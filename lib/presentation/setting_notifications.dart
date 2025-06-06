
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/extensions/localization_extension.dart';

import '../data/service/notifications.dart';
import '../data/service/sharedpreferency_service.dart';

@RoutePage()
class SettingNotificationsScreen extends ConsumerStatefulWidget {
 const SettingNotificationsScreen({super.key});

  @override
  ConsumerState<SettingNotificationsScreen> createState() => _SettingNotificationsScreenState();
}

class _SettingNotificationsScreenState extends ConsumerState<SettingNotificationsScreen> {
  late bool _isNotificationsTurnOn;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _isNotificationsTurnOn = SharedPreferencesService().notificationsEnabled;

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.notifications),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CheckboxListTile(
              title: Text(context.loc.notificationDescription),
              activeColor: Colors.blue,
              checkColor: Colors.white,
                value: _isNotificationsTurnOn,
                onChanged: _onNotificationToggle,
    )
          ],
        ),
      ),
    );
  }

  void _onNotificationToggle(bool? value) {
    if (value == null) return;
    setState(() {
      _isNotificationsTurnOn = value;
    });
    _updateNotificationSettings();
  }

  Future<void> _updateNotificationSettings() async {
    await SharedPreferencesService().setNotificationsEnabled(_isNotificationsTurnOn);

    if (_isNotificationsTurnOn) {
      await NotificationService().scheduleDailyNotification();
      NotificationService().showTurnOnSettingNotification();
    } else {
      await NotificationService().cancel();
    }
  }
}


