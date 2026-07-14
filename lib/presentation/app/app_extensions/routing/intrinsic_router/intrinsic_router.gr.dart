// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'intrinsic_router.dart';

/// generated route for
/// [BlankView]
class BlankRoute extends PageRouteInfo<BlankRouteArgs> {
  BlankRoute({
    Key? key,
    Future<dynamic> Function()? onInit,
    List<PageRouteInfo>? children,
  }) : super(
         BlankRoute.name,
         args: BlankRouteArgs(key: key, onInit: onInit),
         initialChildren: children,
       );

  static const String name = 'BlankRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BlankRouteArgs>(
        orElse: () => const BlankRouteArgs(),
      );
      return BlankView(key: args.key, onInit: args.onInit);
    },
  );
}

class BlankRouteArgs {
  const BlankRouteArgs({this.key, this.onInit});

  final Key? key;

  final Future<dynamic> Function()? onInit;

  @override
  String toString() {
    return 'BlankRouteArgs{key: $key, onInit: $onInit}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BlankRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [CardPhotoView]
class CardPhotoRoute extends PageRouteInfo<CardPhotoRouteArgs> {
  CardPhotoRoute({
    Key? key,
    Future<dynamic> Function()? onInit,
    required Card card,
    required bool isSelected,
    List<PageRouteInfo>? children,
  }) : super(
         CardPhotoRoute.name,
         args: CardPhotoRouteArgs(
           key: key,
           onInit: onInit,
           card: card,
           isSelected: isSelected,
         ),
         initialChildren: children,
       );

  static const String name = 'CardPhotoRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CardPhotoRouteArgs>();
      return CardPhotoView(
        key: args.key,
        onInit: args.onInit,
        card: args.card,
        isSelected: args.isSelected,
      );
    },
  );
}

class CardPhotoRouteArgs {
  const CardPhotoRouteArgs({
    this.key,
    this.onInit,
    required this.card,
    required this.isSelected,
  });

  final Key? key;

  final Future<dynamic> Function()? onInit;

  final Card card;

  final bool isSelected;

  @override
  String toString() {
    return 'CardPhotoRouteArgs{key: $key, onInit: $onInit, card: $card, isSelected: $isSelected}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CardPhotoRouteArgs) return false;
    return key == other.key &&
        card == other.card &&
        isSelected == other.isSelected;
  }

  @override
  int get hashCode => key.hashCode ^ card.hashCode ^ isSelected.hashCode;
}

/// generated route for
/// [GameView]
class GameRoute extends PageRouteInfo<GameRouteArgs> {
  GameRoute({
    Key? key,
    required List<Card> userSelectedCards,
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GameRouteArgs>();
      return GameView(
        key: args.key,
        userSelectedCards: args.userSelectedCards,
        numberOfPlayers: args.numberOfPlayers,
        numberOfHouseCards: args.numberOfHouseCards,
      );
    },
  );
}

class GameRouteArgs {
  const GameRouteArgs({
    this.key,
    required this.userSelectedCards,
    required this.numberOfPlayers,
    required this.numberOfHouseCards,
  });

  final Key? key;

  final List<Card> userSelectedCards;

  final double numberOfPlayers;

  final double numberOfHouseCards;

  @override
  String toString() {
    return 'GameRouteArgs{key: $key, userSelectedCards: $userSelectedCards, numberOfPlayers: $numberOfPlayers, numberOfHouseCards: $numberOfHouseCards}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GameRouteArgs) return false;
    return key == other.key &&
        const ListEquality<Card>().equals(
          userSelectedCards,
          other.userSelectedCards,
        ) &&
        numberOfPlayers == other.numberOfPlayers &&
        numberOfHouseCards == other.numberOfHouseCards;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const ListEquality<Card>().hash(userSelectedCards) ^
      numberOfPlayers.hashCode ^
      numberOfHouseCards.hashCode;
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeView();
    },
  );
}

/// generated route for
/// [SelectCardsBottomSheet]
class SelectCardsBottomSheetRoute
    extends PageRouteInfo<SelectCardsBottomSheetRouteArgs> {
  SelectCardsBottomSheetRoute({
    Key? key,
    List<Card> initialSelectedCards = const [],
    required int maxCards,
    List<Card> disabledCards = const [],
    List<PageRouteInfo>? children,
  }) : super(
         SelectCardsBottomSheetRoute.name,
         args: SelectCardsBottomSheetRouteArgs(
           key: key,
           initialSelectedCards: initialSelectedCards,
           maxCards: maxCards,
           disabledCards: disabledCards,
         ),
         initialChildren: children,
       );

  static const String name = 'SelectCardsBottomSheetRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SelectCardsBottomSheetRouteArgs>();
      return SelectCardsBottomSheet(
        key: args.key,
        initialSelectedCards: args.initialSelectedCards,
        maxCards: args.maxCards,
        disabledCards: args.disabledCards,
      );
    },
  );
}

class SelectCardsBottomSheetRouteArgs {
  const SelectCardsBottomSheetRouteArgs({
    this.key,
    this.initialSelectedCards = const [],
    required this.maxCards,
    this.disabledCards = const [],
  });

  final Key? key;

  final List<Card> initialSelectedCards;

  final int maxCards;

  final List<Card> disabledCards;

  @override
  String toString() {
    return 'SelectCardsBottomSheetRouteArgs{key: $key, initialSelectedCards: $initialSelectedCards, maxCards: $maxCards, disabledCards: $disabledCards}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SelectCardsBottomSheetRouteArgs) return false;
    return key == other.key &&
        const ListEquality<Card>().equals(
          initialSelectedCards,
          other.initialSelectedCards,
        ) &&
        maxCards == other.maxCards &&
        const ListEquality<Card>().equals(disabledCards, other.disabledCards);
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const ListEquality<Card>().hash(initialSelectedCards) ^
      maxCards.hashCode ^
      const ListEquality<Card>().hash(disabledCards);
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashView();
    },
  );
}

/// generated route for
/// [StartGameBottomSheet]
class StartGameBottomSheetRoute extends PageRouteInfo<void> {
  const StartGameBottomSheetRoute({List<PageRouteInfo>? children})
    : super(StartGameBottomSheetRoute.name, initialChildren: children);

  static const String name = 'StartGameBottomSheetRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StartGameBottomSheet();
    },
  );
}
