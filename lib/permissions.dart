import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermissions() async {
  final status = await Permission.storage.request();

  if (status.isGranted) {
    // Uprawnienia przyznane
  } else if (status.isDenied) {
    // Uprawnienia odrzucone
  } else if (status.isPermanentlyDenied) {
    // Uprawnienia trwale odrzucone, użytkownik musi ręcznie włączyć w ustawieniach
  }
}

Future<void> requestNotificationPermission() async {
  if (Platform.isAndroid) {
    // Sprawdź wersję Androida
    final androidInfo = await Permission.notification.status;

    if (androidInfo.isDenied) {
      // Jeśli użytkownik jeszcze nie dał zgody - poproś
      await Permission.notification.request();
    }
  }
}
Future<void> requestExactAlarmPermission() async {
  if (Platform.isAndroid) {
    final status = await Permission.scheduleExactAlarm.status;

    if (status.isDenied || status.isPermanentlyDenied) {
      print("Użytkownik nie ma zgody na exact alarms");

      // Otwórz ustawienia, aby użytkownik mógł sam włączyć
      //await openAppSettings();


    } else if (status.isGranted) {
      print('Zgoda na alarmy została przyznana!');
    }
  }
}
