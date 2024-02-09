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
  _ViewState({
    this.firstSelectedCard,
    this.secondSelectedCard,
    required this.numberOfPlayers,
    required this.openCards,
  });

  final Card? firstSelectedCard;
  final Card? secondSelectedCard;
  final double numberOfPlayers;
  final double openCards;

  _ViewState.initial()
      : this(
          firstSelectedCard: null,
          secondSelectedCard: null,
          numberOfPlayers: 4,
          openCards: 5,
        );

  _ViewState copyWith({
    Card? firstSelectedCard,
    Card? secondSelectedCard,
    double? numberOfPlayers,
    double? openCards,
  }) {
    return _ViewState(
      firstSelectedCard: firstSelectedCard ?? this.firstSelectedCard,
      secondSelectedCard: secondSelectedCard ?? this.secondSelectedCard,
      numberOfPlayers: numberOfPlayers ?? this.numberOfPlayers,
      openCards: openCards ?? this.openCards,
    );
  }
}

class _VSController extends StateNotifier<_ViewState> {
  _VSController({
    required this.params,
  }) : super(_ViewState.initial());
  _VSControllerParams params;

  void initState() {}

  Future<Card?> showSelectCardsBottomSheet(BuildContext context, Card? selectedCard) async {
    return showCupertinoModalBottomSheet<Card>(
      context: context,
      builder: (context) => SelectCardsBottomSheet(
        initialSelectedCard: selectedCard,
      ),
    );
  }

  void openFirstCardList(BuildContext context) async {
    final card = await showSelectCardsBottomSheet(context, state.firstSelectedCard);
    if (card != null) {
      setFirstCard(card);
    }
  }

  void openSecondCardList(BuildContext context) async {
    final card = await showSelectCardsBottomSheet(context, state.secondSelectedCard);
    if (card != null) {
      setSecondCard(card);
    }
  }

  void setFirstCard(Card card) {
    state = state.copyWith(
      firstSelectedCard: card,
    );
  }

  void setSecondCard(Card card) {
    state = state.copyWith(
      secondSelectedCard: card,
    );
  }

  void resetSelectedCards() {
    state = _ViewState.initial();
  }

  void changeNumberOfPlayers(double value) {
    state = state.copyWith(
      numberOfPlayers: value,
    );
  }

  void changeOpenCards(double value) {
    state = state.copyWith(
      openCards: value,
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
