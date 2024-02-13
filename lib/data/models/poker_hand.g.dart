// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poker_hand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokerHandImpl _$$PokerHandImplFromJson(Map<String, dynamic> json) => _$PokerHandImpl(
      cards: (json['cards'] as List<dynamic>).map((e) => Card.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$$PokerHandImplToJson(_$PokerHandImpl instance) => <String, dynamic>{
      'cards': instance.cards.map((e) => e.toJson()).toList(),
    };
