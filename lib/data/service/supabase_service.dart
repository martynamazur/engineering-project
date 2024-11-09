import 'dart:io';
import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../main.dart';

class SupabaseUtils {

  Future<String> uploadImageAndReturnUrl(Uint8List image) async {
    DateTime now = DateTime.now();
    DateFormat dateFormat = DateFormat('yyyyMMdd_HHmmss');
    String formattedDate = dateFormat.format(now);

    final fileName = 'clothingItems/${formattedDate}_image.jpg';
    final publicUrl = await uploadImageToStorage(image, fileName);

    return publicUrl;
  }

  Future<String> uploadImageToStorage(Uint8List image, String fileName) async {
    final user = supabase.auth.currentUser;
    final userId = user?.id;
    final folderPath = '$userId/$fileName';  // Folder path based on user ID

    try {
      await supabase.storage
          .from('users')  // The main bucket name
          .uploadBinary(folderPath, image);

      // Get the public URL after successful upload
      return getPublicUrl(folderPath);
    } catch (error) {
      throw Exception('Failed to upload image: $error');
    }
  }

  String getPublicUrl(String filePath) {
    // Get the public URL for the file in the user's folder
    final imageUrl = supabase.storage
        .from('users')
        .getPublicUrl(filePath);
    return imageUrl;
  }

  Future<void> saveImageUrlToDatabase(int clothingItemId, String publicUrl) async {
    final response = await supabase
        .from('clothingitem')
        .update({'item_photo': publicUrl})
        .eq('clothing_item_id', clothingItemId);

    if (response.error != null) {
      throw Exception('Failed to save image URL to database: ${response.error!.message}');
    }
  }
}
