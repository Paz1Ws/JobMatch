import 'package:flutter/material.dart';

class CurvedPainter extends CustomPainter {
  final Color color;
  const CurvedPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 10;

    var path = Path();

    path.moveTo(0, 0);
    path.moveTo(0, size.height * 0.7);

    path.quadraticBezierTo(size.width * 0.2, size.height * 0.8,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.8, size.width, size.height * 0.7);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
