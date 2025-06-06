import 'dart:developer' as developer;

import 'package:ootd/main.dart';
import 'package:ootd/model/schedule.dart';
import 'package:ootd/utils/log.dart';

import '../../model/result.dart';

class ScheduleRepository {
  late final String _userId;

  ScheduleRepository() {
    _initialize();
  }

  Future<void> _initialize() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }
    _userId = user.id;
  }

  Future<List<Schedule>> getScheduleForMonth(int year, int month) async {
    try {
      final response = await supabase.rpc('get_scheduled_outfits_for_user',
          params: {
            'p_user_uuid': _userId,
            'p_year': year,
            'p_month': month
          });

      final data = response as List<dynamic>;
      return data.map((item) => Schedule.fromJson(item)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Schedule>> getScheduleForWeek() async {
    try {

      DateTime now = DateTime.now();
      DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
      DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));

      final response = await supabase.rpc('get_scheduled_outfits_for_user_by_week',
          params: {
            'start_date': startOfWeek.toIso8601String(),
            'input_user_uuid': _userId,
            'end_date': endOfWeek.toIso8601String(),
          });

      final data = response as List<dynamic>;
      return data.map((item) => Schedule.fromJson(item)).toList();
    } catch (e, stack) {
      developer.log('Error while getting schedule for a week: $e\n$stack');
      return [];
    }
  }

  Future<Result> removeFromSchedule(String scheduleId) async {
    try{
      await supabase.rpc('remove_schedule_and_update_user_list',
          params: {'schedule_id': scheduleId, 'user_uuid': _userId});

      return Result.success();
    }catch(e, stack){
      developer.log('Error removing schedule: $e\n$stack');
      return Result.failure('Error');
    }
  }

  Future<Result>scheduleOutfit(Schedule schedule) async{

    try{
      final response = await supabase.rpc(
          "add_scheduled_outfit",
          params: {
            "p_user_uuid" : _userId,
            "p_schedule_date": schedule.scheduleDate.toString(),
            "p_schedule_time": schedule.scheduleTime,
            "p_outfit_id" : schedule.outfitId
          });
      logger.i('Schedule $response');

      if(response != null){
        return Result.success();
      }else{
        return Result.failure('message');
      }

    }catch(e, stack){
      developer.log('Error while scheduling: $e\n$stack');
      return Result.failure('message');
    }

  }
}
