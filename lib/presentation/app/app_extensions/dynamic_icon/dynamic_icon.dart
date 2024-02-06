// File for abstraction of all dynamic icon methods, to make them easy to use
part of '../app_extension.dart';

class DynamicIcon {
  DynamicIcon._();

  static final DynamicIcon _instance = DynamicIcon._();
  static DynamicIcon get instance => _instance;

  static String defaultIcon = 'default_icon';

  Future<void> setAlternateAppIcon(String iconName) async {
    log('[DynamicIcon.setAlternateAppIcon] $iconName');
    try {
      if (MyAppX.device.isAndroid) {
        // DO NOTHING
        // final currentIcon = await platform.invokeMethod('getCurrentIcon');
        // if (currentIcon != iconName) {
        //   await platform.invokeMethod('changeLauncherIcon', {
        //     'iconName': iconName,
        //   });
        // }
      } else if (Platform.isIOS) {
        if (await FlutterDynamicIcon.supportsAlternateIcons) {
          final currentIcon = await getCurrentAppIconName();
          if (currentIcon != iconName) {
            await FlutterDynamicIcon.setAlternateIconName(iconName);
          }
        }
      }
    } catch (e, s) {
      log('[DynamicIcon.setAlternateAppIcon] $e $s');
    }
  }

  Future<void> setDefaultIcon() async {
    log('[DynamicIcon.setDefaultIcon] $defaultIcon');
    try {
      if (Platform.isAndroid) {
        // DO NOTHING
        // await platform.invokeMethod('setDefaultIcon');
      } else if (Platform.isIOS) {
        if (await FlutterDynamicIcon.supportsAlternateIcons) {
          final currentIcon = await getCurrentAppIconName();
          if (currentIcon != defaultIcon) {
            await FlutterDynamicIcon.setAlternateIconName(defaultIcon);
          }
        }
      }
    } catch (e, s) {
      log('[DynamicIcon.setDefaultIcon] $e $s');
    }
  }

  Future<String> getCurrentAppIconName() async {
    log('[DynamicIcon.getCurrentAppIconName]');
    var currentIcon = defaultIcon;
    try {
      if (await FlutterDynamicIcon.supportsAlternateIcons) {
        currentIcon = await FlutterDynamicIcon.getAlternateIconName() ?? defaultIcon;
      }
    } catch (e, s) {
      log('[DynamicIcon.setAlternateAppIcon] $e $s');
    }
    return currentIcon;
  }
}
