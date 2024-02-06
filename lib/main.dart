import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokerface/presentation/app/app.dart';

Future<void> initializeApp() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await Firebase.initializeApp(
  //   name: 'one4wall-prod',
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // await FirebaseAppCheck.instance.activate(
  //   webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  //   androidProvider: AndroidProvider.debug,
  // );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

void main() async {
  await initializeApp();
  // running the app
  // await SentryFlutter.init(
  //   (options) {
  //     options
  //       ..dsn = 'https://a41021cc49684fc5b581608233682658@o4504781699350528.ingest.sentry.io/4504781700923392'
  //       // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
  //       // We recommend adjusting this value in production.
  //       ..tracesSampleRate = 0.05
  //       ..sampleRate = 0.05;
  //   },
  //   appRunner: () => runApp(
  //     const ProviderScope(
  //       child: MyApp(
  //         key: Key('MyApp'),
  //       ),
  //     ),
  //   ),
  // );
  runApp(
    const ProviderScope(
      child: MyApp(
        key: Key('MyApp'),
      ),
    ),
  );
}
