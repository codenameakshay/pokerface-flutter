import 'dart:isolate';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokerface/data/models/poker_hand.dart';
import 'package:pokerface/presentation/utils/cards/all_cards.dart';
import 'package:pokerface/presentation/utils/hands/testing.dart';

void main() {
  group('findTopNHands', () {
    test('returns grouped hands for a 2-card hand', () async {
      final result = await findTopNHands([Cards.spades.ace, Cards.spades.king], 20);
      expect(result, isNotEmpty);
      expect(result.first.first, isA<PokerHand>());
    });

    test('survives an Isolate.run round-trip (regression: CardImage cast crash)', () async {
      // Reproduces the production path: Card/PokerHand/CardImage objects are
      // sent to and returned from a worker isolate. Previously this threw
      // "_CardImage is not a subtype of Map<String, dynamic>" during fromJson.
      final knownCards = [Cards.hearts.two, Cards.diamonds.ace];
      final result = await Isolate.run(() => findTopNHands(knownCards, 20));

      expect(result, isNotEmpty);
      final firstHand = result.first.first;
      expect(firstHand, isA<PokerHand>());
      expect(firstHand.cards, isNotEmpty);
      // Touch the nested CardImage that used to fail crossing the boundary.
      expect(firstHand.cards.first.image.svg, isNotEmpty);
    });

    test('handles a full 7-card board without throwing', () async {
      final result = await findTopNHands([
        Cards.spades.ace,
        Cards.spades.king,
        Cards.hearts.queen,
        Cards.diamonds.jack,
        Cards.clubs.ten,
        Cards.spades.two,
        Cards.hearts.seven,
      ], 20);
      expect(result, isNotEmpty);
    });
  });
}
