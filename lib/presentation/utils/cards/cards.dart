import 'package:pokerface/gen/assets.gen.dart';

class Cards {
  Cards._();

  static const CardsFronts fronts = CardsFronts();
  static const CardsDecks decks = CardsDecks();
  static const CardsOther other = CardsOther();
}

class CardsFronts {
  const CardsFronts();

  // ----------------- Card Fronts -----------------
  static String get clubsAce => Assets.svgs.fronts.clubsAce;
  static String get clubs2 => Assets.svgs.fronts.clubs2;
  static String get clubs3 => Assets.svgs.fronts.clubs3;
  static String get clubs4 => Assets.svgs.fronts.clubs4;
  static String get clubs5 => Assets.svgs.fronts.clubs5;
  static String get clubs6 => Assets.svgs.fronts.clubs6;
  static String get clubs7 => Assets.svgs.fronts.clubs7;
  static String get clubs8 => Assets.svgs.fronts.clubs8;
  static String get clubs9 => Assets.svgs.fronts.clubs9;
  static String get clubs10 => Assets.svgs.fronts.clubs10;
  static String get clubsJack => Assets.svgs.fronts.clubsJack;
  static String get clubsQueen => Assets.svgs.fronts.clubsQueen;
  static String get clubsKing => Assets.svgs.fronts.clubsKing;

  static String get diamondsAce => Assets.svgs.fronts.diamondsAce;
  static String get diamonds2 => Assets.svgs.fronts.diamonds2;
  static String get diamonds3 => Assets.svgs.fronts.diamonds3;
  static String get diamonds4 => Assets.svgs.fronts.diamonds4;
  static String get diamonds5 => Assets.svgs.fronts.diamonds5;
  static String get diamonds6 => Assets.svgs.fronts.diamonds6;
  static String get diamonds7 => Assets.svgs.fronts.diamonds7;
  static String get diamonds8 => Assets.svgs.fronts.diamonds8;
  static String get diamonds9 => Assets.svgs.fronts.diamonds9;
  static String get diamonds10 => Assets.svgs.fronts.diamonds10;
  static String get diamondsJack => Assets.svgs.fronts.diamondsJack;
  static String get diamondsQueen => Assets.svgs.fronts.diamondsQueen;
  static String get diamondsKing => Assets.svgs.fronts.diamondsKing;

  static String get heartsAce => Assets.svgs.fronts.heartsAce;
  static String get hearts2 => Assets.svgs.fronts.hearts2;
  static String get hearts3 => Assets.svgs.fronts.hearts3;
  static String get hearts4 => Assets.svgs.fronts.hearts4;
  static String get hearts5 => Assets.svgs.fronts.hearts5;
  static String get hearts6 => Assets.svgs.fronts.hearts6;
  static String get hearts7 => Assets.svgs.fronts.hearts7;
  static String get hearts8 => Assets.svgs.fronts.hearts8;
  static String get hearts9 => Assets.svgs.fronts.hearts9;
  static String get hearts10 => Assets.svgs.fronts.hearts10;
  static String get heartsJack => Assets.svgs.fronts.heartsJack;
  static String get heartsQueen => Assets.svgs.fronts.heartsQueen;
  static String get heartsKing => Assets.svgs.fronts.heartsKing;

  static String get spadesAce => Assets.svgs.fronts.spadesAce;
  static String get spades2 => Assets.svgs.fronts.spades2;
  static String get spades3 => Assets.svgs.fronts.spades3;
  static String get spades4 => Assets.svgs.fronts.spades4;
  static String get spades5 => Assets.svgs.fronts.spades5;
  static String get spades6 => Assets.svgs.fronts.spades6;
  static String get spades7 => Assets.svgs.fronts.spades7;
  static String get spades8 => Assets.svgs.fronts.spades8;
  static String get spades9 => Assets.svgs.fronts.spades9;
  static String get spades10 => Assets.svgs.fronts.spades10;
  static String get spadesJack => Assets.svgs.fronts.spadesJack;
  static String get spadesQueen => Assets.svgs.fronts.spadesQueen;
  static String get spadesKing => Assets.svgs.fronts.spadesKing;
}

class CardsDecks {
  const CardsDecks();

  // ----------------- Card Backs -----------------
  static String get abstract => Assets.svgs.backs.abstract;
  static String get abstractClouds => Assets.svgs.backs.abstractClouds;
  static String get abstractScene => Assets.svgs.backs.abstractScene;
  static String get astronaut => Assets.svgs.backs.astronaut;
  static String get blue => Assets.svgs.backs.blue;
  static String get blue2 => Assets.svgs.backs.blue2;
  static String get cars => Assets.svgs.backs.cars;
  static String get castle => Assets.svgs.backs.castle;
  static String get fish => Assets.svgs.backs.fish;
  static String get frog => Assets.svgs.backs.frog;
  static String get red => Assets.svgs.backs.red;
  static String get red2 => Assets.svgs.backs.red2;
}

class CardsOther {
  const CardsOther();

  // ----------------- Special Cards -----------------
  static String get blankCard => Assets.svgs.other.blankCard;
  static String get clubs8Alt => Assets.svgs.other.clubs8Alt;
  static String get clubsAceLargePip => Assets.svgs.other.clubsAceLargePip;
  static String get diamonds8Alt => Assets.svgs.other.diamonds8Alt;
  static String get diamondsAceLargePip => Assets.svgs.other.diamondsAceLargePip;
  static String get hearts8Alt => Assets.svgs.other.hearts8Alt;
  static String get heartsAceLargePip => Assets.svgs.other.heartsAceLargePip;
  static String get spades8Alt => Assets.svgs.other.spades8Alt;
  static String get spadesAceLargePip => Assets.svgs.other.spadesAceLargePip;
  static String get spadesAceNoPhrase => Assets.svgs.other.spadesAceNoPhrase;
  static String get spadesAceSimple => Assets.svgs.other.spadesAceSimple;
}
