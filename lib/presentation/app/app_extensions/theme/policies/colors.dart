part of '../../app_extension.dart';

abstract class ThemeColors {
  factory ThemeColors.dark() => _ThemeColorsDarkBlackImpl();
  factory ThemeColors.darkPurple() => _ThemeColorsPurpleDarkImpl();
  factory ThemeColors.darkRed() => _ThemeColorsDarkRedImpl();
  factory ThemeColors.darkYellow() => _ThemeColorsDarkYellowImpl();
  factory ThemeColors.darkGreen() => _ThemeColorsDarkGreenImpl();
  factory ThemeColors.darkBlue() => _ThemeColorsDarkBlueImpl();

  factory ThemeColors.light() => _ThemeColorsLightWhiteImpl();
  factory ThemeColors.lightYellow() => _ThemeColorsLightYellowImpl();
  factory ThemeColors.lightRed() => _ThemeColorsLightRedImpl();
  factory ThemeColors.lightGreen() => _ThemeColorsLightGreenImpl();
  factory ThemeColors.lightTeal() => _ThemeColorsLightTealImpl();
  factory ThemeColors.lightPurple() => _ThemeColorsLightPurpleImpl();

  factory ThemeColors.olive() => _ThemeColorsDarkOliveImpl();
  factory ThemeColors.darkMaterial() => _ThemeColorsDarkMaterialImpl();
  factory ThemeColors.amoled() => _ThemeColorsDarkAMOLEDImpl();
  factory ThemeColors.redTornado() => _ThemeColorsLightRedTornadoImpl();
  factory ThemeColors.lightMaterial() => _ThemeColorsLightMaterialImpl();

  Color get primary;
  Color get onPrimary;
  Color get primaryContainer;
  Color get onPrimaryContainer;

  Color get secondary;
  Color get onSecondary;
  Color get secondaryContainer;
  Color get onSecondaryContainer;

  Color get tertiary;
  Color get onTertiary;
  Color get tertiaryContainer;
  Color get onTertiaryContainer;

  Color get warning;
  Color get onWarning;

  Color get error;
  Color get onError;
  Color get errorContainer;
  Color get onErrorContainer;

  Color get background;
  Color get onBackground;

  Color get surface;
  Color get onSurface;

  Brightness get brightness;

  ColorScheme get colorScheme => ColorScheme(
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer,
        onPrimaryContainer: onPrimaryContainer,
        secondary: secondary,
        onSecondary: onSecondary,
        secondaryContainer: secondaryContainer,
        onSecondaryContainer: onSecondaryContainer,
        tertiary: tertiary,
        onTertiary: onTertiary,
        tertiaryContainer: tertiaryContainer,
        onTertiaryContainer: onTertiaryContainer,
        surface: surface,
        onSurface: onSurface,
        background: background,
        onBackground: onBackground,
        error: error,
        onError: onError,
        errorContainer: errorContainer,
        onErrorContainer: onErrorContainer,
        brightness: brightness,
      );
}
