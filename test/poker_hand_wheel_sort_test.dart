import 'package:flutter_test/flutter_test.dart';
import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/data/models/poker_hand.dart';
import 'package:pokerface/presentation/utils/cards/all_cards.dart';

void main() {
  group('PokerHand.isWheel', () {
    test('detects the Ace-to-Five wheel regardless of order', () {
      final wheel = PokerHand(
        cards: [
          Cards.spades.five,
          Cards.hearts.ace,
          Cards.diamonds.three,
          Cards.clubs.two,
          Cards.spades.four,
        ],
      );
      expect(wheel.isWheel(wheel.cards), isTrue);
    });

    test('does not treat a Ten-to-Ace straight as a wheel', () {
      final broadway = PokerHand(
        cards: [
          Cards.spades.ten,
          Cards.hearts.jack,
          Cards.diamonds.queen,
          Cards.clubs.king,
          Cards.spades.ace,
        ],
      );
      expect(broadway.isWheel(broadway.cards), isFalse);
    });
  });

  group('PokerHand.sortedCards — sequential hands', () {
    test('wheel straight is displayed with the Ace first (A-2-3-4-5)', () {
      final wheel = PokerHand(
        cards: [
          Cards.spades.five,
          Cards.hearts.ace,
          Cards.diamonds.three,
          Cards.clubs.two,
          Cards.spades.four,
        ],
      );
      final sorted = wheel.sortedCards.map((c) => c.rank).toList();
      // Regression: isWheel was a stub returning false, so the Ace was left
      // at the high end instead of leading the wheel.
      expect(sorted, [Rank.ace, Rank.two, Rank.three, Rank.four, Rank.five]);
    });

    test('normal straight is displayed low-to-high', () {
      final straight = PokerHand(
        cards: [
          Cards.spades.six,
          Cards.hearts.two,
          Cards.diamonds.five,
          Cards.clubs.three,
          Cards.spades.four,
        ],
      );
      final sorted = straight.sortedCards.map((c) => c.rank).toList();
      expect(sorted, [Rank.two, Rank.three, Rank.four, Rank.five, Rank.six]);
    });
  });
}
