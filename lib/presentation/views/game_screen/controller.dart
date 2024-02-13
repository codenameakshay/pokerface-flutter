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
  });

  final List<Card> houseCards;
  final List<GroupedHands> generatedHands;
  final Stopwatch? generateTime;
  final StreetLight streetLight;

  _ViewState.initial()
      : this(
          houseCards: [],
          generatedHands: [],
          generateTime: null,
          streetLight: StreetLight(bulbs: []),
        );

  _ViewState copyWith({
    List<Card>? houseCards,
    List<GroupedHands>? generatedHands,
    Stopwatch? generateTime,
    StreetLight? streetLight,
  }) {
    return _ViewState(
      houseCards: houseCards ?? this.houseCards,
      generatedHands: generatedHands ?? this.generatedHands,
      generateTime: generateTime ?? this.generateTime,
      streetLight: streetLight ?? this.streetLight,
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
      streetLight: StreetLight(bulbs: [
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
      ]),
    );
    // evaluateTopNHands(
    //         context,
    //         [
    //           Cards.diamonds.three,
    //           Cards.spades.five,
    //         ],
    //         20)
    //     .then((value) {
    //   final generatedHands = value;
    //   state = state.copyWith(generatedHands: generatedHands);
    // });
  }

  Future<void> reGenHands(BuildContext context, List<Card> cards) async {
    state = state.copyWith(generateTime: Stopwatch()..start());
    final generatedHands = await MyAppX.isolateManager.runFindTopNHands(cards, 20);
    final groupedHands = generatedHands.map((e) => GroupedHands(pokerHands: e, isExpaned: false)).toList();
    state = state.copyWith(generatedHands: groupedHands);
    state.generateTime?.stop();
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

  Future<Card?> showSelectCardsBottomSheet(BuildContext context, Card? selectedCard) async {
    return showCupertinoModalBottomSheet<Card>(
      context: context,
      builder: (context) => SelectCardsBottomSheet(
        initialSelectedCard: selectedCard,
      ),
    );
  }

  Future<void> showStartGameSheet(BuildContext context, int index) async {
    // if (state.houseCards.length > index) {
    // }
    // final card = await showSelectCardsBottomSheet(context, state.houseCards.elementAt(index));
    // if (card != null) {
    //   setSecondCard(card);
    // }
  }

  void selectHouseCard(Card card) {
    if (state.houseCards.contains(card)) {
      return;
    }

    if (state.houseCards.length == params.numberOfHouseCards.toInt()) {
      return;
    }

    state = state.copyWith(houseCards: [...state.houseCards, card]);
  }
  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
