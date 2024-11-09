import 'package:hive/hive.dart';
import 'package:ootd/model/season.dart';


class SeasonRepository {

  List<Season> getSeason() {
    try {
      final seasonbox = Hive.box<Season>('seasonBox');
      return seasonbox.values.cast<Season>().toList();
    } catch (e) {
      return [];
    }
  }
}
