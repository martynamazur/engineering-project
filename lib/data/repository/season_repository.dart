import 'dart:developer' as developer;

import 'package:hive/hive.dart';
import 'package:ootd/model/season.dart';

import '../../utils/log.dart';


class SeasonRepository {

  List<Season> getSeason() {
    try {
      final seasonBox = Hive.box<Season>('seasonBox');
      return seasonBox.values.cast<Season>().toList();
    } catch (e,stack) {
      logger.i('Error while getting Season List: $e\n$stack');
      return [];
    }
  }
}
