part of '../app_extension.dart';

class Haptics {
  Haptics._();

  void hapticLight(BuildContext context) {
    if (MyAppX.device.isAndroid) {
      Feedback.forTap(context);
    } else if (MyAppX.device.isIOS) {
      HapticFeedback.lightImpact();
    }
  }

  void hapticMedium(BuildContext context) {
    if (MyAppX.device.isAndroid) {
      Feedback.forTap(context);
    } else if (MyAppX.device.isIOS) {
      HapticFeedback.mediumImpact();
    }
  }

  void hapticHeavy(BuildContext context) {
    if (MyAppX.device.isAndroid) {
      Feedback.forLongPress(context);
    } else if (MyAppX.device.isIOS) {
      HapticFeedback.heavyImpact();
    }
  }

  void hapticVibrate() {
    HapticFeedback.vibrate();
  }

  void selectionClick() {
    HapticFeedback.selectionClick();
  }

  void smallButtonHaptic(BuildContext context) {
    hapticLight(context);
  }

  void buttonHaptic(BuildContext context) {
    hapticMedium(context);
  }

  void longPressHaptic() {
    hapticVibrate();
  }

  void selectItemHaptic() {
    selectionClick();
  }
}
