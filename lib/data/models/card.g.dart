// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Card _$CardFromJson(Map<String, dynamic> json) => _Card(
  rank: $enumDecode(_$RankEnumMap, json['rank']),
  suit: $enumDecode(_$SuitEnumMap, json['suit']),
  image: CardImage.fromJson(json['image'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CardToJson(_Card instance) => <String, dynamic>{
  'rank': _$RankEnumMap[instance.rank]!,
  'suit': _$SuitEnumMap[instance.suit]!,
  'image': instance.image,
};

const _$RankEnumMap = {
  Rank.two: 'two',
  Rank.three: 'three',
  Rank.four: 'four',
  Rank.five: 'five',
  Rank.six: 'six',
  Rank.seven: 'seven',
  Rank.eight: 'eight',
  Rank.nine: 'nine',
  Rank.ten: 'ten',
  Rank.jack: 'jack',
  Rank.queen: 'queen',
  Rank.king: 'king',
  Rank.ace: 'ace',
};

const _$SuitEnumMap = {
  Suit.clubs: 'clubs',
  Suit.diamonds: 'diamonds',
  Suit.hearts: 'hearts',
  Suit.spades: 'spades',
};
