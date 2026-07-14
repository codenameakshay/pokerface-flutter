// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'street_light.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StreetLight {

 List<Bulb> get bulbs;
/// Create a copy of StreetLight
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreetLightCopyWith<StreetLight> get copyWith => _$StreetLightCopyWithImpl<StreetLight>(this as StreetLight, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreetLight&&const DeepCollectionEquality().equals(other.bulbs, bulbs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bulbs));

@override
String toString() {
  return 'StreetLight(bulbs: $bulbs)';
}


}

/// @nodoc
abstract mixin class $StreetLightCopyWith<$Res>  {
  factory $StreetLightCopyWith(StreetLight value, $Res Function(StreetLight) _then) = _$StreetLightCopyWithImpl;
@useResult
$Res call({
 List<Bulb> bulbs
});




}
/// @nodoc
class _$StreetLightCopyWithImpl<$Res>
    implements $StreetLightCopyWith<$Res> {
  _$StreetLightCopyWithImpl(this._self, this._then);

  final StreetLight _self;
  final $Res Function(StreetLight) _then;

/// Create a copy of StreetLight
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bulbs = null,}) {
  return _then(StreetLight(
bulbs: null == bulbs ? _self.bulbs : bulbs // ignore: cast_nullable_to_non_nullable
as List<Bulb>,
  ));
}

}


/// Adds pattern-matching-related methods to [StreetLight].
extension StreetLightPatterns on StreetLight {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StreetLight value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StreetLight() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StreetLight value)  $default,){
final _that = this;
switch (_that) {
case _StreetLight():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StreetLight value)?  $default,){
final _that = this;
switch (_that) {
case _StreetLight() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Bulb> bulbs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StreetLight() when $default != null:
return $default(_that.bulbs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Bulb> bulbs)  $default,) {final _that = this;
switch (_that) {
case _StreetLight():
return $default(_that.bulbs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Bulb> bulbs)?  $default,) {final _that = this;
switch (_that) {
case _StreetLight() when $default != null:
return $default(_that.bulbs);case _:
  return null;

}
}

}

/// @nodoc


class _StreetLight implements StreetLight {
   _StreetLight({required  List<Bulb> bulbs}): _bulbs = bulbs;
  

 final  List<Bulb> _bulbs;
@override List<Bulb> get bulbs {
  if (_bulbs is EqualUnmodifiableListView) return _bulbs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bulbs);
}


/// Create a copy of StreetLight
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreetLightCopyWith<_StreetLight> get copyWith => __$StreetLightCopyWithImpl<_StreetLight>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreetLight&&const DeepCollectionEquality().equals(other._bulbs, _bulbs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bulbs));

@override
String toString() {
  return 'StreetLight(bulbs: $bulbs)';
}


}

/// @nodoc
abstract mixin class _$StreetLightCopyWith<$Res> implements $StreetLightCopyWith<$Res> {
  factory _$StreetLightCopyWith(_StreetLight value, $Res Function(_StreetLight) _then) = __$StreetLightCopyWithImpl;
@override @useResult
$Res call({
 List<Bulb> bulbs
});




}
/// @nodoc
class __$StreetLightCopyWithImpl<$Res>
    implements _$StreetLightCopyWith<$Res> {
  __$StreetLightCopyWithImpl(this._self, this._then);

  final _StreetLight _self;
  final $Res Function(_StreetLight) _then;

/// Create a copy of StreetLight
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bulbs = null,}) {
  return _then(_StreetLight(
bulbs: null == bulbs ? _self._bulbs : bulbs // ignore: cast_nullable_to_non_nullable
as List<Bulb>,
  ));
}


}

// dart format on
