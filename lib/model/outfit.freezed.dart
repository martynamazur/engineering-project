// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outfit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Outfit _$OutfitFromJson(Map<String, dynamic> json) {
  return _Outfit.fromJson(json);
}

/// @nodoc
mixin _$Outfit {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'season')
  String get season => throw _privateConstructorUsedError;
  @JsonKey(name: 'useditemsids')
  List<ClothingItem>? get clothingItemList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'userTags')
  List<Tag>? get userTags => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultTags')
  List<int>? get defaultTags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OutfitCopyWith<Outfit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutfitCopyWith<$Res> {
  factory $OutfitCopyWith(Outfit value, $Res Function(Outfit) then) =
      _$OutfitCopyWithImpl<$Res, Outfit>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'season') String season,
      @JsonKey(name: 'useditemsids') List<ClothingItem>? clothingItemList,
      @JsonKey(name: 'userTags') List<Tag>? userTags,
      @JsonKey(name: 'defaultTags') List<int>? defaultTags});
}

/// @nodoc
class _$OutfitCopyWithImpl<$Res, $Val extends Outfit>
    implements $OutfitCopyWith<$Res> {
  _$OutfitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? season = null,
    Object? clothingItemList = freezed,
    Object? userTags = freezed,
    Object? defaultTags = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as String,
      clothingItemList: freezed == clothingItemList
          ? _value.clothingItemList
          : clothingItemList // ignore: cast_nullable_to_non_nullable
              as List<ClothingItem>?,
      userTags: freezed == userTags
          ? _value.userTags
          : userTags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
      defaultTags: freezed == defaultTags
          ? _value.defaultTags
          : defaultTags // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OutfitImplCopyWith<$Res> implements $OutfitCopyWith<$Res> {
  factory _$$OutfitImplCopyWith(
          _$OutfitImpl value, $Res Function(_$OutfitImpl) then) =
      __$$OutfitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'season') String season,
      @JsonKey(name: 'useditemsids') List<ClothingItem>? clothingItemList,
      @JsonKey(name: 'userTags') List<Tag>? userTags,
      @JsonKey(name: 'defaultTags') List<int>? defaultTags});
}

/// @nodoc
class __$$OutfitImplCopyWithImpl<$Res>
    extends _$OutfitCopyWithImpl<$Res, _$OutfitImpl>
    implements _$$OutfitImplCopyWith<$Res> {
  __$$OutfitImplCopyWithImpl(
      _$OutfitImpl _value, $Res Function(_$OutfitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? season = null,
    Object? clothingItemList = freezed,
    Object? userTags = freezed,
    Object? defaultTags = freezed,
  }) {
    return _then(_$OutfitImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as String,
      clothingItemList: freezed == clothingItemList
          ? _value._clothingItemList
          : clothingItemList // ignore: cast_nullable_to_non_nullable
              as List<ClothingItem>?,
      userTags: freezed == userTags
          ? _value._userTags
          : userTags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
      defaultTags: freezed == defaultTags
          ? _value._defaultTags
          : defaultTags // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OutfitImpl with DiagnosticableTreeMixin implements _Outfit {
  const _$OutfitImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'image_url') required this.imageUrl,
      @JsonKey(name: 'season') required this.season,
      @JsonKey(name: 'useditemsids') final List<ClothingItem>? clothingItemList,
      @JsonKey(name: 'userTags') final List<Tag>? userTags,
      @JsonKey(name: 'defaultTags') final List<int>? defaultTags})
      : _clothingItemList = clothingItemList,
        _userTags = userTags,
        _defaultTags = defaultTags;

  factory _$OutfitImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutfitImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @override
  @JsonKey(name: 'season')
  final String season;
  final List<ClothingItem>? _clothingItemList;
  @override
  @JsonKey(name: 'useditemsids')
  List<ClothingItem>? get clothingItemList {
    final value = _clothingItemList;
    if (value == null) return null;
    if (_clothingItemList is EqualUnmodifiableListView)
      return _clothingItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Tag>? _userTags;
  @override
  @JsonKey(name: 'userTags')
  List<Tag>? get userTags {
    final value = _userTags;
    if (value == null) return null;
    if (_userTags is EqualUnmodifiableListView) return _userTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _defaultTags;
  @override
  @JsonKey(name: 'defaultTags')
  List<int>? get defaultTags {
    final value = _defaultTags;
    if (value == null) return null;
    if (_defaultTags is EqualUnmodifiableListView) return _defaultTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Outfit(id: $id, imageUrl: $imageUrl, season: $season, clothingItemList: $clothingItemList, userTags: $userTags, defaultTags: $defaultTags)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Outfit'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('season', season))
      ..add(DiagnosticsProperty('clothingItemList', clothingItemList))
      ..add(DiagnosticsProperty('userTags', userTags))
      ..add(DiagnosticsProperty('defaultTags', defaultTags));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutfitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.season, season) || other.season == season) &&
            const DeepCollectionEquality()
                .equals(other._clothingItemList, _clothingItemList) &&
            const DeepCollectionEquality().equals(other._userTags, _userTags) &&
            const DeepCollectionEquality()
                .equals(other._defaultTags, _defaultTags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      imageUrl,
      season,
      const DeepCollectionEquality().hash(_clothingItemList),
      const DeepCollectionEquality().hash(_userTags),
      const DeepCollectionEquality().hash(_defaultTags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OutfitImplCopyWith<_$OutfitImpl> get copyWith =>
      __$$OutfitImplCopyWithImpl<_$OutfitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutfitImplToJson(
      this,
    );
  }
}

abstract class _Outfit implements Outfit {
  const factory _Outfit(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'image_url') required final String imageUrl,
      @JsonKey(name: 'season') required final String season,
      @JsonKey(name: 'useditemsids') final List<ClothingItem>? clothingItemList,
      @JsonKey(name: 'userTags') final List<Tag>? userTags,
      @JsonKey(name: 'defaultTags')
      final List<int>? defaultTags}) = _$OutfitImpl;

  factory _Outfit.fromJson(Map<String, dynamic> json) = _$OutfitImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  @JsonKey(name: 'season')
  String get season;
  @override
  @JsonKey(name: 'useditemsids')
  List<ClothingItem>? get clothingItemList;
  @override
  @JsonKey(name: 'userTags')
  List<Tag>? get userTags;
  @override
  @JsonKey(name: 'defaultTags')
  List<int>? get defaultTags;
  @override
  @JsonKey(ignore: true)
  _$$OutfitImplCopyWith<_$OutfitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
