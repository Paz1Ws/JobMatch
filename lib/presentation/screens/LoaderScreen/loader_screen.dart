import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/Login/login_screen.dart';
import 'package:job_match_app/presentation/screens/HomeViews/home_view_user.dart';
import 'package:video_player/video_player.dart';

class ScreenLoader extends StatefulWidget {
  final bool userData;
  const ScreenLoader({super.key, required this.userData});
  @override
  _ScreenLoaderState createState() => _ScreenLoaderState();
}

class _ScreenLoaderState extends State<ScreenLoader> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/video/JobMatchSplash.mp4')
      ..initialize().then((_) {
        _controller.setPlaybackSpeed(0.70);
        _controller.setLooping(false);
        _controller.play();
        setState(() {});
      });

    // Iniciar el temporizador para cambiar de pantalla después de 2 segundos
    Timer(const Duration(milliseconds: 3400), () {
      if (widget.userData != true) {
        context.go('/login');
      } else {
        context.go('/user_home');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _controller.value.isInitialized
          ? SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
