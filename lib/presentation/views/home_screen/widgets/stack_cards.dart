part of '../view.dart';

class StackCards extends StatefulWidget {
  const StackCards({super.key, this.width = 72});

  final double width;

  @override
  StackCardsState createState() => StackCardsState();
}

class StackCardsState extends State<StackCards> with SingleTickerProviderStateMixin {
  List<String> cards = [];
  late List<GlobalKey<DiagonalMovingCardState>> cardKeys;

  @override
  void initState() {
    super.initState();
    // pick random 25 from all without Face Cards from available front cards
    cards = List.generate(
      25,
      (index) =>
          CardsPNG.fronts.allWithoutFaceCardsPNG[Random().nextInt(CardsPNG.fronts.allWithoutFaceCardsPNG.length)],
    );
    cardKeys =
        List<GlobalKey<DiagonalMovingCardState>>.generate(cards.length, (_) => GlobalKey<DiagonalMovingCardState>());
  }

  void randomizeCards() {
    for (var key in cardKeys) {
      key.currentState?.randomizeMovement();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RouteDetectorWidget(
      onHidden: () {
        for (var key in cardKeys) {
          key.currentState?.pauseAnimation();
        }
      },
      onShown: () {
        for (var key in cardKeys) {
          key.currentState?.resumeAnimation();
        }
      },
      child: ShakeDetectorWidget(
        onShake: randomizeCards,
        child: Stack(
          children: List.generate(cards.length, (index) {
            return DiagonalMovingCard(
              key: cardKeys[index], // Use the specific key for this card
              card: cards[index],
              width: widget.width,
              speed: Random().nextDouble() * 0.6 + 0.4,
              initialDirection: Offset(Random().nextDouble() * 2 - 1, Random().nextDouble() * 2 - 1),
              initialPosition: Offset(
                Random().nextDouble() * MediaQuery.of(context).size.width,
                Random().nextDouble() * MediaQuery.of(context).size.height,
              ),
              cardKey: cardKeys[index],
            );
          }),
        ),
      ),
    );
  }
}
