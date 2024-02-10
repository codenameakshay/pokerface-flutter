import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/data/models/poker_hand.dart';
import 'package:pokerface/presentation/utils/cards/all_cards.dart';
import 'package:pokerface/presentation/utils/hands/hands.dart';

List<Card> generateDeck() {
  return Cards.all;
}

List<List<Card>> dealHands(List<Card> deck, int numberOfHands, int cardsPerHand) {
  deck.shuffle(); // Shuffle the deck
  List<List<Card>> hands = [];
  // Ensure we do not exceed the deck size
  int totalCardsNeeded = numberOfHands * cardsPerHand;
  if (totalCardsNeeded > deck.length) {
    throw ArgumentError("Not enough cards in the deck for the requested number of hands and cards per hand.");
  }
  for (int i = 0; i < numberOfHands; i++) {
    hands.add(deck.sublist(i * cardsPerHand, (i + 1) * cardsPerHand));
  }
  return hands;
}

List<PokerHand> sortHands(List<List<Card>> hands) {
  List<PokerHand> pokerHands = hands.map((hand) => PokerHand(cards: hand)).toList();

  pokerHands.sort((a, b) => compareHands(b, a));

  return pokerHands;
}

List<PokerHand> generateAndSortRandomHands() {
  // Generate a deck and deal 10 hands of 5 cards each
  List<Card> deck = generateDeck();
  // Adjusted to deal 10 hands to fit a 52-card deck
  List<List<Card>> hands = dealHands(deck, 10, 5);

  // Sort the hands by strength
  List<PokerHand> sortedHands = sortHands(hands);

  return sortedHands;
}

List<List<Card>> generateCommunityCardCombinations(List<Card> deck, int combinationSize) {
  List<List<Card>> combinations = [];
  void generateCombinations(List<Card> list, int start, List<Card> current, int size) {
    if (current.length == size) {
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

// List<PokerHand> findTop20Hands(Card holeCard1, Card holeCard2) {
//   List<Card> deck = generateDeck()..removeWhere((card) => card == holeCard1 || card == holeCard2);
//   List<List<Card>> communityCombinations = generateCommunityCardCombinations(deck, 3);

//   List<PokerHand> allHands =
//       communityCombinations.map((combination) => PokerHand(cards: [holeCard1, holeCard2] + combination)).toList();

//   // Assume evaluateAndSortHands evaluates and then sorts the hands based on their strength
//   allHands.sort((a, b) => compareHands(b, a));

//   // Selecting the top 20 hands based on their strength
//   return allHands.take(20).toList();
// }

List<PokerHand> findTop20Hands(List<Card> knownCards) {
  // Ensure knownCards contains 2 to 7 cards
  if (knownCards.length < 2 || knownCards.length > 7) {
    throw ArgumentError("The number of known cards must be between 2 and 7, inclusive.");
  }

  // Generate the deck excluding known cards
  List<Card> deck = generateDeck()..removeWhere((card) => knownCards.contains(card));

  // Determine the number of community cards to generate based on known cards
  int numCommunityCardsToGenerate = 5 - (knownCards.length - 2); // Total 5 cards in a hand - known community cards

  List<PokerHand> allPossibleHands = [];

  if (numCommunityCardsToGenerate <= 0) {
    // If no more cards need to be generated, evaluate the hand directly
    allPossibleHands.add(PokerHand(cards: knownCards));
  } else {
    // Generate combinations for the remaining community cards
    List<List<Card>> communityCombinations = generateCommunityCardCombinations(deck, numCommunityCardsToGenerate);

    // Generate and evaluate all possible hands
    for (var combination in communityCombinations) {
      var handCards = List<Card>.from(knownCards)..addAll(combination);
      allPossibleHands.add(PokerHand(cards: handCards));
    }
  }

  // Evaluate and sort the hands by strength, then take the top 20
  allPossibleHands.sort((a, b) => compareHands(b, a));

  return allPossibleHands.take(20).toList();
}
