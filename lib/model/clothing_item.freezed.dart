// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clothing_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClothingItem _$ClothingItemFromJson(Map<String, dynamic> json) {
  return _ClothingItem.fromJson(json);
}

/// @nodoc
mixin _$ClothingItem {
  @JsonKey(name: 'clothing_item_id')
  int? get clothingItemId =>
      throw _privateConstructorUsedError; //@JsonKey(name: 'item_name') required String itemName,//nie potzrebne
  @JsonKey(name: 'item_photo')
  String get itemPhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_type')
  String? get itemType => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_category')
  String? get itemCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_category_id')
  int? get itemCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_season_id')
  int? get itemSeason => throw _privateConstructorUsedError; //do usuniecia
  @JsonKey(name: 'seasons')
  List<Season>? get seasons => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClothingItemCopyWith<ClothingItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClothingItemCopyWith<$Res> {
  factory $ClothingItemCopyWith(
          ClothingItem value, $Res Function(ClothingItem) then) =
      _$ClothingItemCopyWithImpl<$Res, ClothingItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'clothing_item_id') int? clothingItemId,
      @JsonKey(name: 'item_photo') String itemPhoto,
      @JsonKey(name: 'item_type') String? itemType,
      @JsonKey(name: 'item_category') String? itemCategory,
      @JsonKey(name: 'item_category_id') int? itemCategoryId,
      @JsonKey(name: 'item_season_id') int? itemSeason,
      @JsonKey(name: 'seasons') List<Season>? seasons});
}

/// @nodoc
class _$ClothingItemCopyWithImpl<$Res, $Val extends ClothingItem>
    implements $ClothingItemCopyWith<$Res> {
  _$ClothingItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clothingItemId = freezed,
    Object? itemPhoto = null,
    Object? itemType = freezed,
    Object? itemCategory = freezed,
    Object? itemCategoryId = freezed,
    Object? itemSeason = freezed,
    Object? seasons = freezed,
  }) {
    return _then(_value.copyWith(
      clothingItemId: freezed == clothingItemId
          ? _value.clothingItemId
          : clothingItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      itemPhoto: null == itemPhoto
          ? _value.itemPhoto
          : itemPhoto // ignore: cast_nullable_to_non_nullable
              as String,
      itemType: freezed == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as String?,
      itemCategory: freezed == itemCategory
          ? _value.itemCategory
          : itemCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      itemCategoryId: freezed == itemCategoryId
          ? _value.itemCategoryId
          : itemCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      itemSeason: freezed == itemSeason
          ? _value.itemSeason
          : itemSeason // ignore: cast_nullable_to_non_nullable
              as int?,
      seasons: freezed == seasons
          ? _value.seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<Season>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClothingItemImplCopyWith<$Res>
    implements $ClothingItemCopyWith<$Res> {
  factory _$$ClothingItemImplCopyWith(
          _$ClothingItemImpl value, $Res Function(_$ClothingItemImpl) then) =
      __$$ClothingItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'clothing_item_id') int? clothingItemId,
      @JsonKey(name: 'item_photo') String itemPhoto,
      @JsonKey(name: 'item_type') String? itemType,
      @JsonKey(name: 'item_category') String? itemCategory,
      @JsonKey(name: 'item_category_id') int? itemCategoryId,
      @JsonKey(name: 'item_season_id') int? itemSeason,
      @JsonKey(name: 'seasons') List<Season>? seasons});
}

/// @nodoc
class __$$ClothingItemImplCopyWithImpl<$Res>
    extends _$ClothingItemCopyWithImpl<$Res, _$ClothingItemImpl>
    implements _$$ClothingItemImplCopyWith<$Res> {
  __$$ClothingItemImplCopyWithImpl(
      _$ClothingItemImpl _value, $Res Function(_$ClothingItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clothingItemId = freezed,
    Object? itemPhoto = null,
    Object? itemType = freezed,
    Object? itemCategory = freezed,
    Object? itemCategoryId = freezed,
    Object? itemSeason = freezed,
    Object? seasons = freezed,
  }) {
    return _then(_$ClothingItemImpl(
      clothingItemId: freezed == clothingItemId
          ? _value.clothingItemId
          : clothingItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      itemPhoto: null == itemPhoto
          ? _value.itemPhoto
          : itemPhoto // ignore: cast_nullable_to_non_nullable
              as String,
      itemType: freezed == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as String?,
      itemCategory: freezed == itemCategory
          ? _value.itemCategory
          : itemCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      itemCategoryId: freezed == itemCategoryId
          ? _value.itemCategoryId
          : itemCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      itemSeason: freezed == itemSeason
          ? _value.itemSeason
          : itemSeason // ignore: cast_nullable_to_non_nullable
              as int?,
      seasons: freezed == seasons
          ? _value._seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<Season>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClothingItemImpl with DiagnosticableTreeMixin implements _ClothingItem {
  const _$ClothingItemImpl(
      {@JsonKey(name: 'clothing_item_id') this.clothingItemId,
      @JsonKey(name: 'item_photo') required this.itemPhoto,
      @JsonKey(name: 'item_type') this.itemType,
      @JsonKey(name: 'item_category') this.itemCategory,
      @JsonKey(name: 'item_category_id') this.itemCategoryId,
      @JsonKey(name: 'item_season_id') this.itemSeason,
      @JsonKey(name: 'seasons') final List<Season>? seasons})
      : _seasons = seasons;

  factory _$ClothingItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClothingItemImplFromJson(json);

  @override
  @JsonKey(name: 'clothing_item_id')
  final int? clothingItemId;
//@JsonKey(name: 'item_name') required String itemName,//nie potzrebne
  @override
  @JsonKey(name: 'item_photo')
  final String itemPhoto;
  @override
  @JsonKey(name: 'item_type')
  final String? itemType;
  @override
  @JsonKey(name: 'item_category')
  final String? itemCategory;
  @override
  @JsonKey(name: 'item_category_id')
  final int? itemCategoryId;
  @override
  @JsonKey(name: 'item_season_id')
  final int? itemSeason;
//do usuniecia
  final List<Season>? _seasons;
//do usuniecia
  @override
  @JsonKey(name: 'seasons')
  List<Season>? get seasons {
    final value = _seasons;
    if (value == null) return null;
    if (_seasons is EqualUnmodifiableListView) return _seasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClothingItem(clothingItemId: $clothingItemId, itemPhoto: $itemPhoto, itemType: $itemType, itemCategory: $itemCategory, itemCategoryId: $itemCategoryId, itemSeason: $itemSeason, seasons: $seasons)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClothingItem'))
      ..add(DiagnosticsProperty('clothingItemId', clothingItemId))
      ..add(DiagnosticsProperty('itemPhoto', itemPhoto))
      ..add(DiagnosticsProperty('itemType', itemType))
      ..add(DiagnosticsProperty('itemCategory', itemCategory))
      ..add(DiagnosticsProperty('itemCategoryId', itemCategoryId))
      ..add(DiagnosticsProperty('itemSeason', itemSeason))
      ..add(DiagnosticsProperty('seasons', seasons));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClothingItemImpl &&
            (identical(other.clothingItemId, clothingItemId) ||
                other.clothingItemId == clothingItemId) &&
            (identical(other.itemPhoto, itemPhoto) ||
                other.itemPhoto == itemPhoto) &&
            (identical(other.itemType, itemType) ||
                other.itemType == itemType) &&
            (identical(other.itemCategory, itemCategory) ||
                other.itemCategory == itemCategory) &&
            (identical(other.itemCategoryId, itemCategoryId) ||
                other.itemCategoryId == itemCategoryId) &&
            (identical(other.itemSeason, itemSeason) ||
                other.itemSeason == itemSeason) &&
            const DeepCollectionEquality().equals(other._seasons, _seasons));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clothingItemId,
      itemPhoto,
      itemType,
      itemCategory,
      itemCategoryId,
      itemSeason,
      const DeepCollectionEquality().hash(_seasons));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClothingItemImplCopyWith<_$ClothingItemImpl> get copyWith =>
      __$$ClothingItemImplCopyWithImpl<_$ClothingItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClothingItemImplToJson(
      this,
    );
  }
}

abstract class _ClothingItem implements ClothingItem {
  const factory _ClothingItem(
          {@JsonKey(name: 'clothing_item_id') final int? clothingItemId,
          @JsonKey(name: 'item_photo') required final String itemPhoto,
          @JsonKey(name: 'item_type') final String? itemType,
          @JsonKey(name: 'item_category') final String? itemCategory,
          @JsonKey(name: 'item_category_id') final int? itemCategoryId,
          @JsonKey(name: 'item_season_id') final int? itemSeason,
          @JsonKey(name: 'seasons') final List<Season>? seasons}) =
      _$ClothingItemImpl;

  factory _ClothingItem.fromJson(Map<String, dynamic> json) =
      _$ClothingItemImpl.fromJson;

  @override
  @JsonKey(name: 'clothing_item_id')
  int? get clothingItemId;
  @override //@JsonKey(name: 'item_name') required String itemName,//nie potzrebne
  @JsonKey(name: 'item_photo')
  String get itemPhoto;
  @override
  @JsonKey(name: 'item_type')
  String? get itemType;
  @override
  @JsonKey(name: 'item_category')
  String? get itemCategory;
  @override
  @JsonKey(name: 'item_category_id')
  int? get itemCategoryId;
  @override
  @JsonKey(name: 'item_season_id')
  int? get itemSeason;
  @override //do usuniecia
  @JsonKey(name: 'seasons')
  List<Season>? get seasons;
  @override
  @JsonKey(ignore: true)
  _$$ClothingItemImplCopyWith<_$ClothingItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
