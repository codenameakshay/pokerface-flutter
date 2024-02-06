part of '../../app_extension.dart';

abstract class ThemeBorders {
  factory ThemeBorders() => _BordersImpl();

  double get b1;

  double get b3;
}

class _BordersImpl implements ThemeBorders {
  @override
  double get b1 => 1.0.toAutoScaledWidth;

  @override
  double get b3 => 3.0.toAutoScaledWidth;
}
