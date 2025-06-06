import 'package:ootd/data/repository/schedule_repository.dart';
import 'package:ootd/model/result.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/schedule.dart';


part 'schedule_provider.g.dart';

@riverpod
ScheduleRepository scheduleRepository (Ref ref) {
  return ScheduleRepository();
}

@riverpod
Future<List<Schedule>> getScheduleForMonth(Ref ref, {required int year,required int month}) async {
  return ref.read(scheduleRepositoryProvider).getScheduleForMonth(year, month);
}

@riverpod
Future<List<Schedule>> getScheduleForWeek(Ref ref) async {
  return ref.read(scheduleRepositoryProvider).getScheduleForWeek();
}

@riverpod
Future<Result> removeFromSchedule(Ref ref, {required String scheduleId}) async {
  return ref.read(scheduleRepositoryProvider).removeFromSchedule(scheduleId);
}

@riverpod
Future<Result> scheduleOutfit(Ref ref, {required Schedule schedule}) async {
return ref.read(scheduleRepositoryProvider).scheduleOutfit(schedule);
}