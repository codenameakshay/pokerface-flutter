// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grouped_hands.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroupedHands {

 bool get isExpaned; List<PokerHand> get pokerHands;
/// Create a copy of GroupedHands
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupedHandsCopyWith<GroupedHands> get copyWith => _$GroupedHandsCopyWithImpl<GroupedHands>(this as GroupedHands, _$identity);

  /// Serializes this GroupedHands to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupedHands&&(identical(other.isExpaned, isExpaned) || other.isExpaned == isExpaned)&&const DeepCollectionEquality().equals(other.pokerHands, pokerHands));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isExpaned,const DeepCollectionEquality().hash(pokerHands));

@override
String toString() {
  return 'GroupedHands(isExpaned: $isExpaned, pokerHands: $pokerHands)';
}


}

/// @nodoc
abstract mixin class $GroupedHandsCopyWith<$Res>  {
  factory $GroupedHandsCopyWith(GroupedHands value, $Res Function(GroupedHands) _then) = _$GroupedHandsCopyWithImpl;
@useResult
$Res call({
 bool isExpaned, List<PokerHand> pokerHands
});




}
/// @nodoc
class _$GroupedHandsCopyWithImpl<$Res>
    implements $GroupedHandsCopyWith<$Res> {
  _$GroupedHandsCopyWithImpl(this._self, this._then);

  final GroupedHands _self;
  final $Res Function(GroupedHands) _then;

/// Create a copy of GroupedHands
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isExpaned = null,Object? pokerHands = null,}) {
  return _then(GroupedHands(
isExpaned: null == isExpaned ? _self.isExpaned : isExpaned // ignore: cast_nullable_to_non_nullable
as bool,pokerHands: null == pokerHands ? _self.pokerHands : pokerHands // ignore: cast_nullable_to_non_nullable
as List<PokerHand>,
  ));
}

}


/// Adds pattern-matching-related methods to [GroupedHands].
extension GroupedHandsPatterns on GroupedHands {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroupedHands value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroupedHands() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroupedHands value)  $default,){
final _that = this;
switch (_that) {
case _GroupedHands():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroupedHands value)?  $default,){
final _that = this;
switch (_that) {
case _GroupedHands() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isExpaned,  List<PokerHand> pokerHands)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroupedHands() when $default != null:
return $default(_that.isExpaned,_that.pokerHands);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isExpaned,  List<PokerHand> pokerHands)  $default,) {final _that = this;
switch (_that) {
case _GroupedHands():
return $default(_that.isExpaned,_that.pokerHands);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isExpaned,  List<PokerHand> pokerHands)?  $default,) {final _that = this;
switch (_that) {
case _GroupedHands() when $default != null:
return $default(_that.isExpaned,_that.pokerHands);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GroupedHands implements GroupedHands {
   _GroupedHands({required this.isExpaned, required  List<PokerHand> pokerHands}): _pokerHands = pokerHands;
  factory _GroupedHands.fromJson(Map<String, dynamic> json) => _$GroupedHandsFromJson(json);

@override final  bool isExpaned;
 final  List<PokerHand> _pokerHands;
@override List<PokerHand> get pokerHands {
  if (_pokerHands is EqualUnmodifiableListView) return _pokerHands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pokerHands);
}


/// Create a copy of GroupedHands
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupedHandsCopyWith<_GroupedHands> get copyWith => __$GroupedHandsCopyWithImpl<_GroupedHands>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroupedHandsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupedHands&&(identical(other.isExpaned, isExpaned) || other.isExpaned == isExpaned)&&const DeepCollectionEquality().equals(other._pokerHands, _pokerHands));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isExpaned,const DeepCollectionEquality().hash(_pokerHands));

@override
String toString() {
  return 'GroupedHands(isExpaned: $isExpaned, pokerHands: $pokerHands)';
}


}

/// @nodoc
abstract mixin class _$GroupedHandsCopyWith<$Res> implements $GroupedHandsCopyWith<$Res> {
  factory _$GroupedHandsCopyWith(_GroupedHands value, $Res Function(_GroupedHands) _then) = __$GroupedHandsCopyWithImpl;
@override @useResult
$Res call({
 bool isExpaned, List<PokerHand> pokerHands
});




}
/// @nodoc
class __$GroupedHandsCopyWithImpl<$Res>
    implements _$GroupedHandsCopyWith<$Res> {
  __$GroupedHandsCopyWithImpl(this._self, this._then);

  final _GroupedHands _self;
  final $Res Function(_GroupedHands) _then;

/// Create a copy of GroupedHands
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isExpaned = null,Object? pokerHands = null,}) {
  return _then(_GroupedHands(
isExpaned: null == isExpaned ? _self.isExpaned : isExpaned // ignore: cast_nullable_to_non_nullable
as bool,pokerHands: null == pokerHands ? _self._pokerHands : pokerHands // ignore: cast_nullable_to_non_nullable
as List<PokerHand>,
  ));
}


}

// dart format on
