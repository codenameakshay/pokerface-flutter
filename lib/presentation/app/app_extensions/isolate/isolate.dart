part of '../app_extension.dart';

class IsolateManager {
  IsolateManager._();

  static final IsolateManager _instance = IsolateManager._();
  static IsolateManager get instance => _instance;

  Future<List<List<PokerHand>>> runFindTopNHands(List<Card> knownCards, int n) async {
    final jsonCards = knownCards.map((e) => e.toJson()).toList();
    final jsonResult = await Isolate.run(() => findTopNHands(jsonCards, n));

    final result = jsonResult.map((e) => e.map((e) => PokerHand.fromJson(e)).toList()).toList();

    return result;
  }
}
