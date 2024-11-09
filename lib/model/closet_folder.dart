import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'clothing_item.dart';

part 'closet_folder.freezed.dart';
part 'closet_folder.g.dart';

@freezed
class ClosetFolder with _$ClosetFolder {


  const factory ClosetFolder({
    @JsonKey(name: 'closet_id') required int closetId,
    @JsonKey(name: 'closet_name') required String closetName,
    @JsonKey(name: 'total_amount_of_clothes') required int totalAmountOfClothes,
    @JsonKey(name: 'clothing_item_ids') required List<int> clothingItemIds,
    @Default([]) List<ClothingItem> clothingItems

    ,
  }) = _ClosetFolder;


  factory ClosetFolder.fromJson(Map<String, dynamic> json) =>
      _$ClosetFolderFromJson(json);
}