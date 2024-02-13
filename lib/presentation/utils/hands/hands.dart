import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/data/models/poker_hand.dart';
import 'package:tuple/tuple.dart';

int compareHands(PokerHand hand1, PokerHand hand2) {
  var rank1 = hand1.evaluateHand();
  var rank2 = hand2.evaluateHand();

  if (rank1.index > rank2.index) {
    return 1;
  } else if (rank1.index < rank2.index) {
    return -1;
  } else {
    // Hands have the same rank, require further comparison
    switch (rank1) {
      case HandRank.fourOfAKind:
        return compareFourOfAKind(hand1, hand2);
      case HandRank.fullHouse:
        return compareFullHouse(hand1, hand2);
      case HandRank.flush:
        return compareFlush(hand1, hand2);
      case HandRank.straight:
      case HandRank.straightFlush:
        return compareStraight(hand1, hand2);
      case HandRank.threeOfAKind:
        return compareThreeOfAKind(hand1, hand2);
      case HandRank.twoPairs:
        return compareTwoPairs(hand1, hand2);
      case HandRank.onePair:
        return compareOnePair(hand1, hand2);
      case HandRank.highCard:
        return compareHighCard(hand1, hand2);
      default:
        return 0; // This case should not happen
    }
  }
}

Tuple2<Rank, Rank> identifyFourOfAKindAndKicker(List<Card> hand) {
  final rankCounts = <Rank, int>{};
  for (var card in hand) {
    rankCounts.update(card.rank, (value) => value + 1, ifAbsent: () => 1);
  }

  // Find the quadruplet and kicker
  Rank quadrupletRank = Rank.two;
  Rank kickerRank = Rank.two;
  rankCounts.forEach((rank, count) {
    if (count == 4) {
      quadrupletRank = rank;
    } else if (count == 1) {
      kickerRank = rank;
    }
  });

  return Tuple2(quadrupletRank, kickerRank);
}

int compareFourOfAKind(PokerHand hand1, PokerHand hand2) {
  final fourOfAKind1 = identifyFourOfAKindAndKicker(hand1.cards);
  final fourOfAKind2 = identifyFourOfAKindAndKicker(hand2.cards);

  // Compare the rank of the quadruplet
  if (fourOfAKind1.item1.index > fourOfAKind2.item1.index) {
    return 1; // Hand1's quadruplet is higher
  } else if (fourOfAKind1.item1.index < fourOfAKind2.item1.index) {
    return -1; // Hand2's quadruplet is higher
  } else {
    // If the quadruplet is the same, compare the kicker
    if (fourOfAKind1.item2.index > fourOfAKind2.item2.index) {
      return 1; // Hand1's kicker is higher
    } else if (fourOfAKind1.item2.index < fourOfAKind2.item2.index) {
      return -1; // Hand2's kicker is higher
    } else {
      return 0; // Hands are identical
    }
  }
}

Tuple2<Rank, Rank> identifyTripletAndPair(List<Card> hand) {
  final rankCounts = <Rank, int>{};
  for (var card in hand) {
    rankCounts.update(card.rank, (value) => value + 1, ifAbsent: () => 1);
  }

  Rank tripletRank = Rank.two;
  Rank pairRank = Rank.two;
  for (var entry in rankCounts.entries) {
    if (entry.value == 3) {
      tripletRank = entry.key;
    } else if (entry.value == 2) {
      pairRank = entry.key;
    }
  }

  return Tuple2(tripletRank, pairRank);
}

int compareFullHouse(PokerHand hand1, PokerHand hand2) {
  final fullHouse1 = identifyTripletAndPair(hand1.cards);
  final fullHouse2 = identifyTripletAndPair(hand2.cards);

  // Compare the triplet part of the Full House
  if (fullHouse1.item1.index > fullHouse2.item1.index) {
    return 1; // Hand1's triplet is higher
  } else if (fullHouse1.item1.index < fullHouse2.item1.index) {
    return -1; // Hand2's triplet is higher
  } else {
    // Triplets are the same, now compare the pair
    if (fullHouse1.item2.index > fullHouse2.item2.index) {
      return 1; // Hand1's pair is higher
    } else if (fullHouse1.item2.index < fullHouse2.item2.index) {
      return -1; // Hand2's pair is higher
    } else {
      return 0; // Both Full Houses are identical (extremely rare in single-deck games, but theoretically possible)
    }
  }
}

int compareFlush(PokerHand hand1, PokerHand hand2) {
  // Assuming the cards are not already sorted by rank in descending order, sort them
  List<Card> sortedHand1 = List.from(hand1.cards)..sort((a, b) => b.rank.index.compareTo(a.rank.index));
  List<Card> sortedHand2 = List.from(hand2.cards)..sort((a, b) => b.rank.index.compareTo(a.rank.index));

  // Compare card ranks from highest to lowest
  for (int i = 0; i < sortedHand1.length; i++) {
    if (sortedHand1[i].rank.index > sortedHand2[i].rank.index) {
      return 1; // Hand1 wins as it has a higher card
    } else if (sortedHand1[i].rank.index < sortedHand2[i].rank.index) {
      return -1; // Hand2 wins as it has a higher card
    }
    // Continue to next card if these are equal
  }

  return 0; // If all compared cards are equal, the hands are effectively identical
}

bool isWheel(List<Card> hand) {
  List<int> ranks = hand.map((card) => card.rank.index).toList()..sort();
  return ranks[0] == Rank.two.index &&
      ranks[1] == Rank.three.index &&
      ranks[2] == Rank.four.index &&
      ranks[3] == Rank.five.index &&
      hand.any((card) => card.rank == Rank.ace);
}

int compareStraight(PokerHand hand1, PokerHand hand2) {
  // Sort the cards in each hand by rank in descending order
  List<Card> sortedHand1 = List.from(hand1.cards)..sort((a, b) => b.rank.index.compareTo(a.rank.index));
  List<Card> sortedHand2 = List.from(hand2.cards)..sort((a, b) => b.rank.index.compareTo(a.rank.index));

  // Handle special case for Ace-to-Five straight (Wheel)
  bool isWheelHand1 = isWheel(sortedHand1);
  bool isWheelHand2 = isWheel(sortedHand2);

  if (isWheelHand1 && !isWheelHand2) {
    return -1; // Hand2 wins because Ace-to-Five is the lowest Straight
  } else if (!isWheelHand1 && isWheelHand2) {
    return 1; // Hand1 wins because Ace-to-Five is the lowest Straight
  }

  // Compare the highest card of each sorted hand
  if (sortedHand1.first.rank.index > sortedHand2.first.rank.index) {
    return 1; // Hand1 wins as it has a higher top card
  } else if (sortedHand1.first.rank.index < sortedHand2.first.rank.index) {
    return -1; // Hand2 wins as it has a higher top card
  }

  return 0; // The hands are equal if the top cards are the same
}

Tuple2<Rank, List<Rank>> identifyTripletAndKickers(List<Card> hand) {
  final rankCounts = <Rank, int>{};
  for (var card in hand) {
    rankCounts.update(card.rank, (value) => value + 1, ifAbsent: () => 1);
  }

  Rank tripletRank = Rank.two;
  List<Rank> kickerRanks = [];
  rankCounts.forEach((rank, count) {
    if (count == 3) {
      tripletRank = rank;
    } else {
      kickerRanks.add(rank);
    }
  });

  // Sort kicker ranks in descending order
  kickerRanks.sort((a, b) => b.index.compareTo(a.index));

  return Tuple2(tripletRank, kickerRanks);
}

int compareThreeOfAKind(PokerHand hand1, PokerHand hand2) {
  final result1 = identifyTripletAndKickers(hand1.cards);
  final result2 = identifyTripletAndKickers(hand2.cards);

  Rank tripletRank1 = result1.item1;
  Rank tripletRank2 = result2.item1;
  List<Rank> kickers1 = result1.item2;
  List<Rank> kickers2 = result2.item2;

  // Compare triplet ranks
  if (tripletRank1.index > tripletRank2.index) {
    return 1; // Hand1 wins
  } else if (tripletRank1.index < tripletRank2.index) {
    return -1; // Hand2 wins
  } else {
    // Triplets are equal, compare kickers
    for (int i = 0; i < kickers1.length; i++) {
      if (kickers1[i].index > kickers2[i].index) {
        return 1; // Hand1's kicker is higher
      } else if (kickers1[i].index < kickers2[i].index) {
        return -1; // Hand2's kicker is higher
      }
    }
    return 0; // If all kickers are equal, the hands are effectively identical
  }
}

Tuple2<Rank, List<Rank>> identifyPairAndKickers(List<Card> hand) {
  final rankCounts = <Rank, int>{};
  for (var card in hand) {
    rankCounts.update(card.rank, (value) => value + 1, ifAbsent: () => 1);
  }

  Rank pairRank = Rank.two;
  List<Rank> kickerRanks = [];
  rankCounts.forEach((rank, count) {
    if (count == 2) {
      pairRank = rank;
    } else if (count == 1) {
      kickerRanks.add(rank);
    }
  });

  // Sort kicker ranks in descending order
  kickerRanks.sort((a, b) => b.index.compareTo(a.index));

  return Tuple2(pairRank, kickerRanks);
}

int compareOnePair(PokerHand hand1, PokerHand hand2) {
  final result1 = identifyPairAndKickers(hand1.cards);
  final result2 = identifyPairAndKickers(hand2.cards);

  Rank pairRank1 = result1.item1;
  Rank pairRank2 = result2.item1;
  List<Rank> kickers1 = result1.item2;
  List<Rank> kickers2 = result2.item2;

  // Compare pair ranks
  if (pairRank1.index > pairRank2.index) {
    return 1; // Hand1 wins with the higher pair
  } else if (pairRank1.index < pairRank2.index) {
    return -1; // Hand2 wins with the higher pair
  } else {
    // Pairs are equal, compare kickers from highest to lowest
    for (int i = 0; i < kickers1.length; i++) {
      if (kickers1[i].index > kickers2[i].index) {
        return 1; // Hand1 has the higher kicker
      } else if (kickers1[i].index < kickers2[i].index) {
        return -1; // Hand2 has the higher kicker
      }
    }
    return 0; // If all kickers are equal, the hands are effectively identical
  }
}

int compareHighCard(PokerHand hand1, PokerHand hand2) {
  List<int> hand1Ranks = hand1.cards.map((card) => card.rank.index).toList()..sort((a, b) => b.compareTo(a));
  List<int> hand2Ranks = hand2.cards.map((card) => card.rank.index).toList()..sort((a, b) => b.compareTo(a));

  for (int i = 0; i < hand1Ranks.length; i++) {
    if (hand1Ranks[i] > hand2Ranks[i]) {
      return -1;
    } else if (hand1Ranks[i] < hand2Ranks[i]) {
      return 1;
    }
  }
  return 0; // If all cards equal, then the hands are completely equal
}

int compareTwoPairs(PokerHand hand1, PokerHand hand2) {
  final hand1PairsAndKicker = extractPairsAndKicker(hand1.cards);
  final hand2PairsAndKicker = extractPairsAndKicker(hand2.cards);

  // Compare higher pairs
  if (hand1PairsAndKicker.item1[0].index > hand2PairsAndKicker.item1[0].index) {
    return 1; // Hand1 wins
  } else if (hand1PairsAndKicker.item1[0].index < hand2PairsAndKicker.item1[0].index) {
    return -1; // Hand2 wins
  }

  // Higher pairs are equal, compare lower pairs
  if (hand1PairsAndKicker.item1[1].index > hand2PairsAndKicker.item1[1].index) {
    return 1; // Hand1 wins
  } else if (hand1PairsAndKicker.item1[1].index < hand2PairsAndKicker.item1[1].index) {
    return -1; // Hand2 wins
  }

  // Both pairs are equal, compare kicker
  if (hand1PairsAndKicker.item2.index > hand2PairsAndKicker.item2.index) {
    return 1; // Hand1 wins
  } else if (hand1PairsAndKicker.item2.index < hand2PairsAndKicker.item2.index) {
    return -1; // Hand2 wins
  }

  return 0; // Hands are completely equal
}

Tuple2<List<Rank>, Rank> extractPairsAndKicker(List<Card> hand) {
  final rankCounts = <Rank, int>{};
  for (var card in hand) {
    rankCounts.update(card.rank, (count) => count + 1, ifAbsent: () => 1);
  }

  // Extract pairs and sort them by rank (descending)
  List<Rank> pairs = rankCounts.entries.where((entry) => entry.value == 2).map((entry) => entry.key).toList()
    ..sort((a, b) => b.index.compareTo(a.index)); // Ensure higher pair comes first

  // Extract kicker
  Rank kicker = rankCounts.entries.firstWhere((entry) => entry.value == 1).key;

  return Tuple2(pairs, kicker);
}

List<List<Card>> generate5CardCombinations(List<Card> cards) {
  List<List<Card>> combinations = [];
  void combine(List<Card> list, int start, List<Card> currentCombination) {
    if (currentCombination.length == 5) {
      combinations.add(List.from(currentCombination));
      return;
    }
    for (int i = start; i < cards.length; i++) {
      currentCombination.add(cards[i]);
      combine(list, i + 1, currentCombination);
      currentCombination.removeLast();
    }
  }

  combine(cards, 0, []);
  return combinations;
}

PokerHand findBestHand(List<Card> sevenCards) {
  final combinations = generate5CardCombinations(sevenCards);
  PokerHand? bestHand;
  HandRank bestRank = HandRank.highCard; // Start with the lowest possible rank
  List<Card> bestCombination = [];

  for (var combination in combinations) {
    var hand = PokerHand(cards: combination);
    var rank = hand.evaluateHand();

    if (bestHand == null || rank.index < bestRank.index) {
      bestHand = hand;
      bestRank = rank;
      bestCombination = combination;
    }
  }

  return PokerHand(cards: bestCombination);
}

List<PokerHand> findAllHands(List<Card> sevenCards) {
  final combinations = generate5CardCombinations(sevenCards);
  List<PokerHand> allHands = [];

  for (var combination in combinations) {
    allHands.add(PokerHand(cards: combination));
  }

  return allHands;
}

List<List<PokerHand>> combineSameHands(List<PokerHand> hands) {
  // Use a LinkedHashMap to maintain the order of insertion if needed
  var handGroups = <String, List<PokerHand>>{};

  for (var hand in hands) {
    // Assume `getRankKey` is a function that returns a unique string key for the rank
    // This key could be based on the hand's rank, e.g., "Flush", "Three of a Kind", etc.
    HandRank rank = hand.evaluateHand();
    String rankKey = rank.name;

    // If the key already exists in the map, append the hand to the existing list
    if (handGroups.containsKey(rankKey)) {
      handGroups[rankKey]?.add(hand);
    } else {
      // Otherwise, create a new list with the hand
      handGroups[rankKey] = [hand];
    }
  }

  // Convert the map values to a list of lists
  return handGroups.values.toList();
}
