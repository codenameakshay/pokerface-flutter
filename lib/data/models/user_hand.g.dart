// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_hand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserHandImpl _$$UserHandImplFromJson(Map<String, dynamic> json) => _$UserHandImpl(
      userCards: (json['userCards'] as List<dynamic>).map((e) => Card.fromJson(e as Map<String, dynamic>)).toList(),
      houseCards: (json['houseCards'] as List<dynamic>).map((e) => Card.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$$UserHandImplToJson(_$UserHandImpl instance) => <String, dynamic>{
      'userCards': instance.userCards,
      'houseCards': instance.houseCards,
    };
