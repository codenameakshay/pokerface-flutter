import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_image.freezed.dart';
part 'card_image.g.dart';

@freezed
class CardImage with _$CardImage {
  factory CardImage({
    required String svg,
    required String png,
  }) = _CardImage;

  factory CardImage.fromJson(Map<String, dynamic> json) => _$CardImageFromJson(json);
}
