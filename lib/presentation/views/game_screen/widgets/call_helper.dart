part of '../view.dart';

/// Optional "Should I call?" helper. Collapsed to a single tappable line by
/// default so it stays out of the way; tap it to enter the pot and the amount
/// to stay in and get a plain call/fold verdict.
class _CallHelper extends ConsumerStatefulWidget {
  const _CallHelper({required this.params});

  final _VSControllerParams params;

  @override
  ConsumerState<_CallHelper> createState() => _CallHelperState();
}

class _CallHelperState extends ConsumerState<_CallHelper> {
  late final TextEditingController _potController;
  late final TextEditingController _callController;
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    final state = ref.read(_vsProvider(widget.params));
    _potController = TextEditingController(text: state.pot > 0 ? _format(state.pot) : '');
    _callController = TextEditingController(text: state.toCall > 0 ? _format(state.toCall) : '');
    // Open automatically if the start sheet already provided values.
    _expanded = state.pot > 0 || state.toCall > 0;
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

    if (!_expanded) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() => _expanded = true),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.toAutoScaledHeight),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Should I call?',
                style: theme.themeText.subtitle2?.copyWith(color: theme.colors.onBackground.withValues(alpha: 0.6)),
              ),
              Icon(Icons.keyboard_arrow_down, size: 18, color: theme.colors.onBackground.withValues(alpha: 0.6)),
            ],
          ),
        ),
      );
    }

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
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => setState(() => _expanded = false),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Should I call?',
                  style: theme.themeText.subtitle1?.copyWith(color: theme.colors.onBackground.withValues(alpha: 0.8)),
                ),
                Icon(Icons.keyboard_arrow_up, size: 18, color: theme.colors.onBackground.withValues(alpha: 0.6)),
              ],
            ),
          ),
          6.toAutoScaledHeight.toVerticalSizedBox,
          Text(
            'How much is in the pot, and what it costs you to stay in?',
            textAlign: TextAlign.center,
            style: theme.themeText.caption?.copyWith(color: theme.colors.onBackground.withValues(alpha: 0.5)),
          ),
          12.toAutoScaledHeight.toVerticalSizedBox,
          Row(
            children: [
              Expanded(child: _field('Pot', _potController, controller.setPot, theme)),
              12.toAutoScaledWidth.toHorizontalSizedBox,
              Expanded(child: _field('To stay in', _callController, controller.setToCall, theme)),
            ],
          ),
          if (advice != null) ...[
            10.toAutoScaledHeight.toVerticalSizedBox,
            Text(
              advice.worthCalling
                  ? "Worth calling ✓  ·  you're ${(advice.winEquity * 100).round()}%, need ${(advice.requiredEquity * 100).round()}%"
                  : "Better to fold ✗  ·  you're ${(advice.winEquity * 100).round()}%, need ${(advice.requiredEquity * 100).round()}%",
              textAlign: TextAlign.center,
              style: theme.themeText.subtitle2?.copyWith(
                color: advice.worthCalling ? theme.colors.primary : theme.colors.error,
                fontWeight: FontWeight.bold,
              ),
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
