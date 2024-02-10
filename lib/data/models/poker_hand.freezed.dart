// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poker_hand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokerHand _$PokerHandFromJson(Map<String, dynamic> json) {
  return _PokerHand.fromJson(json);
}

/// @nodoc
mixin _$PokerHand {
  List<Card> get cards => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokerHandCopyWith<PokerHand> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokerHandCopyWith<$Res> {
  factory $PokerHandCopyWith(PokerHand value, $Res Function(PokerHand) then) = _$PokerHandCopyWithImpl<$Res, PokerHand>;
  @useResult
  $Res call({List<Card> cards});
}

/// @nodoc
class _$PokerHandCopyWithImpl<$Res, $Val extends PokerHand> implements $PokerHandCopyWith<$Res> {
  _$PokerHandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
  }) {
    return _then(_value.copyWith(
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<Card>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokerHandImplCopyWith<$Res> implements $PokerHandCopyWith<$Res> {
  factory _$$PokerHandImplCopyWith(_$PokerHandImpl value, $Res Function(_$PokerHandImpl) then) =
      __$$PokerHandImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Card> cards});
}

/// @nodoc
class __$$PokerHandImplCopyWithImpl<$Res> extends _$PokerHandCopyWithImpl<$Res, _$PokerHandImpl>
    implements _$$PokerHandImplCopyWith<$Res> {
  __$$PokerHandImplCopyWithImpl(_$PokerHandImpl _value, $Res Function(_$PokerHandImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
  }) {
    return _then(_$PokerHandImpl(
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<Card>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokerHandImpl implements _PokerHand {
  _$PokerHandImpl({required final List<Card> cards}) : _cards = cards;

  factory _$PokerHandImpl.fromJson(Map<String, dynamic> json) => _$$PokerHandImplFromJson(json);

  final List<Card> _cards;
  @override
  List<Card> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  String toString() {
    return 'PokerHand(cards: $cards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokerHandImpl &&
            const DeepCollectionEquality().equals(other._cards, _cards));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(_cards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PokerHandImplCopyWith<_$PokerHandImpl> get copyWith =>
      __$$PokerHandImplCopyWithImpl<_$PokerHandImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokerHandImplToJson(
      this,
    );
  }
}

abstract class _PokerHand implements PokerHand {
  factory _PokerHand({required final List<Card> cards}) = _$PokerHandImpl;

  factory _PokerHand.fromJson(Map<String, dynamic> json) = _$PokerHandImpl.fromJson;

  @override
  List<Card> get cards;
  @override
  @JsonKey(ignore: true)
  _$$PokerHandImplCopyWith<_$PokerHandImpl> get copyWith => throw _privateConstructorUsedError;
}
