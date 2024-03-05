// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameHistory _$GameHistoryFromJson(Map<String, dynamic> json) {
  return _GameHistory.fromJson(json);
}

/// @nodoc
mixin _$GameHistory {
  List<Card> get userSelectedCards => throw _privateConstructorUsedError;
  double get numberOfPlayers => throw _privateConstructorUsedError;
  double get numberOfHouseCards => throw _privateConstructorUsedError;
  List<Card> get openHouseCards => throw _privateConstructorUsedError;
  bool get isUserWinner => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  int get elapsedSeconds => throw _privateConstructorUsedError;
  DateTime get gameStartAt => throw _privateConstructorUsedError;
  DateTime get gameUpdatedAt => throw _privateConstructorUsedError;
  PokerHand get topPokerHand => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameHistoryCopyWith<GameHistory> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameHistoryCopyWith<$Res> {
  factory $GameHistoryCopyWith(GameHistory value, $Res Function(GameHistory) then) =
      _$GameHistoryCopyWithImpl<$Res, GameHistory>;
  @useResult
  $Res call(
      {List<Card> userSelectedCards,
      double numberOfPlayers,
      double numberOfHouseCards,
      List<Card> openHouseCards,
      bool isUserWinner,
      int score,
      int elapsedSeconds,
      DateTime gameStartAt,
      DateTime gameUpdatedAt,
      PokerHand topPokerHand});

  $PokerHandCopyWith<$Res> get topPokerHand;
}

/// @nodoc
class _$GameHistoryCopyWithImpl<$Res, $Val extends GameHistory> implements $GameHistoryCopyWith<$Res> {
  _$GameHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userSelectedCards = null,
    Object? numberOfPlayers = null,
    Object? numberOfHouseCards = null,
    Object? openHouseCards = null,
    Object? isUserWinner = null,
    Object? score = null,
    Object? elapsedSeconds = null,
    Object? gameStartAt = null,
    Object? gameUpdatedAt = null,
    Object? topPokerHand = null,
  }) {
    return _then(_value.copyWith(
      userSelectedCards: null == userSelectedCards
          ? _value.userSelectedCards
          : userSelectedCards // ignore: cast_nullable_to_non_nullable
              as List<Card>,
      numberOfPlayers: null == numberOfPlayers
          ? _value.numberOfPlayers
          : numberOfPlayers // ignore: cast_nullable_to_non_nullable
              as double,
      numberOfHouseCards: null == numberOfHouseCards
          ? _value.numberOfHouseCards
          : numberOfHouseCards // ignore: cast_nullable_to_non_nullable
              as double,
      openHouseCards: null == openHouseCards
          ? _value.openHouseCards
          : openHouseCards // ignore: cast_nullable_to_non_nullable
              as List<Card>,
      isUserWinner: null == isUserWinner
          ? _value.isUserWinner
          : isUserWinner // ignore: cast_nullable_to_non_nullable
              as bool,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      elapsedSeconds: null == elapsedSeconds
          ? _value.elapsedSeconds
          : elapsedSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      gameStartAt: null == gameStartAt
          ? _value.gameStartAt
          : gameStartAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      gameUpdatedAt: null == gameUpdatedAt
          ? _value.gameUpdatedAt
          : gameUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      topPokerHand: null == topPokerHand
          ? _value.topPokerHand
          : topPokerHand // ignore: cast_nullable_to_non_nullable
              as PokerHand,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PokerHandCopyWith<$Res> get topPokerHand {
    return $PokerHandCopyWith<$Res>(_value.topPokerHand, (value) {
      return _then(_value.copyWith(topPokerHand: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameHistoryImplCopyWith<$Res> implements $GameHistoryCopyWith<$Res> {
  factory _$$GameHistoryImplCopyWith(_$GameHistoryImpl value, $Res Function(_$GameHistoryImpl) then) =
      __$$GameHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Card> userSelectedCards,
      double numberOfPlayers,
      double numberOfHouseCards,
      List<Card> openHouseCards,
      bool isUserWinner,
      int score,
      int elapsedSeconds,
      DateTime gameStartAt,
      DateTime gameUpdatedAt,
      PokerHand topPokerHand});

  @override
  $PokerHandCopyWith<$Res> get topPokerHand;
}

/// @nodoc
class __$$GameHistoryImplCopyWithImpl<$Res> extends _$GameHistoryCopyWithImpl<$Res, _$GameHistoryImpl>
    implements _$$GameHistoryImplCopyWith<$Res> {
  __$$GameHistoryImplCopyWithImpl(_$GameHistoryImpl _value, $Res Function(_$GameHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userSelectedCards = null,
    Object? numberOfPlayers = null,
    Object? numberOfHouseCards = null,
    Object? openHouseCards = null,
    Object? isUserWinner = null,
    Object? score = null,
    Object? elapsedSeconds = null,
    Object? gameStartAt = null,
    Object? gameUpdatedAt = null,
    Object? topPokerHand = null,
  }) {
    return _then(_$GameHistoryImpl(
      userSelectedCards: null == userSelectedCards
          ? _value._userSelectedCards
          : userSelectedCards // ignore: cast_nullable_to_non_nullable
              as List<Card>,
      numberOfPlayers: null == numberOfPlayers
          ? _value.numberOfPlayers
          : numberOfPlayers // ignore: cast_nullable_to_non_nullable
              as double,
      numberOfHouseCards: null == numberOfHouseCards
          ? _value.numberOfHouseCards
          : numberOfHouseCards // ignore: cast_nullable_to_non_nullable
              as double,
      openHouseCards: null == openHouseCards
          ? _value._openHouseCards
          : openHouseCards // ignore: cast_nullable_to_non_nullable
              as List<Card>,
      isUserWinner: null == isUserWinner
          ? _value.isUserWinner
          : isUserWinner // ignore: cast_nullable_to_non_nullable
              as bool,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      elapsedSeconds: null == elapsedSeconds
          ? _value.elapsedSeconds
          : elapsedSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      gameStartAt: null == gameStartAt
          ? _value.gameStartAt
          : gameStartAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      gameUpdatedAt: null == gameUpdatedAt
          ? _value.gameUpdatedAt
          : gameUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      topPokerHand: null == topPokerHand
          ? _value.topPokerHand
          : topPokerHand // ignore: cast_nullable_to_non_nullable
              as PokerHand,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameHistoryImpl implements _GameHistory {
  _$GameHistoryImpl(
      {required final List<Card> userSelectedCards,
      required this.numberOfPlayers,
      required this.numberOfHouseCards,
      required final List<Card> openHouseCards,
      required this.isUserWinner,
      required this.score,
      required this.elapsedSeconds,
      required this.gameStartAt,
      required this.gameUpdatedAt,
      required this.topPokerHand})
      : _userSelectedCards = userSelectedCards,
        _openHouseCards = openHouseCards;

  factory _$GameHistoryImpl.fromJson(Map<String, dynamic> json) => _$$GameHistoryImplFromJson(json);

  final List<Card> _userSelectedCards;
  @override
  List<Card> get userSelectedCards {
    if (_userSelectedCards is EqualUnmodifiableListView) return _userSelectedCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userSelectedCards);
  }

  @override
  final double numberOfPlayers;
  @override
  final double numberOfHouseCards;
  final List<Card> _openHouseCards;
  @override
  List<Card> get openHouseCards {
    if (_openHouseCards is EqualUnmodifiableListView) return _openHouseCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_openHouseCards);
  }

  @override
  final bool isUserWinner;
  @override
  final int score;
  @override
  final int elapsedSeconds;
  @override
  final DateTime gameStartAt;
  @override
  final DateTime gameUpdatedAt;
  @override
  final PokerHand topPokerHand;

  @override
  String toString() {
    return 'GameHistory(userSelectedCards: $userSelectedCards, numberOfPlayers: $numberOfPlayers, numberOfHouseCards: $numberOfHouseCards, openHouseCards: $openHouseCards, isUserWinner: $isUserWinner, score: $score, elapsedSeconds: $elapsedSeconds, gameStartAt: $gameStartAt, gameUpdatedAt: $gameUpdatedAt, topPokerHand: $topPokerHand)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameHistoryImpl &&
            const DeepCollectionEquality().equals(other._userSelectedCards, _userSelectedCards) &&
            (identical(other.numberOfPlayers, numberOfPlayers) || other.numberOfPlayers == numberOfPlayers) &&
            (identical(other.numberOfHouseCards, numberOfHouseCards) ||
                other.numberOfHouseCards == numberOfHouseCards) &&
            const DeepCollectionEquality().equals(other._openHouseCards, _openHouseCards) &&
            (identical(other.isUserWinner, isUserWinner) || other.isUserWinner == isUserWinner) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.elapsedSeconds, elapsedSeconds) || other.elapsedSeconds == elapsedSeconds) &&
            (identical(other.gameStartAt, gameStartAt) || other.gameStartAt == gameStartAt) &&
            (identical(other.gameUpdatedAt, gameUpdatedAt) || other.gameUpdatedAt == gameUpdatedAt) &&
            (identical(other.topPokerHand, topPokerHand) || other.topPokerHand == topPokerHand));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_userSelectedCards),
      numberOfPlayers,
      numberOfHouseCards,
      const DeepCollectionEquality().hash(_openHouseCards),
      isUserWinner,
      score,
      elapsedSeconds,
      gameStartAt,
      gameUpdatedAt,
      topPokerHand);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameHistoryImplCopyWith<_$GameHistoryImpl> get copyWith =>
      __$$GameHistoryImplCopyWithImpl<_$GameHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameHistoryImplToJson(
      this,
    );
  }
}

abstract class _GameHistory implements GameHistory {
  factory _GameHistory(
      {required final List<Card> userSelectedCards,
      required final double numberOfPlayers,
      required final double numberOfHouseCards,
      required final List<Card> openHouseCards,
      required final bool isUserWinner,
      required final int score,
      required final int elapsedSeconds,
      required final DateTime gameStartAt,
      required final DateTime gameUpdatedAt,
      required final PokerHand topPokerHand}) = _$GameHistoryImpl;

  factory _GameHistory.fromJson(Map<String, dynamic> json) = _$GameHistoryImpl.fromJson;

  @override
  List<Card> get userSelectedCards;
  @override
  double get numberOfPlayers;
  @override
  double get numberOfHouseCards;
  @override
  List<Card> get openHouseCards;
  @override
  bool get isUserWinner;
  @override
  int get score;
  @override
  int get elapsedSeconds;
  @override
  DateTime get gameStartAt;
  @override
  DateTime get gameUpdatedAt;
  @override
  PokerHand get topPokerHand;
  @override
  @JsonKey(ignore: true)
  _$$GameHistoryImplCopyWith<_$GameHistoryImpl> get copyWith => throw _privateConstructorUsedError;
}
