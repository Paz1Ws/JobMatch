import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class JCBackgroundAnimation extends StatefulWidget {
  const JCBackgroundAnimation({super.key});

  @override
  State<JCBackgroundAnimation> createState() => _JCBackgroundAnimationState();
}

class _JCBackgroundAnimationState extends State<JCBackgroundAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            "assets/Rive/shapes.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          
        ],
      ),
    );
  }
}
