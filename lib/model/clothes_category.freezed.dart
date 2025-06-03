// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clothes_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClothesCategory _$ClothesCategoryFromJson(Map<String, dynamic> json) {
  return _ClothesCategory.fromJson(json);
}

/// @nodoc
mixin _$ClothesCategory {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoryname')
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoryicon')
  String get imagePath => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  /// Serializes this ClothesCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClothesCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClothesCategoryCopyWith<ClothesCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClothesCategoryCopyWith<$Res> {
  factory $ClothesCategoryCopyWith(
          ClothesCategory value, $Res Function(ClothesCategory) then) =
      _$ClothesCategoryCopyWithImpl<$Res, ClothesCategory>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'categoryname') String categoryName,
      @JsonKey(name: 'categoryicon') String imagePath,
      bool isSelected});
}

/// @nodoc
class _$ClothesCategoryCopyWithImpl<$Res, $Val extends ClothesCategory>
    implements $ClothesCategoryCopyWith<$Res> {
  _$ClothesCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClothesCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryName = null,
    Object? imagePath = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClothesCategoryImplCopyWith<$Res>
    implements $ClothesCategoryCopyWith<$Res> {
  factory _$$ClothesCategoryImplCopyWith(_$ClothesCategoryImpl value,
          $Res Function(_$ClothesCategoryImpl) then) =
      __$$ClothesCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'categoryname') String categoryName,
      @JsonKey(name: 'categoryicon') String imagePath,
      bool isSelected});
}

/// @nodoc
class __$$ClothesCategoryImplCopyWithImpl<$Res>
    extends _$ClothesCategoryCopyWithImpl<$Res, _$ClothesCategoryImpl>
    implements _$$ClothesCategoryImplCopyWith<$Res> {
  __$$ClothesCategoryImplCopyWithImpl(
      _$ClothesCategoryImpl _value, $Res Function(_$ClothesCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClothesCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryName = null,
    Object? imagePath = null,
    Object? isSelected = null,
  }) {
    return _then(_$ClothesCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClothesCategoryImpl
    with DiagnosticableTreeMixin
    implements _ClothesCategory {
  const _$ClothesCategoryImpl(
      {required this.id,
      @JsonKey(name: 'categoryname') required this.categoryName,
      @JsonKey(name: 'categoryicon') required this.imagePath,
      this.isSelected = false});

  factory _$ClothesCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClothesCategoryImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'categoryname')
  final String categoryName;
  @override
  @JsonKey(name: 'categoryicon')
  final String imagePath;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClothesCategory(id: $id, categoryName: $categoryName, imagePath: $imagePath, isSelected: $isSelected)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClothesCategory'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('categoryName', categoryName))
      ..add(DiagnosticsProperty('imagePath', imagePath))
      ..add(DiagnosticsProperty('isSelected', isSelected));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClothesCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, categoryName, imagePath, isSelected);

  /// Create a copy of ClothesCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClothesCategoryImplCopyWith<_$ClothesCategoryImpl> get copyWith =>
      __$$ClothesCategoryImplCopyWithImpl<_$ClothesCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClothesCategoryImplToJson(
      this,
    );
  }
}

abstract class _ClothesCategory implements ClothesCategory {
  const factory _ClothesCategory(
      {required final int id,
      @JsonKey(name: 'categoryname') required final String categoryName,
      @JsonKey(name: 'categoryicon') required final String imagePath,
      final bool isSelected}) = _$ClothesCategoryImpl;

  factory _ClothesCategory.fromJson(Map<String, dynamic> json) =
      _$ClothesCategoryImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'categoryname')
  String get categoryName;
  @override
  @JsonKey(name: 'categoryicon')
  String get imagePath;
  @override
  bool get isSelected;

  /// Create a copy of ClothesCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClothesCategoryImplCopyWith<_$ClothesCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
