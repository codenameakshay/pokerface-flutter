import 'package:flutter/material.dart';

class DashedBorder extends ShapeBorder {
  final double dashWidth;
  final double dashSpace;
  final double strokeWidth;
  final bool top;
  final bool left;
  final bool bottom;
  final bool right;
  final Paint painter;

  DashedBorder({
    this.dashWidth = 5.0,
    this.dashSpace = 3.0,
    this.strokeWidth = 1.0,
    this.top = false,
    this.bottom = false,
    this.left = false,
    this.right = false,
    Color color = Colors.black,
  }) : painter = Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke;

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(1);

  @override
  ShapeBorder scale(double t) {
    return this;
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    var path = Path();
    path.addRect(rect);
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    var path = Path();
    double x = 0.0, y = 0.0;
    while (x < rect.width) {
      path.moveTo(rect.left + x, rect.top);
      if (top) path.lineTo(rect.left + x + dashWidth, rect.top);
      x += dashWidth + dashSpace;
    }
    while (y < rect.height) {
      path.moveTo(rect.right, rect.top + y);
      if (right) path.lineTo(rect.right, rect.top + y + dashWidth);
      y += dashWidth + dashSpace;
    }
    x = 0.0;
    y = 0.0;
    while (x < rect.width) {
      path.moveTo(rect.left + x, rect.bottom);
      if (bottom) path.lineTo(rect.left + x + dashWidth, rect.bottom);
      x += dashWidth + dashSpace;
    }
    while (y < rect.height) {
      path.moveTo(rect.left, rect.top + y);
      if (left) path.lineTo(rect.left, rect.top + y + dashWidth);
      y += dashWidth + dashSpace;
    }
    canvas.drawPath(path, painter);
  }
}
