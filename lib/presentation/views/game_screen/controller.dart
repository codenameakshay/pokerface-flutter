part of 'view.dart';

class _VSControllerParams extends Equatable {
  const _VSControllerParams({
    required this.context,
    required this.userSelectedCards,
    required this.numberOfPlayers,
    required this.numberOfHouseCards,
  });

  final BuildContext context;
  final List<Card> userSelectedCards;
  final double numberOfPlayers;
  final double numberOfHouseCards;

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
  )..initState(params.context);

  return stateController;
});

class _ViewState {
  _ViewState({
    required this.houseCards,
    required this.generatedHands,
    required this.fromFile,
    required this.generateTime,
  });

  final List<Card> houseCards;
  final List<PokerHand> generatedHands;
  final bool fromFile;
  final Stopwatch? generateTime;

  _ViewState.initial()
      : this(
          houseCards: [],
          generatedHands: [],
          fromFile: false,
          generateTime: null,
        );

  _ViewState copyWith({
    List<Card>? houseCards,
    List<PokerHand>? generatedHands,
    bool? fromFile,
    Stopwatch? generateTime,
  }) {
    return _ViewState(
      houseCards: houseCards ?? this.houseCards,
      generatedHands: generatedHands ?? this.generatedHands,
      fromFile: fromFile ?? this.fromFile,
      generateTime: generateTime ?? this.generateTime,
    );
  }
}

class _VSController extends StateNotifier<_ViewState> {
  _VSController({
    required this.params,
  }) : super(_ViewState.initial());
  _VSControllerParams params;

  void initState(BuildContext context) {
    state = state.copyWith(
      generateTime: Stopwatch(),
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

  void changeFromFile(bool fromFile) {
    state = state.copyWith(fromFile: fromFile);
  }

  Future<void> reGenHands(BuildContext context, List<Card> cards) async {
    state = state.copyWith(generateTime: Stopwatch()..start());
    if (state.fromFile) {
      final generatedHands = await evaluateTopNHands(context, cards, 20);
      state = state.copyWith(generatedHands: generatedHands);
    } else {
      final generatedHands = await findTop20Hands(cards);
      state = state.copyWith(generatedHands: generatedHands);
    }
    state.generateTime?.stop();
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
