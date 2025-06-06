import 'package:flutter/material.dart';

Widget imageLoadingBuilder(BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
  if (loadingProgress == null) return child;

  return Center(
    child: CircularProgressIndicator(
      value: loadingProgress.expectedTotalBytes != null
          ? loadingProgress.cumulativeBytesLoaded /
          loadingProgress.expectedTotalBytes!
          : null,
    ),
  );
}

Widget imageErrorBuilder(BuildContext context, Object error, StackTrace? stackTrace) {
  return const Icon(Icons.broken_image);
}
