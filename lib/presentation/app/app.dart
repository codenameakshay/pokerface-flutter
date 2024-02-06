import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokerface/gen/assets.gen.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/app/app_extensions/routing/intrinsic_router/intrinsic_router.dart';
import 'package:pokerface/presentation/app/booters/shared_prefs/prefs_booter.dart';
import 'package:pokerface/presentation/app/booters/theme/theme_booter.dart';
import 'package:pokerface/presentation/app/core_widgets/confetti/confetti.dart';
import 'package:pokerface/presentation/app/core_widgets/in_app_notification/in_app_notification.dart';
import 'package:pokerface/presentation/app/core_widgets/url_builder.dart';

part 'booters/app/app_booters.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  // StreamSubscription<User?>? _authSubscription;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // _authSubscription = MyAppX.authentication.authStateChanges().listen(_authListener);
    MyAppX.currentRef = ref;
  }

  void _authListener(event) {
    log('⚠️AuthState: $event');
  }

  @override
  void dispose() {
    // _authSubscription?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    MyAppX.currentRef = null;
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    log('⚠️AppLifecycleState: ${state.name}');

    switch (state) {
      case AppLifecycleState.resumed:
        // MyAppX.authentication.changeOnlineStatus(true);
        break;
      case AppLifecycleState.inactive:
        // MyAppX.authentication.changeOnlineStatus(false);
        break;
      case AppLifecycleState.paused:
        // MyAppX.authentication.changeOnlineStatus(false);
        break;
      case AppLifecycleState.detached:
        // MyAppX.authentication.changeOnlineStatus(false);
        break;
      case AppLifecycleState.hidden:
        // MyAppX.authentication.changeOnlineStatus(false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    MyAppX.currentRef = ref;

    // booting the booters
    final _ = ref.watch(_appBooterProvider);
    final currentTheme = ref.watch(MyAppX.theme.current);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      color: currentTheme.colors.primary,
      routerDelegate: AutoRouterDelegate(
        MyAppX.router,
        navigatorObservers: () => [
          MyAppRouterObserver(),
        ],
      ),
      theme: ThemeData.from(
        colorScheme: currentTheme.colors.colorScheme,
        textTheme: currentTheme.themeText.textTheme,
        useMaterial3: true,
      ),
      themeMode: currentTheme.type.mode,
      routeInformationParser: MyAppX.router.defaultRouteParser(),
      builder: (context, child) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return CustomError(errorDetails: errorDetails);
        };
        return ConfettiProvider(
          // adding toast provider here, so that it is visible on the top
          child: ToastProvider(
            child: child ?? Container(),
          ),
        );
      },
    );
  }
}

class CustomError extends ConsumerWidget {
  final FlutterErrorDetails errorDetails;

  const CustomError({
    Key? key,
    required this.errorDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.appIcon.image(
              width: 100,
              height: 100,
            ),
            16.toAutoScaledHeight.toVerticalSizedBox,
            Text(
              'Oops! Something went wrong!',
              textAlign: TextAlign.center,
              style: theme.themeText.headline6,
            ),
            8.toAutoScaledHeight.toVerticalSizedBox,
            Text(
              'Screenshot this page, and send it to the developer at',
              textAlign: TextAlign.center,
              style: theme.themeText.bodyText1,
            ),
            8.toAutoScaledHeight.toVerticalSizedBox,
            const UrlBuilder('info@one4studio.com', url: 'mailto:info@one4studio.com'),
            16.toAutoScaledHeight.toVerticalSizedBox,
            Container(
              decoration: BoxDecoration(
                color: theme.colors.errorContainer.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: theme.colors.errorContainer,
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    errorDetails.summary.toString(),
                    textAlign: TextAlign.center,
                    style: theme.themeText.bodyText1?.copyWith(
                      fontFamily: GoogleFonts.sourceCodePro().fontFamily,
                      color: theme.colors.onErrorContainer,
                    ),
                  ),
                  Text(
                    errorDetails.stack.toString(),
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    style: theme.themeText.caption?.copyWith(
                      fontFamily: GoogleFonts.sourceCodePro().fontFamily,
                      color: theme.colors.onErrorContainer,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            16.toAutoScaledHeight.toVerticalSizedBox,
            Text(
              'Note: Please be assured, we are already working on it!',
              textAlign: TextAlign.center,
              style: theme.themeText.caption,
            )
          ],
        ),
      ),
    );
  }
}
