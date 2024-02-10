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

@freezed
class PokerHand with _$PokerHand {
  factory PokerHand({
    required List<Card> cards,
  }) = _PokerHand;

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
    bool isStraight = this.isStraight || isStraightWithAceLow;

    // Check for Royal Flush
    if (isFlush && isStraight && cards.any((card) => card.rank == Rank.ace)) {
      return HandRank.royalFlush;
    }

    // Check for Straight Flush
    if (isFlush && isStraight) {
      return HandRank.straightFlush;
    }

    // Check for Four of a Kind
    if (hasFourOfAKind) {
      return HandRank.fourOfAKind;
    }

    // Check for Full House
    if (hasThreeOfAKind && rankCounts.values.any((count) => count == 2)) {
      return HandRank.fullHouse;
    }

    // Check for Flush
    if (isFlush) {
      return HandRank.flush;
    }

    // Check for Straight or Straight with Ace Low
    if (isStraight) {
      return HandRank.straight;
    }

    // Check for Three of a Kind
    if (hasThreeOfAKind) {
      return HandRank.threeOfAKind;
    }

    // Check for Two Pairs
    if (rankCounts.values.where((count) => count == 2).length == 2) {
      return HandRank.twoPairs;
    }

    // Check for One Pair
    if (hasPair) {
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
    // Implement logic to detect a wheel (Ace to Five straight)
    // Placeholder implementation
    return false;
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

  Fraction get probabilityFraction => Fraction.fromDouble(probability);

  int get score {
    return (1 ~/ probability);
  }
}
