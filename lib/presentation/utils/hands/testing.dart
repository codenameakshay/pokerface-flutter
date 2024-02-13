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

Future<List<List<Card>>> generateCombinations(String key, List<Card> elements, int k) async {
  List<List<Card>> combinations = [];
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
  return combinations;
}

Future<List<List<PokerHand>>> findTopNHands(List<Card> knownCards, int n) async {
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

    List<PokerHand> allPossibleHands = [];

    for (var handCard in allHandCards) {
      // We just need to figure out the best combination out of these cards to return
      List<List<Card>> cardCombinations = await generateCombinations(key, handCard, 5);
      List<PokerHand> possibleHands = cardCombinations.map((combination) => PokerHand(cards: combination)).toList();
      allPossibleHands.addAll(possibleHands);
    }

    // Evaluate and sort the hands by strength, then take the top 20
    allPossibleHands.sort((a, b) => compareHands(b, a));

    final nPossibleHands = allPossibleHands.take(n).toList();
    final groupedHands = combineSameHands(nPossibleHands);

    return groupedHands;
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

    final nPossibleHands = allPossibleHands.take(n).toList();
    final groupedHands = combineSameHands(nPossibleHands);

    return groupedHands;
  }
}
