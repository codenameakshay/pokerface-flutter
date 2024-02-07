part of '../view.dart';

class DiagonalMovingCard extends StatefulWidget {
  final GlobalKey<DiagonalMovingCardState> cardKey;

  const DiagonalMovingCard({
    super.key,
    required this.card,
    this.width = 48,
    this.speed = 1,
    this.initialDirection = const Offset(1, 1),
    this.initialPosition = const Offset(0, 0),
    required this.cardKey,
  });

  final String card;
  final double width;
  final double speed;
  final Offset initialDirection;
  final Offset initialPosition;

  @override
  DiagonalMovingCardState createState() => DiagonalMovingCardState();

  void randomizeMovement() {
    cardKey.currentState?.randomizeMovement();
  }
}

class DiagonalMovingCardState extends State<DiagonalMovingCard> with TickerProviderStateMixin {
  AnimationController? _controller;
  AnimationController? _glowController;
  Animation<Color?>? _glowColorAnimation;
  late double speed; // Initial speed
  late Offset direction; // Initial direction
  late Offset position; // Initial position

  @override
  void initState() {
    super.initState();
    speed = widget.speed * 100;
    direction = widget.initialDirection;
    position = widget.initialPosition;
    startAnimationLoop();

    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
    );
    _glowColorAnimation = ColorTween(
      begin: Colors.black.withOpacity(0),
      end: Colors.black,
    ).animate(_glowController!)
      ..addListener(() {
        setState(() {});
      });
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
    final newPosition = position + direction * speed * delta;

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

    // Corner detection
    bool isCornerHit = (newPosition.dx <= 0 || newPosition.dx >= screenSize.width - cardWidth) &&
        (newPosition.dy <= 0 || newPosition.dy >= screenSize.height - cardHeight);

    if (isCornerHit || collidedWithHorizontalEdge || collidedWithVerticalEdge) {
      // Trigger glow effect
      _glowController!.forward(from: 0).then((_) => _glowController!.reverse());
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

  void randomizeMovement() {
    setState(() {
      direction = Offset(Random().nextDouble() * 2 - 1, Random().nextDouble() * 2 - 1);
      if (speed < 1000) {
        speed += 250;
      } else {
        speed = Random().nextDouble() * 60 + 40;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: position,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: _glowColorAnimation!.value ?? Colors.black.withOpacity(0),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: CardsPNG.drawCard(widget.card, width: widget.width),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    _glowController?.dispose();
    super.dispose();
  }
}
