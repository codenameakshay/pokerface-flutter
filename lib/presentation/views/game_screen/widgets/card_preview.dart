part of '../view.dart';

class CardPreview extends ConsumerWidget {
  final double width;
  final Card card;
  final List<Card> userCards;
  final ThemeState theme;

  const CardPreview({
    super.key,
    required this.width,
    required this.card,
    required this.userCards,
    required this.theme,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width,
      height: (333 / 234) * width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: userCards.contains(card)
            ? Border.all(
                color: theme.colors.primary,
                width: 2,
                strokeAlign: BorderSide.strokeAlignInside,
              )
            : null,
      ),
      child: CardsPNG.drawCard(card.image.png, fit: BoxFit.cover),
    );
  }
}
