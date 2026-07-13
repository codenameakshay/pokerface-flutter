part of '../view.dart';

/// Optional "Should I call?" helper: enter the pot and the amount to call, and
/// it says whether calling is worth it based on your win chance. Leaving the
/// fields blank changes nothing else on the screen.
class _CallHelper extends ConsumerStatefulWidget {
  const _CallHelper({required this.params});

  final _VSControllerParams params;

  @override
  ConsumerState<_CallHelper> createState() => _CallHelperState();
}

class _CallHelperState extends ConsumerState<_CallHelper> {
  late final TextEditingController _potController;
  late final TextEditingController _callController;

  @override
  void initState() {
    super.initState();
    final state = ref.read(_vsProvider(widget.params));
    _potController = TextEditingController(text: state.pot > 0 ? _format(state.pot) : '');
    _callController = TextEditingController(text: state.toCall > 0 ? _format(state.toCall) : '');
  }

  @override
  void dispose() {
    _potController.dispose();
    _callController.dispose();
    super.dispose();
  }

  String _format(double v) => v == v.roundToDouble() ? v.toInt().toString() : '$v';

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(MyAppX.theme.current);
    final state = ref.watch(_vsProvider(widget.params));
    final controller = ref.read(_vsProvider(widget.params).notifier);
    final equity = state.equity;

    final advice = equity.iterations == 0
        ? null
        : callAdvice(winEquity: equity.equity, pot: state.pot, toCall: state.toCall);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.toAutoScaledWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Should I call?',
            textAlign: TextAlign.center,
            style: theme.themeText.headline6?.copyWith(color: theme.colors.onBackground.withValues(alpha: 0.8)),
          ),
          12.toAutoScaledHeight.toVerticalSizedBox,
          Row(
            children: [
              Expanded(child: _field('Pot', _potController, controller.setPot, theme)),
              16.toAutoScaledWidth.toHorizontalSizedBox,
              Expanded(child: _field('To call', _callController, controller.setToCall, theme)),
            ],
          ),
          if (advice != null) ...[
            12.toAutoScaledHeight.toVerticalSizedBox,
            Text(
              advice.worthCalling ? 'Worth calling ✓' : 'Better to fold ✗',
              textAlign: TextAlign.center,
              style: theme.themeText.subtitle1?.copyWith(
                color: advice.worthCalling ? theme.colors.primary : theme.colors.error,
                fontWeight: FontWeight.bold,
              ),
            ),
            4.toAutoScaledHeight.toVerticalSizedBox,
            Text(
              advice.worthCalling
                  ? 'you win often enough to make it pay'
                  : "you'd need to win more often than you will",
              textAlign: TextAlign.center,
              style: theme.themeText.caption?.copyWith(color: theme.colors.onBackground.withValues(alpha: 0.6)),
            ),
            Text(
              "you're ${(advice.winEquity * 100).round()}%, need ${(advice.requiredEquity * 100).round()}%",
              textAlign: TextAlign.center,
              style: theme.themeText.caption?.copyWith(color: theme.colors.onBackground.withValues(alpha: 0.4)),
            ),
          ],
        ],
      ),
    );
  }

  Widget _field(String label, TextEditingController controller, void Function(double) onChanged, ThemeState theme) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      textAlign: TextAlign.center,
      style: theme.themeText.bodyText1,
      onChanged: (text) => onChanged(double.tryParse(text) ?? 0),
      decoration: InputDecoration(
        labelText: label,
        isDense: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
