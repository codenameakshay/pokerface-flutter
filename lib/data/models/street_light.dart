import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokerface/data/models/bulb.dart';

part 'street_light.freezed.dart';

@freezed
class StreetLight with _$StreetLight {
  factory StreetLight({
    required List<Bulb> bulbs,
  }) = _StreetLight;
}
