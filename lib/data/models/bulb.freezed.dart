// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bulb.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Bulb {

 Color get onColor; Color get offColor; Color get borderColor; bool get isOn;
/// Create a copy of Bulb
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BulbCopyWith<Bulb> get copyWith => _$BulbCopyWithImpl<Bulb>(this as Bulb, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bulb&&(identical(other.onColor, onColor) || other.onColor == onColor)&&(identical(other.offColor, offColor) || other.offColor == offColor)&&(identical(other.borderColor, borderColor) || other.borderColor == borderColor)&&(identical(other.isOn, isOn) || other.isOn == isOn));
}


@override
int get hashCode => Object.hash(runtimeType,onColor,offColor,borderColor,isOn);

@override
String toString() {
  return 'Bulb(onColor: $onColor, offColor: $offColor, borderColor: $borderColor, isOn: $isOn)';
}


}

/// @nodoc
abstract mixin class $BulbCopyWith<$Res>  {
  factory $BulbCopyWith(Bulb value, $Res Function(Bulb) _then) = _$BulbCopyWithImpl;
@useResult
$Res call({
 Color onColor, Color offColor, Color borderColor, bool isOn
});




}
/// @nodoc
class _$BulbCopyWithImpl<$Res>
    implements $BulbCopyWith<$Res> {
  _$BulbCopyWithImpl(this._self, this._then);

  final Bulb _self;
  final $Res Function(Bulb) _then;

/// Create a copy of Bulb
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? onColor = null,Object? offColor = null,Object? borderColor = null,Object? isOn = null,}) {
  return _then(Bulb(
onColor: null == onColor ? _self.onColor : onColor // ignore: cast_nullable_to_non_nullable
as Color,offColor: null == offColor ? _self.offColor : offColor // ignore: cast_nullable_to_non_nullable
as Color,borderColor: null == borderColor ? _self.borderColor : borderColor // ignore: cast_nullable_to_non_nullable
as Color,isOn: null == isOn ? _self.isOn : isOn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Bulb].
extension BulbPatterns on Bulb {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Bulb value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Bulb() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Bulb value)  $default,){
final _that = this;
switch (_that) {
case _Bulb():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Bulb value)?  $default,){
final _that = this;
switch (_that) {
case _Bulb() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Color onColor,  Color offColor,  Color borderColor,  bool isOn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Bulb() when $default != null:
return $default(_that.onColor,_that.offColor,_that.borderColor,_that.isOn);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Color onColor,  Color offColor,  Color borderColor,  bool isOn)  $default,) {final _that = this;
switch (_that) {
case _Bulb():
return $default(_that.onColor,_that.offColor,_that.borderColor,_that.isOn);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Color onColor,  Color offColor,  Color borderColor,  bool isOn)?  $default,) {final _that = this;
switch (_that) {
case _Bulb() when $default != null:
return $default(_that.onColor,_that.offColor,_that.borderColor,_that.isOn);case _:
  return null;

}
}

}

/// @nodoc


class _Bulb implements Bulb {
   _Bulb({required this.onColor, required this.offColor, required this.borderColor, required this.isOn});
  

@override final  Color onColor;
@override final  Color offColor;
@override final  Color borderColor;
@override final  bool isOn;

/// Create a copy of Bulb
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BulbCopyWith<_Bulb> get copyWith => __$BulbCopyWithImpl<_Bulb>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bulb&&(identical(other.onColor, onColor) || other.onColor == onColor)&&(identical(other.offColor, offColor) || other.offColor == offColor)&&(identical(other.borderColor, borderColor) || other.borderColor == borderColor)&&(identical(other.isOn, isOn) || other.isOn == isOn));
}


@override
int get hashCode => Object.hash(runtimeType,onColor,offColor,borderColor,isOn);

@override
String toString() {
  return 'Bulb(onColor: $onColor, offColor: $offColor, borderColor: $borderColor, isOn: $isOn)';
}


}

/// @nodoc
abstract mixin class _$BulbCopyWith<$Res> implements $BulbCopyWith<$Res> {
  factory _$BulbCopyWith(_Bulb value, $Res Function(_Bulb) _then) = __$BulbCopyWithImpl;
@override @useResult
$Res call({
 Color onColor, Color offColor, Color borderColor, bool isOn
});




}
/// @nodoc
class __$BulbCopyWithImpl<$Res>
    implements _$BulbCopyWith<$Res> {
  __$BulbCopyWithImpl(this._self, this._then);

  final _Bulb _self;
  final $Res Function(_Bulb) _then;

/// Create a copy of Bulb
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? onColor = null,Object? offColor = null,Object? borderColor = null,Object? isOn = null,}) {
  return _then(_Bulb(
onColor: null == onColor ? _self.onColor : onColor // ignore: cast_nullable_to_non_nullable
as Color,offColor: null == offColor ? _self.offColor : offColor // ignore: cast_nullable_to_non_nullable
as Color,borderColor: null == borderColor ? _self.borderColor : borderColor // ignore: cast_nullable_to_non_nullable
as Color,isOn: null == isOn ? _self.isOn : isOn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
