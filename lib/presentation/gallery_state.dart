import 'package:flutter/foundation.dart';

class GalleryState {
  final Map<String, bool> categoryStates;

  GalleryState({required this.categoryStates});

  GalleryState copyWith({Map<String, bool>? categoryStates}) {
    return GalleryState(
      categoryStates: categoryStates ?? this.categoryStates,
    );
  }
}
