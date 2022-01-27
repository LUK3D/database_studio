import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurvedLine extends CustomPainter {
  final strockWidth = 8.0;
  final Color = Colors.black;
  final Path path = new Path();
  final quadraticBezierTo = [];
  @override
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color
      ..style = PaintingStyle.stroke
      ..strokeWidth = this.strockWidth;

    Path path = this.path;
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 100, size.width, 0);
    path.addPolygon([Offset(size.width / 2, size.height)], false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
