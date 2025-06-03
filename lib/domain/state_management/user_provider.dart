
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/user_repository.dart';


part 'user_provider.g.dart';

@riverpod
UserRepository userRepository (Ref ref) {
  return UserRepository();
}

