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

final _vsProvider = StateNotifierProvider.autoDispose.family<_VSController, _ViewState, _VSControllerParams>((
  ref,
  params,
) {
  final stateController = _VSController(params: params)..initState();

  return stateController;
});

class _ViewState {
  _ViewState({required this.selectedCards, required this.numberOfPlayers, required this.pot, required this.toCall});

  final List<Card> selectedCards;
  final double numberOfPlayers;

  /// Optional "Should I call?" inputs. Zero means "not entered".
  final double pot;
  final double toCall;

  _ViewState.initial() : this(selectedCards: [], numberOfPlayers: 4, pot: 0, toCall: 0);

  _ViewState copyWith({List<Card>? selectedCards, double? numberOfPlayers, double? pot, double? toCall}) {
    return _ViewState(
      selectedCards: selectedCards ?? this.selectedCards,
      numberOfPlayers: numberOfPlayers ?? this.numberOfPlayers,
      pot: pot ?? this.pot,
      toCall: toCall ?? this.toCall,
    );
  }
}

class _VSController extends StateNotifier<_ViewState> {
  _VSController({required this.params}) : super(_ViewState.initial());
  _VSControllerParams params;

  void initState() {}

  Future<List<Card>?> showSelectCardsBottomSheet(BuildContext context, List<Card>? selectedCards) async {
    return showCupertinoModalBottomSheet<List<Card>>(
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (context) => SelectCardsBottomSheet(initialSelectedCards: selectedCards ?? [], maxCards: 2),
    );
  }

  void openCardsList(BuildContext context) async {
    final cards = await showSelectCardsBottomSheet(context, state.selectedCards);
    if (cards != null) {
      setCards(cards);
    }
  }

  void setCards(List<Card> cards) {
    state = state.copyWith(selectedCards: cards);
  }

  void resetSelectedCards() {
    state = _ViewState.initial();
  }

  void changeNumberOfPlayers(double value) {
    state = state.copyWith(numberOfPlayers: value);
  }

  void setPot(double value) => state = state.copyWith(pot: value);

  void setToCall(double value) => state = state.copyWith(toCall: value);

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
