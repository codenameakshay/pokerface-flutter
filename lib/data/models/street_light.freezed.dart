// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'street_light.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StreetLight {
  List<Bulb> get bulbs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StreetLightCopyWith<StreetLight> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreetLightCopyWith<$Res> {
  factory $StreetLightCopyWith(StreetLight value, $Res Function(StreetLight) then) =
      _$StreetLightCopyWithImpl<$Res, StreetLight>;
  @useResult
  $Res call({List<Bulb> bulbs});
}

/// @nodoc
class _$StreetLightCopyWithImpl<$Res, $Val extends StreetLight> implements $StreetLightCopyWith<$Res> {
  _$StreetLightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bulbs = null,
  }) {
    return _then(_value.copyWith(
      bulbs: null == bulbs
          ? _value.bulbs
          : bulbs // ignore: cast_nullable_to_non_nullable
              as List<Bulb>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StreetLightImplCopyWith<$Res> implements $StreetLightCopyWith<$Res> {
  factory _$$StreetLightImplCopyWith(_$StreetLightImpl value, $Res Function(_$StreetLightImpl) then) =
      __$$StreetLightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Bulb> bulbs});
}

/// @nodoc
class __$$StreetLightImplCopyWithImpl<$Res> extends _$StreetLightCopyWithImpl<$Res, _$StreetLightImpl>
    implements _$$StreetLightImplCopyWith<$Res> {
  __$$StreetLightImplCopyWithImpl(_$StreetLightImpl _value, $Res Function(_$StreetLightImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bulbs = null,
  }) {
    return _then(_$StreetLightImpl(
      bulbs: null == bulbs
          ? _value._bulbs
          : bulbs // ignore: cast_nullable_to_non_nullable
              as List<Bulb>,
    ));
  }
}

/// @nodoc

class _$StreetLightImpl implements _StreetLight {
  _$StreetLightImpl({required final List<Bulb> bulbs}) : _bulbs = bulbs;

  final List<Bulb> _bulbs;
  @override
  List<Bulb> get bulbs {
    if (_bulbs is EqualUnmodifiableListView) return _bulbs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bulbs);
  }

  @override
  String toString() {
    return 'StreetLight(bulbs: $bulbs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreetLightImpl &&
            const DeepCollectionEquality().equals(other._bulbs, _bulbs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(_bulbs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StreetLightImplCopyWith<_$StreetLightImpl> get copyWith =>
      __$$StreetLightImplCopyWithImpl<_$StreetLightImpl>(this, _$identity);
}

abstract class _StreetLight implements StreetLight {
  factory _StreetLight({required final List<Bulb> bulbs}) = _$StreetLightImpl;

  @override
  List<Bulb> get bulbs;
  @override
  @JsonKey(ignore: true)
  _$$StreetLightImplCopyWith<_$StreetLightImpl> get copyWith => throw _privateConstructorUsedError;
}
