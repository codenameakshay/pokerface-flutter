import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokerface/presentation/utils/cards/all_cards.dart';
import 'package:pokerface/presentation/utils/hands/equity.dart';

void main() {
  group('calculateEquity — deterministic anchors', () {
    test('an unbeatable royal flush on the river wins 100%', () {
      // Player holds A-K of spades; board completes the royal with Q-J-T of
      // spades. No opponent can beat or tie it (the player holds A/K of spades).
      final result = calculateEquity(
        holeCards: [Cards.spades.ace, Cards.spades.king],
        board: [Cards.spades.queen, Cards.spades.jack, Cards.spades.ten, Cards.hearts.two, Cards.diamonds.three],
        opponents: 3,
        iterations: 500,
        random: Random(1),
      );
      expect(result.winRate, 1.0);
      expect(result.tieRate, 0.0);
      expect(result.lossRate, 0.0);
      expect(result.equity, 1.0);
    });

    test('a royal flush on the board splits the pot with everyone', () {
      // The five community cards are themselves a royal flush, so every player
      // plays the board and ties. With one opponent, equity is a 1/2 split.
      final result = calculateEquity(
        holeCards: [Cards.hearts.two, Cards.diamonds.three],
        board: [Cards.spades.ace, Cards.spades.king, Cards.spades.queen, Cards.spades.jack, Cards.spades.ten],
        opponents: 1,
        iterations: 500,
        random: Random(2),
      );
      expect(result.winRate, 0.0);
      expect(result.tieRate, 1.0);
      expect(result.equity, closeTo(0.5, 1e-9));
    });

    test('returns an empty result when there are too many opponents to deal', () {
      final result = calculateEquity(
        holeCards: [Cards.spades.ace, Cards.spades.king],
        board: const [],
        opponents: 30,
        iterations: 100,
        random: Random(3),
      );
      expect(result.iterations, 0);
      expect(result.equity, 0.0);
    });
  });

  group('calculateEquity — statistical (seeded, so stable)', () {
    test('pocket aces beat a single random hand ~85% pre-flop', () {
      final result = calculateEquity(
        holeCards: [Cards.spades.ace, Cards.hearts.ace],
        board: const [],
        opponents: 1,
        iterations: 4000,
        random: Random(42),
      );
      // Pocket aces are ~85% to win heads-up pre-flop.
      expect(result.equity, closeTo(0.85, 0.04));
    });

    test('equity drops as more opponents join', () {
      final oneOpp = calculateEquity(
        holeCards: [Cards.spades.ace, Cards.hearts.ace],
        board: const [],
        opponents: 1,
        iterations: 3000,
        random: Random(7),
      );
      final fiveOpp = calculateEquity(
        holeCards: [Cards.spades.ace, Cards.hearts.ace],
        board: const [],
        opponents: 5,
        iterations: 3000,
        random: Random(7),
      );
      expect(fiveOpp.equity, lessThan(oneOpp.equity));
    });
  });
}
