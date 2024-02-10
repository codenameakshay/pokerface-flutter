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
  });

  final List<Card> houseCards;
  final List<PokerHand> generatedHands;

  _ViewState.initial()
      : this(
          houseCards: [],
          generatedHands: [],
        );

  _ViewState copyWith({
    List<Card>? houseCards,
    List<PokerHand>? generatedHands,
  }) {
    return _ViewState(
      houseCards: houseCards ?? this.houseCards,
      generatedHands: generatedHands ?? this.generatedHands,
    );
  }
}

class _VSController extends StateNotifier<_ViewState> {
  _VSController({
    required this.params,
  }) : super(_ViewState.initial());
  _VSControllerParams params;

  void initState(BuildContext context) {
    final generatedHands = generateAndSortRandomHands();
    state = state.copyWith(generatedHands: generatedHands);
  }

  void reGenHands() {
    final generatedHands = generateAndSortRandomHands();
    state = state.copyWith(generatedHands: generatedHands);
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
