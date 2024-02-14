part of '../app_extension.dart';

enum ThemeType {
  // dark(mode: ThemeMode.dark),
  darkPurple(mode: ThemeMode.dark),
  // darkRed(mode: ThemeMode.dark),
  darkYellow(mode: ThemeMode.dark),
  darkGreen(mode: ThemeMode.dark),
  // darkBlue(mode: ThemeMode.dark),

  // light(mode: ThemeMode.light),
  // lightYellow(mode: ThemeMode.light),
  // lightRed(mode: ThemeMode.light),
  lightGreen(mode: ThemeMode.light),
  // lightTeal(mode: ThemeMode.light),
  lightPurple(mode: ThemeMode.light),

  olive(mode: ThemeMode.dark),
  darkMaterial(mode: ThemeMode.dark),
  darkAmoled(mode: ThemeMode.dark),
  // redTornado(mode: ThemeMode.light),
  // lightMaterial(mode: ThemeMode.light),

  systemTheme(mode: ThemeMode.system);

  const ThemeType({
    required this.mode,
  });

  final ThemeMode mode;

  bool get isDark => mode == ThemeMode.dark;
  bool get isLight => mode == ThemeMode.light;
  bool get isSystem => mode == ThemeMode.system;

  String get label {
    switch (this) {
      // case ThemeType.dark:
      //   return 'Dark';
      case ThemeType.darkPurple:
        return 'Dark Purple';
      // case ThemeType.light:
      //   return 'Light';
      // case ThemeType.lightYellow:
      //   return 'Light Yellow';
      // case ThemeType.darkRed:
      //   return 'Dark Red';
      case ThemeType.darkYellow:
        return 'Dark Yellow';
      case ThemeType.darkGreen:
        return 'Dark Green';
      // case ThemeType.darkBlue:
      //   return 'Dark Blue';
      // case ThemeType.lightRed:
      //   return 'Light Red';
      case ThemeType.lightGreen:
        return 'Light Green';
      // case ThemeType.lightTeal:
      //   return 'Light Teal';
      case ThemeType.lightPurple:
        return 'Light Purple';
      case ThemeType.olive:
        return 'Olive';
      case ThemeType.darkMaterial:
        return 'Dark Material';
      case ThemeType.darkAmoled:
        return 'AMOLED';
      // case ThemeType.redTornado:
      //   return 'Red Tornado';
      // case ThemeType.lightMaterial:
      //   return 'Light Material';
      case ThemeType.systemTheme:
        return 'System Theme';
    }
  }
}

const String themeTypeKey = 'theme_type_0';

class ThemeSettings
    implements AppSettings<AutoDisposeStateNotifierProvider<ThemeStateNotifier, ThemeState>, ThemeType> {
  ThemeSettings._();

  @override
  AutoDisposeStateNotifierProvider<ThemeStateNotifier, ThemeState> get current => _themeProvider;

  @override
  void switchTo(ThemeType type, {bool showToast = true}) {
    MyAppX.currentRef?.read(_themeProvider.notifier).switchTheme(type, showToast: showToast);
  }

  @override
  void nextTo() {
    MyAppX.currentRef?.read(_themeProvider.notifier).nextTheme();
  }

  ThemeColors? getThemeColors(ThemeType type) {
    return MyAppX.currentRef?.read(_themeProvider.notifier).getThemeColors(type);
  }
}
