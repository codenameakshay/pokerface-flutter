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

  int calculateScore() {
    List<int> scoreDistribution = [];
    int score = 0;

    if (allCards.length > 2) {
      for (int i = 0; i < allCards.length; i++) {
        for (int j = i + 1; j < allCards.length; j++) {
          if (allCards[i].rank == allCards[j].rank) {
            // Pair
            scoreDistribution.add(2);
            score += 2;
          }

          // Suited
          if (allCards[0].suit == allCards[1].suit) {
            scoreDistribution.add(5);
            score += 5;
          }

          // Connectors
          if ((allCards[0].rank.index - allCards[1].rank.index).abs() == 1) {
            scoreDistribution.add(4);
            score += 4;
          }
        }
      }
    }

    // if (userCards.length == 2) {
    //   // Pair
    //   if (userCards[0].rank == userCards[1].rank) {
    //     scoreDistribution.add(8); // High pair
    //     score += 8; // High pair
    //   }

    //   // Suited
    //   if (userCards[0].suit == userCards[1].suit) {
    //     scoreDistribution.add(5);
    //     score += 5;
    //   }

    //   // Connectors
    //   if ((userCards[0].rank.index - userCards[1].rank.index).abs() == 1) {
    //     scoreDistribution.add(4);
    //     score += 4;
    //   }
    // }

    Map<String, int> rankCounts = {};
    Map<String, int> suitCounts = {};
    for (var card in allCards) {
      rankCounts[card.rank.name] = (rankCounts[card.rank.name] ?? 0) + 1;
      suitCounts[card.suit.name] = (suitCounts[card.suit.name] ?? 0) + 1;
    }

    // Check for pairs, three of a kind, four of a kind
    for (var count in rankCounts.values) {
      if (count == 2) {
        scoreDistribution.add(2);
        score += 2; // Pair
      } else if (count == 3) {
        scoreDistribution.add(6);
        score += 6; // Three of a kind
      } else if (count == 4) {
        scoreDistribution.add(12);
        score += 12; // Four of a kind
      }
    }

    // Check for full house
    if (rankCounts.values.contains(3) && rankCounts.values.contains(2)) {
      scoreDistribution.add(10);
      score += 10;
    }

    // Check for flush
    if (suitCounts.values.contains(5)) {
      scoreDistribution.add(9);
      score += 9;
    }

    // Straight
    List<int> ranks = allCards.map((card) => card.rank.index).toList()..sort();
    for (int i = 0; i < ranks.length - 1; i++) {
      if (ranks[i + 1] - ranks[i] != 1) {
        break;
      }
      if (i == ranks.length - 2) {
        scoreDistribution.add(7);
        score += 7;
      }
    }

    // // Check for straight
    // List<int> ranks = allCards.map((card) => card.rank.index).toList()..sort();
    // for (int i = 0; i < ranks.length - 1; i++) {
    //   if (ranks[i] + 1 != ranks[i + 1]) {
    //     break;
    //   }
    //   if (i == ranks.length - 2) {
    //     score += 7;
    //   }
    // }

    return score;
    // return int.parse(scoreDistribution.reduce((value, element) => value + element).toString());
  }
}
