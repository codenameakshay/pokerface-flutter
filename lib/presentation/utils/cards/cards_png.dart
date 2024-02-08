import 'package:flutter/material.dart';
import 'package:pokerface/gen/assets.gen.dart';

class CardsPNG {
  CardsPNG._();

  static const CardsPNGFronts fronts = CardsPNGFronts();
  static const CardsPNGDecks decks = CardsPNGDecks();
  static const CardsPNGOther other = CardsPNGOther();

  static Widget drawCard(String card, {double? width, double? height}) {
    return Image.asset(
      card,
      fit: BoxFit.contain,
      height: height,
      width: width,
    );
  }
}

class CardsPNGFronts {
  const CardsPNGFronts();

  // ----------------- Card Fronts -----------------
  String get clubsAce => Assets.images.fronts.clubsAce.path;
  String get clubs2 => Assets.images.fronts.clubs2.path;
  String get clubs3 => Assets.images.fronts.clubs3.path;
  String get clubs4 => Assets.images.fronts.clubs4.path;
  String get clubs5 => Assets.images.fronts.clubs5.path;
  String get clubs6 => Assets.images.fronts.clubs6.path;
  String get clubs7 => Assets.images.fronts.clubs7.path;
  String get clubs8 => Assets.images.fronts.clubs8.path;
  String get clubs9 => Assets.images.fronts.clubs9.path;
  String get clubs10 => Assets.images.fronts.clubs10.path;
  String get clubsJack => Assets.images.fronts.clubsJack.path;
  String get clubsQueen => Assets.images.fronts.clubsQueen.path;
  String get clubsKing => Assets.images.fronts.clubsKing.path;

  String get diamondsAce => Assets.images.fronts.diamondsAce.path;
  String get diamonds2 => Assets.images.fronts.diamonds2.path;
  String get diamonds3 => Assets.images.fronts.diamonds3.path;
  String get diamonds4 => Assets.images.fronts.diamonds4.path;
  String get diamonds5 => Assets.images.fronts.diamonds5.path;
  String get diamonds6 => Assets.images.fronts.diamonds6.path;
  String get diamonds7 => Assets.images.fronts.diamonds7.path;
  String get diamonds8 => Assets.images.fronts.diamonds8.path;
  String get diamonds9 => Assets.images.fronts.diamonds9.path;
  String get diamonds10 => Assets.images.fronts.diamonds10.path;
  String get diamondsJack => Assets.images.fronts.diamondsJack.path;
  String get diamondsQueen => Assets.images.fronts.diamondsQueen.path;
  String get diamondsKing => Assets.images.fronts.diamondsKing.path;

  String get heartsAce => Assets.images.fronts.heartsAce.path;
  String get hearts2 => Assets.images.fronts.hearts2.path;
  String get hearts3 => Assets.images.fronts.hearts3.path;
  String get hearts4 => Assets.images.fronts.hearts4.path;
  String get hearts5 => Assets.images.fronts.hearts5.path;
  String get hearts6 => Assets.images.fronts.hearts6.path;
  String get hearts7 => Assets.images.fronts.hearts7.path;
  String get hearts8 => Assets.images.fronts.hearts8.path;
  String get hearts9 => Assets.images.fronts.hearts9.path;
  String get hearts10 => Assets.images.fronts.hearts10.path;
  String get heartsJack => Assets.images.fronts.heartsJack.path;
  String get heartsQueen => Assets.images.fronts.heartsQueen.path;
  String get heartsKing => Assets.images.fronts.heartsKing.path;

  String get spadesAce => Assets.images.fronts.spadesAce.path;
  String get spades2 => Assets.images.fronts.spades2.path;
  String get spades3 => Assets.images.fronts.spades3.path;
  String get spades4 => Assets.images.fronts.spades4.path;
  String get spades5 => Assets.images.fronts.spades5.path;
  String get spades6 => Assets.images.fronts.spades6.path;
  String get spades7 => Assets.images.fronts.spades7.path;
  String get spades8 => Assets.images.fronts.spades8.path;
  String get spades9 => Assets.images.fronts.spades9.path;
  String get spades10 => Assets.images.fronts.spades10.path;
  String get spadesJack => Assets.images.fronts.spadesJack.path;
  String get spadesQueen => Assets.images.fronts.spadesQueen.path;
  String get spadesKing => Assets.images.fronts.spadesKing.path;

  List<String> get allClubs => [
        clubsAce,
        clubs2,
        clubs3,
        clubs4,
        clubs5,
        clubs6,
        clubs7,
        clubs8,
        clubs9,
        clubs10,
        clubsJack,
        clubsQueen,
        clubsKing,
      ];

  List<String> get allDiamonds => [
        diamondsAce,
        diamonds2,
        diamonds3,
        diamonds4,
        diamonds5,
        diamonds6,
        diamonds7,
        diamonds8,
        diamonds9,
        diamonds10,
        diamondsJack,
        diamondsQueen,
        diamondsKing,
      ];

  List<String> get allHearts => [
        heartsAce,
        hearts2,
        hearts3,
        hearts4,
        hearts5,
        hearts6,
        hearts7,
        hearts8,
        hearts9,
        hearts10,
        heartsJack,
        heartsQueen,
        heartsKing,
      ];

  List<String> get allSpades => [
        spadesAce,
        spades2,
        spades3,
        spades4,
        spades5,
        spades6,
        spades7,
        spades8,
        spades9,
        spades10,
        spadesJack,
        spadesQueen,
        spadesKing,
      ];

  List<String> get all => [
        clubsAce,
        clubs2,
        clubs3,
        clubs4,
        clubs5,
        clubs6,
        clubs7,
        clubs8,
        clubs9,
        clubs10,
        clubsJack,
        clubsQueen,
        clubsKing,
        diamondsAce,
        diamonds2,
        diamonds3,
        diamonds4,
        diamonds5,
        diamonds6,
        diamonds7,
        diamonds8,
        diamonds9,
        diamonds10,
        diamondsJack,
        diamondsQueen,
        diamondsKing,
        heartsAce,
        hearts2,
        hearts3,
        hearts4,
        hearts5,
        hearts6,
        hearts7,
        hearts8,
        hearts9,
        hearts10,
        heartsJack,
        heartsQueen,
        heartsKing,
        spadesAce,
        spades2,
        spades3,
        spades4,
        spades5,
        spades6,
        spades7,
        spades8,
        spades9,
        spades10,
        spadesJack,
        spadesQueen,
        spadesKing,
      ];

  List<String> get allWithoutFaceCardsPNG => [
        clubs2,
        clubs3,
        clubs4,
        clubs5,
        clubs6,
        clubs7,
        clubs8,
        clubs9,
        clubs10,
        diamonds2,
        diamonds3,
        diamonds4,
        diamonds5,
        diamonds6,
        diamonds7,
        diamonds8,
        diamonds9,
        diamonds10,
        hearts2,
        hearts3,
        hearts4,
        hearts5,
        hearts6,
        hearts7,
        hearts8,
        hearts9,
        hearts10,
        spades2,
        spades3,
        spades4,
        spades5,
        spades6,
        spades7,
        spades8,
        spades9,
        spades10,
      ];
}

class CardsPNGDecks {
  const CardsPNGDecks();

  // ----------------- Card Backs -----------------
  String get abstract => Assets.images.backs.abstract.path;
  String get abstractClouds => Assets.images.backs.abstractClouds.path;
  String get abstractScene => Assets.images.backs.abstractScene.path;
  String get astronaut => Assets.images.backs.astronaut.path;
  String get blue => Assets.images.backs.blue.path;
  String get blue2 => Assets.images.backs.blue2.path;
  String get cars => Assets.images.backs.cars.path;
  String get castle => Assets.images.backs.castle.path;
  String get fish => Assets.images.backs.fish.path;
  String get frog => Assets.images.backs.frog.path;
  String get red => Assets.images.backs.red.path;
  String get red2 => Assets.images.backs.red2.path;

  List<String> get all => [
        abstract,
        abstractClouds,
        abstractScene,
        astronaut,
        blue,
        blue2,
        cars,
        castle,
        fish,
        frog,
        red,
        red2,
      ];
}

class CardsPNGOther {
  const CardsPNGOther();

  // ----------------- Special CardsPNG -----------------
  String get blankCard => Assets.images.other.blankCard.path;
  String get clubs8Alt => Assets.images.other.clubs8Alt.path;
  String get clubsAceLargePip => Assets.images.other.clubsAceLargePip.path;
  String get diamonds8Alt => Assets.images.other.diamonds8Alt.path;
  String get diamondsAceLargePip => Assets.images.other.diamondsAceLargePip.path;
  String get hearts8Alt => Assets.images.other.hearts8Alt.path;
  String get heartsAceLargePip => Assets.images.other.heartsAceLargePip.path;
  String get spades8Alt => Assets.images.other.spades8Alt.path;
  String get spadesAceLargePip => Assets.images.other.spadesAceLargePip.path;
  String get spadesAceNoPhrase => Assets.images.other.spadesAceNoPhrase.path;
  String get spadesAceSimple => Assets.images.other.spadesAceSimple.path;

  List<String> get all => [
        blankCard,
        clubs8Alt,
        clubsAceLargePip,
        diamonds8Alt,
        diamondsAceLargePip,
        hearts8Alt,
        heartsAceLargePip,
        spades8Alt,
        spadesAceLargePip,
        spadesAceNoPhrase,
        spadesAceSimple,
      ];
}
