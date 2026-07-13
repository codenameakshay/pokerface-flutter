part of '../view.dart';

/// Compact win-equity readout, e.g. "32% win · against 3 opponents".
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

    final equityPct = (equity.equity * 100).round();
    final Color accent;
    if (equity.equity >= 0.5) {
      accent = theme.colors.primary;
    } else if (equity.equity >= 0.25) {
      accent = theme.colors.warning;
    } else {
      accent = theme.colors.error;
    }

    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '$equityPct% ',
                style: theme.themeText.headline4?.copyWith(color: accent, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'win',
                style: theme.themeText.headline6?.copyWith(color: theme.colors.onBackground.withValues(alpha: 0.7)),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'against ${equity.opponents} opponent${equity.opponents == 1 ? '' : 's'}',
          textAlign: TextAlign.center,
          style: theme.themeText.caption?.copyWith(color: theme.colors.onBackground.withValues(alpha: 0.6)),
        ),
      ],
    );
  }
}
