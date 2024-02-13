import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokerface/data/models/poker_hand.dart';

part 'grouped_hands.freezed.dart';
part 'grouped_hands.g.dart';

@freezed
class GroupedHands with _$GroupedHands {
  factory GroupedHands({
    required bool isExpaned,
    required List<PokerHand> pokerHands,
  }) = _GroupedHands;

  factory GroupedHands.fromJson(Map<String, dynamic> json) => _$GroupedHandsFromJson(json);
}
