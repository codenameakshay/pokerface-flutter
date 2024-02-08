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
  });

  final String? firstSelectedCard;
  final String? secondSelectedCard;

  _ViewState.initial()
      : this(
          firstSelectedCard: null,
          secondSelectedCard: null,
        );

  _ViewState copyWith({
    String? firstSelectedCard,
    String? secondSelectedCard,
  }) {
    return _ViewState(
      firstSelectedCard: firstSelectedCard ?? this.firstSelectedCard,
      secondSelectedCard: secondSelectedCard ?? this.secondSelectedCard,
    );
  }
}

class _VSController extends StateNotifier<_ViewState> {
  _VSController({
    required this.params,
  }) : super(_ViewState.initial());
  _VSControllerParams params;

  void initState() {}

  Future<String?> showCardsListBottomSheet(BuildContext context, String? selectedCard) async {
    return showCupertinoModalBottomSheet<String>(
      context: context,
      builder: (context) => CardsListBottomSheet(
        initialSelectedCard: selectedCard,
      ),
    );
  }

  void openFirstCardList(BuildContext context) async {
    final card = await showCardsListBottomSheet(context, state.firstSelectedCard);
    if (card != null) {
      setFirstCard(card);
    }
  }

  void openSecondCardList(BuildContext context) async {
    final card = await showCardsListBottomSheet(context, state.secondSelectedCard);
    if (card != null) {
      setSecondCard(card);
    }
  }

  void setFirstCard(String card) {
    state = state.copyWith(
      firstSelectedCard: card,
    );
  }

  void setSecondCard(String card) {
    state = state.copyWith(
      secondSelectedCard: card,
    );
  }

  void resetSelectedCards() {
    state = _ViewState.initial();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
