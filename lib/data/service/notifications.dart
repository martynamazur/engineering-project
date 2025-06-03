import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../model/schedule.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  static final _plugin = FlutterLocalNotificationsPlugin();
  static FlutterLocalNotificationsPlugin get plugin => _plugin;
  static late NotificationDetails _notificationDetails;


  NotificationService._internal();
  factory NotificationService() => _instance;



  Future<void> initialize() async {
    const androidInitialization = AndroidInitializationSettings(
        '@drawable/brand_logo');
    const initializationSettings = InitializationSettings(
        android: androidInitialization);
    await _plugin.initialize(initializationSettings);

    // Tworzenie kanału
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'default_channel',
      'Default Notifications',
      description: 'This channel is used for general notifications',
      importance: Importance.high,
    );

    await _plugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // Tworzenie szczegółów powiadomienia
    const androidDetails = AndroidNotificationDetails(
      'default_channel',
      'Default Notifications',
      channelDescription: 'This channel is used for general notifications',
      importance: Importance.high,
      priority: Priority.high,
    );

    _notificationDetails = const NotificationDetails(android: androidDetails);
  }

  Future<void> scheduleDailyNotification() async {


    final schedule = Schedule(
      id: '22',
      scheduleDate: DateTime.now(),
      // Tylko dla pomocniczego czasu startu
      scheduleTime: '11:30',
      outfitId: 123,
      imageUrl: 'https://example.com/outfit.jpg',
    );

    final int notificationId = schedule.outfitId ?? schedule.id?.hashCode ??
        DateTime.now().millisecondsSinceEpoch;

    // Ustaw godzinę i minutę
    final now = DateTime.now();
    final scheduledTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      11, // godzina
      30, // minuta
    );

    // Jeśli czas już minął dzisiaj, ustaw na jutro
    final nextScheduleTime = scheduledTime.isBefore(now)
        ? scheduledTime.add(const Duration(days: 1))
        : scheduledTime;

    await _plugin.zonedSchedule(
      notificationId,
      'Hello, see your today\'s outfit',
      'Check your outfit for today!',
      nextScheduleTime,
      _notificationDetails,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time, // kluczowe dla powtarzania
    );
  }

  Future<void> cancel() async{
    await _plugin.cancelAll();
  }

  Future<void> showTurnOnSettingNotification() async {
    await _plugin.show(
      0,
      'Hello!',
      "Notifications are enabled successfully" ,
      _notificationDetails,
    );
  }
}