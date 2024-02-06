import 'package:flutter/material.dart';

Path squirclePath(Rect rect, BorderRadius? radius) {
  final c = rect.center;
  final startX = rect.left;
  final endX = rect.right;
  final startY = rect.top;
  final endY = rect.bottom;

  final midX = c.dx;
  final midY = c.dy;

  if (radius == null) {
    return Path()
      ..moveTo(startX, midY)
      ..cubicTo(startX, startY, startX, startY, midX, startY)
      ..cubicTo(endX, startY, endX, startY, endX, midY)
      ..cubicTo(endX, endY, endX, endY, midX, endY)
      ..cubicTo(startX, endY, startX, endY, startX, midY)
      ..close();
  }

  return Path()

    // Start position
    ..moveTo(startX, startY + radius.topLeft.y)

    // top left corner
    ..cubicTo(
      startX,
      startY,
      startX,
      startY,
      startX + radius.topLeft.x,
      startY,
    )

    // top line
    ..lineTo(endX - radius.topRight.x, startY)

    // top right corner
    ..cubicTo(
      endX,
      startY,
      endX,
      startY,
      endX,
      startY + radius.topRight.y,
    )

    // right line
    ..lineTo(endX, endY - radius.bottomRight.y)

    // bottom right corner
    ..cubicTo(
      endX,
      endY,
      endX,
      endY,
      endX - radius.bottomRight.x,
      endY,
    )

    // bottom line
    ..lineTo(startX + radius.bottomLeft.x, endY)

    // bottom left corner
    ..cubicTo(
      startX,
      endY,
      startX,
      endY,
      startX,
      endY - radius.bottomLeft.y,
    )

    // left line
    //..moveTo(startX, startY + radius)
    ..close();
}

class SquircleBorder extends ShapeBorder {
  const SquircleBorder({
    this.side = BorderSide.none,
    this.radius,
  });

  final BorderSide side;
  final BorderRadius? radius;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  @override
  ShapeBorder scale(double t) {
    return SquircleBorder(
      side: side.scale(t),
      radius: radius,
    );
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return squirclePath(rect.deflate(side.width), radius);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return squirclePath(rect, radius);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    switch (side.style) {
      case BorderStyle.none:
        break;
      case BorderStyle.solid:
        final path = getOuterPath(rect.deflate(side.width / 2.0), textDirection: textDirection);
        canvas.drawPath(path, side.toPaint());
    }
  }
}
