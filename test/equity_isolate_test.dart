import 'dart:isolate';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokerface/presentation/utils/cards/all_cards.dart';
import 'package:pokerface/presentation/utils/hands/equity.dart';

void main() {
  test('EquityResult survives an Isolate.run round-trip (production path)', () async {
    // Mirrors IsolateManager.runCalculateEquity: cards go in, an EquityResult
    // comes back across the isolate boundary. Guards against a repeat of the
    // findTopNHands serialization crash.
    final hole = [Cards.spades.ace, Cards.hearts.ace];
    final result = await Isolate.run(
      () => calculateEquity(holeCards: hole, board: const [], opponents: 3, iterations: 1000),
    );

    expect(result.iterations, 1000);
    expect(result.opponents, 3);
    expect(result.equity, greaterThan(0));
    expect(result.equity, lessThanOrEqualTo(1));
    expect(result.wins + result.ties + result.losses, 1000);
  });
}
