part of 'view.dart';

class _VSControllerParams extends Equatable {
  const _VSControllerParams({
    required this.context,
    required this.userSelectedCards,
    required this.numberOfPlayers,
    required this.numberOfHouseCards,
    required this.theme,
  });

  final BuildContext context;
  final List<Card> userSelectedCards;
  final double numberOfPlayers;
  final double numberOfHouseCards;
  final ThemeState theme;

  @override
  List<Object> get props => [
        userSelectedCards[0],
        userSelectedCards[1],
        numberOfPlayers,
        numberOfHouseCards,
      ];
}

final _paramsProvider = Provider<_VSControllerParams>((ref) {
  // Throwing an error, as params are not yet instantiated. Overriding this in the view.
  throw UnimplementedError();
});

final _vsProvider =
    StateNotifierProvider.autoDispose.family<_VSController, _ViewState, _VSControllerParams>((ref, params) {
  final stateController = _VSController(
    params: params,
  )..initState(params.context, params.theme);

  return stateController;
});

class _ViewState {
  _ViewState({
    required this.houseCards,
    required this.generatedHands,
    required this.generateTime,
    required this.streetLight,
    required this.loadingState,
    required this.showAIChat,
    required this.aiChatHistory,
    required this.elapsedSeconds,
    required this.gameHistory,
  });

  final List<Card> houseCards;
  final List<GroupedHands> generatedHands;
  final Stopwatch? generateTime;
  final StreetLight streetLight;
  final LoadingState loadingState;
  final bool showAIChat;
  final List<Content> aiChatHistory;
  final int elapsedSeconds;
  final GameHistory? gameHistory;

  _ViewState.initial()
      : this(
          houseCards: [],
          generatedHands: [],
          generateTime: null,
          streetLight: StreetLight(bulbs: []),
          loadingState: LoadingState.init,
          showAIChat: false,
          aiChatHistory: [],
          elapsedSeconds: 0,
          gameHistory: null,
        );

  _ViewState copyWith({
    List<Card>? houseCards,
    List<GroupedHands>? generatedHands,
    Stopwatch? generateTime,
    StreetLight? streetLight,
    LoadingState? loadingState,
    bool? showAIChat,
    List<Content>? aiChatHistory,
    int? elapsedSeconds,
    GameHistory? gameHistory,
  }) {
    return _ViewState(
      houseCards: houseCards ?? this.houseCards,
      generatedHands: generatedHands ?? this.generatedHands,
      generateTime: generateTime ?? this.generateTime,
      streetLight: streetLight ?? this.streetLight,
      loadingState: loadingState ?? this.loadingState,
      showAIChat: showAIChat ?? this.showAIChat,
      aiChatHistory: aiChatHistory ?? this.aiChatHistory,
      elapsedSeconds: elapsedSeconds ?? this.elapsedSeconds,
      gameHistory: gameHistory ?? this.gameHistory,
    );
  }
}

class _VSController extends StateNotifier<_ViewState> {
  _VSController({
    required this.params,
  }) : super(_ViewState.initial());
  _VSControllerParams params;
  Timer? _timer;

  void initState(BuildContext context, ThemeState theme) {
    _startTimer();
    final gameHistory = GameHistory(
      userSelectedCards: params.userSelectedCards,
      numberOfPlayers: params.numberOfPlayers,
      numberOfHouseCards: params.numberOfHouseCards,
      openHouseCards: state.houseCards,
      gameStartAt: DateTime.now(),
      gameUpdatedAt: DateTime.now(),
      elapsedSeconds: state.elapsedSeconds,
      isUserWinner: false,
      score: score,
      topPokerHand: PokerHand(
        cards: params.userSelectedCards,
      ),
    );
    MyAppX.gameHistory.updateGameHistory(gameHistory);

    state = state.copyWith(
      generateTime: Stopwatch(),
      streetLight: StreetLight(
        bulbs: [
          Bulb(
            isOn: false,
            borderColor: theme.colors.onPrimary.withOpacity(0.1),
            offColor: theme.colors.primary.withOpacity(0.2),
            onColor: theme.colors.primary,
          ),
          Bulb(
            isOn: false,
            borderColor: theme.colors.onWarning.withOpacity(0.1),
            offColor: theme.colors.warning.withOpacity(0.2),
            onColor: theme.colors.warning,
          ),
          Bulb(
            isOn: false,
            borderColor: theme.colors.onError.withOpacity(0.1),
            offColor: theme.colors.error.withOpacity(0.2),
            onColor: theme.colors.error,
          ),
        ],
      ),
      gameHistory: gameHistory,
      loadingState: LoadingState.init,
    );
    reGenHands(context, params.userSelectedCards);
  }

  void updateGameHistory() {
    state = state.copyWith(
      gameHistory: state.gameHistory?.copyWith(
        openHouseCards: state.houseCards,
        elapsedSeconds: state.elapsedSeconds,
        isUserWinner: false,
        score: score,
        gameUpdatedAt: DateTime.now(),
        topPokerHand: state.generatedHands[0].pokerHands[0],
      ),
    );
    MyAppX.gameHistory.updateGameHistory(state.gameHistory!);
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = state.copyWith(elapsedSeconds: state.elapsedSeconds + 1);
    });
  }

  int get score {
    final userHand = UserHand(userCards: params.userSelectedCards, houseCards: state.houseCards);
    final scoreDistribution = userHand.calculateScoreDistribution();

    if (scoreDistribution.isEmpty) {
      return 0;
    }

    return int.parse(userHand.calculateScoreDistribution().reduce((value, element) => value + element).toString());
  }

  Map<String, String> get scoreDistribution {
    final userHand = UserHand(userCards: params.userSelectedCards, houseCards: state.houseCards);
    return userHand.parsedScoreDistribution();
  }

  Future<void> reGenHands(BuildContext context, List<Card> cards) async {
    state = state.copyWith(generateTime: Stopwatch()..start(), loadingState: LoadingState.loading);
    final generatedHands = await MyAppX.isolateManager.runFindTopNHands(cards, 20);
    final groupedHands = generatedHands.map((e) => GroupedHands(pokerHands: e, isExpaned: false)).toList();
    if (mounted) {
      state = state.copyWith(
        generatedHands: groupedHands,
        streetLight: state.streetLight.copyWith(
          bulbs: state.streetLight.bulbs
              .map((e) => e.copyWith(
                  isOn: groupedHands[0].pokerHands[0].handRankStatus + 1 == state.streetLight.bulbs.indexOf(e)))
              .toList(),
        ),
      );
    }
    state.generateTime?.stop();
    state = state.copyWith(loadingState: LoadingState.success);
  }

  void toggleExpand(int index, bool isExpanded) {
    final newGeneratedHands = state.generatedHands.map((e) {
      if (state.generatedHands.indexOf(e) == index) {
        return e.copyWith(isExpaned: isExpanded);
      }
      return e;
    }).toList();
    state = state.copyWith(generatedHands: newGeneratedHands);
  }

  void toggleAIChat() {
    state = state.copyWith(showAIChat: !state.showAIChat);
  }

  void updateAIChatHistory(List<Content> newHistory) {
    state = state.copyWith(aiChatHistory: newHistory);
  }

  Future<List<Card>?> showSelectCardsBottomSheet(BuildContext context, List<Card>? selectedCards) async {
    return showCupertinoModalBottomSheet<List<Card>>(
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (context) => SelectCardsBottomSheet(
        disabledCards: params.userSelectedCards,
        initialSelectedCards: selectedCards ?? [],
        maxCards: 5,
      ),
    );
  }

  Future<void> onSelectHouseCards(BuildContext context, int index) async {
    final cards = await showSelectCardsBottomSheet(context, state.houseCards);
    if (cards != null) {
      // ignore: use_build_context_synchronously
      selectHouseCards(context, cards);
    }
  }

  void selectHouseCards(BuildContext context, List<Card> cards) {
    state = state.copyWith(houseCards: cards);
    final totalCards = params.userSelectedCards + cards;
    reGenHands(context, totalCards);
  }

  String get inputPrompt =>
      """You are a Texas Hold'em Poker expert. You will be given a query by the user, and your task is to resolve it in the best possible way. The current hand of the user is ${params.userSelectedCards.map((e) => '${e.rank.name} of ${e.suit.name}').join(", ")}.${state.houseCards.isNotEmpty ? ' Currently open house cards are ${state.houseCards.map((e) => '${e.rank.name} of ${e.suit.name},').join(", ")}.' : 'No house cards are currently open.'}

-------------------

""";

  void navigateToNewGame({
    required List<Card> userSelectedCards,
    required double numberOfPlayers,
    required double numberOfHouseCards,
  }) {
    state = _ViewState.initial();
    Future.delayed(Duration.zero, () {
      MyAppX.router.navigate(
        GameRoute(
          userSelectedCards: userSelectedCards,
          numberOfPlayers: numberOfPlayers,
          numberOfHouseCards: numberOfHouseCards,
        ),
      );
    });
  }

  Future<void> showStartGameBottomSheet(BuildContext context) async {
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

  @override
  void dispose() {
    updateGameHistory();
    _timer?.cancel();
    super.dispose();
  }
}
