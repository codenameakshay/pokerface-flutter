import 'package:flutter/material.dart' hide Card;
import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/data/models/poker_hand.dart';
import 'package:pokerface/gen/assets.gen.dart';
import 'package:pokerface/presentation/utils/combinations/io.dart';
import 'package:pokerface/presentation/utils/hands/hands.dart';

Future<List<PokerHand>> evaluateTopNHands(BuildContext context, List<Card> knownCards, int n) async {
  String key = knownCards.map((card) => '${card.suit.name}.${card.rank.name}').join(',');

  switch (knownCards.length) {
    case 2:
      // There are two known cards. So we will generate 3 community card combinations, and then add these two cards, and then sort and use the best n hands.
      final combinationsOf3 = await readCombinationsFromFile(context, Assets.combinations.cards3);
      // remove the known cards from the combinations
      combinationsOf3
          .removeWhere((combination) => combination.contains(knownCards[0]) || combination.contains(knownCards[1]));

      final hands = combinationsOf3.map((cards) => PokerHand(cards: knownCards + cards)).toList();

      hands.sort((a, b) => compareHands(b, a));

      return hands.take(n).toList();
    case 3:
      // There are three known cards. So we will generate 2 community card combinations, and then add these three cards, and then sort and use the best n hands.
      final combinationsOf2 = await readCombinationsFromFile(context, Assets.combinations.cards2);
      // remove the known cards from the combinations
      combinationsOf2.removeWhere((combination) =>
          combination.contains(knownCards[0]) &&
          combination.contains(knownCards[1]) &&
          combination.contains(knownCards[2]));

      final hands = combinationsOf2.map((cards) => PokerHand(cards: knownCards + cards)).toList();

      hands.sort((a, b) => compareHands(b, a));

      return hands.take(n).toList();
    case 4:
      // There are four known cards. So we will generate 1 community card combinations, and then add these four cards, and then sort and use the best n hands.
      final combinationsOf1 = await readCombinationsFromFile(context, Assets.combinations.cards1);
      // remove the known cards from the combinations
      combinationsOf1.removeWhere((combination) =>
          combination.contains(knownCards[0]) &&
          combination.contains(knownCards[1]) &&
          combination.contains(knownCards[2]) &&
          combination.contains(knownCards[3]));

      final hands = combinationsOf1.map((cards) => PokerHand(cards: knownCards + cards)).toList();

      hands.sort((a, b) => compareHands(b, a));

      return hands.take(n).toList();
    case 5:
      // There are five known cards. So we will generate 2 community card combinations, then add these 5 cards to all of them. Now we will pick 7C5 combinations of each list and then sort and use the best n hands.
      return [PokerHand(cards: knownCards)];
    case 6:
      // There are six known cards. So we will generate 1 community card combinations, then add these 6 cards to all of them. Now we will pick 7C5 combinations of each list and then sort and use the best n hands.
      return [PokerHand(cards: knownCards)];
    case 7:
      // There are seven known cards. So we will pick 7C5 combinations of these 7 cards and then sort and use the best n hands.
      return [PokerHand(cards: knownCards)];
    default:
      throw ArgumentError("The number of known cards must be between 2 and 7, inclusive.");
  }
}
