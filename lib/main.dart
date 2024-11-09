import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ootd/permissions.dart';
import 'package:ootd/presentation/styles/headline_text.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'data/service/hive_service.dart';
import 'model/season.dart';
import 'model/tag.dart';
import 'navigation/app_router.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await Supabase.initialize(url: "https://nofqkuoakmrnkuwmdsdw.supabase.co", anonKey: dotenv.env["API_KEY"]!);
  await Hive.initFlutter();
  Hive.registerAdapter(SeasonAdapter());
  await Hive.openBox<Season>('seasonBox');
  HiveService().initializeSeasonBox();
  await requestPermissions();


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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(
          headlineLarge: headlineLarge,
          headlineMedium: headlineMedium,
          headlineSmall: headlineSmall,
        ),
      ),
    );
  }
}

