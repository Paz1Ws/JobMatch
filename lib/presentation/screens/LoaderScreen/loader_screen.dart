import 'dart:async';

import 'package:flutter/material.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/Login/login_screen.dart';
import 'package:job_match_app/presentation/screens/HomeViews/home_view_user.dart';
import 'package:video_player/video_player.dart';

class ScreenLoader extends StatefulWidget {
  final bool userData;
  const ScreenLoader({super.key, required this.userData});
  @override
  _ScreenLoader createState() => _ScreenLoader();
}

class _ScreenLoader extends State<ScreenLoader> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/video/JobMatchSplash.mp4')
      ..initialize().then((_) {
        _controller.setPlaybackSpeed(0.50);
        _controller.play();
        setState(() {});
      });

    // Iniciar el temporizador para cambiar de pantalla después de 2 segundos
    Timer(const Duration(seconds: 5), () {
      if (widget.userData != true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      } else {
        // Redireccionar a la pantalla del usuario si está autenticado
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ScreenUser()),
        );
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
