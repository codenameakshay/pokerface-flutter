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

final _vsProvider = StateNotifierProvider.autoDispose.family<_VSController, _ViewState, _VSControllerParams>((
  ref,
  params,
) {
  final stateController = _VSController(params: params)..initState(params.context, params.theme);

  return stateController;
});

class _ViewState {
  _ViewState({
    required this.houseCards,
    required this.generatedHands,
    required this.generateTime,
    required this.streetLight,
    required this.loadingState,
    required this.equity,
    required this.pot,
    required this.toCall,
  });

  final List<Card> houseCards;
  final List<GroupedHands> generatedHands;
  final Stopwatch? generateTime;
  final StreetLight streetLight;
  final LoadingState loadingState;
  final EquityResult equity;

  /// Optional "Should I call?" inputs. Zero means "not entered".
  final double pot;
  final double toCall;

  _ViewState.initial()
    : this(
        houseCards: [],
        generatedHands: [],
        generateTime: null,
        streetLight: StreetLight(bulbs: []),
        loadingState: LoadingState.init,
        equity: const EquityResult.empty(),
        pot: 0,
        toCall: 0,
      );

  _ViewState copyWith({
    List<Card>? houseCards,
    List<GroupedHands>? generatedHands,
    Stopwatch? generateTime,
    StreetLight? streetLight,
    LoadingState? loadingState,
    EquityResult? equity,
    double? pot,
    double? toCall,
  }) {
    return _ViewState(
      houseCards: houseCards ?? this.houseCards,
      generatedHands: generatedHands ?? this.generatedHands,
      generateTime: generateTime ?? this.generateTime,
      streetLight: streetLight ?? this.streetLight,
      loadingState: loadingState ?? this.loadingState,
      equity: equity ?? this.equity,
      pot: pot ?? this.pot,
      toCall: toCall ?? this.toCall,
    );
  }
}

class _VSController extends StateNotifier<_ViewState> {
  _VSController({required this.params}) : super(_ViewState.initial());
  _VSControllerParams params;

  void initState(BuildContext context, ThemeState theme) {
    state = state.copyWith(
      generateTime: Stopwatch(),
      streetLight: StreetLight(
        bulbs: [
          Bulb(
            isOn: false,
            borderColor: theme.colors.onPrimary.withValues(alpha: 0.1),
            offColor: theme.colors.primary.withValues(alpha: 0.2),
            onColor: theme.colors.primary,
          ),
          Bulb(
            isOn: false,
            borderColor: theme.colors.onWarning.withValues(alpha: 0.1),
            offColor: theme.colors.warning.withValues(alpha: 0.2),
            onColor: theme.colors.warning,
          ),
          Bulb(
            isOn: false,
            borderColor: theme.colors.onError.withValues(alpha: 0.1),
            offColor: theme.colors.error.withValues(alpha: 0.2),
            onColor: theme.colors.error,
          ),
        ],
      ),
      loadingState: LoadingState.init,
    );
    reGenHands(context, params.userSelectedCards);
  }

  Future<void> reGenHands(BuildContext context, List<Card> cards) async {
    state = state.copyWith(generateTime: Stopwatch()..start(), loadingState: LoadingState.loading);

    final holeCards = params.userSelectedCards;
    final board = state.houseCards;
    final opponents = params.numberOfPlayers.round() - 1;

    // Run the top-hands search and the win-equity simulation on their worker
    // isolates concurrently.
    final handsFuture = MyAppX.isolateManager.runFindTopNHands(cards, 20);
    final equityFuture = holeCards.length == 2 && opponents >= 1
        ? MyAppX.isolateManager.runCalculateEquity(holeCards: holeCards, board: board, opponents: opponents)
        : Future<EquityResult>.value(const EquityResult.empty());

    final generatedHands = await handsFuture;
    final equity = await equityFuture;

    final groupedHands = generatedHands.map((e) => GroupedHands(pokerHands: e, isExpaned: false)).toList();

    state = state.copyWith(
      generatedHands: groupedHands,
      equity: equity,
      streetLight: _streetLightForEquity(equity),
    );
    state.generateTime?.stop();
    state = state.copyWith(loadingState: LoadingState.success);
  }

  /// Lights the green / amber / red bulb from the player's win equity: green at
  /// 50%+, amber at 25–50%, red below 25%. No bulb lights until a simulation
  /// has run.
  StreetLight _streetLightForEquity(EquityResult equity) {
    final bulbs = state.streetLight.bulbs;
    int litIndex;
    if (equity.iterations == 0) {
      litIndex = -1;
    } else if (equity.equity >= 0.5) {
      litIndex = 0;
    } else if (equity.equity >= 0.25) {
      litIndex = 1;
    } else {
      litIndex = 2;
    }
    return state.streetLight.copyWith(
      bulbs: [
        for (var i = 0; i < bulbs.length; i++) bulbs[i].copyWith(isOn: i == litIndex),
      ],
    );
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

  void setPot(double value) => state = state.copyWith(pot: value);

  void setToCall(double value) => state = state.copyWith(toCall: value);

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
}
