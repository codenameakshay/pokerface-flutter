part of '../view.dart';

class _AIChatButton extends ConsumerWidget {
  const _AIChatButton({
    required this.params,
  });

  final _VSControllerParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.watch(_vsProvider(params).notifier);

    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.all(24.toAutoScaledWidth),
        child: FloatingActionButton(
          onPressed: stateController.toggleAIChat,
          child: Icon(
            state.showAIChat ? Icons.close : Icons.bolt,
            color: theme.colors.onPrimary,
          ),
        ),
      ),
    );
  }
}
