part of '../app_extension.dart';

const String animationTypeKey = 'animation_type_0';

class VisualAppSettings
    implements AppSettings<AutoDisposeStateNotifierProvider<SettingsStateNotifier, SettingsState>, bool> {
  VisualAppSettings._();

  @override
  AutoDisposeStateNotifierProvider<SettingsStateNotifier, SettingsState> get current => _settingsProvider;

  @override
  void switchTo(bool type) {
    MyAppX.currentRef?.read(_settingsProvider.notifier).switchAnimationSetting(animationType: type);
  }

  @override
  void nextTo() {
    MyAppX.currentRef?.read(_settingsProvider.notifier).nextAnimation();
  }
}
