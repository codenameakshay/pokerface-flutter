// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CardImage {

 String get svg; String get png;
/// Create a copy of CardImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardImageCopyWith<CardImage> get copyWith => _$CardImageCopyWithImpl<CardImage>(this as CardImage, _$identity);

  /// Serializes this CardImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardImage&&(identical(other.svg, svg) || other.svg == svg)&&(identical(other.png, png) || other.png == png));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,svg,png);

@override
String toString() {
  return 'CardImage(svg: $svg, png: $png)';
}


}

/// @nodoc
abstract mixin class $CardImageCopyWith<$Res>  {
  factory $CardImageCopyWith(CardImage value, $Res Function(CardImage) _then) = _$CardImageCopyWithImpl;
@useResult
$Res call({
 String svg, String png
});




}
/// @nodoc
class _$CardImageCopyWithImpl<$Res>
    implements $CardImageCopyWith<$Res> {
  _$CardImageCopyWithImpl(this._self, this._then);

  final CardImage _self;
  final $Res Function(CardImage) _then;

/// Create a copy of CardImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? svg = null,Object? png = null,}) {
  return _then(CardImage(
svg: null == svg ? _self.svg : svg // ignore: cast_nullable_to_non_nullable
as String,png: null == png ? _self.png : png // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CardImage].
extension CardImagePatterns on CardImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardImage value)  $default,){
final _that = this;
switch (_that) {
case _CardImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardImage value)?  $default,){
final _that = this;
switch (_that) {
case _CardImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String svg,  String png)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardImage() when $default != null:
return $default(_that.svg,_that.png);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String svg,  String png)  $default,) {final _that = this;
switch (_that) {
case _CardImage():
return $default(_that.svg,_that.png);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String svg,  String png)?  $default,) {final _that = this;
switch (_that) {
case _CardImage() when $default != null:
return $default(_that.svg,_that.png);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CardImage implements CardImage {
   _CardImage({required this.svg, required this.png});
  factory _CardImage.fromJson(Map<String, dynamic> json) => _$CardImageFromJson(json);

@override final  String svg;
@override final  String png;

/// Create a copy of CardImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardImageCopyWith<_CardImage> get copyWith => __$CardImageCopyWithImpl<_CardImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardImage&&(identical(other.svg, svg) || other.svg == svg)&&(identical(other.png, png) || other.png == png));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,svg,png);

@override
String toString() {
  return 'CardImage(svg: $svg, png: $png)';
}


}

/// @nodoc
abstract mixin class _$CardImageCopyWith<$Res> implements $CardImageCopyWith<$Res> {
  factory _$CardImageCopyWith(_CardImage value, $Res Function(_CardImage) _then) = __$CardImageCopyWithImpl;
@override @useResult
$Res call({
 String svg, String png
});




}
/// @nodoc
class __$CardImageCopyWithImpl<$Res>
    implements _$CardImageCopyWith<$Res> {
  __$CardImageCopyWithImpl(this._self, this._then);

  final _CardImage _self;
  final $Res Function(_CardImage) _then;

/// Create a copy of CardImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? svg = null,Object? png = null,}) {
  return _then(_CardImage(
svg: null == svg ? _self.svg : svg // ignore: cast_nullable_to_non_nullable
as String,png: null == png ? _self.png : png // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
