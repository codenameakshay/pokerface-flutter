// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CardImage _$CardImageFromJson(Map<String, dynamic> json) {
  return _CardImage.fromJson(json);
}

/// @nodoc
mixin _$CardImage {
  String get svg => throw _privateConstructorUsedError;
  String get png => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardImageCopyWith<CardImage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardImageCopyWith<$Res> {
  factory $CardImageCopyWith(CardImage value, $Res Function(CardImage) then) = _$CardImageCopyWithImpl<$Res, CardImage>;
  @useResult
  $Res call({String svg, String png});
}

/// @nodoc
class _$CardImageCopyWithImpl<$Res, $Val extends CardImage> implements $CardImageCopyWith<$Res> {
  _$CardImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? svg = null,
    Object? png = null,
  }) {
    return _then(_value.copyWith(
      svg: null == svg
          ? _value.svg
          : svg // ignore: cast_nullable_to_non_nullable
              as String,
      png: null == png
          ? _value.png
          : png // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardImageImplCopyWith<$Res> implements $CardImageCopyWith<$Res> {
  factory _$$CardImageImplCopyWith(_$CardImageImpl value, $Res Function(_$CardImageImpl) then) =
      __$$CardImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String svg, String png});
}

/// @nodoc
class __$$CardImageImplCopyWithImpl<$Res> extends _$CardImageCopyWithImpl<$Res, _$CardImageImpl>
    implements _$$CardImageImplCopyWith<$Res> {
  __$$CardImageImplCopyWithImpl(_$CardImageImpl _value, $Res Function(_$CardImageImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? svg = null,
    Object? png = null,
  }) {
    return _then(_$CardImageImpl(
      svg: null == svg
          ? _value.svg
          : svg // ignore: cast_nullable_to_non_nullable
              as String,
      png: null == png
          ? _value.png
          : png // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardImageImpl implements _CardImage {
  _$CardImageImpl({required this.svg, required this.png});

  factory _$CardImageImpl.fromJson(Map<String, dynamic> json) => _$$CardImageImplFromJson(json);

  @override
  final String svg;
  @override
  final String png;

  @override
  String toString() {
    return 'CardImage(svg: $svg, png: $png)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardImageImpl &&
            (identical(other.svg, svg) || other.svg == svg) &&
            (identical(other.png, png) || other.png == png));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, svg, png);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardImageImplCopyWith<_$CardImageImpl> get copyWith =>
      __$$CardImageImplCopyWithImpl<_$CardImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardImageImplToJson(
      this,
    );
  }
}

abstract class _CardImage implements CardImage {
  factory _CardImage({required final String svg, required final String png}) = _$CardImageImpl;

  factory _CardImage.fromJson(Map<String, dynamic> json) = _$CardImageImpl.fromJson;

  @override
  String get svg;
  @override
  String get png;
  @override
  @JsonKey(ignore: true)
  _$$CardImageImplCopyWith<_$CardImageImpl> get copyWith => throw _privateConstructorUsedError;
}
