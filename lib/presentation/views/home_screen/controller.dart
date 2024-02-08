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
  _ViewState();

  _ViewState.initial() : this();

  _ViewState copyWith() {
    return _ViewState();
  }
}

class _VSController extends StateNotifier<_ViewState> {
  _VSController({
    required this.params,
  }) : super(_ViewState.initial());
  _VSControllerParams params;

  void initState() {}

  void navigateToNewGame({
    required List<String> userSelectedCards,
    required double numberOfPlayers,
    required double numberOfHouseCards,
  }) {
    MyAppX.router.navigate(
      GameRoute(
        userSelectedCards: userSelectedCards,
        numberOfPlayers: numberOfPlayers,
        numberOfHouseCards: numberOfHouseCards,
      ),
    );
  }

  Future<void> showSelectCardsBottomSheet(BuildContext context) async {
    // MyAppX.router.pushNativeRoute(
    //   MaterialWithModalsPageRoute(
    //     fullscreenDialog: true,
    //     builder: (BuildContext context) => BlankView(
    //       onInit: () => showCupertinoModalBottomSheet(
    //         context: context,
    //         builder: (context) => const SelectCardsBottomSheet(),
    //       ),
    //     ),
    //   ),
    // );
    // MyAppX.router.navigate(
    //   BlankRoute(
    //     onInit: () => showCupertinoModalBottomSheet(
    //       context: context,
    //       builder: (context) => const SelectCardsBottomSheet(),
    //     ),
    //   ),
    // );
    final data = await showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => const SelectCardsBottomSheet(),
    );

    if (data != null) {
      print(data);
      navigateToNewGame(
        userSelectedCards: data['userSelectedCards'],
        numberOfPlayers: data['numberOfPlayers'],
        numberOfHouseCards: data['numberOfHouseCards'],
      );
    }
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
