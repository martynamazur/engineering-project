import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/service/hive_service.dart';

part 'hive_service_provider.g.dart';

@riverpod
HiveService hiveService (Ref ref) {
  return HiveService();
}
