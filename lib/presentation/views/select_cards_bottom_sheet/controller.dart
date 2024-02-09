part of 'view.dart';

class _VSControllerParams extends Equatable {
  const _VSControllerParams({this.initialSelectedCard});

  final Card? initialSelectedCard;

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
  _ViewState({this.selectedCard});

  final Card? selectedCard;

  _ViewState.initial() : this(selectedCard: null);

  _ViewState copyWith({Card? selectedCard}) {
    return _ViewState(
      selectedCard: selectedCard ?? this.selectedCard,
    );
  }
}

class _VSController extends StateNotifier<_ViewState> {
  _VSController({
    required this.params,
  }) : super(_ViewState.initial());
  _VSControllerParams params;

  void initState() {
    state = state.copyWith(selectedCard: params.initialSelectedCard);
  }

  Future<void> showCardPreview(Card card) async {
    final data = await MyAppX.router.push(
      CardPhotoRoute(
        card: card,
      ),
    ) as bool?;

    if (data == true) {
      state = state.copyWith(selectedCard: card);
      MyAppX.router.pop(card);
    }
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
