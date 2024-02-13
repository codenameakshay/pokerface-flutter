part of 'view.dart';

class _VSControllerParams extends Equatable {
  const _VSControllerParams({
    this.initialSelectedCards = const [],
    required this.maxSelectedCards,
    this.disabledCards = const [],
  });

  final List<Card> initialSelectedCards;
  final int maxSelectedCards;
  final List<Card> disabledCards;

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
  _ViewState({required this.selectedCards});

  final List<Card> selectedCards;

  _ViewState.initial() : this(selectedCards: []);

  _ViewState copyWith({List<Card>? selectedCards}) {
    return _ViewState(
      selectedCards: selectedCards ?? this.selectedCards,
    );
  }
}

class _VSController extends StateNotifier<_ViewState> {
  _VSController({
    required this.params,
  }) : super(_ViewState.initial());
  _VSControllerParams params;

  void initState() {
    state = state.copyWith(selectedCards: params.initialSelectedCards);
  }

  Future<void> showCardPreview(Card card) async {
    final data = await MyAppX.router.push(
      CardPhotoRoute(
        card: card,
        isSelected: state.selectedCards.contains(card),
      ),
    ) as bool?;

    if (data == true) {
      if (state.selectedCards.contains(card)) {
      } else {
        if (state.selectedCards.length >= params.maxSelectedCards) {
          MyAppX.showToast(message: 'You can only select ${params.maxSelectedCards} cards', type: ToastType.failure);
        } else {
          state.selectedCards.add(card);
          state = state.copyWith(selectedCards: state.selectedCards);
        }
      }
    } else if (data == false) {
      if (state.selectedCards.contains(card)) {
        state.selectedCards.remove(card);
        state = state.copyWith(selectedCards: state.selectedCards);
      } else {}
    }

    // MyAppX.router.pop(card);
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
