import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ootd/data/service/notifications.dart';
import 'package:ootd/data/service/sharedpreferency_service.dart';
import 'package:ootd/permissions.dart';
import 'package:ootd/presentation/styles/headline_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'data/service/hive_service.dart';
import 'l10n/app_localizations.dart';
import 'model/season.dart';
import 'navigation/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;



void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
      url: "https://nofqkuoakmrnkuwmdsdw.supabase.co",
      anonKey: dotenv.env["API_KEY"]!);

  await Hive.initFlutter();
  Hive.registerAdapter(SeasonAdapter());
  await Hive.openBox<Season>('seasonBox');
  HiveService().initializeSeasonBox();

  await requestPermissions();
  await requestNotificationPermission();

  await NotificationService().initialize();
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Europe/Warsaw'));


  await SharedPreferencesService().initialize();


  runApp(ProviderScope(child: MyApp()));
}


final supabase = Supabase.instance.client;


class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        textTheme: TextTheme(
          headlineLarge: headlineLarge,
          headlineMedium: headlineMedium,
          headlineSmall: headlineSmall,
        ),
      ),
      localizationsDelegates: const[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('pl')
      ],
      locale: const Locale('en'),
    );
  }
}

