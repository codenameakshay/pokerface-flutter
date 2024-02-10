part of '../view.dart';

class CardPreview extends ConsumerWidget {
  final double width;
  final Card card;

  const CardPreview({
    super.key,
    required this.width,
    required this.card,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: width,
      height: (333 / 234) * width,
      child: CardsPNG.drawCard(card.image.png),
    );
  }
}
