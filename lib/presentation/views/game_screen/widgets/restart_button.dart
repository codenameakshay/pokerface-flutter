part of '../view.dart';

class _RestartButton extends ConsumerWidget {
  const _RestartButton({
    required this.params,
  });

  final _VSControllerParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.watch(_vsProvider(params).notifier);

    final showRestartButton = state.houseCards.length == params.numberOfHouseCards;

    return showRestartButton
        ? Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(24.toAutoScaledWidth),
              child: FloatingActionButton(
                heroTag: 'restart',
                onPressed: () => stateController.showStartGameBottomSheet(context),
                child: Icon(
                  Icons.replay,
                  color: theme.colors.onPrimary,
                ),
              ),
            ),
          )
        : const Offstage();
  }
}
