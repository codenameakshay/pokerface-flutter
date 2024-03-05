import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/data/models/poker_hand.dart';

part 'game_history.freezed.dart';
part 'game_history.g.dart';

@freezed
class GameHistory with _$GameHistory {
  factory GameHistory({
    required List<Card> userSelectedCards,
    required double numberOfPlayers,
    required double numberOfHouseCards,
    required List<Card> openHouseCards,
    required bool isUserWinner,
    required int score,
    required int elapsedSeconds,
    required DateTime gameStartAt,
    required DateTime gameUpdatedAt,
    required PokerHand topPokerHand,
  }) = _GameHistory;

  factory GameHistory.fromJson(Map<String, dynamic> json) => _$GameHistoryFromJson(json);
}
