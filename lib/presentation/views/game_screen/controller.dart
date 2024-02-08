part of 'view.dart';

class _VSControllerParams extends Equatable {
  const _VSControllerParams({required this.context});

  final BuildContext context;

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

  void initState(BuildContext context) {
    Future.delayed(
      Duration.zero,
      () => showSelectCardsBottomSheet(context),
    );
  }

  void showSelectCardsBottomSheet(BuildContext context) {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => const SelectCardsBottomSheet(),
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
