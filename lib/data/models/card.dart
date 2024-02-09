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

@freezed
class Card with _$Card {
  const factory Card({
    required Rank rank,
    required Suit suit,
    required CardImage image,
  }) = _Card;

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
}
