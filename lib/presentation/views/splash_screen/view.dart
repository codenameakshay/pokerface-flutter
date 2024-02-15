import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokerface/gen/assets.gen.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';

@RoutePage(name: 'SplashRoute')
class SplashView extends ConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);
    FlutterNativeSplash.remove();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: theme.type.isDark ? Brightness.dark : Brightness.light, // iOS
        statusBarIconBrightness: theme.type.isDark ? Brightness.light : Brightness.dark, // Android
        systemNavigationBarIconBrightness: theme.type.isDark ? Brightness.light : Brightness.dark, // Android
      ),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [SystemUiOverlay.top]);
    return ColoredBox(
      color: theme.colors.background,
      child: Center(
        child: Image.asset(
          Assets.images.appIconIos.path,
          width: 255,
          fit: BoxFit.cover,
        )
            .animate()
            .animate(
              onPlay: (controller) => controller.repeat(),
            )
            .then(
              delay: const Duration(
                milliseconds: 200,
              ),
            )
            .shimmer(
              duration: const Duration(seconds: 1),
              color: Colors.white30,
            ),
      ),
    );
  }
}
