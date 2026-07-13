import 'dart:math';

import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/data/models/poker_hand.dart';
import 'package:pokerface/presentation/utils/cards/all_cards.dart';
import 'package:pokerface/presentation/utils/hands/hands.dart';

List<Card> generateDeck() {
  final deck = Cards.all;
  deck.shuffle();

  return deck;
}

Future<List<List<Card>>> generateCommunityCardCombinations(String key, List<Card> deck, int combinationSize) async {
  List<List<Card>> combinations = [];
  void generateCombinations(List<Card> list, int start, List<Card> current, int size) {
    if (current.length == size) {
      // print('combination: ${current.map((e) => '${e.suit.name}.${e.rank.name}')}');
      combinations.add(List.from(current));
      return;
    }
    for (int i = start; i <= list.length - size + current.length; i++) {
      current.add(list[i]);
      generateCombinations(list, i + 1, current, size);
      current.removeLast();
    }
  }

  generateCombinations(deck, 0, [], combinationSize);

  return combinations;
}

/// Enumerate board runouts exhaustively when there are at most this many;
/// otherwise sample them. Pre-flop there are C(50,5) ≈ 2.1M runouts.
const int _maxExactRunouts = 20000;

/// Number of random runouts to sample when exhaustive enumeration is too large.
const int _sampledRunouts = 3000;

/// Returns the strongest hands the player can end up with, grouped by rank.
///
/// [knownCards] are every card the player can currently see (their two hole
/// cards plus any community cards). For each way the board can complete to five
/// community cards, this evaluates the player's best five-of-seven — the actual
/// Texas Hold'em hand — and returns the top [n] of those grouped by rank.
///
/// At the river (seven known cards) there is a single runout, so the result is
/// just the player's one made hand rather than a list of sub-combinations.
Future<List<List<PokerHand>>> findTopNHands(List<Card> knownCards, int n) async {
  // Ensure knownCards contains 2 to 7 cards
  if (knownCards.length < 2 || knownCards.length > 7) {
    throw ArgumentError("The number of known cards must be between 2 and 7, inclusive.");
  }

  // Generate the deck excluding known cards
  final List<Card> deck = generateDeck()..removeWhere((card) => knownCards.contains(card));

  // Cards still needed to reach a full seven (two hole + five community).
  final int cardsToComplete = 7 - knownCards.length;

  // Every way the board can finish. Enumerate when that is cheap, otherwise
  // sample (pre-flop has ~2.1M completions, far too many to walk exhaustively).
  final List<List<Card>> runouts;
  if (_combinationCount(deck.length, cardsToComplete) <= _maxExactRunouts) {
    runouts = await generateCommunityCardCombinations('', deck, cardsToComplete);
  } else {
    runouts = _sampleRunouts(deck, cardsToComplete, _sampledRunouts);
  }

  // For each completed board, take the single best five-card hand of the seven.
  final List<PokerHand> bestHands = [
    for (final runout in runouts) findBestHand([...knownCards, ...runout]),
  ];

  // Strongest first, keep the top n, then group equal-ranked hands together.
  bestHands.sort((a, b) => compareHands(b, a));
  return combineSameHands(bestHands.take(n).toList());
}

/// Number of k-card combinations from [nCards] cards, i.e. C(nCards, k).
int _combinationCount(int nCards, int k) {
  if (k < 0 || k > nCards) return 0;
  var result = 1;
  for (var i = 0; i < k; i++) {
    result = result * (nCards - i) ~/ (i + 1);
  }
  return result;
}

/// Draws [count] random [size]-card runouts from [deck], partial-shuffling a
/// fresh copy each time. Runouts may repeat, which is fine for ranking.
List<List<Card>> _sampleRunouts(List<Card> deck, int size, int count) {
  if (size == 0) return [<Card>[]];
  final rng = Random();
  final pool = List<Card>.of(deck);
  final n = pool.length;
  final runouts = <List<Card>>[];
  for (var s = 0; s < count; s++) {
    for (var i = 0; i < size; i++) {
      final j = i + rng.nextInt(n - i);
      final tmp = pool[i];
      pool[i] = pool[j];
      pool[j] = tmp;
    }
    runouts.add(pool.sublist(0, size));
  }
  return runouts;
}
