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
    // pick random 10 from all available front cards
    cards = List.generate(
      10,
      (index) => Cards.fronts.all[Random().nextInt(Cards.fronts.all.length)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: cards.map((e) => DiagonalMovingCard(card: e, width: widget.width)).toList(),
    );
  }
}
