part of '../view.dart';

class DiagonalMovingCard extends StatefulWidget {
  const DiagonalMovingCard({
    super.key,
    required this.card,
    this.width = 48,
    this.speed = 1,
    this.initialDirection = const Offset(1, 1),
    this.initialPosition = const Offset(0, 0),
  });

  final String card;
  final double width;
  final double speed;
  final Offset initialDirection;
  final Offset initialPosition;

  @override
  DiagonalMovingCardState createState() => DiagonalMovingCardState();
}

class DiagonalMovingCardState extends State<DiagonalMovingCard> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  late Offset direction; // Initial direction
  late Offset position; // Initial position

  @override
  void initState() {
    super.initState();
    direction = widget.initialDirection;
    position = widget.initialPosition;
    startAnimationLoop();
  }

  void startAnimationLoop() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 16), // Approx. 120 FPS
    )..addListener(() {
        const delta = 1 / 60.0; // Assuming 120 FPS for smooth animation
        updatePosition(delta);
      });

    _controller!.repeat();
  }

  void updatePosition(double delta) {
    Size screenSize = MediaQuery.of(context).size;
    double cardWidth = widget.width; // Width of the Card
    double cardHeight = (widget.width * 333) / 234; // Height of the Card

    // Calculate new position based on direction and speed
    final newPosition = position + direction * (widget.speed * 100) * delta;

    // Adjust newPosition to consider the card's dimensions for edge collisions
    // Check for collisions with the right and bottom edges by subtracting cardWidth and cardHeight respectively
    bool isCollidingRightOrBottom =
        newPosition.dx > screenSize.width - cardWidth || newPosition.dy > screenSize.height - cardHeight;
    bool isCollidingLeftOrTop = newPosition.dx < 0 || newPosition.dy < 0;

    if (isCollidingRightOrBottom || isCollidingLeftOrTop) {
      direction = pickRandomDirection(); // Pick a new direction

      // Adjust position to prevent the card from moving beyond the screen edges
      double newXPosition = max(0, min(screenSize.width - cardWidth, newPosition.dx));
      double newYPosition = max(0, min(screenSize.height - cardHeight, newPosition.dy));
      position = Offset(newXPosition, newYPosition);
    } else {
      position = newPosition;
    }

    setState(() {}); // Trigger a rebuild with the new position
  }

  Offset pickRandomDirection() {
    Random random = Random();
    int choice = random.nextInt(4); // Pick a random direction
    switch (choice) {
      case 0:
        return const Offset(1, 1);
      case 1:
        return const Offset(-1, 1);
      case 2:
        return const Offset(-1, -1);
      case 3:
        return const Offset(1, -1);
      default:
        return const Offset(1, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: position,
      child: Cards.drawCard(widget.card, width: widget.width),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
