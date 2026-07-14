import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokerface/data/models/card_image.dart';

part 'card.freezed.dart';
part 'card.g.dart';

enum Suit {
  @JsonValue("clubs")
  clubs,
  @JsonValue("diamonds")
  diamonds,
  @JsonValue("hearts")
  hearts,
  @JsonValue("spades")
  spades,
}

extension SuitExtension on Suit {
  String get emoji {
    switch (this) {
      case Suit.clubs:
        return '♣️';
      case Suit.diamonds:
        return '♦️';
      case Suit.hearts:
        return '♥️';
      case Suit.spades:
        return '♠️';
    }
  }
}

enum Rank {
  @JsonValue("two")
  two,
  @JsonValue("three")
  three,
  @JsonValue("four")
  four,
  @JsonValue("five")
  five,
  @JsonValue("six")
  six,
  @JsonValue("seven")
  seven,
  @JsonValue("eight")
  eight,
  @JsonValue("nine")
  nine,
  @JsonValue("ten")
  ten,
  @JsonValue("jack")
  jack,
  @JsonValue("queen")
  queen,
  @JsonValue("king")
  king,
  @JsonValue("ace")
  ace,
}

extension RankExtension on Rank {
  String get emoji {
    switch (this) {
      case Rank.two:
        return '2️⃣';
      case Rank.three:
        return '3️⃣';
      case Rank.four:
        return '4️⃣';
      case Rank.five:
        return '5️⃣';
      case Rank.six:
        return '6️⃣';
      case Rank.seven:
        return '7️⃣';
      case Rank.eight:
        return '8️⃣';
      case Rank.nine:
        return '9️⃣';
      case Rank.ten:
        return '🔟';
      case Rank.jack:
        return '🃏';
      case Rank.queen:
        return '👸';
      case Rank.king:
        return '🤴';
      case Rank.ace:
        return '🅰️';
    }
  }
}

@freezed
abstract class Card with _$Card {
  const factory Card({required Rank rank, required Suit suit, required CardImage image}) = _Card;

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
}
