part of '../../app_extension.dart';

abstract class ThemeFontSizes {
  factory ThemeFontSizes() => _ThemeFontSizesImpl();

  double get s9;

  double get s11;

  double get s12;

  double get s13;

  double get s14;

  double get s16;

  double get s18;

  double get s20;

  double get s24;

  double get s28;

  double get s36;

  double get s30;

  double get s48;
}

class _ThemeFontSizesImpl implements ThemeFontSizes {
  @override
  double get s9 => 9.0.toAutoScaledFont;

  @override
  double get s11 => 11.0.toAutoScaledFont;

  @override
  double get s12 => 12.0.toAutoScaledFont;

  @override
  double get s13 => 13.0.toAutoScaledFont;

  @override
  double get s14 => 14.0.toAutoScaledFont;

  @override
  double get s16 => 16.0.toAutoScaledFont;

  @override
  double get s18 => 18.0.toAutoScaledFont;

  @override
  double get s20 => 20.0.toAutoScaledFont;

  @override
  double get s24 => 24.0.toAutoScaledFont;

  @override
  double get s28 => 28.0.toAutoScaledFont;

  @override
  double get s30 => 30.0.toAutoScaledFont;

  @override
  double get s36 => 36.0.toAutoScaledFont;

  @override
  double get s48 => 48.0.toAutoScaledFont;
}

abstract class ThemeFontWeights {
  factory ThemeFontWeights() => _ThemeFontWeightsImpl();

  FontWeight get wRegular;

  FontWeight get wSemiBold;

  FontWeight get wBold;
}

class _ThemeFontWeightsImpl implements ThemeFontWeights {
  @override
  FontWeight get wRegular => FontWeight.w400;

  @override
  FontWeight get wSemiBold => FontWeight.w600;

  @override
  FontWeight get wBold => FontWeight.w700;
}

abstract class ThemeFontLineHeights {
  factory ThemeFontLineHeights() => _ThemeFontLineHeightsImpl();

  double get lh12;

  double get lh14;

  double get lh16;

  double get lh18;

  double get lh20;

  double get lh22;

  double get lh24;

  double get lh28;

  double get lh32;

  double get lh36;

  double get lh44;

  double get lh48;

  double get lh60;
}

class _ThemeFontLineHeightsImpl implements ThemeFontLineHeights {
  @override
  double get lh12 => 12.0.toAutoScaledFont;

  @override
  double get lh14 => 14.0.toAutoScaledFont;

  @override
  double get lh16 => 16.0.toAutoScaledFont;

  @override
  double get lh18 => 18.0.toAutoScaledFont;

  @override
  double get lh20 => 20.0.toAutoScaledFont;

  @override
  double get lh22 => 22.0.toAutoScaledFont;

  @override
  double get lh24 => 24.0.toAutoScaledFont;

  @override
  double get lh28 => 28.0.toAutoScaledFont;

  @override
  double get lh32 => 32.0.toAutoScaledFont;

  @override
  double get lh44 => 44.0.toAutoScaledFont;

  @override
  double get lh48 => 48.0.toAutoScaledFont;

  @override
  double get lh60 => 60.0.toAutoScaledFont;

  @override
  double get lh36 => 36.0.toAutoScaledFont;
}
