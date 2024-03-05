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
    AdaptiveRoute(
      path: MyAppPathsRegistry.previousGames,
      page: PreviousGamesRoute.page,
    ),
    // CustomRoute(
    //   path: MyAppPathsRegistry.startGameBottomSheet,
    //   page: StartGameBottomSheetRoute.page,
    //   transitionsBuilder: MyAppTransitionBuilders.iOSDialog,
    // ),
    CustomRoute(
      path: MyAppPathsRegistry.cardPhoto,
      page: CardPhotoRoute.page,
      transitionsBuilder: MyAppTransitionBuilders.fadeIn,
      barrierColor: Colors.black38,
      barrierDismissible: true,
      fullscreenDialog: true,
      maintainState: false,
      opaque: false,
    ),
    // add a blank route
    CustomRoute(
      path: MyAppPathsRegistry.blank,
      page: BlankRoute.page,
      transitionsBuilder: MyAppTransitionBuilders.none,
      barrierColor: Colors.white,
      barrierDismissible: true,
      fullscreenDialog: true,
      maintainState: false,
      opaque: false,
    ),
  ];
}
