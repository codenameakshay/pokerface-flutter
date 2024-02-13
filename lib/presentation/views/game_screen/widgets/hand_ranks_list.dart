part of '../view.dart';

class _HandRanksList extends ConsumerWidget {
  const _HandRanksList({
    required this.params,
  });

  final _VSControllerParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.watch(_vsProvider(params).notifier);

    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        stateController.toggleExpand(index, isExpanded);
      },
      dividerColor: Colors.transparent,
      elevation: 0,
      expandedHeaderPadding: EdgeInsets.zero,
      materialGapSize: 0,
      expandIconColor: theme.colors.primary,
      children: [
        for (final groupedHands in state.generatedHands) ...[
          ExpansionPanel(
            headerBuilder: (context, isExpanded) => Column(
              children: [
                _HandRankHeader(
                  hand: groupedHands.pokerHands[0],
                  params: params,
                ),
                _HandPreview(
                  hand: groupedHands.pokerHands[0],
                  params: params,
                  widthMultiplier: 0.6,
                ),
                24.toAutoScaledHeight.toVerticalSizedBox,
              ],
            ),
            body: Column(
              children: [
                for (final hand in groupedHands.pokerHands) ...[
                  24.toAutoScaledHeight.toVerticalSizedBox,
                  _HandPreview(hand: hand, params: params),
                ]
              ],
            ),
            canTapOnHeader: true,
            isExpanded: groupedHands.isExpaned,
          ),
        ]
      ],
    );
  }
}
