import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/presentation/utils/cards/all_card_images.dart';

class Cards {
  Cards._();

  static const Clubs clubs = Clubs();
  static const Diamonds diamonds = Diamonds();
  static const Hearts hearts = Hearts();
  static const Spades spades = Spades();
}

class Clubs {
  const Clubs();

  Card get ace => Card(rank: Rank.ace, suit: Suit.clubs, image: CardsImages.clubs.ace);
  Card get two => Card(rank: Rank.two, suit: Suit.clubs, image: CardsImages.clubs.two);
  Card get three => Card(rank: Rank.three, suit: Suit.clubs, image: CardsImages.clubs.three);
  Card get four => Card(rank: Rank.four, suit: Suit.clubs, image: CardsImages.clubs.four);
  Card get five => Card(rank: Rank.five, suit: Suit.clubs, image: CardsImages.clubs.five);
  Card get six => Card(rank: Rank.six, suit: Suit.clubs, image: CardsImages.clubs.six);
  Card get seven => Card(rank: Rank.seven, suit: Suit.clubs, image: CardsImages.clubs.seven);
  Card get eight => Card(rank: Rank.eight, suit: Suit.clubs, image: CardsImages.clubs.eight);
  Card get nine => Card(rank: Rank.nine, suit: Suit.clubs, image: CardsImages.clubs.nine);
  Card get ten => Card(rank: Rank.ten, suit: Suit.clubs, image: CardsImages.clubs.ten);
  Card get jack => Card(rank: Rank.jack, suit: Suit.clubs, image: CardsImages.clubs.jack);
  Card get queen => Card(rank: Rank.queen, suit: Suit.clubs, image: CardsImages.clubs.queen);
  Card get king => Card(rank: Rank.king, suit: Suit.clubs, image: CardsImages.clubs.king);

  List<Card> get all => [
        ace,
        two,
        three,
        four,
        five,
        six,
        seven,
        eight,
        nine,
        ten,
        jack,
        queen,
        king,
      ];
}

class Diamonds {
  const Diamonds();

  Card get ace => Card(rank: Rank.ace, suit: Suit.diamonds, image: CardsImages.diamonds.ace);
  Card get two => Card(rank: Rank.two, suit: Suit.diamonds, image: CardsImages.diamonds.two);
  Card get three => Card(rank: Rank.three, suit: Suit.diamonds, image: CardsImages.diamonds.three);
  Card get four => Card(rank: Rank.four, suit: Suit.diamonds, image: CardsImages.diamonds.four);
  Card get five => Card(rank: Rank.five, suit: Suit.diamonds, image: CardsImages.diamonds.five);
  Card get six => Card(rank: Rank.six, suit: Suit.diamonds, image: CardsImages.diamonds.six);
  Card get seven => Card(rank: Rank.seven, suit: Suit.diamonds, image: CardsImages.diamonds.seven);
  Card get eight => Card(rank: Rank.eight, suit: Suit.diamonds, image: CardsImages.diamonds.eight);
  Card get nine => Card(rank: Rank.nine, suit: Suit.diamonds, image: CardsImages.diamonds.nine);
  Card get ten => Card(rank: Rank.ten, suit: Suit.diamonds, image: CardsImages.diamonds.ten);
  Card get jack => Card(rank: Rank.jack, suit: Suit.diamonds, image: CardsImages.diamonds.jack);
  Card get queen => Card(rank: Rank.queen, suit: Suit.diamonds, image: CardsImages.diamonds.queen);
  Card get king => Card(rank: Rank.king, suit: Suit.diamonds, image: CardsImages.diamonds.king);

  List<Card> get all => [
        ace,
        two,
        three,
        four,
        five,
        six,
        seven,
        eight,
        nine,
        ten,
        jack,
        queen,
        king,
      ];
}

class Hearts {
  const Hearts();

  Card get ace => Card(rank: Rank.ace, suit: Suit.hearts, image: CardsImages.hearts.ace);
  Card get two => Card(rank: Rank.two, suit: Suit.hearts, image: CardsImages.hearts.two);
  Card get three => Card(rank: Rank.three, suit: Suit.hearts, image: CardsImages.hearts.three);
  Card get four => Card(rank: Rank.four, suit: Suit.hearts, image: CardsImages.hearts.four);
  Card get five => Card(rank: Rank.five, suit: Suit.hearts, image: CardsImages.hearts.five);
  Card get six => Card(rank: Rank.six, suit: Suit.hearts, image: CardsImages.hearts.six);
  Card get seven => Card(rank: Rank.seven, suit: Suit.hearts, image: CardsImages.hearts.seven);
  Card get eight => Card(rank: Rank.eight, suit: Suit.hearts, image: CardsImages.hearts.eight);
  Card get nine => Card(rank: Rank.nine, suit: Suit.hearts, image: CardsImages.hearts.nine);
  Card get ten => Card(rank: Rank.ten, suit: Suit.hearts, image: CardsImages.hearts.ten);
  Card get jack => Card(rank: Rank.jack, suit: Suit.hearts, image: CardsImages.hearts.jack);
  Card get queen => Card(rank: Rank.queen, suit: Suit.hearts, image: CardsImages.hearts.queen);
  Card get king => Card(rank: Rank.king, suit: Suit.hearts, image: CardsImages.hearts.king);

  List<Card> get all => [
        ace,
        two,
        three,
        four,
        five,
        six,
        seven,
        eight,
        nine,
        ten,
        jack,
        queen,
        king,
      ];
}

class Spades {
  const Spades();

  Card get ace => Card(rank: Rank.ace, suit: Suit.spades, image: CardsImages.spades.ace);
  Card get two => Card(rank: Rank.two, suit: Suit.spades, image: CardsImages.spades.two);
  Card get three => Card(rank: Rank.three, suit: Suit.spades, image: CardsImages.spades.three);
  Card get four => Card(rank: Rank.four, suit: Suit.spades, image: CardsImages.spades.four);
  Card get five => Card(rank: Rank.five, suit: Suit.spades, image: CardsImages.spades.five);
  Card get six => Card(rank: Rank.six, suit: Suit.spades, image: CardsImages.spades.six);
  Card get seven => Card(rank: Rank.seven, suit: Suit.spades, image: CardsImages.spades.seven);
  Card get eight => Card(rank: Rank.eight, suit: Suit.spades, image: CardsImages.spades.eight);
  Card get nine => Card(rank: Rank.nine, suit: Suit.spades, image: CardsImages.spades.nine);
  Card get ten => Card(rank: Rank.ten, suit: Suit.spades, image: CardsImages.spades.ten);
  Card get jack => Card(rank: Rank.jack, suit: Suit.spades, image: CardsImages.spades.jack);
  Card get queen => Card(rank: Rank.queen, suit: Suit.spades, image: CardsImages.spades.queen);
  Card get king => Card(rank: Rank.king, suit: Suit.spades, image: CardsImages.spades.king);

  List<Card> get all => [
        ace,
        two,
        three,
        four,
        five,
        six,
        seven,
        eight,
        nine,
        ten,
        jack,
        queen,
        king,
      ];
}
