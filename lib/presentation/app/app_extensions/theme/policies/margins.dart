part of '../../app_extension.dart';

abstract class ThemeMargins {
  factory ThemeMargins() => _ThemeMarginsImpl();

  // Vertical margins
  double get v2;

  double get v4;

  double get v8;

  double get v12;

  double get v10;

  double get v16;

  double get v18;

  double get v20;

  double get v24;

  double get v28;

  double get v30;

  double get v32;

  double get v36;

  double get v48;

  // Horizontal margins
  double get h4;

  double get h8;

  double get h10;

  double get h12;

  double get h16;

  double get h18;

  double get h20;

  double get h24;

  double get h32;

  double get h36;
}

class _ThemeMarginsImpl implements ThemeMargins {
  @override
  double get h12 => 12.0.toAutoScaledWidth;

  @override
  double get h16 => 16.0.toAutoScaledWidth;

  @override
  double get h18 => 18.0.toAutoScaledWidth;

  @override
  double get h20 => 20.0.toAutoScaledWidth;

  @override
  double get h24 => 24.0.toAutoScaledWidth;

  @override
  double get h32 => 32.0.toAutoScaledWidth;

  @override
  double get h36 => 36.0.toAutoScaledWidth;

  @override
  double get h4 => 4.0.toAutoScaledWidth;

  @override
  double get h8 => 8.0.toAutoScaledWidth;

  @override
  double get h10 => 10.0.toAutoScaledWidth;

  @override
  double get v12 => 12.0.toAutoScaledHeight;

  @override
  double get v10 => 10.0.toAutoScaledHeight;

  @override
  double get v16 => 16.0.toAutoScaledHeight;

  @override
  double get v18 => 18.0.toAutoScaledHeight;

  @override
  double get v2 => 2.0.toAutoScaledHeight;

  @override
  double get v20 => 20.0.toAutoScaledHeight;

  @override
  double get v24 => 24.0.toAutoScaledHeight;

  @override
  double get v28 => 28.0.toAutoScaledHeight;

  @override
  double get v30 => 30.0.toAutoScaledHeight;

  @override
  double get v32 => 32.0.toAutoScaledHeight;

  @override
  double get v36 => 36.0.toAutoScaledHeight;

  @override
  double get v4 => 4.0.toAutoScaledHeight;

  @override
  double get v48 => 48.0.toAutoScaledHeight;

  @override
  double get v8 => 8.0.toAutoScaledHeight;
}
