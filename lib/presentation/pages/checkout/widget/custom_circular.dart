import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ibeauty/presentation/style/style.dart';

class ArcPainter extends CustomPainter {
  final int index;
  final double radius;
  double baseAngle;
  final Paint unselect = createPaintForColor(CustomStyle.icon);
  final Paint green = createPaintForColor(CustomStyle.greenColor);

  ArcPainter(this.radius, this.baseAngle, this.index);

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: radius);
    if (index == 2) {
      canvas.drawArc(
          rect, baseAngle + 1.1 / 3 * pi, sweepAngle(), false, green);
      canvas.drawArc(
          rect, baseAngle + 3.1 / 3 * pi, sweepAngle(), false, green);
      canvas.drawArc(
          rect, baseAngle + 5.1 / 3 * pi, sweepAngle(), false, unselect);
    } else if (index == 3) {
      canvas.drawArc(
          rect, baseAngle + 1.1 / 3 * pi, sweepAngle(), false, green);
      canvas.drawArc(
          rect, baseAngle + 3.1 / 3 * pi, sweepAngle(), false, green);
      canvas.drawArc(
          rect, baseAngle + 5.1 / 3 * pi, sweepAngle(), false, green);
    } else {
      canvas.drawArc(
          rect, baseAngle + 1.1 / 3 * pi, sweepAngle(), false, green);
      canvas.drawArc(
          rect, baseAngle + 3.1 / 3 * pi, sweepAngle(), false, unselect);
      canvas.drawArc(
          rect, baseAngle + 5.1 / 3 * pi, sweepAngle(), false, unselect);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  double sweepAngle() => 0.86 * 2 / 3 * pi;
}

Paint createPaintForColor(Color color) {
  return Paint()
    ..color = color
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = 15;
}
