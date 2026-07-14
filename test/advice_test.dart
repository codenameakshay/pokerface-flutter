import 'package:flutter_test/flutter_test.dart';
import 'package:pokerface/presentation/utils/cards/all_cards.dart';
import 'package:pokerface/presentation/utils/hands/advice.dart';

void main() {
  group('verdictFor — judged against fair share', () {
    test('three opponents', () {
      expect(verdictFor(equity: 0.40, opponents: 3), HandVerdict.winning); // ratio 1.6
      expect(verdictFor(equity: 0.32, opponents: 3), HandVerdict.close); // ratio 1.28
      expect(verdictFor(equity: 0.20, opponents: 3), HandVerdict.behind); // ratio 0.8
      expect(verdictFor(equity: 0.10, opponents: 3), HandVerdict.losing); // ratio 0.4
    });

    test('heads-up', () {
      expect(verdictFor(equity: 0.70, opponents: 1), HandVerdict.winning);
      expect(verdictFor(equity: 0.50, opponents: 1), HandVerdict.close);
      expect(verdictFor(equity: 0.35, opponents: 1), HandVerdict.behind);
      expect(verdictFor(equity: 0.20, opponents: 1), HandVerdict.losing);
    });
  });

  group('improvementHint', () {
    test('flush draw using a hole card', () {
      final hint = improvementHint(
        holeCards: [Cards.spades.ace, Cards.spades.king],
        board: [Cards.spades.queen, Cards.spades.jack, Cards.hearts.two],
      );
      expect(hint, contains('Flush'));
    });

    test('open-ended straight draw', () {
      final hint = improvementHint(
        holeCards: [Cards.hearts.nine, Cards.spades.eight],
        board: [Cards.diamonds.seven, Cards.clubs.six, Cards.spades.two],
      );
      expect(hint, contains('Straight'));
      expect(hint, contains('5'));
      expect(hint, contains('10'));
    });

    test('pairing an unpaired hole card', () {
      final hint = improvementHint(
        holeCards: [Cards.hearts.ace, Cards.spades.king],
        board: [Cards.diamonds.two, Cards.clubs.seven, Cards.spades.nine],
      );
      expect(hint, 'Pair your Ace or King to improve.');
    });

    test('trips from a pocket pair', () {
      final hint = improvementHint(
        holeCards: [Cards.hearts.king, Cards.spades.king],
        board: [Cards.diamonds.two, Cards.clubs.seven, Cards.spades.nine],
      );
      expect(hint, 'Another King gives you Three of a Kind.');
    });

    test('does not suggest pairing the board (shared pair)', () {
      final hint = improvementHint(
        holeCards: [Cards.hearts.ace, Cards.spades.king],
        board: [Cards.diamonds.seven, Cards.clubs.seven, Cards.spades.two],
      );
      // Should suggest your own cards, never "another 7".
      expect(hint, isNot(contains('7')));
      expect(hint, 'Pair your Ace or King to improve.');
    });

    test('no hint once the board is complete (river)', () {
      final hint = improvementHint(
        holeCards: [Cards.spades.ace, Cards.spades.king],
        board: [Cards.spades.queen, Cards.spades.jack, Cards.spades.ten, Cards.hearts.two, Cards.diamonds.three],
      );
      expect(hint, isNull);
    });
  });

  group('callAdvice — pot odds', () {
    test('worth calling when equity beats the price', () {
      final advice = callAdvice(winEquity: 0.32, pot: 80, toCall: 20);
      expect(advice, isNotNull);
      expect(advice!.worthCalling, isTrue);
      expect(advice.requiredEquity, closeTo(0.20, 1e-9));
    });

    test('fold when the price is too high', () {
      final advice = callAdvice(winEquity: 0.32, pot: 60, toCall: 50);
      expect(advice!.worthCalling, isFalse);
      expect(advice.requiredEquity, closeTo(50 / 110, 1e-9));
    });

    test('null when there is nothing to call', () {
      expect(callAdvice(winEquity: 0.5, pot: 100, toCall: 0), isNull);
    });
  });
}
