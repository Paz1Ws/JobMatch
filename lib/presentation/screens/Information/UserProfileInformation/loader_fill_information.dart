import 'package:flutter/material.dart';
import 'package:job_match_app/config/Languajes/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';

class LoaderFillInformation extends StatefulWidget {
  const LoaderFillInformation({super.key});

  @override
  _LoaderFillInformationState createState() => _LoaderFillInformationState();
}

class _LoaderFillInformationState extends State<LoaderFillInformation>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    // Esperar 2 segundos antes de iniciar la animación
    Future.delayed(const Duration(seconds: 2), () {
      _animationController = AnimationController(
        vsync: this,
        duration: const Duration(
            seconds: 15), // Establecer la duración en 15 segundos
      )..repeat();
      setState(() {}); // Actualizar el estado para iniciar la animación
    });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors
          .transparent, // Establecer el color de fondo como semi-transparente
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/video/UploadingCV.json',
            controller: _animationController,
          ),
          Text(
            '${AppLocalizations.of(context)?.subiendoCV}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          const CircularProgressIndicator(),
        ],
      )),
    );
  }
}
