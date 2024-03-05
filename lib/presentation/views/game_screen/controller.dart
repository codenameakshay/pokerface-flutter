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
  });

  final List<Card> houseCards;
  final List<GroupedHands> generatedHands;
  final Stopwatch? generateTime;
  final StreetLight streetLight;
  final LoadingState loadingState;
  final bool showAIChat;
  final List<Content> aiChatHistory;

  _ViewState.initial()
      : this(
          houseCards: [],
          generatedHands: [],
          generateTime: null,
          streetLight: StreetLight(bulbs: []),
          loadingState: LoadingState.init,
          showAIChat: false,
          aiChatHistory: [],
        );

  _ViewState copyWith({
    List<Card>? houseCards,
    List<GroupedHands>? generatedHands,
    Stopwatch? generateTime,
    StreetLight? streetLight,
    LoadingState? loadingState,
    bool? showAIChat,
    List<Content>? aiChatHistory,
  }) {
    return _ViewState(
      houseCards: houseCards ?? this.houseCards,
      generatedHands: generatedHands ?? this.generatedHands,
      generateTime: generateTime ?? this.generateTime,
      streetLight: streetLight ?? this.streetLight,
      loadingState: loadingState ?? this.loadingState,
      showAIChat: showAIChat ?? this.showAIChat,
      aiChatHistory: aiChatHistory ?? this.aiChatHistory,
    );
  }
}

class _VSController extends StateNotifier<_ViewState> {
  _VSController({
    required this.params,
  }) : super(_ViewState.initial());
  _VSControllerParams params;

  void initState(BuildContext context, ThemeState theme) {
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
      loadingState: LoadingState.init,
    );
    reGenHands(context, params.userSelectedCards);
  }

  int get calScore {
    final userHand = UserHand(userCards: params.userSelectedCards, houseCards: state.houseCards);
    return userHand.calculateScore();
  }

  Future<void> reGenHands(BuildContext context, List<Card> cards) async {
    state = state.copyWith(generateTime: Stopwatch()..start(), loadingState: LoadingState.loading);
    final generatedHands = await MyAppX.isolateManager.runFindTopNHands(cards, 20);
    final groupedHands = generatedHands.map((e) => GroupedHands(pokerHands: e, isExpaned: false)).toList();
    state = state.copyWith(
      generatedHands: groupedHands,
      streetLight: state.streetLight.copyWith(
        bulbs: state.streetLight.bulbs
            .map((e) => e.copyWith(
                isOn: groupedHands[0].pokerHands[0].handRankStatus + 1 == state.streetLight.bulbs.indexOf(e)))
            .toList(),
      ),
    );
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

  Future<void> showStartGameSheet(BuildContext context, int index) async {
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
}
