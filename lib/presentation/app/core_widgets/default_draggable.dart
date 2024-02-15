import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class DefaultDraggable extends StatefulWidget {
  const DefaultDraggable({
    super.key,
    required this.child,
    this.childWhenDragging = const SizedBox(),
  });

  final Widget child;
  final Widget childWhenDragging;

  @override
  DefaultDraggableState createState() => DefaultDraggableState();
}

class DefaultDraggableState extends State<DefaultDraggable> {
  @override
  Widget build(BuildContext context) {
    return Draggable(
      childWhenDragging: widget.childWhenDragging,
      feedback: DraggableRotatingFeedback(child: widget.child),
      child: widget.child,
    );
  }
}

class DraggableRotatingFeedback extends StatefulWidget {
  const DraggableRotatingFeedback({super.key, required this.child});
  final Widget child;

  @override
  DraggableRotatingFeedbackState createState() => DraggableRotatingFeedbackState();
}

class DraggableRotatingFeedbackState extends State<DraggableRotatingFeedback> with SingleTickerProviderStateMixin {
  late Timer _timer;
  late AnimationController _controller;
  double _rotationSpeed = 1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(days: 10),
    )..repeat();

    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      setState(() {
        _rotationSpeed *= 1.1; // Increase speed by 10%
        _controller.duration = Duration(milliseconds: 846000000 ~/ _rotationSpeed);
        if (_controller.isAnimating) {
          _controller.forward(from: _controller.value); // Restart from current position
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
        return Transform.rotate(
          angle: 200000 * pi * _controller.value,
          child: child,
        );
      },
    );
  }
}
