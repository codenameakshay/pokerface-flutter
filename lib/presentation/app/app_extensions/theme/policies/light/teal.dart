part of '../../../app_extension.dart';

class _ThemeColorsLightTealImpl implements ThemeColors {
  @override
  Color get primary => const Color(0xFF1F3339);

  @override
  Color get background => const Color(0xfff7f7f8);

  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get error => const Color(0xffb00020);

  @override
  Color get errorContainer => const Color(0xfffcd8df);

  @override
  Color get onBackground => const Color(0xff090909);

  @override
  Color get onError => const Color(0xffffffff);

  @override
  Color get onErrorContainer => const Color(0xff141213);

  @override
  Color get onPrimary => const Color(0xffffffff);

  @override
  Color get onPrimaryContainer => const Color(0xff0d1012);

  @override
  Color get onSecondary => const Color(0xff000000);

  @override
  Color get onSecondaryContainer => const Color(0xff0f1112);

  @override
  Color get onSurface => const Color(0xff090909);

  @override
  Color get onTertiary => const Color(0xffffffff);

  @override
  Color get onTertiaryContainer => const Color(0xff141211);

  @override
  Color get onWarning => const Color(0xFF1F1A0F);

  @override
  Color get primaryContainer => const Color(0xFF9EC4D4);

  @override
  Color get secondary => const Color(0xFF93A0A9);

  @override
  Color get secondaryContainer => const Color(0xFFB5CDDB);

  @override
  Color get surface => const Color(0xfff7f7f8);

  @override
  Color get tertiary => const Color(0xFFD2600A);

  @override
  Color get tertiaryContainer => const Color(0xffffdbc8);

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
