// From pub.dev package loading_animation_widget

import 'dart:math' as math;

import 'package:flutter/material.dart';

class DrawDot extends StatelessWidget {
  const DrawDot.circular({
    super.key,
    required double dotSize,
    required this.color,
  })  : width = dotSize,
        height = dotSize,
        circular = true;

  const DrawDot.elliptical({
    super.key,
    required this.width,
    required this.height,
    required this.color,
  }) : circular = false;
  final double width;
  final double height;
  final bool circular;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        shape: circular ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: circular ? null : BorderRadius.all(Radius.elliptical(width, height)),
      ),
    );
  }
}

class SwivelDot extends StatelessWidget {
  const SwivelDot.left({
    super.key,
    required this.color,
    required this.dotSize,
    required this.rotationOrigin,
    required this.controller,
    required this.firstInterval,
    required this.secondInterval,
    required this.thirdInterval,
    required this.fourthInterval,
  }) : left = true;

  const SwivelDot.right({
    super.key,
    required this.color,
    required this.dotSize,
    required this.rotationOrigin,
    required this.controller,
    required this.firstInterval,
    required this.secondInterval,
    required this.thirdInterval,
    required this.fourthInterval,
  }) : left = false;
  final double dotSize;
  final Offset rotationOrigin;
  final Color color;
  final AnimationController controller;
  final bool left;
  final double firstInterval;
  final double secondInterval;
  final double thirdInterval;
  final double fourthInterval;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Visibility(
          visible: controller.value <= thirdInterval,
          child: Transform.rotate(
            origin: rotationOrigin,
            angle: Tween<double>(
              begin: 0,
              end: left ? math.pi / 5 : -math.pi / 5,
            )
                .animate(
                  CurvedAnimation(
                    parent: controller,
                    curve: Interval(
                      firstInterval,
                      secondInterval,
                      // curve: curve,
                    ),
                  ),
                )
                .value,
            child: DrawDot.circular(
              color: color,
              dotSize: dotSize,
            ),
          ),
        ),
        Visibility(
          visible: controller.value >= thirdInterval,
          child: Transform.rotate(
            origin: rotationOrigin,
            angle: Tween<double>(
              begin: left ? math.pi / 5 : -math.pi / 5,
              end: 0,
            )
                .animate(
                  CurvedAnimation(
                    parent: controller,
                    curve: Interval(
                      thirdInterval,
                      fourthInterval,
                      // curve: curve,
                    ),
                  ),
                )
                .value,
            child: DrawDot.circular(
              color: color,
              dotSize: dotSize,
            ),
          ),
        ),
      ],
    );
  }
}

class NewtonCradle extends StatefulWidget {
  const NewtonCradle({
    super.key,
    required this.size,
    required this.color,
  });
  final double size;
  final Color color;

  @override
  State<NewtonCradle> createState() => _NewtonCradleState();
}

class _NewtonCradleState extends State<NewtonCradle> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final dotSize = widget.size / 10;
    final rotationOrigin = Offset(0, -widget.size / 2);
    final color = widget.color;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, __) => SizedBox(
        width: widget.size,
        height: widget.size,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwivelDot.left(
              color: color,
              controller: _animationController,
              dotSize: dotSize,
              rotationOrigin: rotationOrigin,
              firstInterval: 0,
              secondInterval: 0.20,
              thirdInterval: 0.30,
              fourthInterval: 0.50,
            ),
            DrawDot.circular(
              dotSize: dotSize,
              color: color,
            ),
            DrawDot.circular(
              dotSize: dotSize,
              color: color,
            ),
            SwivelDot.right(
              color: color,
              controller: _animationController,
              dotSize: dotSize,
              rotationOrigin: rotationOrigin,
              firstInterval: 0.50,
              secondInterval: 0.70,
              thirdInterval: 0.80,
              fourthInterval: 1,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
