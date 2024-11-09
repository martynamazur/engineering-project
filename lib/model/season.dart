import 'package:hive/hive.dart';

part 'season.g.dart';

@HiveType(typeId: 0)
class Season extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String seasonName;

  @HiveField(2)
  String seasonImagePath;


  Season(this.id, this.seasonName, this.seasonImagePath);
}
