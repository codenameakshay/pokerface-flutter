import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokerface/gen/assets.gen.dart';

class Cards {
  Cards._();

  static const CardsFronts fronts = CardsFronts();
  static const CardsDecks decks = CardsDecks();
  static const CardsOther other = CardsOther();

  static Widget drawCard(String card, {double? width, double? height}) {
    return SvgPicture.asset(
      card,
      fit: BoxFit.contain,
      height: height,
      width: width,
    );
  }
}

class CardsFronts {
  const CardsFronts();

  // ----------------- Card Fronts -----------------
  String get clubsAce => Assets.svgs.fronts.clubsAce;
  String get clubs2 => Assets.svgs.fronts.clubs2;
  String get clubs3 => Assets.svgs.fronts.clubs3;
  String get clubs4 => Assets.svgs.fronts.clubs4;
  String get clubs5 => Assets.svgs.fronts.clubs5;
  String get clubs6 => Assets.svgs.fronts.clubs6;
  String get clubs7 => Assets.svgs.fronts.clubs7;
  String get clubs8 => Assets.svgs.fronts.clubs8;
  String get clubs9 => Assets.svgs.fronts.clubs9;
  String get clubs10 => Assets.svgs.fronts.clubs10;
  String get clubsJack => Assets.svgs.fronts.clubsJack;
  String get clubsQueen => Assets.svgs.fronts.clubsQueen;
  String get clubsKing => Assets.svgs.fronts.clubsKing;

  String get diamondsAce => Assets.svgs.fronts.diamondsAce;
  String get diamonds2 => Assets.svgs.fronts.diamonds2;
  String get diamonds3 => Assets.svgs.fronts.diamonds3;
  String get diamonds4 => Assets.svgs.fronts.diamonds4;
  String get diamonds5 => Assets.svgs.fronts.diamonds5;
  String get diamonds6 => Assets.svgs.fronts.diamonds6;
  String get diamonds7 => Assets.svgs.fronts.diamonds7;
  String get diamonds8 => Assets.svgs.fronts.diamonds8;
  String get diamonds9 => Assets.svgs.fronts.diamonds9;
  String get diamonds10 => Assets.svgs.fronts.diamonds10;
  String get diamondsJack => Assets.svgs.fronts.diamondsJack;
  String get diamondsQueen => Assets.svgs.fronts.diamondsQueen;
  String get diamondsKing => Assets.svgs.fronts.diamondsKing;

  String get heartsAce => Assets.svgs.fronts.heartsAce;
  String get hearts2 => Assets.svgs.fronts.hearts2;
  String get hearts3 => Assets.svgs.fronts.hearts3;
  String get hearts4 => Assets.svgs.fronts.hearts4;
  String get hearts5 => Assets.svgs.fronts.hearts5;
  String get hearts6 => Assets.svgs.fronts.hearts6;
  String get hearts7 => Assets.svgs.fronts.hearts7;
  String get hearts8 => Assets.svgs.fronts.hearts8;
  String get hearts9 => Assets.svgs.fronts.hearts9;
  String get hearts10 => Assets.svgs.fronts.hearts10;
  String get heartsJack => Assets.svgs.fronts.heartsJack;
  String get heartsQueen => Assets.svgs.fronts.heartsQueen;
  String get heartsKing => Assets.svgs.fronts.heartsKing;

  String get spadesAce => Assets.svgs.fronts.spadesAce;
  String get spades2 => Assets.svgs.fronts.spades2;
  String get spades3 => Assets.svgs.fronts.spades3;
  String get spades4 => Assets.svgs.fronts.spades4;
  String get spades5 => Assets.svgs.fronts.spades5;
  String get spades6 => Assets.svgs.fronts.spades6;
  String get spades7 => Assets.svgs.fronts.spades7;
  String get spades8 => Assets.svgs.fronts.spades8;
  String get spades9 => Assets.svgs.fronts.spades9;
  String get spades10 => Assets.svgs.fronts.spades10;
  String get spadesJack => Assets.svgs.fronts.spadesJack;
  String get spadesQueen => Assets.svgs.fronts.spadesQueen;
  String get spadesKing => Assets.svgs.fronts.spadesKing;

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

  List<String> get allWithoutFaceCards => [
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

class CardsDecks {
  const CardsDecks();

  // ----------------- Card Backs -----------------
  String get abstract => Assets.svgs.backs.abstract;
  String get abstractClouds => Assets.svgs.backs.abstractClouds;
  String get abstractScene => Assets.svgs.backs.abstractScene;
  String get astronaut => Assets.svgs.backs.astronaut;
  String get blue => Assets.svgs.backs.blue;
  String get blue2 => Assets.svgs.backs.blue2;
  String get cars => Assets.svgs.backs.cars;
  String get castle => Assets.svgs.backs.castle;
  String get fish => Assets.svgs.backs.fish;
  String get frog => Assets.svgs.backs.frog;
  String get red => Assets.svgs.backs.red;
  String get red2 => Assets.svgs.backs.red2;

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

class CardsOther {
  const CardsOther();

  // ----------------- Special Cards -----------------
  String get blankCard => Assets.svgs.other.blankCard;
  String get clubs8Alt => Assets.svgs.other.clubs8Alt;
  String get clubsAceLargePip => Assets.svgs.other.clubsAceLargePip;
  String get diamonds8Alt => Assets.svgs.other.diamonds8Alt;
  String get diamondsAceLargePip => Assets.svgs.other.diamondsAceLargePip;
  String get hearts8Alt => Assets.svgs.other.hearts8Alt;
  String get heartsAceLargePip => Assets.svgs.other.heartsAceLargePip;
  String get spades8Alt => Assets.svgs.other.spades8Alt;
  String get spadesAceLargePip => Assets.svgs.other.spadesAceLargePip;
  String get spadesAceNoPhrase => Assets.svgs.other.spadesAceNoPhrase;
  String get spadesAceSimple => Assets.svgs.other.spadesAceSimple;

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
