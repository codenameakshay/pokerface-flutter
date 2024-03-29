import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:isolate';

import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/data/models/poker_hand.dart';
import 'package:pokerface/gen/assets.gen.dart';
import 'package:pokerface/presentation/app/app_extensions/routing/intrinsic_router/intrinsic_router.dart';
import 'package:pokerface/presentation/app/app_extensions/theme/policies/text_theme.dart';
import 'package:pokerface/presentation/app/core_widgets/confetti/confetti.dart';
import 'package:pokerface/presentation/app/core_widgets/in_app_notification/in_app_notification.dart';
import 'package:pokerface/presentation/utils/hands/testing.dart';
import 'package:pokerface/presentation/utils/string/string.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

part 'audio_player/audio_player.dart';
part 'app_review/app_review.dart';
part 'device_info/device_info.dart';
part 'dynamic_icon/dynamic_icon.dart';
part 'environment/environment.dart';
part 'generative_ai/generative_ai.dart';
part 'haptics/haptics.dart';
part 'routing/observers/route_observer.dart';
part 'routing/observers/page_route_observer.dart';
part 'routing/registry/path_registry.dart';
part 'routing/registry/routes_registry.dart';
part 'routing/router.dart';
part 'routing/transitions/transitions.dart';
part 'settings/app_settings.dart';
part 'shared_prefs/shared_prefs.dart';
part 'shared_prefs/shared_prefs_impl.dart';
part 'theme/policies/borders.dart';
part 'theme/policies/colors.dart';
part 'theme/policies/dark/black.dart';
part 'theme/policies/dark/blue.dart';
part 'theme/policies/dark/green.dart';
part 'theme/policies/dark/purple.dart';
part 'theme/policies/dark/red.dart';
part 'theme/policies/dark/special/amoled.dart';
part 'theme/policies/dark/special/material_default.dart';
part 'theme/policies/dark/special/olive.dart';
part 'theme/policies/dark/yellow.dart';
part 'theme/policies/fonts.dart';
part 'theme/policies/light/green.dart';
part 'theme/policies/light/purple.dart';
part 'theme/policies/light/red.dart';
part 'theme/policies/light/special/material_default.dart';
part 'theme/policies/light/special/tornado.dart';
part 'theme/policies/light/teal.dart';
part 'theme/policies/light/white.dart';
part 'theme/policies/light/yellow.dart';
part 'theme/policies/margins.dart';
part 'theme/policies/paddings.dart';
part 'theme/theme_extensions.dart';
part 'theme/theme_provider.dart';
part 'theme/theme_settings.dart';
part 'app_settings/settings.dart';
part 'app_settings/settings_provider.dart';
part 'url_launcher/url_launcher.dart';
part 'uuid/uuid.dart';
part 'json_local_file/json_local_file.dart';
part 'isolate/isolate.dart';

class MyAppX {
  MyAppX._();

  static WidgetRef? currentRef;

  static BuildContext? get currentContext => router.navigatorKey.currentContext;

  static MyAppRouter router = MyAppRouter._();

  static ThemeSettings theme = ThemeSettings._();

  // static Networking network = Networking._();

  static void showConfetti() => ConfettiController.shared.showConfettiView();

  static void showSnow() => ConfettiController.shared.showSnowView();

  /// Pass in a [router] when within a nested route. This will aid in rendering the toast with right context.
  ///
  /// An actionable toast (one with [trailingAction] or [leadingAction] present is always persistent.
  /// A non-actionable toast is persistent if [persistent] is true.
  static void showToast<T>({
    String? title,
    required String message,
    bool persistent = false,
    ToastType type = ToastType.success,
    ToastAction? leadingAction,
    ToastAction? trailingAction,
    double? spacingBetweenActions,
    Duration? duration,
    ToastDismissCallback? onDismissed,
    StackRouter? router,

    ///If you want to auto dismiss the notification even if it has action buttons. By default if it has action buttons it does not auto dismiss.
    bool overrideDismiss = false,
  }) {
    ToastController.shared.showToast(
      message: message,
      type: type,
      leadingAction: leadingAction,
      trailingAction: trailingAction,
      spacingBetweenActions: spacingBetweenActions,
      duration: duration,
      persistent: persistent,
      onDismissed: onDismissed,
      overrideDismiss: overrideDismiss,
    );
  }

  static void dismissToast({StackRouter? router}) {
    ToastController.shared.hideToast();
  }

  /// Pass in a [router] when within a nested route. This will aid in rendering the toast with right context.
  ///
  /// An actionable toast (one with [trailingAction] or [leadingAction] present is always persistent.
  /// A non-actionable toast is persistent if [persistent] is true.
  static void showBottomToast<T>({
    String? title,
    required String message,
    bool persistent = false,
    ToastType type = ToastType.success,
    ToastAction? leadingAction,
    ToastAction? trailingAction,
    double? spacingBetweenActions,
    Duration? duration,
    ToastDismissCallback? onDismissed,
    StackRouter? router,

    ///If you want to auto dismiss the notification even if it has action buttons. By default if it has action buttons it does not auto dismiss.
    bool overrideDismiss = false,
  }) {
    ToastController.shared.showBottomToast(
      message: message,
      type: type,
      leadingAction: leadingAction,
      trailingAction: trailingAction,
      spacingBetweenActions: spacingBetweenActions,
      duration: duration,
      persistent: persistent,
      onDismissed: onDismissed,
      overrideDismiss: overrideDismiss,
    );
  }

  static void dismissBottomToast({StackRouter? router}) {
    ToastController.shared.hideBottomToast();
  }

  static UniqueId uniqueId = UniqueId.instance;

  static Haptics haptics = Haptics._();

  static ThemeState? currentTheme = MyAppX.currentRef?.read(MyAppX.theme.current);

  static URLLauncher url = URLLauncher.instance;

  static SimpleStorage prefs = SimpleStorage();

  static DeviceDetails device = DeviceDetails.instance;

  static AppReview review = AppReview.instance;

  static DynamicIcon dynamicIcon = DynamicIcon.instance;

  static VisualAppSettings settings = VisualAppSettings._();

  static SoundPlayer soundPlayer = SoundPlayer.instance;

  static MyAppRouterObserver routeObserver = MyAppRouterObserver();

  static RouteObserver<PageRoute> pageRouteObserver = pagerouteObserver;

  static JSONLocalFile jsonLocalFile = JSONLocalFile.instance;

  static IsolateManager isolateManager = IsolateManager.instance;

  static GenerativeAI generativeAI = GenerativeAI.instance;

  static Environment environment = Environment.instance;
}
