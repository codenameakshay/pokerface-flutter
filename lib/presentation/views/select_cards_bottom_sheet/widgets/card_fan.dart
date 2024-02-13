part of '../view.dart';

class CardFan extends StatelessWidget {
  final double width;
  final double offsetStep;
  final List<Card> cards;
  final Function(Card) onPressed;
  final List<Card>? selectedCards;

  const CardFan({
    super.key,
    required this.width,
    required this.offsetStep,
    required this.cards,
    required this.onPressed,
    this.selectedCards,
  });
  @override
  Widget build(BuildContext context) {
    // Use Stack to overlay cards
    return Padding(
      padding: EdgeInsets.only(
        left: 16.toAutoScaledWidth,
        right: 16.toAutoScaledWidth,
        top: 16.toAutoScaledHeight,
      ),
      child: SizedBox(
        width: // calculate total width based on number of cards
            width + (cards.length - 1) * offsetStep,
        height: width * (333 / 234), // Ensure this matches your card height
        child: Stack(
          children: List.generate(cards.length, (index) {
            // Calculate the offset for each card based on its index
            double offset = index * offsetStep;

            return Positioned(
              left: offset,
              child: Transform.translate(
                offset: selectedCards?.contains(cards[index]) == true
                    ? Offset(0, -16.toAutoScaledHeight)
                    : const Offset(0, 0),
                child: Material(
                  color: Colors.transparent,
                  child: Clickable(
                    onPressed: () => onPressed(cards[index]),
                    child: Hero(
                      tag: cards[index],
                      child: Container(
                        width: width,
                        height: width * (333 / 234),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                          cards[index].image.png,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
