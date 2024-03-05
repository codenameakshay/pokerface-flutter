part of '../view.dart';

class ElapsedTimerWidget extends ConsumerStatefulWidget {
  const ElapsedTimerWidget({super.key});

  @override
  ElapsedTimerWidgetState createState() => ElapsedTimerWidgetState();
}

class ElapsedTimerWidgetState extends ConsumerState<ElapsedTimerWidget> {
  Timer? _timer;
  int _elapsedSeconds = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  String _formatElapsedTime(int totalSeconds) {
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(MyAppX.theme.current);

    return Positioned(
      top: 0,
      child: SafeArea(
        bottom: false,
        child: Text(
          _formatElapsedTime(_elapsedSeconds),
          style: GoogleFonts.inter().copyWith(
            color: theme.colors.onBackground.withOpacity(0.5),
            fontSize: 12.toAutoScaledFont,
          ),
        ),
      ),
    );
  }
}
