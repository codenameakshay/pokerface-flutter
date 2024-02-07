part of '../view.dart';

class StackCards extends StatefulWidget {
  const StackCards({super.key, this.width = 48});

  final double width;

  @override
  StackCardsState createState() => StackCardsState();
}

class StackCardsState extends State<StackCards> with SingleTickerProviderStateMixin {
  List<String> cards = [];

  @override
  void initState() {
    super.initState();
    // pick random 10 from all without Face Cards from available front cards
    cards = List.generate(
      25,
      (index) =>
          CardsPNG.fronts.allWithoutFaceCardsPNG[Random().nextInt(CardsPNG.fronts.allWithoutFaceCardsPNG.length)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: cards
          .map((e) => DiagonalMovingCard(
                card: e,
                width: widget.width,
                speed: Random().nextDouble() * 0.6 + 0.4,
                initialDirection: Offset(Random().nextDouble() * 2 - 1, Random().nextDouble() * 2 - 1),
                initialPosition: Offset(
                  Random().nextDouble() * MediaQuery.of(context).size.width,
                  Random().nextDouble() * MediaQuery.of(context).size.height,
                ),
              ))
          .toList(),
    );
  }
}
