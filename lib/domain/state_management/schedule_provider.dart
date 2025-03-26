import 'package:ootd/data/repository/schedule_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/schedule.dart';


part 'schedule_provider.g.dart';

@riverpod
ScheduleRepository scheduleRepository (ScheduleRepositoryRef ref) {
  return ScheduleRepository();
}

@riverpod
Future<List<Schedule>> getScheduleForMonth(GetScheduleForMonthRef ref, int year, int month) async {
  return ref.read(scheduleRepositoryProvider).getScheduleForMonth(year, month);
}

@riverpod
Future<List<Schedule>> getScheduleForWeek(GetScheduleForWeekRef ref) async {
  return ref.read(scheduleRepositoryProvider).getScheduleForWeek();
}

@riverpod
Future<void> removeFromSchedule(RemoveFromScheduleRef ref, int scheduleId) async {
  return ref.read(scheduleRepositoryProvider).removeFromSchedule(scheduleId);
}

@riverpod
void scheduleOutfit(ScheduleOutfitRef ref, Schedule schedule) async {
return ref.read(scheduleRepositoryProvider).scheduleOutfit(schedule);
}