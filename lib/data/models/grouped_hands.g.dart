// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grouped_hands.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GroupedHands _$GroupedHandsFromJson(Map<String, dynamic> json) =>
    _GroupedHands(
      isExpaned: json['isExpaned'] as bool,
      pokerHands: (json['pokerHands'] as List<dynamic>)
          .map((e) => PokerHand.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupedHandsToJson(_GroupedHands instance) =>
    <String, dynamic>{
      'isExpaned': instance.isExpaned,
      'pokerHands': instance.pokerHands,
    };
