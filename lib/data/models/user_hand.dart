import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokerface/data/models/card.dart';

part 'user_hand.freezed.dart';
part 'user_hand.g.dart';

@freezed
class UserHand with _$UserHand {
  factory UserHand({
    required List<Card> userCards,
    required List<Card> houseCards,
  }) = _UserHand;

  factory UserHand.fromJson(Map<String, dynamic> json) => _$UserHandFromJson(json);
}

extension UserHandExtension on UserHand {
  List<Card> get allCards => [...userCards, ...houseCards];

  List<int> calculateScoreDistribution() {
    List<int> scoreDistribution = [];

    if (allCards.length > 2) {
      for (int i = 0; i < allCards.length; i++) {
        for (int j = i + 1; j < allCards.length; j++) {
          if (allCards[i].rank == allCards[j].rank) {
            // Pair
            scoreDistribution.add(getScoreForType['Pair']!);
          }

          // Suited
          if (allCards[0].suit == allCards[1].suit) {
            scoreDistribution.add(getScoreForType['Suited']!);
          }

          // Connectors
          if ((allCards[0].rank.index - allCards[1].rank.index).abs() == 1) {
            scoreDistribution.add(getScoreForType['Connectors']!);
          }
        }
      }
    }

    Map<String, int> rankCounts = {};
    Map<String, int> suitCounts = {};
    for (var card in allCards) {
      rankCounts[card.rank.name] = (rankCounts[card.rank.name] ?? 0) + 1;
      suitCounts[card.suit.name] = (suitCounts[card.suit.name] ?? 0) + 1;
    }

    // Check for pairs, three of a kind, four of a kind
    for (var count in rankCounts.values) {
      if (count == 3) {
        scoreDistribution.add(getScoreForType['Three of a Kind']!);
      } else if (count == 4) {
        scoreDistribution.add(getScoreForType['Four of a Kind']!);
      }
    }

    // Check for full house
    if (rankCounts.values.contains(3) && rankCounts.values.contains(2)) {
      scoreDistribution.add(getScoreForType['Full House']!);
    }

    // Check for flush
    if (suitCounts.values.contains(5)) {
      scoreDistribution.add(getScoreForType['Flush']!);
    }

    // Straight
    List<int> ranks = allCards.map((card) => card.rank.index).toList()..sort();
    for (int i = 0; i < ranks.length - 1; i++) {
      if (ranks[i + 1] - ranks[i] != 1) {
        break;
      }
      if (i == ranks.length - 2) {
        scoreDistribution.add(getScoreForType['Straight']!);
      }
    }

    return scoreDistribution;
  }

  Map<String, int> get getScoreForType => {
        'Pair': 2,
        'Suited': 5,
        'Connectors': 4,
        'Two Pair': 2,
        'Three of a Kind': 3,
        'Straight': 7,
        'Flush': 9,
        'Full House': 10,
        'Four of a Kind': 8,
      };

  Map<String, String> parsedScoreDistribution() {
    Map<String, int> parsedScoreDistribution = getScoreForType.map((key, value) => MapEntry(key, 0));

    List<int> scoreDistribution = calculateScoreDistribution();

    for (var score in scoreDistribution) {
      for (var type in getScoreForType.entries) {
        if (score == type.value) {
          parsedScoreDistribution[type.key] = parsedScoreDistribution[type.key]! + 1;
        }
      }
    }

    if (parsedScoreDistribution['Pair']! > 1) {
      parsedScoreDistribution['Two Pair'] = 1;
      parsedScoreDistribution['Pair'] = parsedScoreDistribution['Pair']! - 2;
    }

    // convert parsedScoreDistribution int to string with multiplier
    final parsedScore = parsedScoreDistribution.map((key, value) => MapEntry(
          key,
          '$value x ${getScoreForType[key]}',
        ));

    return parsedScore;
  }
}
