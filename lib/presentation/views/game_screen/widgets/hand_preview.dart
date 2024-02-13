part of '../view.dart';

class _HandPreview extends ConsumerWidget {
  const _HandPreview({
    required this.hand,
    this.widthMultiplier = 0.8,
    required this.params,
  });

  final PokerHand hand;
  final double widthMultiplier;
  final _VSControllerParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);
    final state = ref.watch(_vsProvider(params));

    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 8.toAutoScaledWidth,
      spacing: 8.toAutoScaledWidth,
      children: List.generate(
        hand.cards.length,
        (index) => CardPreview(
          width: MediaQuery.of(context).size.width * widthMultiplier / hand.cards.length,
          card: hand.sortedCards[index],
          userCards: params.userSelectedCards,
          houseCards: state.houseCards,
          theme: theme,
        ),
      ),
    );
  }
}
