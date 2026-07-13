part of '../view.dart';

/// Shows the player's Monte Carlo win equity for the current hand and board:
/// a headline pot-share percentage plus the win / tie / lose breakdown.
class _EquityPanel extends ConsumerWidget {
  const _EquityPanel({required this.params});

  final _VSControllerParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);
    final state = ref.watch(_vsProvider(params));
    final equity = state.equity;

    // The hand list already shows a spinner while (re)generating; keep the
    // last equity in place rather than flashing empty.
    if (equity.iterations == 0) {
      return const SizedBox.shrink();
    }

    final equityPct = (equity.equity * 100).round();
    final Color accent;
    if (equity.equity >= 0.5) {
      accent = theme.colors.primary;
    } else if (equity.equity >= 0.25) {
      accent = theme.colors.warning;
    } else {
      accent = theme.colors.error;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.toAutoScaledWidth),
      child: Column(
        children: [
          Text(
            'WIN PROBABILITY',
            textAlign: TextAlign.center,
            style: theme.themeText.overline?.copyWith(color: theme.colors.onBackground.withOpacity(0.6)),
          ),
          Text(
            '$equityPct%',
            textAlign: TextAlign.center,
            style: theme.themeText.headline3?.copyWith(color: accent, fontWeight: FontWeight.bold),
          ),
          Text(
            'vs ${equity.opponents} opponent${equity.opponents == 1 ? '' : 's'}'
            ' · ${equity.iterations} simulations',
            textAlign: TextAlign.center,
            style: theme.themeText.caption?.copyWith(color: theme.colors.onBackground.withOpacity(0.6)),
          ),
          12.toAutoScaledHeight.toVerticalSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _EquityStat(label: 'Win', percent: equity.winRate, color: theme.colors.primary, theme: theme),
              _EquityStat(label: 'Tie', percent: equity.tieRate, color: theme.colors.warning, theme: theme),
              _EquityStat(label: 'Lose', percent: equity.lossRate, color: theme.colors.error, theme: theme),
            ],
          ),
        ],
      ),
    );
  }
}

class _EquityStat extends StatelessWidget {
  const _EquityStat({required this.label, required this.percent, required this.color, required this.theme});

  final String label;
  final double percent;
  final Color color;
  final ThemeState theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${(percent * 100).round()}%',
          style: theme.themeText.headline6?.copyWith(color: color, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: theme.themeText.caption?.copyWith(color: theme.colors.onBackground.withOpacity(0.6)),
        ),
      ],
    );
  }
}
