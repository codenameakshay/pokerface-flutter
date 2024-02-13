// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grouped_hands.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupedHandsImpl _$$GroupedHandsImplFromJson(Map<String, dynamic> json) => _$GroupedHandsImpl(
      isExpaned: json['isExpaned'] as bool,
      pokerHands:
          (json['pokerHands'] as List<dynamic>).map((e) => PokerHand.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$$GroupedHandsImplToJson(_$GroupedHandsImpl instance) => <String, dynamic>{
      'isExpaned': instance.isExpaned,
      'pokerHands': instance.pokerHands,
    };
