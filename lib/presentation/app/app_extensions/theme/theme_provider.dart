part of '../app_extension.dart';

final _themeProvider = StateNotifierProvider.autoDispose<ThemeStateNotifier, ThemeState>(
  (ref) {
    final notifier = ThemeStateNotifier(
      ThemeState.defaults(),
    )..initState();

    return notifier;
  },
);

class ThemeState {
  ThemeState({
    required this.type,
    required this.margins,
    required this.paddings,
    required this.borders,
    required this.colors,
    required this.fontSizes,
    required this.fontWeights,
    required this.fontLineHeights,
    required this.themeText,
  });

  ThemeState.defaults()
      : this(
          type: ThemeType.dark,
          margins: ThemeMargins(),
          paddings: ThemePaddings(),
          borders: ThemeBorders(),
          colors: ThemeColors.dark(),
          fontSizes: ThemeFontSizes(),
          fontWeights: ThemeFontWeights(),
          fontLineHeights: ThemeFontLineHeights(),
          themeText: ThemeText(),
        );

  ThemeState.saved(
    ThemeType type,
    ThemeColors colors,
  ) : this(
          type: type,
          margins: ThemeMargins(),
          paddings: ThemePaddings(),
          borders: ThemeBorders(),
          colors: colors,
          fontSizes: ThemeFontSizes(),
          fontWeights: ThemeFontWeights(),
          fontLineHeights: ThemeFontLineHeights(),
          themeText: ThemeText(),
        );

  final ThemeType type;
  final ThemeMargins margins;
  final ThemePaddings paddings;
  final ThemeBorders borders;
  final ThemeColors colors;
  final ThemeFontSizes fontSizes;
  final ThemeFontWeights fontWeights;
  final ThemeFontLineHeights fontLineHeights;
  final ThemeText themeText;

  ThemeState copyWith({
    ThemeType? type,
    ThemeMargins? margins,
    ThemePaddings? paddings,
    ThemeBorders? borders,
    ThemeColors? colors,
    ThemeFontSizes? fontSizes,
    ThemeFontWeights? fontWeights,
    ThemeFontLineHeights? fontLineHeights,
    ThemeText? themeText,
  }) {
    return ThemeState(
      type: type ?? this.type,
      margins: margins ?? this.margins,
      paddings: paddings ?? this.paddings,
      borders: borders ?? this.borders,
      colors: colors ?? this.colors,
      fontSizes: fontSizes ?? this.fontSizes,
      fontWeights: fontWeights ?? this.fontWeights,
      fontLineHeights: fontLineHeights ?? this.fontLineHeights,
      themeText: themeText ?? this.themeText,
    );
  }
}

class ThemeStateNotifier extends StateNotifier<ThemeState> {
  ThemeStateNotifier([ThemeState? initialState]) : super(initialState ?? ThemeState.defaults());

  void initState() {
    fetchSavedTheme();
  }

  Future<void> fetchSavedTheme() async {
    final themeType = await MyAppX.prefs.retrieve(
          key: themeTypeKey,
          decoder: (themeType) => themeType.toThemeType,
        ) ??
        ThemeType.dark;

    switchTheme(themeType, showToast: false);
  }

  void switchTheme(ThemeType themeType, {bool showToast = true}) {
    MyAppX.prefs.update(
      key: themeTypeKey,
      updatedData: themeType,
      encoder: (themeType) => themeType.name,
    );
    final colors = getThemeColors(themeType);

    state = ThemeState.defaults().copyWith(
      type: themeType,
      colors: colors,
    );
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: themeType.isDark ? Brightness.dark : Brightness.light, // iOS
        statusBarIconBrightness: themeType.isDark ? Brightness.light : Brightness.dark, // Android
        systemNavigationBarIconBrightness: themeType.isDark ? Brightness.light : Brightness.dark, // Android
      ),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [SystemUiOverlay.top]);

    if (showToast) {
      MyAppX.showToast(
        message: 'Theme switched to ${themeType.label}',
      );
    }
  }

  void nextTheme() {
    final themeType = state.type;
    final nextThemeType = ThemeType.values[(themeType.index + 1) % ThemeType.values.length];

    switchTheme(nextThemeType);
  }

  ThemeColors getThemeColors(ThemeType themeType) {
    switch (themeType) {
      case ThemeType.dark:
        return ThemeColors.dark();
      case ThemeType.darkPurple:
        return ThemeColors.darkPurple();
      case ThemeType.light:
        return ThemeColors.light();
      case ThemeType.lightYellow:
        return ThemeColors.lightYellow();
      case ThemeType.darkRed:
        return ThemeColors.darkRed();
      case ThemeType.darkYellow:
        return ThemeColors.darkYellow();
      case ThemeType.darkGreen:
        return ThemeColors.darkGreen();
      case ThemeType.darkBlue:
        return ThemeColors.darkBlue();
      case ThemeType.lightRed:
        return ThemeColors.lightRed();
      case ThemeType.lightGreen:
        return ThemeColors.lightGreen();
      case ThemeType.lightTeal:
        return ThemeColors.lightTeal();
      case ThemeType.lightPurple:
        return ThemeColors.lightPurple();
      case ThemeType.olive:
        return ThemeColors.olive();
      case ThemeType.darkMaterial:
        return ThemeColors.darkMaterial();
      case ThemeType.darkAmoled:
        return ThemeColors.amoled();
      case ThemeType.redTornado:
        return ThemeColors.redTornado();
      case ThemeType.lightMaterial:
        return ThemeColors.lightMaterial();
      case ThemeType.systemTheme:
        return WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark
            ? ThemeColors.dark()
            : ThemeColors.light();
    }
  }
}
