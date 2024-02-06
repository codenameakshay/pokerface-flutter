part of '../../../app_extension.dart';

class _ThemeColorsPurpleDarkImpl implements ThemeColors {
  @override
  Color get primary => const Color(0xFFD0BCFF);

  @override
  Color get background => const Color(0xFF1C1B1E);

  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get error => const Color(0xFFCE657A);

  @override
  Color get errorContainer => const Color(0xFFB1374E);

  @override
  Color get onBackground => const Color(0xFFE4E4E4);

  @override
  Color get onError => const Color(0xFF1E1314);

  @override
  Color get onErrorContainer => const Color(0xFFF9DDE2);

  @override
  Color get onPrimary => const Color(0xFF1E1C1E);

  @override
  Color get onPrimaryContainer => const Color(0xFFE2DDF1);

  @override
  Color get onSecondary => const Color(0xFF1E1C1E);

  @override
  Color get onSecondaryContainer => const Color(0xFFE1E0E4);

  @override
  Color get onSurface => const Color(0xFFF1F1F1);

  @override
  Color get onTertiary => const Color(0xFF1D1B1D);

  @override
  Color get onTertiaryContainer => const Color(0xFFE7DEE1);

  @override
  Color get onWarning => const Color(0xFF1F1A0F);

  @override
  Color get primaryContainer => const Color(0xFF4F378B);

  @override
  Color get secondary => const Color(0xFFCCC2DC);

  @override
  Color get secondaryContainer => const Color(0xFF4A4459);

  @override
  Color get surface => const Color(0xFF161517);

  @override
  Color get tertiary => const Color(0xFFEEB8C8);

  @override
  Color get tertiaryContainer => const Color(0xFF633B48);

  @override
  Color get warning => const Color(0xFFEBB252);

  @override
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
