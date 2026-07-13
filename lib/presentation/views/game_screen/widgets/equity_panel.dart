part of '../view.dart';

/// Plain-language read on the hand: a verdict headline, the win chance as a
/// subtitle, and (when you're not ahead) a hint about what would improve it.
class _EquityPanel extends ConsumerWidget {
  const _EquityPanel({required this.params});

  final _VSControllerParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);
    final state = ref.watch(_vsProvider(params));
    final equity = state.equity;

    if (equity.iterations == 0) {
      return const SizedBox.shrink();
    }

    final opponents = equity.opponents;
    final verdict = verdictFor(equity: equity.equity, opponents: opponents);
    final equityPct = (equity.equity * 100).round();

    final accent = switch (verdict) {
      HandVerdict.winning => theme.colors.primary,
      HandVerdict.close => theme.colors.warning,
      HandVerdict.behind => theme.colors.warning,
      HandVerdict.losing => theme.colors.error,
    };

    // "What you need" line — only when you're not already ahead.
    String? hintLine;
    if (verdict != HandVerdict.winning) {
      final tip = improvementHint(holeCards: params.userSelectedCards, board: state.houseCards);
      if (tip != null) {
        hintLine = tip;
      } else if ((verdict == HandVerdict.behind || verdict == HandVerdict.losing) && state.houseCards.length < 5) {
        hintLine = 'Not much can help this hand — better to fold.';
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.toAutoScaledWidth),
      child: Column(
        children: [
          Text(
            verdict.message,
            textAlign: TextAlign.center,
            style: theme.themeText.headline4?.copyWith(color: accent, fontWeight: FontWeight.bold),
          ),
          4.toAutoScaledHeight.toVerticalSizedBox,
          Text(
            '$equityPct% chance · $opponents opponent${opponents == 1 ? '' : 's'}',
            textAlign: TextAlign.center,
            style: theme.themeText.caption?.copyWith(color: theme.colors.onBackground.withValues(alpha: 0.6)),
          ),
          if (hintLine != null) ...[
            12.toAutoScaledHeight.toVerticalSizedBox,
            Text(
              hintLine,
              textAlign: TextAlign.center,
              style: theme.themeText.bodyText2?.copyWith(color: theme.colors.onBackground.withValues(alpha: 0.85)),
            ),
          ],
        ],
      ),
    );
  }
}
