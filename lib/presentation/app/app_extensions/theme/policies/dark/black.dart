part of '../../../app_extension.dart';

class _ThemeColorsDarkBlackImpl implements ThemeColors {
  @override
  Color get primary => const Color(0xFF3A82F7);

  @override
  Color get background => const Color(0xFF1B1A29);

  @override
  Brightness get brightness => colorScheme.brightness;

  @override
  Color get error => colorScheme.error;

  @override
  Color get errorContainer => colorScheme.errorContainer;

  @override
  Color get onBackground => colorScheme.onBackground;

  @override
  Color get onError => colorScheme.onError;

  @override
  Color get onErrorContainer => colorScheme.onErrorContainer;

  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  @override
  Color get onPrimaryContainer => colorScheme.onPrimaryContainer;

  @override
  Color get onSecondary => colorScheme.onSecondary;

  @override
  Color get onSecondaryContainer => colorScheme.onSecondaryContainer;

  @override
  Color get onSurface => colorScheme.onSurface;

  @override
  Color get onTertiary => colorScheme.onTertiary;

  @override
  Color get onTertiaryContainer => colorScheme.onTertiaryContainer;

  @override
  Color get onWarning => const Color(0xFF1F1A0F);

  @override
  Color get primaryContainer => colorScheme.primaryContainer;

  @override
  Color get secondary => colorScheme.secondary;

  @override
  Color get secondaryContainer => const Color(0xFF262538);

  @override
  Color get surface => colorScheme.surface;

  @override
  Color get tertiary => colorScheme.tertiary;

  @override
  Color get tertiaryContainer => colorScheme.tertiaryContainer;

  @override
  Color get warning => const Color(0xFFEBB252);

  @override
  ColorScheme get colorScheme => ColorScheme.fromSeed(
        seedColor: const Color(0xFF3A82F7),
        brightness: Brightness.dark,
      );
}
