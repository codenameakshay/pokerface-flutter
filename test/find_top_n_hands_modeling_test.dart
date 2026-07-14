import 'package:flutter_test/flutter_test.dart';
import 'package:pokerface/data/models/poker_hand.dart';
import 'package:pokerface/presentation/utils/cards/all_cards.dart';
import 'package:pokerface/presentation/utils/hands/hands.dart';
import 'package:pokerface/presentation/utils/hands/testing.dart';

int _totalHands(List<List<PokerHand>> grouped) => grouped.fold<int>(0, (sum, group) => sum + group.length);

void main() {
  group('findTopNHands — Texas Hold\'em modeling', () {
    test('at the river the list is the single best-of-seven hand, not 20 sub-hands', () async {
      final known = [
        Cards.spades.ace, Cards.hearts.king, // hole
        Cards.diamonds.two, Cards.clubs.seven, Cards.spades.nine, // flop
        Cards.hearts.four, Cards.diamonds.jack, // turn, river
      ];
      final result = await findTopNHands(known, 20);

      // Regression: the old ≥5-card branch emitted every C(7,5)=21 sub-hand and
      // showed 20 of them. There is only one hand at the river.
      expect(_totalHands(result), 1);

      final shown = result.first.first;
      final expected = findBestHand(known);
      expect(shown.evaluateHand(), expected.evaluateHand());
      // These seven cards make only ace-high.
      expect(shown.evaluateHand(), HandRank.highCard);
    });

    test('a completed royal flush is reported as the single royal at the river', () async {
      final known = [
        Cards.spades.ace, Cards.spades.king,
        Cards.spades.queen, Cards.spades.jack, Cards.spades.ten,
        Cards.hearts.two, Cards.diamonds.three,
      ];
      final result = await findTopNHands(known, 20);
      expect(_totalHands(result), 1);
      expect(result.first.first.evaluateHand(), HandRank.royalFlush);
    });

    test('post-flop evaluates best-of-seven (a flopped flush is a flush)', () async {
      // Five spades already on the flop -> the made hand is a flush, and no
      // two-card runout can beat it (no straight flush / full house reachable).
      final known = [
        Cards.spades.ace, Cards.spades.king,
        Cards.spades.two, Cards.spades.seven, Cards.spades.nine,
      ];
      final result = await findTopNHands(known, 20);
      expect(result.first.first.evaluateHand(), HandRank.flush);
    });

    test('pre-flop samples runouts and returns at most n grouped hands', () async {
      final result = await findTopNHands([Cards.spades.ace, Cards.spades.king], 20);
      expect(result, isNotEmpty);
      expect(_totalHands(result), greaterThan(0));
      expect(_totalHands(result), lessThanOrEqualTo(20));
    });
  });
}
