part of '../../app_extension.dart';

class MyAppRoutesRegistry {
  MyAppRoutesRegistry._();

  static List<AutoRoute> routes = <AutoRoute>[
    AdaptiveRoute(
      path: MyAppPathsRegistry.splash,
      page: SplashRoute.page,
    ),
    AdaptiveRoute(
      path: MyAppPathsRegistry.home,
      page: HomeRoute.page,
    ),
    // CustomRoute(
    //   path: MyAppPathsRegistry.appVersion,
    //   page: AppVersionRoute.page,
    //   transitionsBuilder: MyAppTransitionBuilders.slideBottom,
    // ),
  ];
}
