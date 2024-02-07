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
      duration: const Duration(milliseconds: 8), // Approx. 120 FPS
    )..addListener(() {
        const delta = 1 / 120.0; // Assuming 120 FPS for smooth animation
        updatePosition(delta);
      });

    _controller!.repeat();
  }

  void updatePosition(double delta) {
    Size screenSize = MediaQuery.of(context).size;
    double cardWidth = widget.width; // Width of the Card
    double cardHeight = (widget.width * 333) / 234; // Height of the Card, assuming aspect ratio

    // Calculate new position based on direction and speed
    final newPosition = position + direction * (widget.speed * 100) * delta;

    // Initialize flags to determine collision type
    bool collidedWithVerticalEdge = false;
    bool collidedWithHorizontalEdge = false;

    // Check for collisions and set flags
    if (newPosition.dx <= 0 || newPosition.dx >= screenSize.width - cardWidth) {
      collidedWithVerticalEdge = true;
    }
    if (newPosition.dy <= 0 || newPosition.dy >= screenSize.height - cardHeight) {
      collidedWithHorizontalEdge = true;
    }

    // Adjust direction based on collision type
    if (collidedWithVerticalEdge) {
      direction = Offset(-direction.dx, direction.dy); // Invert horizontal component
    }
    if (collidedWithHorizontalEdge) {
      direction = Offset(direction.dx, -direction.dy); // Invert vertical component
    }

    // Calculate new position after collision adjustment
    // This prevents the card from going beyond the screen edges
    double newXPosition = max(0, min(screenSize.width - cardWidth, newPosition.dx));
    double newYPosition = max(0, min(screenSize.height - cardHeight, newPosition.dy));
    position = Offset(newXPosition, newYPosition);

    setState(() {}); // Trigger a rebuild with the new position
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: position,
      child: CardsPNG.drawCard(widget.card, width: widget.width),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
