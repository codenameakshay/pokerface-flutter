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
