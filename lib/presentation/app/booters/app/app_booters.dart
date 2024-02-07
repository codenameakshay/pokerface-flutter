part of '../../app.dart';

final _appBooterProvider = StateNotifierProvider<AppBooter, AppBootStatus>(
  (ref) {
    final appBooter = AppBooter().._bootUp();

    final removeListener = appBooter.addListener((state) {
      log('⚠️AppBooter: ${state.name}');
    });

    ref.onDispose(() {
      appBooter._bootDown();
      removeListener();
    });

    return appBooter;
  },
);

enum AppBootStatus {
  booting,
  booted,
}

class AppBooter extends StateNotifier<AppBootStatus> {
  AppBooter() : super(AppBootStatus.booting);
  static StateNotifierProvider<AppBooter, AppBootStatus> get provider => _appBooterProvider;

  Future<void> _bootUp() async {
    final bootUpProcesses = [
      PrefsBooter.instance.bootUp(),
      ThemeBooter.instance.bootUp(),
      MyAppX.soundPlayer.initClickSoundEffect(),
      // PurchaseBooter.instance.bootUp(),
      // FlutterDownloader.initialize(),
      // WallpaperBooter.instance.bootUp(),
      // OneSignalBooter.instance.bootUp(),
      if (MyAppX.device.isAndroid) MyAppX.device.getAndroidDeviceInfo(),
      if (MyAppX.device.isIOS) MyAppX.device.getIOSDeviceInfo(),
      MyAppX.review.clearInAppReviewShown(),
      // IncomingShareIntentBooter.instance.bootUp(),
    ];

    await Future.wait(bootUpProcesses);

    state = AppBootStatus.booted;

    await _onBootedUp();
  }

  void _bootDown() {
    // Do something on boot down
  }

  Future<void> _onBootedUp() async {
    const isFirstTimeKey = 'isFirstTimeUser#2.0.0+42';
    try {
      if (await MyAppX.prefs.exists(key: isFirstTimeKey)) {
        final isFirstTimeUser = await MyAppX.prefs.retrieve(
              key: isFirstTimeKey,
              decoder: (p0) => p0 == 'true',
            ) ??
            false;
        if (isFirstTimeUser) {
          await MyAppX.router.replace(
            const HomeRoute(),
          );
        } else {
          await MyAppX.prefs.store(
            key: isFirstTimeKey,
            data: true,
            encoder: (p0) => p0.toString(),
            overwrite: true,
          );
          await MyAppX.router.replace(
            // const OnboardingRoute(),
            const HomeRoute(),
          );
        }
      } else {
        await MyAppX.prefs.store(
          key: isFirstTimeKey,
          data: true,
          encoder: (p0) => p0.toString(),
          overwrite: true,
        );
        await MyAppX.router.replace(
          // const OnboardingRoute(),
          const HomeRoute(),
        );
      }
    } catch (e, s) {
      log('⚠️AppBooter: $e $s');
    }
    log('pushed');
  }
}
