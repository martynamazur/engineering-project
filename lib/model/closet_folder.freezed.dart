// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'closet_folder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClosetFolder _$ClosetFolderFromJson(Map<String, dynamic> json) {
  return _ClosetFolder.fromJson(json);
}

/// @nodoc
mixin _$ClosetFolder {
  @JsonKey(name: 'closet_id')
  int get closetId => throw _privateConstructorUsedError;
  @JsonKey(name: 'closet_name')
  String get closetName => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount_of_clothes')
  int get totalAmountOfClothes => throw _privateConstructorUsedError;
  @JsonKey(name: 'clothing_item_ids')
  List<int> get clothingItemIds => throw _privateConstructorUsedError;
  List<ClothingItem> get clothingItems => throw _privateConstructorUsedError;

  /// Serializes this ClosetFolder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClosetFolder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClosetFolderCopyWith<ClosetFolder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClosetFolderCopyWith<$Res> {
  factory $ClosetFolderCopyWith(
          ClosetFolder value, $Res Function(ClosetFolder) then) =
      _$ClosetFolderCopyWithImpl<$Res, ClosetFolder>;
  @useResult
  $Res call(
      {@JsonKey(name: 'closet_id') int closetId,
      @JsonKey(name: 'closet_name') String closetName,
      @JsonKey(name: 'total_amount_of_clothes') int totalAmountOfClothes,
      @JsonKey(name: 'clothing_item_ids') List<int> clothingItemIds,
      List<ClothingItem> clothingItems});
}

/// @nodoc
class _$ClosetFolderCopyWithImpl<$Res, $Val extends ClosetFolder>
    implements $ClosetFolderCopyWith<$Res> {
  _$ClosetFolderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClosetFolder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? closetId = null,
    Object? closetName = null,
    Object? totalAmountOfClothes = null,
    Object? clothingItemIds = null,
    Object? clothingItems = null,
  }) {
    return _then(_value.copyWith(
      closetId: null == closetId
          ? _value.closetId
          : closetId // ignore: cast_nullable_to_non_nullable
              as int,
      closetName: null == closetName
          ? _value.closetName
          : closetName // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmountOfClothes: null == totalAmountOfClothes
          ? _value.totalAmountOfClothes
          : totalAmountOfClothes // ignore: cast_nullable_to_non_nullable
              as int,
      clothingItemIds: null == clothingItemIds
          ? _value.clothingItemIds
          : clothingItemIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      clothingItems: null == clothingItems
          ? _value.clothingItems
          : clothingItems // ignore: cast_nullable_to_non_nullable
              as List<ClothingItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClosetFolderImplCopyWith<$Res>
    implements $ClosetFolderCopyWith<$Res> {
  factory _$$ClosetFolderImplCopyWith(
          _$ClosetFolderImpl value, $Res Function(_$ClosetFolderImpl) then) =
      __$$ClosetFolderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'closet_id') int closetId,
      @JsonKey(name: 'closet_name') String closetName,
      @JsonKey(name: 'total_amount_of_clothes') int totalAmountOfClothes,
      @JsonKey(name: 'clothing_item_ids') List<int> clothingItemIds,
      List<ClothingItem> clothingItems});
}

/// @nodoc
class __$$ClosetFolderImplCopyWithImpl<$Res>
    extends _$ClosetFolderCopyWithImpl<$Res, _$ClosetFolderImpl>
    implements _$$ClosetFolderImplCopyWith<$Res> {
  __$$ClosetFolderImplCopyWithImpl(
      _$ClosetFolderImpl _value, $Res Function(_$ClosetFolderImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClosetFolder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? closetId = null,
    Object? closetName = null,
    Object? totalAmountOfClothes = null,
    Object? clothingItemIds = null,
    Object? clothingItems = null,
  }) {
    return _then(_$ClosetFolderImpl(
      closetId: null == closetId
          ? _value.closetId
          : closetId // ignore: cast_nullable_to_non_nullable
              as int,
      closetName: null == closetName
          ? _value.closetName
          : closetName // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmountOfClothes: null == totalAmountOfClothes
          ? _value.totalAmountOfClothes
          : totalAmountOfClothes // ignore: cast_nullable_to_non_nullable
              as int,
      clothingItemIds: null == clothingItemIds
          ? _value._clothingItemIds
          : clothingItemIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      clothingItems: null == clothingItems
          ? _value._clothingItems
          : clothingItems // ignore: cast_nullable_to_non_nullable
              as List<ClothingItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClosetFolderImpl with DiagnosticableTreeMixin implements _ClosetFolder {
  const _$ClosetFolderImpl(
      {@JsonKey(name: 'closet_id') required this.closetId,
      @JsonKey(name: 'closet_name') required this.closetName,
      @JsonKey(name: 'total_amount_of_clothes')
      required this.totalAmountOfClothes,
      @JsonKey(name: 'clothing_item_ids')
      required final List<int> clothingItemIds,
      final List<ClothingItem> clothingItems = const []})
      : _clothingItemIds = clothingItemIds,
        _clothingItems = clothingItems;

  factory _$ClosetFolderImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClosetFolderImplFromJson(json);

  @override
  @JsonKey(name: 'closet_id')
  final int closetId;
  @override
  @JsonKey(name: 'closet_name')
  final String closetName;
  @override
  @JsonKey(name: 'total_amount_of_clothes')
  final int totalAmountOfClothes;
  final List<int> _clothingItemIds;
  @override
  @JsonKey(name: 'clothing_item_ids')
  List<int> get clothingItemIds {
    if (_clothingItemIds is EqualUnmodifiableListView) return _clothingItemIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clothingItemIds);
  }

  final List<ClothingItem> _clothingItems;
  @override
  @JsonKey()
  List<ClothingItem> get clothingItems {
    if (_clothingItems is EqualUnmodifiableListView) return _clothingItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clothingItems);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClosetFolder(closetId: $closetId, closetName: $closetName, totalAmountOfClothes: $totalAmountOfClothes, clothingItemIds: $clothingItemIds, clothingItems: $clothingItems)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClosetFolder'))
      ..add(DiagnosticsProperty('closetId', closetId))
      ..add(DiagnosticsProperty('closetName', closetName))
      ..add(DiagnosticsProperty('totalAmountOfClothes', totalAmountOfClothes))
      ..add(DiagnosticsProperty('clothingItemIds', clothingItemIds))
      ..add(DiagnosticsProperty('clothingItems', clothingItems));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosetFolderImpl &&
            (identical(other.closetId, closetId) ||
                other.closetId == closetId) &&
            (identical(other.closetName, closetName) ||
                other.closetName == closetName) &&
            (identical(other.totalAmountOfClothes, totalAmountOfClothes) ||
                other.totalAmountOfClothes == totalAmountOfClothes) &&
            const DeepCollectionEquality()
                .equals(other._clothingItemIds, _clothingItemIds) &&
            const DeepCollectionEquality()
                .equals(other._clothingItems, _clothingItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      closetId,
      closetName,
      totalAmountOfClothes,
      const DeepCollectionEquality().hash(_clothingItemIds),
      const DeepCollectionEquality().hash(_clothingItems));

  /// Create a copy of ClosetFolder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosetFolderImplCopyWith<_$ClosetFolderImpl> get copyWith =>
      __$$ClosetFolderImplCopyWithImpl<_$ClosetFolderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClosetFolderImplToJson(
      this,
    );
  }
}

abstract class _ClosetFolder implements ClosetFolder {
  const factory _ClosetFolder(
      {@JsonKey(name: 'closet_id') required final int closetId,
      @JsonKey(name: 'closet_name') required final String closetName,
      @JsonKey(name: 'total_amount_of_clothes')
      required final int totalAmountOfClothes,
      @JsonKey(name: 'clothing_item_ids')
      required final List<int> clothingItemIds,
      final List<ClothingItem> clothingItems}) = _$ClosetFolderImpl;

  factory _ClosetFolder.fromJson(Map<String, dynamic> json) =
      _$ClosetFolderImpl.fromJson;

  @override
  @JsonKey(name: 'closet_id')
  int get closetId;
  @override
  @JsonKey(name: 'closet_name')
  String get closetName;
  @override
  @JsonKey(name: 'total_amount_of_clothes')
  int get totalAmountOfClothes;
  @override
  @JsonKey(name: 'clothing_item_ids')
  List<int> get clothingItemIds;
  @override
  List<ClothingItem> get clothingItems;

  /// Create a copy of ClosetFolder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClosetFolderImplCopyWith<_$ClosetFolderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
