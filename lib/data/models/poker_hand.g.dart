// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poker_hand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PokerHand _$PokerHandFromJson(Map<String, dynamic> json) =>
    _PokerHand(cards: (json['cards'] as List<dynamic>).map((e) => Card.fromJson(e as Map<String, dynamic>)).toList());

Map<String, dynamic> _$PokerHandToJson(_PokerHand instance) => <String, dynamic>{'cards': instance.cards};
