part of '../view.dart';

class _BottomHouseCards extends ConsumerWidget {
  const _BottomHouseCards({
    required this.params,
  });

  final _VSControllerParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.watch(_vsProvider(params).notifier);

    return Positioned(
      bottom: 0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: ShapeDecoration(
          color: theme.colors.background,
          shape: DashedBorder(
            color: theme.colors.secondary.withOpacity(0.1),
            dashWidth: 12,
            dashSpace: 4,
            strokeWidth: 2,
            top: true,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 24.toAutoScaledHeight),
        child: SafeArea(
          top: false,
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 16.toAutoScaledWidth,
            spacing: 16.toAutoScaledWidth,
            children: List.generate(
              params.numberOfHouseCards.toInt(),
              (index) => DashedCardButton(
                // onPressed: () => stateController.reGenHands(context, params.userSelectedCards.sublist(0, index + 2)),
                onPressed: () => stateController.showStartGameSheet(context, index),
                width: MediaQuery.of(context).size.width * 0.7 / params.numberOfHouseCards,
                card: state.houseCards.length > index ? state.houseCards[index] : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
