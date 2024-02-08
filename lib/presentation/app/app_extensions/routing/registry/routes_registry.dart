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
    AdaptiveRoute(
      path: MyAppPathsRegistry.game,
      page: GameRoute.page,
    ),
    CustomRoute(
      path: MyAppPathsRegistry.selectCardsBottomSheet,
      page: SelectCardsBottomSheetRoute.page,
      transitionsBuilder: MyAppTransitionBuilders.iOSDialog,
    ),
  ];
}
