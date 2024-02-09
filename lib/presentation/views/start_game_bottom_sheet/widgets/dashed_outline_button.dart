part of '../view.dart';

class DashedCardButton extends ConsumerWidget {
  final VoidCallback onPressed;
  final double width;
  final String? card;

  const DashedCardButton({
    super.key,
    required this.onPressed,
    required this.width,
    this.card,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);

    return Clickable(
      onPressed: onPressed,
      child: SizedBox(
        width: width,
        height: (333 / 234) * width,
        child: CustomPaint(
          painter: DashedRectPainter(
            color: theme.colors.primary,
            dashWidth: 8,
            gap: 4,
            strokeWidth: 2,
            borderRadius: 4,
          ),
          child: card != null
              ? CardsPNG.drawCard(card!)
              : const Center(
                  child: Icon(Icons.add, size: 24), // "+" icon
                ),
        ),
      ),
    );
  }
}
