// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'intrinsic_router.dart';

abstract class _$IntrinsicRouter extends RootStackRouter {
  // ignore: unused_element
  _$IntrinsicRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BlankRoute.name: (routeData) {
      final args = routeData.argsAs<BlankRouteArgs>(orElse: () => const BlankRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BlankView(
          key: args.key,
          onInit: args.onInit,
        ),
      );
    },
    CardPhotoRoute.name: (routeData) {
      final args = routeData.argsAs<CardPhotoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CardPhotoView(
          key: args.key,
          onInit: args.onInit,
          card: args.card,
        ),
      );
    },
    CardsListBottomSheetRoute.name: (routeData) {
      final args = routeData.argsAs<CardsListBottomSheetRouteArgs>(orElse: () => const CardsListBottomSheetRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CardsListBottomSheet(
          key: args.key,
          initialSelectedCard: args.initialSelectedCard,
        ),
      );
    },
    GameRoute.name: (routeData) {
      final args = routeData.argsAs<GameRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GameView(
          key: args.key,
          userSelectedCards: args.userSelectedCards,
          numberOfPlayers: args.numberOfPlayers,
          numberOfHouseCards: args.numberOfHouseCards,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    SelectCardsBottomSheetRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SelectCardsBottomSheet(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
  };
}

/// generated route for
/// [BlankView]
class BlankRoute extends PageRouteInfo<BlankRouteArgs> {
  BlankRoute({
    Key? key,
    Future<dynamic> Function()? onInit,
    List<PageRouteInfo>? children,
  }) : super(
          BlankRoute.name,
          args: BlankRouteArgs(
            key: key,
            onInit: onInit,
          ),
          initialChildren: children,
        );

  static const String name = 'BlankRoute';

  static const PageInfo<BlankRouteArgs> page = PageInfo<BlankRouteArgs>(name);
}

class BlankRouteArgs {
  const BlankRouteArgs({
    this.key,
    this.onInit,
  });

  final Key? key;

  final Future<dynamic> Function()? onInit;

  @override
  String toString() {
    return 'BlankRouteArgs{key: $key, onInit: $onInit}';
  }
}

/// generated route for
/// [CardPhotoView]
class CardPhotoRoute extends PageRouteInfo<CardPhotoRouteArgs> {
  CardPhotoRoute({
    Key? key,
    Future<dynamic> Function()? onInit,
    required String card,
    List<PageRouteInfo>? children,
  }) : super(
          CardPhotoRoute.name,
          args: CardPhotoRouteArgs(
            key: key,
            onInit: onInit,
            card: card,
          ),
          initialChildren: children,
        );

  static const String name = 'CardPhotoRoute';

  static const PageInfo<CardPhotoRouteArgs> page = PageInfo<CardPhotoRouteArgs>(name);
}

class CardPhotoRouteArgs {
  const CardPhotoRouteArgs({
    this.key,
    this.onInit,
    required this.card,
  });

  final Key? key;

  final Future<dynamic> Function()? onInit;

  final String card;

  @override
  String toString() {
    return 'CardPhotoRouteArgs{key: $key, onInit: $onInit, card: $card}';
  }
}

/// generated route for
/// [CardsListBottomSheet]
class CardsListBottomSheetRoute extends PageRouteInfo<CardsListBottomSheetRouteArgs> {
  CardsListBottomSheetRoute({
    Key? key,
    String? initialSelectedCard,
    List<PageRouteInfo>? children,
  }) : super(
          CardsListBottomSheetRoute.name,
          args: CardsListBottomSheetRouteArgs(
            key: key,
            initialSelectedCard: initialSelectedCard,
          ),
          initialChildren: children,
        );

  static const String name = 'CardsListBottomSheetRoute';

  static const PageInfo<CardsListBottomSheetRouteArgs> page = PageInfo<CardsListBottomSheetRouteArgs>(name);
}

class CardsListBottomSheetRouteArgs {
  const CardsListBottomSheetRouteArgs({
    this.key,
    this.initialSelectedCard,
  });

  final Key? key;

  final String? initialSelectedCard;

  @override
  String toString() {
    return 'CardsListBottomSheetRouteArgs{key: $key, initialSelectedCard: $initialSelectedCard}';
  }
}

/// generated route for
/// [GameView]
class GameRoute extends PageRouteInfo<GameRouteArgs> {
  GameRoute({
    Key? key,
    required List<String> userSelectedCards,
    required double numberOfPlayers,
    required double numberOfHouseCards,
    List<PageRouteInfo>? children,
  }) : super(
          GameRoute.name,
          args: GameRouteArgs(
            key: key,
            userSelectedCards: userSelectedCards,
            numberOfPlayers: numberOfPlayers,
            numberOfHouseCards: numberOfHouseCards,
          ),
          initialChildren: children,
        );

  static const String name = 'GameRoute';

  static const PageInfo<GameRouteArgs> page = PageInfo<GameRouteArgs>(name);
}

class GameRouteArgs {
  const GameRouteArgs({
    this.key,
    required this.userSelectedCards,
    required this.numberOfPlayers,
    required this.numberOfHouseCards,
  });

  final Key? key;

  final List<String> userSelectedCards;

  final double numberOfPlayers;

  final double numberOfHouseCards;

  @override
  String toString() {
    return 'GameRouteArgs{key: $key, userSelectedCards: $userSelectedCards, numberOfPlayers: $numberOfPlayers, numberOfHouseCards: $numberOfHouseCards}';
  }
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SelectCardsBottomSheet]
class SelectCardsBottomSheetRoute extends PageRouteInfo<void> {
  const SelectCardsBottomSheetRoute({List<PageRouteInfo>? children})
      : super(
          SelectCardsBottomSheetRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectCardsBottomSheetRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
