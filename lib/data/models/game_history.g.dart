// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameHistoryImpl _$$GameHistoryImplFromJson(Map<String, dynamic> json) => _$GameHistoryImpl(
      userSelectedCards:
          (json['userSelectedCards'] as List<dynamic>).map((e) => Card.fromJson(e as Map<String, dynamic>)).toList(),
      numberOfPlayers: (json['numberOfPlayers'] as num).toDouble(),
      numberOfHouseCards: (json['numberOfHouseCards'] as num).toDouble(),
      openHouseCards:
          (json['openHouseCards'] as List<dynamic>).map((e) => Card.fromJson(e as Map<String, dynamic>)).toList(),
      isUserWinner: json['isUserWinner'] as bool,
      score: json['score'] as int,
      elapsedSeconds: json['elapsedSeconds'] as int,
      gameStartAt: DateTime.parse(json['gameStartAt'] as String),
      gameUpdatedAt: DateTime.parse(json['gameUpdatedAt'] as String),
    );

Map<String, dynamic> _$$GameHistoryImplToJson(_$GameHistoryImpl instance) => <String, dynamic>{
      'userSelectedCards': instance.userSelectedCards.map((e) => e.toJson()).toList(),
      'numberOfPlayers': instance.numberOfPlayers,
      'numberOfHouseCards': instance.numberOfHouseCards,
      'openHouseCards': instance.openHouseCards.map((e) => e.toJson()).toList(),
      'isUserWinner': instance.isUserWinner,
      'score': instance.score,
      'elapsedSeconds': instance.elapsedSeconds,
      'gameStartAt': instance.gameStartAt.toIso8601String(),
      'gameUpdatedAt': instance.gameUpdatedAt.toIso8601String(),
    };
