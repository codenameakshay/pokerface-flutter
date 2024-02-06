part of '../app_extension.dart';

class AppReview {
  AppReview._();

  static final AppReview _instance = AppReview._();
  static AppReview get instance => _instance;

  static const inAppReviewKey = 'InAppReviewShownKey';

  static final rateMyApp = RateMyApp(
    minDays: 2,
    minLaunches: 3,
    remindDays: 7,
    remindLaunches: 3,
    googlePlayIdentifier: 'one4studio.wallpaper.one4wall',
    appStoreIdentifier: '6446678464',
  );

  static final InAppReview inAppReview = InAppReview.instance;

  Future<void> clearInAppReviewShown() async {
    await MyAppX.prefs.update(
      key: inAppReviewKey,
      updatedData: 'false',
      encoder: (p0) => p0,
      createIfNotExisting: true,
    );
  }

  Future<void> showRatingPopUp() async {
    await rateMyApp.init();
    final inAppReviewShownAlready =
        await MyAppX.prefs.retrieve(key: inAppReviewKey, decoder: (p0) => p0 == 'true') ?? false;
    if (rateMyApp.shouldOpenDialog && !inAppReviewShownAlready) {
      final isAvailable = await inAppReview.isAvailable();
      final isNativeReviewSupported = await rateMyApp.isNativeReviewDialogSupported ?? false;
      if (isAvailable) {
        await MyAppX.prefs.update(
          key: inAppReviewKey,
          updatedData: 'true',
          encoder: (p0) => p0,
          createIfNotExisting: true,
        );
        await inAppReview.requestReview();
      } else if (MyAppX.device.isIOS && isNativeReviewSupported) {
        await MyAppX.prefs.update(
          key: inAppReviewKey,
          updatedData: 'true',
          encoder: (p0) => p0,
          createIfNotExisting: true,
        );
        await rateMyApp.launchNativeReviewDialog();
      }
      await rateMyApp.save();
    }
  }
}
