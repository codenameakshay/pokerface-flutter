// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Card _$CardFromJson(Map<String, dynamic> json) {
  return _Card.fromJson(json);
}

/// @nodoc
mixin _$Card {
  Rank get rank => throw _privateConstructorUsedError;
  Suit get suit => throw _privateConstructorUsedError;
  CardImage get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardCopyWith<Card> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardCopyWith<$Res> {
  factory $CardCopyWith(Card value, $Res Function(Card) then) = _$CardCopyWithImpl<$Res, Card>;
  @useResult
  $Res call({Rank rank, Suit suit, CardImage image});

  $CardImageCopyWith<$Res> get image;
}

/// @nodoc
class _$CardCopyWithImpl<$Res, $Val extends Card> implements $CardCopyWith<$Res> {
  _$CardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? suit = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as Rank,
      suit: null == suit
          ? _value.suit
          : suit // ignore: cast_nullable_to_non_nullable
              as Suit,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as CardImage,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CardImageCopyWith<$Res> get image {
    return $CardImageCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CardImplCopyWith<$Res> implements $CardCopyWith<$Res> {
  factory _$$CardImplCopyWith(_$CardImpl value, $Res Function(_$CardImpl) then) = __$$CardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Rank rank, Suit suit, CardImage image});

  @override
  $CardImageCopyWith<$Res> get image;
}

/// @nodoc
class __$$CardImplCopyWithImpl<$Res> extends _$CardCopyWithImpl<$Res, _$CardImpl> implements _$$CardImplCopyWith<$Res> {
  __$$CardImplCopyWithImpl(_$CardImpl _value, $Res Function(_$CardImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? suit = null,
    Object? image = null,
  }) {
    return _then(_$CardImpl(
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as Rank,
      suit: null == suit
          ? _value.suit
          : suit // ignore: cast_nullable_to_non_nullable
              as Suit,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as CardImage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardImpl implements _Card {
  const _$CardImpl({required this.rank, required this.suit, required this.image});

  factory _$CardImpl.fromJson(Map<String, dynamic> json) => _$$CardImplFromJson(json);

  @override
  final Rank rank;
  @override
  final Suit suit;
  @override
  final CardImage image;

  @override
  String toString() {
    return 'Card(rank: $rank, suit: $suit, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardImpl &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.suit, suit) || other.suit == suit) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rank, suit, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardImplCopyWith<_$CardImpl> get copyWith => __$$CardImplCopyWithImpl<_$CardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardImplToJson(
      this,
    );
  }
}

abstract class _Card implements Card {
  const factory _Card({required final Rank rank, required final Suit suit, required final CardImage image}) =
      _$CardImpl;

  factory _Card.fromJson(Map<String, dynamic> json) = _$CardImpl.fromJson;

  @override
  Rank get rank;
  @override
  Suit get suit;
  @override
  CardImage get image;
  @override
  @JsonKey(ignore: true)
  _$$CardImplCopyWith<_$CardImpl> get copyWith => throw _privateConstructorUsedError;
}
