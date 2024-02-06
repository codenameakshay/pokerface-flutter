part of '../app_extension.dart';

final _settingsProvider = StateNotifierProvider.autoDispose<SettingsStateNotifier, SettingsState>(
  (ref) {
    final notifier = SettingsStateNotifier(
      SettingsState.defaults(),
    )..initState();

    return notifier;
  },
);

class SettingsState {
  SettingsState({
    required this.isHighEndAnimation,
  });

  SettingsState.defaults()
      : this(
          isHighEndAnimation: MyAppX.device.isIOS,
        );

  final bool isHighEndAnimation;

  SettingsState copyWith({
    bool? isHighEndAnimation,
  }) {
    return SettingsState(
      isHighEndAnimation: isHighEndAnimation ?? this.isHighEndAnimation,
    );
  }
}

class SettingsStateNotifier extends StateNotifier<SettingsState> {
  SettingsStateNotifier([SettingsState? initialState]) : super(initialState ?? SettingsState.defaults());

  void initState() {
    fetchSavedSettings();
  }

  Future<void> fetchSavedSettings() async {
    final animationType = await MyAppX.prefs.retrieve(
          key: animationTypeKey,
          decoder: (animationType) => animationType == 'true',
        ) ??
        true;

    switchAnimationSetting(animationType: animationType);
  }

  void switchAnimationSetting({required bool animationType}) {
    MyAppX.prefs.update(
      key: animationTypeKey,
      updatedData: animationType,
      encoder: (animationType) => animationType.toString(),
    );

    state = SettingsState.defaults().copyWith(
      isHighEndAnimation: animationType,
    );
  }

  void nextAnimation() {
    final animationType = state.isHighEndAnimation;
    final nextAnimationType = !animationType;

    switchAnimationSetting(animationType: nextAnimationType);
  }
}
