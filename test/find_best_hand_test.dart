import 'package:flutter_test/flutter_test.dart';
import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/data/models/poker_hand.dart';
import 'package:pokerface/presentation/utils/cards/all_cards.dart';
import 'package:pokerface/presentation/utils/hands/hands.dart';

void main() {
  group('findBestHand — best 5 of 7', () {
    test('picks four of a kind over the available full house', () {
      final best = findBestHand([
        Cards.spades.king,
        Cards.hearts.king,
        Cards.diamonds.king,
        Cards.clubs.king,
        Cards.spades.ace,
        Cards.hearts.ace,
        Cards.diamonds.queen,
      ]);
      expect(best.evaluateHand(), HandRank.fourOfAKind);
    });

    test('picks a straight over a lower pair', () {
      final best = findBestHand([
        Cards.spades.three,
        Cards.hearts.four,
        Cards.diamonds.five,
        Cards.clubs.six,
        Cards.spades.seven,
        Cards.hearts.king,
        Cards.diamonds.king,
      ]);
      expect(best.evaluateHand(), HandRank.straight);
    });

    test('breaks ties within a rank: chooses the higher straight', () {
      // Cards 2..8 across suits allow both a 6-high and an 8-high straight.
      final best = findBestHand([
        Cards.spades.two,
        Cards.hearts.three,
        Cards.diamonds.four,
        Cards.clubs.five,
        Cards.spades.six,
        Cards.hearts.seven,
        Cards.diamonds.eight,
      ]);
      expect(best.evaluateHand(), HandRank.straight);
      final ranks = best.cards.map((c) => c.rank).toSet();
      // Regression: the old implementation returned the first combination and
      // could not distinguish the 4-5-6-7-8 straight from the 2-3-4-5-6 one.
      expect(ranks, {Rank.four, Rank.five, Rank.six, Rank.seven, Rank.eight});
    });

    test('exactly five cards returns that hand', () {
      final best = findBestHand([
        Cards.spades.ten,
        Cards.spades.jack,
        Cards.spades.queen,
        Cards.spades.king,
        Cards.spades.ace,
      ]);
      expect(best.evaluateHand(), HandRank.royalFlush);
    });
  });
}
