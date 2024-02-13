// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bulb.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Bulb {
  Color get onColor => throw _privateConstructorUsedError;
  Color get offColor => throw _privateConstructorUsedError;
  Color get borderColor => throw _privateConstructorUsedError;
  bool get isOn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BulbCopyWith<Bulb> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BulbCopyWith<$Res> {
  factory $BulbCopyWith(Bulb value, $Res Function(Bulb) then) = _$BulbCopyWithImpl<$Res, Bulb>;
  @useResult
  $Res call({Color onColor, Color offColor, Color borderColor, bool isOn});
}

/// @nodoc
class _$BulbCopyWithImpl<$Res, $Val extends Bulb> implements $BulbCopyWith<$Res> {
  _$BulbCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onColor = null,
    Object? offColor = null,
    Object? borderColor = null,
    Object? isOn = null,
  }) {
    return _then(_value.copyWith(
      onColor: null == onColor
          ? _value.onColor
          : onColor // ignore: cast_nullable_to_non_nullable
              as Color,
      offColor: null == offColor
          ? _value.offColor
          : offColor // ignore: cast_nullable_to_non_nullable
              as Color,
      borderColor: null == borderColor
          ? _value.borderColor
          : borderColor // ignore: cast_nullable_to_non_nullable
              as Color,
      isOn: null == isOn
          ? _value.isOn
          : isOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BulbImplCopyWith<$Res> implements $BulbCopyWith<$Res> {
  factory _$$BulbImplCopyWith(_$BulbImpl value, $Res Function(_$BulbImpl) then) = __$$BulbImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Color onColor, Color offColor, Color borderColor, bool isOn});
}

/// @nodoc
class __$$BulbImplCopyWithImpl<$Res> extends _$BulbCopyWithImpl<$Res, _$BulbImpl> implements _$$BulbImplCopyWith<$Res> {
  __$$BulbImplCopyWithImpl(_$BulbImpl _value, $Res Function(_$BulbImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onColor = null,
    Object? offColor = null,
    Object? borderColor = null,
    Object? isOn = null,
  }) {
    return _then(_$BulbImpl(
      onColor: null == onColor
          ? _value.onColor
          : onColor // ignore: cast_nullable_to_non_nullable
              as Color,
      offColor: null == offColor
          ? _value.offColor
          : offColor // ignore: cast_nullable_to_non_nullable
              as Color,
      borderColor: null == borderColor
          ? _value.borderColor
          : borderColor // ignore: cast_nullable_to_non_nullable
              as Color,
      isOn: null == isOn
          ? _value.isOn
          : isOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BulbImpl implements _Bulb {
  _$BulbImpl({required this.onColor, required this.offColor, required this.borderColor, required this.isOn});

  @override
  final Color onColor;
  @override
  final Color offColor;
  @override
  final Color borderColor;
  @override
  final bool isOn;

  @override
  String toString() {
    return 'Bulb(onColor: $onColor, offColor: $offColor, borderColor: $borderColor, isOn: $isOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BulbImpl &&
            (identical(other.onColor, onColor) || other.onColor == onColor) &&
            (identical(other.offColor, offColor) || other.offColor == offColor) &&
            (identical(other.borderColor, borderColor) || other.borderColor == borderColor) &&
            (identical(other.isOn, isOn) || other.isOn == isOn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onColor, offColor, borderColor, isOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BulbImplCopyWith<_$BulbImpl> get copyWith => __$$BulbImplCopyWithImpl<_$BulbImpl>(this, _$identity);
}

abstract class _Bulb implements Bulb {
  factory _Bulb(
      {required final Color onColor,
      required final Color offColor,
      required final Color borderColor,
      required final bool isOn}) = _$BulbImpl;

  @override
  Color get onColor;
  @override
  Color get offColor;
  @override
  Color get borderColor;
  @override
  bool get isOn;
  @override
  @JsonKey(ignore: true)
  _$$BulbImplCopyWith<_$BulbImpl> get copyWith => throw _privateConstructorUsedError;
}
