part of '../view.dart';

class _HandRankHeader extends ConsumerWidget {
  const _HandRankHeader({
    required this.hand,
    required this.params,
  });

  final PokerHand hand;
  final _VSControllerParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);

    return ListTile(
      leading: Padding(
        padding: EdgeInsets.only(left: 16.toAutoScaledWidth),
        child: Text(
          hand.evaluateHand().emoji,
          textAlign: TextAlign.center,
          style: theme.themeText.headline6,
        ),
      ),
      title: Text(
        hand.evaluateHand().name,
        textAlign: TextAlign.center,
        style: theme.themeText.headline6,
      ),
      trailing: Padding(
        padding: EdgeInsets.only(right: 8.toAutoScaledWidth),
        child: Text(
          (hand.score).toString(),
          textAlign: TextAlign.center,
          style: theme.themeText.headline6,
        ),
      ),
    );
  }
}
