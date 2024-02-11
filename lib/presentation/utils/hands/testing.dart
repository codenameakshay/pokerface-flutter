import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/data/models/poker_hand.dart';
import 'package:pokerface/presentation/utils/cards/all_cards.dart';
import 'package:pokerface/presentation/utils/hands/hands.dart';
import 'package:pokerface/presentation/utils/hands/store.dart';

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

Future<List<List<Card>>> generateCommunityCardCombinations(String key, List<Card> deck, int combinationSize) async {
  List<List<Card>> combinations = [];
  final combinatio = await retrieveCombination(key);
  if (combinatio.isNotEmpty) {
    return combinatio;
  }
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

  await storeCombination(key, combinations);
  return combinations;
}

Future<List<List<Card>>> generateCombinations(String key, List<Card> elements, int k) async {
  List<List<Card>> combinations = [];
  // final combinatio = await retrieveCombination(key);
  // if (combinatio.isNotEmpty) {
  //   return combinatio;
  // }
  void combine(int start, List<Card> currentCombination) {
    // When the combination is of size k, add it to the result list
    if (currentCombination.length == k) {
      // print('combination: ${currentCombination.map((e) => '${e.suit.name}.${e.rank.name}')}');
      combinations.add(List.from(currentCombination));
      return;
    }
    for (int i = start; i < elements.length; i++) {
      currentCombination.add(elements[i]);
      combine(i + 1, currentCombination);
      currentCombination.removeLast(); // Backtrack
    }
  }

  combine(0, []);
  await storeCombination(key, combinations);
  return combinations;
}

Future<List<PokerHand>> findTop20Hands(List<Card> knownCards) async {
  // Ensure knownCards contains 2 to 7 cards
  if (knownCards.length < 2 || knownCards.length > 7) {
    throw ArgumentError("The number of known cards must be between 2 and 7, inclusive.");
  }

  // Generate the deck excluding known cards
  List<Card> deck = generateDeck()..removeWhere((card) => knownCards.contains(card));

  String key = knownCards.map((card) => '${card.suit.name}.${card.rank.name}').join(',');

  if (knownCards.length >= 5) {
    // Generate combinations for the remaining community cards
    List<List<Card>> communityCombinations = await generateCommunityCardCombinations(key, deck, 7 - knownCards.length);

    List<List<Card>> allHandCards = [];

    // Generate and evaluate all possible hands
    for (var combination in communityCombinations) {
      var handCards = List<Card>.from(knownCards)..addAll(combination);
      allHandCards.add(handCards);
    }

    // We just need to figure out the best combination out of these cards to return
    // List<List<Card>> cardCombinations = await generateCombinations(key, knownCards, 5);

    List<PokerHand> allPossibleHands = [];

    for (var handCard in allHandCards) {
      // We just need to figure out the best combination out of these cards to return
      List<List<Card>> cardCombinations = await generateCombinations(key, handCard, 5);
      List<PokerHand> possibleHands = cardCombinations.map((combination) => PokerHand(cards: combination)).toList();
      allPossibleHands.addAll(possibleHands);
    }

    // Evaluate and sort the hands by strength, then take the top 20
    allPossibleHands.sort((a, b) => compareHands(b, a));

    return allPossibleHands.take(20).toList();
  } else {
    // We need to generate remaining cards
    // Determine the number of community cards to generate based on known cards
    int numCommunityCardsToGenerate = 5 - knownCards.length; // Total 5 cards in a hand - known community cards

    List<PokerHand> allPossibleHands = [];

    // Generate combinations for the remaining community cards
    List<List<Card>> communityCombinations =
        await generateCommunityCardCombinations(key, deck, numCommunityCardsToGenerate);

    // Generate and evaluate all possible hands
    for (var combination in communityCombinations) {
      var handCards = List<Card>.from(knownCards)..addAll(combination);
      allPossibleHands.add(PokerHand(cards: handCards));
    }

    // Evaluate and sort the hands by strength, then take the top 20
    allPossibleHands.sort((a, b) => compareHands(b, a));

    return allPossibleHands.take(20).toList();
  }
}
