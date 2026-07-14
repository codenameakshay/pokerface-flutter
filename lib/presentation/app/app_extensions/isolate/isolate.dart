part of '../app_extension.dart';

class IsolateManager {
  IsolateManager._();

  static final IsolateManager _instance = IsolateManager._();
  static IsolateManager get instance => _instance;

  Future<List<List<PokerHand>>> runFindTopNHands(List<Card> knownCards, int n) async {
    // Card / PokerHand are plain immutable data, so they are sent to and from
    // the worker isolate directly. (The previous toJson/fromJson round-trip was
    // broken: toJson leaves nested CardImage objects unserialized, which then
    // fail the `as Map` cast on the way back.)
    return Isolate.run(() => findTopNHands(knownCards, n));
  }

  /// Runs the Monte Carlo win-equity simulation on a worker isolate so the
  /// heavy computation never blocks the UI.
  ///
  /// The RNG is seeded deterministically from the known cards, so an identical
  /// situation always yields the same percentage instead of flickering by a
  /// point or two between recomputes. 5000 trials keeps the estimate within
  /// ~1% while staying fast enough to rerun on every card reveal.
  Future<EquityResult> runCalculateEquity({
    required List<Card> holeCards,
    required List<Card> board,
    required int opponents,
    int iterations = 5000,
  }) async {
    var seed = opponents;
    for (final card in [...holeCards, ...board]) {
      seed = seed * 53 + card.rank.index * 4 + card.suit.index;
    }
    return Isolate.run(
      () => calculateEquity(
        holeCards: holeCards,
        board: board,
        opponents: opponents,
        iterations: iterations,
        random: Random(seed),
      ),
    );
  }
}
