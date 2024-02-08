import 'dart:ui';

import 'package:flutter/material.dart';

class DashedRectPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;
  final double dashWidth;
  final double borderRadius;

  DashedRectPainter({
    this.color = Colors.black,
    this.strokeWidth = 2.0,
    this.gap = 5.0,
    this.dashWidth = 5.0,
    this.borderRadius = 12.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    var path = Path();
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(borderRadius),
      ),
    );

    Path dashPath = Path();

    for (PathMetric pathMetric in path.computeMetrics()) {
      final double length = pathMetric.length;
      double distance = 0.0;
      while (distance < length) {
        dashPath.addPath(pathMetric.extractPath(distance, distance + dashWidth), Offset.zero);
        distance += dashWidth + gap;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
