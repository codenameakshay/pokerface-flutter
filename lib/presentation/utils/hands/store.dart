// Serialize a combination for storage
import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/data/models/card_image.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';

String keyPrefix = 'combinations#';

// Example of storing a combination
Future<void> storeCombination(String key, List<List<Card>> combinations) async {
  final prefs = MyAppX.prefs;
  await prefs.update(
    key: keyPrefix + key,
    updatedData: combinations,
    encoder: (s) => combinations
        .map((combination) =>
            combination.map((card) => '${card.suit.name}*${card.rank.name}*${card.image.png}*${card.image.svg}'))
        .join(','),
  );
}

List<List<Card>> deserializeCardString(String serializedCards) {
  // Split the string into individual card tuples
  List<String> tuples = serializedCards.split('),');

  // Adjust tuples to ensure closing parentheses are correctly placed after splitting
  tuples = tuples.map((t) => t.endsWith(')') ? t : "$t)").toList();

  List<List<Card>> cardGroups = [];

  for (var tuple in tuples) {
    // Clean up each tuple string
    String cleanedTuple = tuple.replaceAll(RegExp(r'[\(\)]'), '');

    // Split into individual card strings
    List<String> cardStrings = cleanedTuple.split(', ');

    List<Card> cards = cardStrings.map((cardStr) {
      // Split card data and create Card objects
      List<String> parts = cardStr.split('*');
      return Card(
        suit: Suit.values.byName(parts[0]),
        rank: Rank.values.byName(parts[1]),
        image: CardImage(
          png: parts[2],
          svg: parts[3],
        ),
      );
    }).toList();

    cardGroups.add(cards);
  }

  return cardGroups;
}

// Example of retrieving a combination
Future<List<List<Card>>> retrieveCombination(String key) async {
  final prefs = MyAppX.prefs;
  List<List<Card>>? serialized = await prefs.retrieve(key: keyPrefix + key, decoder: (s) => deserializeCardString(s));

  return serialized ?? [];
}
