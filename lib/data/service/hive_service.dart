
import 'package:hive/hive.dart';

import '../../model/season.dart';


class HiveService {


  Future<void> initializeSeasonBox() async{
    final seasonBox = Hive.box<Season>('seasonBox');
    if(seasonBox.isEmpty){
      final List<Season> initialTags = [
        Season(1, 'Summer', 'assets/season_icon/summer_cover.png'),
        Season(2, 'Winter', 'assets/season_icon/winter_cover.png'),
        Season(3, 'Autumn', 'assets/season_icon/autumn_cover.png'),
        Season(4, 'Spring', 'assets/season_icon/spring_cover.png'),

      ];
      await seasonBox.addAll(initialTags);
    }

  }
}