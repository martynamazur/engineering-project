/*
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareContentManager {
  final String _urlPhotoPath;

  ShareContentManager(this._urlPhotoPath);

  Future<void> onSharePhotoLink(BuildContext context) async {
    try {
      final box = context.findRenderObject() as RenderBox?;
      final scaffoldMessenger = ScaffoldMessenger.of(context);

      // Pobierz zdjęcie z URL
      final http.Response response = await http.get(Uri.parse(_urlPhotoPath));

      if (response.statusCode == 200) {
        final tempDir = await getTemporaryDirectory();
        final filePath = '${tempDir.path}/shared_photo.png';
        final file = File(filePath);

        // Zapisz obraz w lokalnym pliku
        await file.writeAsBytes(response.bodyBytes);

        final XFile xfile = XFile(file.path);

        // Udostępnij zapisany plik
        await Share.shareXFiles(
          [xfile],
          text: 'Check out this photo!',
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
        );
      } else {
        print('Failed to download image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error downloading or sharing image: $e');
    }
  }
}

 */
