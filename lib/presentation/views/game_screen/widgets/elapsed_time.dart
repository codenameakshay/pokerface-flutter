part of '../view.dart';

class ElapsedTimerWidget extends ConsumerWidget {
  const ElapsedTimerWidget({
    super.key,
    required this.params,
  });

  final _VSControllerParams params;

  String _formatElapsedTime(int totalSeconds) {
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);
    final state = ref.watch(_vsProvider(params));

    return Positioned(
      top: 0,
      child: SafeArea(
        bottom: false,
        child: Text(
          _formatElapsedTime(state.elapsedSeconds),
          style: GoogleFonts.inter().copyWith(
            color: theme.colors.onBackground.withOpacity(0.5),
            fontSize: 12.toAutoScaledFont,
          ),
        ),
      ),
    );
  }
}
