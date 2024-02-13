import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bulb.freezed.dart';

@freezed
class Bulb with _$Bulb {
  factory Bulb({
    required Color onColor,
    required Color offColor,
    required Color borderColor,
    required bool isOn,
  }) = _Bulb;
}
