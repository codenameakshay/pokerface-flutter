import 'package:pokerface/data/models/card_image.dart';
import 'package:pokerface/presentation/utils/cards/cards.dart';
import 'package:pokerface/presentation/utils/cards/cards_png.dart';

class CardsImages {
  CardsImages._();

  static const ClubsImages clubs = ClubsImages();
  static const DiamondsImages diamonds = DiamondsImages();
  static const HeartsImages hearts = HeartsImages();
  static const SpadesImages spades = SpadesImages();
}

class ClubsImages {
  const ClubsImages();

  CardImage get ace => CardImage(svg: CardsSVG.fronts.clubsAce, png: CardsPNG.fronts.clubsAce);
  CardImage get two => CardImage(svg: CardsSVG.fronts.clubs2, png: CardsPNG.fronts.clubs2);
  CardImage get three => CardImage(svg: CardsSVG.fronts.clubs3, png: CardsPNG.fronts.clubs3);
  CardImage get four => CardImage(svg: CardsSVG.fronts.clubs4, png: CardsPNG.fronts.clubs4);
  CardImage get five => CardImage(svg: CardsSVG.fronts.clubs5, png: CardsPNG.fronts.clubs5);
  CardImage get six => CardImage(svg: CardsSVG.fronts.clubs6, png: CardsPNG.fronts.clubs6);
  CardImage get seven => CardImage(svg: CardsSVG.fronts.clubs7, png: CardsPNG.fronts.clubs7);
  CardImage get eight => CardImage(svg: CardsSVG.fronts.clubs8, png: CardsPNG.fronts.clubs8);
  CardImage get nine => CardImage(svg: CardsSVG.fronts.clubs9, png: CardsPNG.fronts.clubs9);
  CardImage get ten => CardImage(svg: CardsSVG.fronts.clubs10, png: CardsPNG.fronts.clubs10);
  CardImage get jack => CardImage(svg: CardsSVG.fronts.clubsJack, png: CardsPNG.fronts.clubsJack);
  CardImage get queen => CardImage(svg: CardsSVG.fronts.clubsQueen, png: CardsPNG.fronts.clubsQueen);
  CardImage get king => CardImage(svg: CardsSVG.fronts.clubsKing, png: CardsPNG.fronts.clubsKing);
}

class DiamondsImages {
  const DiamondsImages();

  CardImage get ace => CardImage(svg: CardsSVG.fronts.diamondsAce, png: CardsPNG.fronts.diamondsAce);
  CardImage get two => CardImage(svg: CardsSVG.fronts.diamonds2, png: CardsPNG.fronts.diamonds2);
  CardImage get three => CardImage(svg: CardsSVG.fronts.diamonds3, png: CardsPNG.fronts.diamonds3);
  CardImage get four => CardImage(svg: CardsSVG.fronts.diamonds4, png: CardsPNG.fronts.diamonds4);
  CardImage get five => CardImage(svg: CardsSVG.fronts.diamonds5, png: CardsPNG.fronts.diamonds5);
  CardImage get six => CardImage(svg: CardsSVG.fronts.diamonds6, png: CardsPNG.fronts.diamonds6);
  CardImage get seven => CardImage(svg: CardsSVG.fronts.diamonds7, png: CardsPNG.fronts.diamonds7);
  CardImage get eight => CardImage(svg: CardsSVG.fronts.diamonds8, png: CardsPNG.fronts.diamonds8);
  CardImage get nine => CardImage(svg: CardsSVG.fronts.diamonds9, png: CardsPNG.fronts.diamonds9);
  CardImage get ten => CardImage(svg: CardsSVG.fronts.diamonds10, png: CardsPNG.fronts.diamonds10);
  CardImage get jack => CardImage(svg: CardsSVG.fronts.diamondsJack, png: CardsPNG.fronts.diamondsJack);
  CardImage get queen => CardImage(svg: CardsSVG.fronts.diamondsQueen, png: CardsPNG.fronts.diamondsQueen);
  CardImage get king => CardImage(svg: CardsSVG.fronts.diamondsKing, png: CardsPNG.fronts.diamondsKing);
}

class HeartsImages {
  const HeartsImages();

  CardImage get ace => CardImage(svg: CardsSVG.fronts.heartsAce, png: CardsPNG.fronts.heartsAce);
  CardImage get two => CardImage(svg: CardsSVG.fronts.hearts2, png: CardsPNG.fronts.hearts2);
  CardImage get three => CardImage(svg: CardsSVG.fronts.hearts3, png: CardsPNG.fronts.hearts3);
  CardImage get four => CardImage(svg: CardsSVG.fronts.hearts4, png: CardsPNG.fronts.hearts4);
  CardImage get five => CardImage(svg: CardsSVG.fronts.hearts5, png: CardsPNG.fronts.hearts5);
  CardImage get six => CardImage(svg: CardsSVG.fronts.hearts6, png: CardsPNG.fronts.hearts6);
  CardImage get seven => CardImage(svg: CardsSVG.fronts.hearts7, png: CardsPNG.fronts.hearts7);
  CardImage get eight => CardImage(svg: CardsSVG.fronts.hearts8, png: CardsPNG.fronts.hearts8);
  CardImage get nine => CardImage(svg: CardsSVG.fronts.hearts9, png: CardsPNG.fronts.hearts9);
  CardImage get ten => CardImage(svg: CardsSVG.fronts.hearts10, png: CardsPNG.fronts.hearts10);
  CardImage get jack => CardImage(svg: CardsSVG.fronts.heartsJack, png: CardsPNG.fronts.heartsJack);
  CardImage get queen => CardImage(svg: CardsSVG.fronts.heartsQueen, png: CardsPNG.fronts.heartsQueen);
  CardImage get king => CardImage(svg: CardsSVG.fronts.heartsKing, png: CardsPNG.fronts.heartsKing);
}

class SpadesImages {
  const SpadesImages();

  CardImage get ace => CardImage(svg: CardsSVG.fronts.spadesAce, png: CardsPNG.fronts.spadesAce);
  CardImage get two => CardImage(svg: CardsSVG.fronts.spades2, png: CardsPNG.fronts.spades2);
  CardImage get three => CardImage(svg: CardsSVG.fronts.spades3, png: CardsPNG.fronts.spades3);
  CardImage get four => CardImage(svg: CardsSVG.fronts.spades4, png: CardsPNG.fronts.spades4);
  CardImage get five => CardImage(svg: CardsSVG.fronts.spades5, png: CardsPNG.fronts.spades5);
  CardImage get six => CardImage(svg: CardsSVG.fronts.spades6, png: CardsPNG.fronts.spades6);
  CardImage get seven => CardImage(svg: CardsSVG.fronts.spades7, png: CardsPNG.fronts.spades7);
  CardImage get eight => CardImage(svg: CardsSVG.fronts.spades8, png: CardsPNG.fronts.spades8);
  CardImage get nine => CardImage(svg: CardsSVG.fronts.spades9, png: CardsPNG.fronts.spades9);
  CardImage get ten => CardImage(svg: CardsSVG.fronts.spades10, png: CardsPNG.fronts.spades10);
  CardImage get jack => CardImage(svg: CardsSVG.fronts.spadesJack, png: CardsPNG.fronts.spadesJack);
  CardImage get queen => CardImage(svg: CardsSVG.fronts.spadesQueen, png: CardsPNG.fronts.spadesQueen);
  CardImage get king => CardImage(svg: CardsSVG.fronts.spadesKing, png: CardsPNG.fronts.spadesKing);
}
