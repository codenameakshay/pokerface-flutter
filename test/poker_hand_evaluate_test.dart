import 'package:flutter_test/flutter_test.dart';
import 'package:pokerface/data/models/poker_hand.dart';
import 'package:pokerface/presentation/utils/cards/all_cards.dart';

void main() {
  group('PokerHand.evaluateHand — straight flush family', () {
    test('Ten-to-Ace suited is a Royal Flush', () {
      final hand = PokerHand(
        cards: [
          Cards.spades.ten,
          Cards.spades.jack,
          Cards.spades.queen,
          Cards.spades.king,
          Cards.spades.ace,
        ],
      );
      expect(hand.evaluateHand(), HandRank.royalFlush);
    });

    test('Ace-low steel wheel (A-2-3-4-5 suited) is a Straight Flush, NOT a Royal Flush', () {
      final hand = PokerHand(
        cards: [
          Cards.hearts.ace,
          Cards.hearts.two,
          Cards.hearts.three,
          Cards.hearts.four,
          Cards.hearts.five,
        ],
      );
      // Regression: previously misclassified as royalFlush because it is a
      // flush + (ace-low) straight that contains an Ace.
      expect(hand.evaluateHand(), HandRank.straightFlush);
      expect(hand.evaluateHand(), isNot(HandRank.royalFlush));
    });

    test('Nine-to-King suited is a Straight Flush (no Ace)', () {
      final hand = PokerHand(
        cards: [
          Cards.clubs.nine,
          Cards.clubs.ten,
          Cards.clubs.jack,
          Cards.clubs.queen,
          Cards.clubs.king,
        ],
      );
      expect(hand.evaluateHand(), HandRank.straightFlush);
    });
  });

  group('PokerHand.evaluateHand — straights (non-flush)', () {
    test('Ace-low wheel across suits is a Straight', () {
      final hand = PokerHand(
        cards: [
          Cards.spades.ace,
          Cards.hearts.two,
          Cards.diamonds.three,
          Cards.clubs.four,
          Cards.spades.five,
        ],
      );
      expect(hand.evaluateHand(), HandRank.straight);
    });

    test('Ten-to-Ace across suits (Broadway) is a Straight', () {
      final hand = PokerHand(
        cards: [
          Cards.spades.ten,
          Cards.hearts.jack,
          Cards.diamonds.queen,
          Cards.clubs.king,
          Cards.spades.ace,
        ],
      );
      expect(hand.evaluateHand(), HandRank.straight);
    });
  });
}
