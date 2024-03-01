part of 'view.dart';

class _VSControllerParams extends Equatable {
  const _VSControllerParams();

  @override
  List<Object> get props => [];
}

final _paramsProvider = Provider<_VSControllerParams>((ref) {
  // Throwing an error, as params are not yet instantiated. Overriding this in the view.
  throw UnimplementedError();
});

final _vsProvider =
    StateNotifierProvider.autoDispose.family<_VSController, _ViewState, _VSControllerParams>((ref, params) {
  final stateController = _VSController(
    params: params,
  )..initState();

  return stateController;
});

class _ViewState {
  _ViewState();

  _ViewState.initial() : this();

  _ViewState copyWith() {
    return _ViewState();
  }
}

class _VSController extends StateNotifier<_ViewState> {
  _VSController({
    required this.params,
  }) : super(_ViewState.initial());
  _VSControllerParams params;

  void initState() {}

  void navigateToNewGame({
    required List<Card> userSelectedCards,
    required double numberOfPlayers,
    required double numberOfHouseCards,
  }) {
    MyAppX.router.navigate(
      GameRoute(
        userSelectedCards: userSelectedCards,
        numberOfPlayers: numberOfPlayers,
        numberOfHouseCards: numberOfHouseCards,
      ),
    );
  }

  void navigateToAIScreen() {
    MyAppX.router.pushNativeRoute(
      MaterialWithModalsPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => ChatScreen(
          title: 'Pokerface',
          onClose: MyAppX.router.pop,
          initialHistory: [],
          inputPrompt:
              """You are a Texas Hold'em Poker expert. You will be given a query by the user, and your task is to resolve it in the best possible way. The current hand of the user is 2H and AD. Currently open house cards are 4S, 5H and 9C.

-------------------

""",
        ),
      ),
    );
  }

  Future<void> showStartGameBottomSheet(BuildContext context) async {
    // MyAppX.router.pushNativeRoute(
    //   MaterialWithModalsPageRoute(
    //     fullscreenDialog: true,
    //     builder: (BuildContext context) => BlankView(
    //       onInit: () => showCupertinoModalBottomSheet(
    //         context: context,
    //         builder: (context) => const StartGameBottomSheet(),
    //       ),
    //     ),
    //   ),
    // );
    // MyAppX.router.navigate(
    //   BlankRoute(
    //     onInit: () => showCupertinoModalBottomSheet(
    //       context: context,
    //       builder: (context) => const StartGameBottomSheet(),
    //     ),
    //   ),
    // );
    final data = await showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => const StartGameBottomSheet(),
    );

    if (data != null) {
      navigateToNewGame(
        userSelectedCards: data['userSelectedCards'] as List<Card>,
        numberOfPlayers: data['numberOfPlayers'],
        numberOfHouseCards: data['numberOfHouseCards'],
      );
    }
  }

  Future<void> showChangeThemeBottomSheet(BuildContext context) async {
    final data = await showCupertinoModalBottomSheet<ThemeType>(
      context: context,
      builder: (context) => const ChangeAppThemeSheet(),
    );

    if (data != null) {
      MyAppX.theme.switchTo(data);
    }
  }

  void showAboutSheet(BuildContext context) {
    showCupertinoModalBottomSheet<ThemeType>(
      context: context,
      builder: (context) => const AboutSheet(),
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
