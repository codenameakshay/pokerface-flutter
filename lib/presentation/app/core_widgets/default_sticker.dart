import 'package:flutter/material.dart';

class DraggableSticker extends StatefulWidget {
  const DraggableSticker({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<DraggableSticker> createState() => _DraggableStickerState();
}

class _DraggableStickerState extends State<DraggableSticker> with SingleTickerProviderStateMixin {
  Offset position = Offset.zero;
  double scale = 1.0;
  double rotation = 0.0;
  Offset? initialFocalPoint;
  late AnimationController _controller;
  late Animation<Offset> _positionAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  DateTime? _lastAnimationTime;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _controller.addListener(() {
      setState(() {
        position = _positionAnimation.value;
        scale = _scaleAnimation.value;
        rotation = _rotationAnimation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _runAnimation(Offset finalPosition, double finalScale, double finalRotation) {
    final now = DateTime.now();
    if (_lastAnimationTime != null && now.difference(_lastAnimationTime!) < const Duration(milliseconds: 500)) {
      // If the last animation was started less than 500ms ago, do nothing
      return;
    }
    _lastAnimationTime = now;

    _positionAnimation = Tween<Offset>(
      begin: position,
      end: finalPosition,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _scaleAnimation = Tween<double>(
      begin: scale,
      end: finalScale,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _rotationAnimation = Tween<double>(
      begin: rotation,
      end: finalRotation,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (details) {
        final now = DateTime.now();
        if (_lastAnimationTime != null && now.difference(_lastAnimationTime!) < const Duration(milliseconds: 500)) {
        } else {
          _controller.stop();
        }
        initialFocalPoint = details.focalPoint;
      },
      onScaleUpdate: (details) {
        final now = DateTime.now();
        if (_lastAnimationTime != null && now.difference(_lastAnimationTime!) < const Duration(milliseconds: 500)) {
        } else {
          setState(() {
            if (initialFocalPoint != null) {
              position += details.focalPoint - initialFocalPoint!;
              initialFocalPoint = details.focalPoint;
            }
            scale = details.scale.clamp(0.5, 3.0);
            rotation = details.rotation;
          });
        }
      },
      onScaleEnd: (details) {
        _runAnimation(Offset.zero, 1.0, 0.0);
      },
      child: Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..translate(position.dx, position.dy)
          ..scale(scale)
          ..rotateZ(rotation),
        child: widget.child,
      ),
    );
  }
}
