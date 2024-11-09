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