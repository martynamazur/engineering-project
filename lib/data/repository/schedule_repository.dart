import 'package:ootd/main.dart';
import 'package:ootd/model/schedule.dart';

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
            'user_uuid': _userId,
            'selected_year': year,
            'selected_month': month
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
      DateTime endOfWeek = startOfWeek.add(Duration(days: 6));

      final response = await supabase.rpc('get_scheduled_outfits_for_user_by_week',
          params: {

            'start_date': startOfWeek.toIso8601String(),
            'input_user_uuid': _userId,
            'end_date': endOfWeek.toIso8601String(),

          });

      final data = response as List<dynamic>;
      return data.map((item) => Schedule.fromJson(item)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> removeFromSchedule(String scheduleId) async {
    await supabase.rpc(' remove_schedule_and_update_user_list',
        params: {'schedule_id': scheduleId, 'user_uuid': _userId});
  }

  void scheduleOutfit(Schedule schedule) async{

    /*
    p_user_uuid uuid,
    p_schedule_date date,
    p_schedule_time text,
    p_outfit_id integer
     */

    //add_scheduled_outfit(p_outfit_id, p_schedule_date, p_schedule_time, p_user_uuid))
    await supabase.rpc(
        "add_scheduled_outfit",
        params: {
          "p_user_uuid" : _userId,
          "p_schedule_date": schedule.scheduleDate.toString(),
          "p_schedule_time": schedule.scheduleTime,
          "p_outfit_id" : schedule.outfitId
        });
  }
}
