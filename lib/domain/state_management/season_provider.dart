import 'package:hive/hive.dart';
import 'package:riverpod/riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/season_repository.dart';
import '../../model/season.dart';


part 'season_provider.g.dart';

@riverpod
SeasonRepository seasonRepository(Ref ref) {
  return SeasonRepository();
}

@riverpod
List<Season> getSeasonList(Ref ref){
  final repo = ref.watch(seasonRepositoryProvider);
  return repo.getSeason();
}
