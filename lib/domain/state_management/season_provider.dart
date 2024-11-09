import 'package:hive/hive.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/season_repository.dart';
import '../../model/season.dart';


part 'season_provider.g.dart';

@riverpod
SeasonRepository seasonRepository(SeasonRepositoryRef ref) {
  return SeasonRepository();
}

