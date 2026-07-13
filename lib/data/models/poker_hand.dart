import 'package:fraction/fraction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokerface/data/models/card.dart';

part 'poker_hand.freezed.dart';
part 'poker_hand.g.dart';

enum HandRank {
  @JsonValue("highCard")
  highCard,
  @JsonValue("onePair")
  onePair,
  @JsonValue("twoPairs")
  twoPairs,
  @JsonValue("threeOfAKind")
  threeOfAKind,
  @JsonValue("straight")
  straight,
  @JsonValue("flush")
  flush,
  @JsonValue("fullHouse")
  fullHouse,
  @JsonValue("fourOfAKind")
  fourOfAKind,
  @JsonValue("straightFlush")
  straightFlush,
  @JsonValue("royalFlush")
  royalFlush,
}

extension HandRankExtension on HandRank {
  String get emoji {
    switch (this) {
      case HandRank.highCard:
        return '🃏';
      case HandRank.onePair:
        return '👫';
      case HandRank.twoPairs:
        return '👬';
      case HandRank.threeOfAKind:
        return '🧑‍🤝‍🧑';
      case HandRank.straight:
        return '📈';
      case HandRank.flush:
        return '🚽';
      case HandRank.fullHouse:
        return '🏠';
      case HandRank.fourOfAKind:
        return '🎲';
      case HandRank.straightFlush:
        return '📈🚽';
      case HandRank.royalFlush:
        return '👑📈🚽';
    }
  }

  String get name {
    switch (this) {
      case HandRank.highCard:
        return 'High Card';
      case HandRank.onePair:
        return 'One Pair';
      case HandRank.twoPairs:
        return 'Two Pairs';
      case HandRank.threeOfAKind:
        return 'Three of a Kind';
      case HandRank.straight:
        return 'Straight';
      case HandRank.flush:
        return 'Flush';
      case HandRank.fullHouse:
        return 'Full House';
      case HandRank.fourOfAKind:
        return 'Four of a Kind';
      case HandRank.straightFlush:
        return 'Straight Flush';
      case HandRank.royalFlush:
        return 'Royal Flush';
    }
  }
}

@freezed
abstract class PokerHand with _$PokerHand {
  factory PokerHand({required List<Card> cards}) = _PokerHand;

  factory PokerHand.fromJson(Map<String, dynamic> json) => _$PokerHandFromJson(json);
}

extension PokerHandExtension on PokerHand {
  bool get isFlush => cards.map((card) => card.suit).toSet().length == 1;

  bool get isStraight {
    List<int> ranks = cards.map((card) => card.rank.index).toList()..sort();
    for (int i = 0; i < ranks.length - 1; i++) {
      if (ranks[i] + 1 != ranks[i + 1]) return false;
    }
    return true;
  }

  Map<Rank, int> get rankCounts {
    var counts = <Rank, int>{};
    for (var card in cards) {
      counts.update(card.rank, (value) => value + 1, ifAbsent: () => 1);
    }
    return counts;
  }

  bool get hasFourOfAKind => rankCounts.values.any((count) => count == 4);
  bool get hasThreeOfAKind => rankCounts.values.any((count) => count == 3);
  bool get hasPair => rankCounts.values.any((count) => count == 2);

  // Method to check for a straight that wraps around (Ace low)
  bool get isStraightWithAceLow {
    var ranks = cards.map((card) => card.rank.index).toList()..sort();
    var hasAce = ranks.contains(Rank.ace.index);
    var hasTwo = ranks.contains(Rank.two.index);
    var hasThree = ranks.contains(Rank.three.index);
    var hasFour = ranks.contains(Rank.four.index);
    var hasFive = ranks.contains(Rank.five.index);

    return hasAce && hasTwo && hasThree && hasFour && hasFive;
  }

  HandRank evaluateHand() {
    // Compute the expensive derived values once. The getters below each rebuild
    // a map/set/sorted-list on every access, and evaluateHand is called millions
    // of times during equity simulation, so recomputing them is the hot path.
    final Map<Rank, int> counts = rankCounts;
    final Iterable<int> countValues = counts.values;
    final bool flush = isFlush;

    // A "high" straight is five consecutive ranks (at most Ten-to-Ace); the
    // Ace-low "wheel" (A-2-3-4-5) is detected separately via isStraightWithAceLow.
    final bool highStraight = isStraight;
    final bool anyStraight = highStraight || isStraightWithAceLow;

    // Royal Flush is the Ten-to-Ace straight flush: a *high* straight that
    // contains an Ace — the only such run is T-J-Q-K-A. This deliberately
    // excludes the Ace-low "steel wheel" (A-2-3-4-5 suited), which contains an
    // Ace but is only a five-high straight flush.
    if (flush && highStraight && counts.containsKey(Rank.ace)) {
      return HandRank.royalFlush;
    }

    // Straight Flush (includes the Ace-low steel wheel).
    if (flush && anyStraight) {
      return HandRank.straightFlush;
    }

    final bool hasFour = countValues.any((count) => count == 4);
    if (hasFour) {
      return HandRank.fourOfAKind;
    }

    final bool hasThree = countValues.any((count) => count == 3);
    final int pairCount = countValues.where((count) => count == 2).length;
    if (hasThree && pairCount >= 1) {
      return HandRank.fullHouse;
    }

    if (flush) {
      return HandRank.flush;
    }

    // Straight or Straight with Ace Low (the wheel).
    if (anyStraight) {
      return HandRank.straight;
    }

    if (hasThree) {
      return HandRank.threeOfAKind;
    }

    if (pairCount == 2) {
      return HandRank.twoPairs;
    }

    if (pairCount == 1) {
      return HandRank.onePair;
    }

    // If none of the above, it's a High Card
    return HandRank.highCard;
  }

  List<Card> get sortedCards {
    // Identify the hand type
    final handRank = evaluateHand();

    switch (handRank) {
      case HandRank.onePair:
      case HandRank.twoPairs:
      case HandRank.threeOfAKind:
      case HandRank.fullHouse:
      case HandRank.fourOfAKind:
        return _sortForGroupedHands();
      case HandRank.straight:
      case HandRank.flush:
      case HandRank.straightFlush:
        return _sortForSequentialHands();
      case HandRank.highCard:
      default:
        return _sortForHighCard();
    }
  }

  List<Card> _sortForGroupedHands() {
    // Group cards by rank
    final Map<Rank, List<Card>> grouped = {};
    for (var card in cards) {
      grouped.putIfAbsent(card.rank, () => []);
      grouped[card.rank]!.add(card);
    }

    // Sort groups by size (descending), then by rank
    final sortedGroups = grouped.values.toList();
    sortedGroups.sort((a, b) {
      int compare = b.length.compareTo(a.length);
      if (compare == 0) compare = b.first.rank.index.compareTo(a.first.rank.index);
      return compare;
    });

    // Flatten sorted groups back into a list of cards
    return sortedGroups.expand((x) => x).toList();
  }

  List<Card> _sortForSequentialHands() {
    // Simply sort by rank, considering Ace both high and low for straights
    List<Card> sorted = List.from(cards)..sort((a, b) => a.rank.index.compareTo(b.rank.index));
    if (isWheel(sorted)) {
      // Move Ace to the front if it's a wheel (Ace to Five straight)
      final ace = sorted.last;
      sorted.removeLast();
      sorted.insert(0, ace);
    }
    return sorted;
  }

  List<Card> _sortForHighCard() {
    // Sort by rank in descending order
    return List.from(cards)..sort((a, b) => b.rank.index.compareTo(a.rank.index));
  }

  bool isWheel(List<Card> sortedCards) {
    // A "wheel" is the Ace-to-Five straight (A-2-3-4-5), where the Ace plays
    // low. Detect it by the exact set of ranks present, independent of order.
    final ranks = sortedCards.map((card) => card.rank).toSet();
    return ranks.containsAll(const [Rank.ace, Rank.two, Rank.three, Rank.four, Rank.five]);
  }

  double get probability {
    final handRank = evaluateHand();
    switch (handRank) {
      case HandRank.royalFlush:
        return 4.0 / 2598960.0;
      case HandRank.straightFlush:
        // Excluding Royal Flushes
        return (36.0 - 4.0) / 2598960.0;
      case HandRank.fourOfAKind:
        return 624.0 / 2598960.0;
      case HandRank.fullHouse:
        return 3744.0 / 2598960.0;
      case HandRank.flush:
        // Excluding Straight Flushes and Royal Flushes
        return (5108.0 - 36.0) / 2598960.0;
      case HandRank.straight:
        // Excluding Straight Flushes
        return (10200.0 - 36.0) / 2598960.0;
      case HandRank.threeOfAKind:
        return 54912.0 / 2598960.0;
      case HandRank.twoPairs:
        return 123552.0 / 2598960.0;
      case HandRank.onePair:
        return 1098240.0 / 2598960.0;
      case HandRank.highCard:
        // Excluding all other hand types
        return (1302540.0 - 5108.0) / 2598960.0;
      default:
        return 0.0; // For unimplemented or unrecognized hand types
    }
  }

  double get handRankStatus {
    final handRank = evaluateHand();
    switch (handRank) {
      case HandRank.royalFlush:
        return -1;
      case HandRank.straightFlush:
        return -1;
      case HandRank.fourOfAKind:
        return -1;
      case HandRank.fullHouse:
        return -1;
      case HandRank.flush:
        return -1;
      case HandRank.straight:
        return -1;
      case HandRank.threeOfAKind:
        return 0;
      case HandRank.twoPairs:
        return 1;
      case HandRank.onePair:
        return 1;
      case HandRank.highCard:
        return 1;
      default:
        return -1; // For unimplemented or unrecognized hand types
    }
  }

  Fraction get probabilityFraction => Fraction.fromDouble(probability);

  int get score {
    return (1 ~/ probability);
  }
}
