import 'package:flutter_riverpod/flutter_riverpod.dart';

extension DebounceAndCancelExtension on Ref {
  /// Waits for [duration] (default is 500ms), and then executes a query.
  ///
  /// If the state_management is disposed in the meantime (e.g., due to navigation),
  /// the query will be cancelled.
  Future<T> executeDebouncedQuery<T>(Future<T> Function() query, [Duration? duration]) async {
    // Handle debouncing
    var didDispose = false;
    onDispose(() => didDispose = true);

    // Delay the query by 500ms (or another duration)
    await Future<void>.delayed(duration ?? const Duration(milliseconds: 500));

    // If the state_management was disposed, cancel the query
    if (didDispose) {
      throw Exception('Cancelled');
    }

    // Execute the query
    return await query();
  }
}
