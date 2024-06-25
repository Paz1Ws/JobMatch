import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoaderFillInformation extends StatefulWidget {
  const LoaderFillInformation({super.key});

  @override
  _LoaderFillInformationState createState() => _LoaderFillInformationState();
}

class _LoaderFillInformationState extends State<LoaderFillInformation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15), // Set the duration to 15 seconds
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white
          .withOpacity(0.5), // Set the background color to semi-transparent
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/video/UploadingCV.json',
              controller: _animationController,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
