import 'package:pokerface/data/models/card.dart';

/// A plain-language read on how the player's hand is doing.
enum HandVerdict { winning, close, behind, losing }

extension HandVerdictCopy on HandVerdict {
  /// Short, jargon-free line shown as the headline on the game screen.
  String get message {
    switch (this) {
      case HandVerdict.winning:
        return "You're winning this";
      case HandVerdict.close:
        return 'Too close to call';
      case HandVerdict.behind:
        return "You're behind";
      case HandVerdict.losing:
        return "You'll probably lose";
    }
  }

  bool get isAheadish => this == HandVerdict.winning;
}

/// Turns a raw win-equity fraction into a plain verdict, judged against the
/// player's fair share of the pot (1 / (opponents + 1)). This keeps the verdict
/// honest in multiway pots: 32% with three opponents is above the 25% fair
/// share, so it reads "too close" rather than "behind".
HandVerdict verdictFor({required double equity, required int opponents}) {
  final fairShare = 1.0 / (opponents + 1);
  final ratio = fairShare <= 0 ? 0.0 : equity / fairShare;
  if (ratio >= 1.3) return HandVerdict.winning;
  if (ratio >= 0.9) return HandVerdict.close;
  if (ratio >= 0.55) return HandVerdict.behind;
  return HandVerdict.losing;
}

/// A plain-language, jargon-free hint about the single card that would most
/// improve the player's hand, e.g. "You need one more ♥ for a Flush."
///
/// Returns null when the board is already complete (nothing left to come) or
/// nothing clearly improves the hand. Only improvements that use the player's
/// own hole cards are suggested, so a card that merely pairs the board (which
/// helps everyone equally) is never proposed.
String? improvementHint({required List<Card> holeCards, required List<Card> board}) {
  if (holeCards.length != 2) return null;
  final known = [...holeCards, ...board];
  if (known.length >= 7) return null; // river — no cards left to come

  return _flushDrawHint(holeCards, known) ??
      _straightDrawHint(holeCards, known) ??
      _pairOrTripsHint(holeCards, known);
}

String? _flushDrawHint(List<Card> hole, List<Card> known) {
  for (final suit in Suit.values) {
    final inKnown = known.where((c) => c.suit == suit).length;
    final inHole = hole.where((c) => c.suit == suit).length;
    // Four to a flush with at least one from your hand — one more completes it.
    if (inKnown == 4 && inHole >= 1) {
      return 'You need one more ${suit.emoji} for a Flush.';
    }
  }
  return null;
}

String? _straightDrawHint(List<Card> hole, List<Card> known) {
  int val(Rank r) => r.index + 2; // two -> 2 ... ace -> 14

  final present = <int>{};
  for (final c in known) {
    present.add(val(c.rank));
    if (c.rank == Rank.ace) present.add(1); // Ace also plays low
  }
  final holeVals = <int>{};
  for (final c in hole) {
    holeVals.add(val(c.rank));
    if (c.rank == Rank.ace) holeVals.add(1);
  }

  final missing = <int>{};
  for (var low = 1; low <= 10; low++) {
    final window = [for (var k = 0; k < 5; k++) low + k];
    final have = window.where(present.contains).length;
    final gaps = window.where((v) => !present.contains(v)).toList();
    // Four of the five ranks present, with at least one coming from your hand.
    if (have == 4 && gaps.length == 1 && window.where(holeVals.contains).isNotEmpty) {
      missing.add(gaps.first);
    }
  }
  if (missing.isEmpty) return null;

  final labels = <String>{for (final v in missing) _valueLabel(v)}.toList();
  final need = labels.length == 1
      ? 'a ${labels.first}'
      : 'a ${labels.sublist(0, labels.length - 1).join(', a ')} or a ${labels.last}';
  return 'You need $need for a Straight.';
}

String? _pairOrTripsHint(List<Card> hole, List<Card> known) {
  final counts = <Rank, int>{};
  for (final c in known) {
    counts.update(c.rank, (v) => v + 1, ifAbsent: () => 1);
  }
  final holeRanks = hole.map((c) => c.rank).toSet();

  // Already hold a pair that includes a hole card -> one more makes trips.
  for (final r in holeRanks) {
    if ((counts[r] ?? 0) == 2) {
      return 'Another ${_rankLabel(r)} gives you Three of a Kind.';
    }
  }

  // Otherwise, pairing an unpaired hole card is the improvement.
  final unpaired = holeRanks.where((r) => (counts[r] ?? 0) == 1).toList()
    ..sort((a, b) => b.index.compareTo(a.index));
  if (unpaired.length >= 2) {
    return 'Pair your ${_rankLabel(unpaired[0])} or ${_rankLabel(unpaired[1])} to improve.';
  }
  if (unpaired.length == 1) {
    return 'Pair your ${_rankLabel(unpaired[0])} to improve.';
  }
  return null;
}

String _rankLabel(Rank r) => _valueLabel(r.index + 2);

String _valueLabel(int v) {
  switch (v) {
    case 1:
    case 14:
      return 'Ace';
    case 13:
      return 'King';
    case 12:
      return 'Queen';
    case 11:
      return 'Jack';
    default:
      return '$v';
  }
}

/// The result of the optional "Should I call?" check.
class CallAdvice {
  const CallAdvice({required this.worthCalling, required this.requiredEquity, required this.winEquity});

  final bool worthCalling;

  /// The share of the time you must win to break even on the call.
  final double requiredEquity;

  /// Your actual win equity.
  final double winEquity;
}

/// Compares the player's win equity to the pot odds. Returns null if the inputs
/// aren't usable yet (nothing to call). [winEquity], [pot] and [toCall] are the
/// win fraction, current pot size, and amount to call.
CallAdvice? callAdvice({required double winEquity, required double pot, required double toCall}) {
  if (toCall <= 0 || pot < 0) return null;
  final required = toCall / (pot + toCall);
  return CallAdvice(worthCalling: winEquity >= required, requiredEquity: required, winEquity: winEquity);
}
