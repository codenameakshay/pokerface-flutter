// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poker_hand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PokerHand {

 List<Card> get cards;
/// Create a copy of PokerHand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokerHandCopyWith<PokerHand> get copyWith => _$PokerHandCopyWithImpl<PokerHand>(this as PokerHand, _$identity);

  /// Serializes this PokerHand to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokerHand&&const DeepCollectionEquality().equals(other.cards, cards));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(cards));

@override
String toString() {
  return 'PokerHand(cards: $cards)';
}


}

/// @nodoc
abstract mixin class $PokerHandCopyWith<$Res>  {
  factory $PokerHandCopyWith(PokerHand value, $Res Function(PokerHand) _then) = _$PokerHandCopyWithImpl;
@useResult
$Res call({
 List<Card> cards
});




}
/// @nodoc
class _$PokerHandCopyWithImpl<$Res>
    implements $PokerHandCopyWith<$Res> {
  _$PokerHandCopyWithImpl(this._self, this._then);

  final PokerHand _self;
  final $Res Function(PokerHand) _then;

/// Create a copy of PokerHand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cards = null,}) {
  return _then(PokerHand(
cards: null == cards ? _self.cards : cards // ignore: cast_nullable_to_non_nullable
as List<Card>,
  ));
}

}


/// Adds pattern-matching-related methods to [PokerHand].
extension PokerHandPatterns on PokerHand {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokerHand value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokerHand() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokerHand value)  $default,){
final _that = this;
switch (_that) {
case _PokerHand():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokerHand value)?  $default,){
final _that = this;
switch (_that) {
case _PokerHand() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Card> cards)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokerHand() when $default != null:
return $default(_that.cards);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Card> cards)  $default,) {final _that = this;
switch (_that) {
case _PokerHand():
return $default(_that.cards);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Card> cards)?  $default,) {final _that = this;
switch (_that) {
case _PokerHand() when $default != null:
return $default(_that.cards);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokerHand implements PokerHand {
   _PokerHand({required  List<Card> cards}): _cards = cards;
  factory _PokerHand.fromJson(Map<String, dynamic> json) => _$PokerHandFromJson(json);

 final  List<Card> _cards;
@override List<Card> get cards {
  if (_cards is EqualUnmodifiableListView) return _cards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cards);
}


/// Create a copy of PokerHand
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokerHandCopyWith<_PokerHand> get copyWith => __$PokerHandCopyWithImpl<_PokerHand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokerHandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokerHand&&const DeepCollectionEquality().equals(other._cards, _cards));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cards));

@override
String toString() {
  return 'PokerHand(cards: $cards)';
}


}

/// @nodoc
abstract mixin class _$PokerHandCopyWith<$Res> implements $PokerHandCopyWith<$Res> {
  factory _$PokerHandCopyWith(_PokerHand value, $Res Function(_PokerHand) _then) = __$PokerHandCopyWithImpl;
@override @useResult
$Res call({
 List<Card> cards
});




}
/// @nodoc
class __$PokerHandCopyWithImpl<$Res>
    implements _$PokerHandCopyWith<$Res> {
  __$PokerHandCopyWithImpl(this._self, this._then);

  final _PokerHand _self;
  final $Res Function(_PokerHand) _then;

/// Create a copy of PokerHand
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cards = null,}) {
  return _then(_PokerHand(
cards: null == cards ? _self._cards : cards // ignore: cast_nullable_to_non_nullable
as List<Card>,
  ));
}


}

// dart format on
