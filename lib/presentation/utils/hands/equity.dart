import 'dart:math';

import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/presentation/utils/cards/all_cards.dart';
import 'package:pokerface/presentation/utils/hands/hands.dart';

/// The result of a Texas Hold'em win-equity simulation for the player's hand
/// against a number of unknown opponents over the remaining board.
class EquityResult {
  const EquityResult({
    required this.iterations,
    required this.wins,
    required this.ties,
    required this.losses,
    required this.equitySum,
    required this.opponents,
  });

  /// Number of Monte Carlo trials run.
  final int iterations;

  /// Trials the player won outright (sole best hand).
  final int wins;

  /// Trials the player tied for best with at least one opponent.
  final int ties;

  /// Trials the player lost (some opponent had a strictly better hand).
  final int losses;

  /// Sum of the player's pot share across all trials: `1` for an outright win
  /// and `1/k` for a `k`-way tie. Dividing by [iterations] gives [equity].
  final double equitySum;

  /// Number of opponents simulated.
  final int opponents;

  const EquityResult.empty()
      : iterations = 0,
        wins = 0,
        ties = 0,
        losses = 0,
        equitySum = 0,
        opponents = 0;

  /// Fraction of trials won outright, 0..1.
  double get winRate => iterations == 0 ? 0 : wins / iterations;

  /// Fraction of trials that ended in a split pot, 0..1.
  double get tieRate => iterations == 0 ? 0 : ties / iterations;

  /// Fraction of trials lost, 0..1.
  double get lossRate => iterations == 0 ? 0 : losses / iterations;

  /// Expected pot share, 0..1 — the headline "odds of winning" figure. Counts
  /// outright wins fully and split pots proportionally.
  double get equity => iterations == 0 ? 0 : equitySum / iterations;
}

/// Estimates the player's win equity in Texas Hold'em by Monte Carlo simulation.
///
/// [holeCards] are the player's two cards, [board] the currently-known
/// community cards (0, 3, 4 or 5), and [opponents] the number of other players
/// dealt in. Each trial deals random hole cards to every opponent, completes
/// the five-card board, evaluates every player's best five-of-seven, and tallies
/// the player's pot share.
///
/// Pass a seeded [random] for reproducible results (used in tests).
EquityResult calculateEquity({
  required List<Card> holeCards,
  required List<Card> board,
  required int opponents,
  int iterations = 20000,
  Random? random,
}) {
  assert(holeCards.length == 2, 'A Hold\'em hand has exactly two hole cards.');
  assert(board.length <= 5, 'The board has at most five community cards.');

  final rng = random ?? Random();
  final known = <Card>{...holeCards, ...board};

  // The cards that could still be dealt to opponents or land on the board.
  final availableTemplate = Cards.all.where((card) => !known.contains(card)).toList();

  final boardToDeal = 5 - board.length;
  final cardsNeeded = opponents * 2 + boardToDeal;

  // Not enough cards to run the simulation (too many opponents) — return empty.
  if (opponents < 1 || cardsNeeded > availableTemplate.length) {
    return EquityResult(
      iterations: 0,
      wins: 0,
      ties: 0,
      losses: 0,
      equitySum: 0,
      opponents: opponents,
    );
  }

  var wins = 0;
  var ties = 0;
  var losses = 0;
  var equitySum = 0.0;

  for (var i = 0; i < iterations; i++) {
    final available = List<Card>.of(availableTemplate);
    _partialShuffle(available, cardsNeeded, rng);

    // Deal the board completion first, then two cards per opponent.
    final fullBoard = <Card>[...board];
    var cursor = 0;
    for (var b = 0; b < boardToDeal; b++) {
      fullBoard.add(available[cursor++]);
    }

    final playerBest = findBestHand([...holeCards, ...fullBoard]);

    var equalOpponents = 0;
    var beaten = false;
    for (var o = 0; o < opponents; o++) {
      final oppHole = [available[cursor++], available[cursor++]];
      final oppBest = findBestHand([...oppHole, ...fullBoard]);
      final cmp = compareHands(oppBest, playerBest);
      if (cmp > 0) {
        beaten = true;
        break;
      } else if (cmp == 0) {
        equalOpponents++;
      }
    }

    if (beaten) {
      losses++;
    } else if (equalOpponents == 0) {
      wins++;
      equitySum += 1;
    } else {
      ties++;
      equitySum += 1 / (equalOpponents + 1);
    }
  }

  return EquityResult(
    iterations: iterations,
    wins: wins,
    ties: ties,
    losses: losses,
    equitySum: equitySum,
    opponents: opponents,
  );
}

/// Fisher–Yates shuffle of just the first [count] positions of [cards]. We only
/// need [count] random cards per trial, so shuffling the whole deck each time is
/// wasted work.
void _partialShuffle(List<Card> cards, int count, Random rng) {
  final n = cards.length;
  final limit = min(count, n - 1);
  for (var i = 0; i < limit; i++) {
    final j = i + rng.nextInt(n - i);
    final tmp = cards[i];
    cards[i] = cards[j];
    cards[j] = tmp;
  }
}
