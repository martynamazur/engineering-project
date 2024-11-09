import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.freezed.dart';

part 'tag.g.dart';

@freezed
class Tag with _$Tag {
  const factory Tag({
    @JsonKey(name: 'id') required int tagId,
    @JsonKey(name: 'tag_name')required String tagName,
    @JsonKey(name: 'tag_image_path')required String tagImagePath,
    @Default(false) bool isSelected

  }) = _Tag;


  factory Tag.fromJson(Map<String, dynamic> json) =>
      _$TagFromJson(json);
}