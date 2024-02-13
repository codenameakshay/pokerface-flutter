import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart' hide Card;
import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';

// void generateAndStoreCombinationsInChunks() async {
//   final directory = await MyAppX.path.getTempDirectory();
//   List<Card> deck = generateDeck(); // Assume this returns a list of card identifiers
//   int chunkSize = 100000; // Number of combinations per chunk

//   // Generate combinations in chunks
//   for (int i = 0; i < deck.length; i += chunkSize) {
//     List<List<Card>> combinations =
//         await generateCommunityCardCombinations('dfdfdfsfdf', deck.sublist(i, min(i + chunkSize, deck.length)), 1);
//     String filePath = '${directory.path}/combinations_$i.json';
//     await writeCombinationsToFile(combinations, filePath);
//   }
// }

Future<void> writeCombinationsToFile(List<List<Card>> combinations, String filePath) async {
  List<List<Map<String, dynamic>>> jsonCombinations = combinations
      .map(
        (combo) => combo
            .map(
              (card) => card.toJson(),
            )
            .toList(),
      )
      .toList();

  String jsonString = jsonEncode(jsonCombinations);
  // print('Writing combinations to file... $jsonString');
  await File(filePath).writeAsString(jsonString);
}

Future<List<List<Card>>> readCombinationsFromFile(BuildContext context, String filePath) async {
  String jsonString = await MyAppX.jsonLocalFile.getLocalFile(context, filePath);

  final List<List<Card>> combinations = (jsonDecode(jsonString) as List<dynamic>)
      .map(
        (list) => (list as List<dynamic>)
            .map(
              (card) => Card.fromJson(card),
            )
            .toList(),
      )
      .toList();

  return combinations;
}
