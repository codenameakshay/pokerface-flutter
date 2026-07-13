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
  Future<EquityResult> runCalculateEquity({
    required List<Card> holeCards,
    required List<Card> board,
    required int opponents,
    int iterations = 20000,
  }) async {
    return Isolate.run(
      () => calculateEquity(
        holeCards: holeCards,
        board: board,
        opponents: opponents,
        iterations: iterations,
      ),
    );
  }
}
