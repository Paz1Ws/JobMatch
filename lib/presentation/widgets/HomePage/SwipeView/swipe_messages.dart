import 'package:flutter/material.dart';

class SwipeText extends StatelessWidget {
  final String text;
  final Color color;
  final Alignment alignment;

  SwipeText({required this.text, required this.color, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: 1.0, // Opacidad inicial
      child: Align(
        alignment: alignment,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }
}
