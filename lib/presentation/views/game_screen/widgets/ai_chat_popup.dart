part of '../view.dart';

class _AIChatPopup extends ConsumerWidget {
  const _AIChatPopup({
    required this.params,
  });

  final _VSControllerParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.watch(_vsProvider(params).notifier);

    return AnimatedPositioned(
      bottom: 24.toAutoScaledWidth,
      right: 24.toAutoScaledWidth,
      left: state.showAIChat ? 24.toAutoScaledWidth : MediaQuery.of(context).size.width - 24.toAutoScaledWidth,
      top: state.showAIChat
          ? MediaQuery.of(context).padding.top + 24.toAutoScaledWidth
          : MediaQuery.of(context).size.height - 24.toAutoScaledWidth - MediaQuery.of(context).padding.top,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(16.toAutoScaledWidth),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.toAutoScaledWidth),
          child: state.showAIChat
              ? ChatScreen(
                  title: 'Gemini',
                  onClose: stateController.toggleAIChat,
                )
              : DummyChatScreen(
                  title: 'Gemini',
                  onClose: stateController.toggleAIChat,
                ),
        ),
      ),
    );
  }
}
