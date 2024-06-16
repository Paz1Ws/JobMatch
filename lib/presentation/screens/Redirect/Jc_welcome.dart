import 'package:flutter/material.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/Login/ForEnterprises/enterprises_login.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/Login/ForUsers/users_login.dart';
import 'package:job_match_app/presentation/widgets/theme_button.dart';

class JcWelcomeScreen extends StatelessWidget {
  const JcWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido a JobMatch'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(left: 0, top: 5, right: 1),
            child: ThemeButton(),
          ),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 100,
              ),
              child: FadeInImage(
                placeholder: const AssetImage('assets/images/JcPhoto.png'),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.sizeOf(context).width,
                image: const AssetImage('assets/images/JcPhoto.png'),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  top: 150,
                  left: 20,
                ),
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 243, 89, 33)),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  },
                  child: const Text(
                    'Candidato',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                )),
            const SizedBox(height: 16),
            Positioned(
              right: 40,
              bottom: 390,
              child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 243, 89, 33)),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RucLoginScreen()));
                },
                child: const Text('Empresa',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 500,
              ),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  final isDarkTheme =
                      Theme.of(context).brightness == Brightness.dark;
                  final gradient = LinearGradient(
                    colors: isDarkTheme
                        ? [Colors.white, Colors.orange]
                        : [Colors.black, Colors.orange],
                    stops: const [0.3, 1.4],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  );
                  return gradient.createShader(bounds);
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text:
                        '¡Hola! Soy JC y estamos aquí para ayudarte a alcanzar tus metas y superar tus desafíos. \nPor favor elige una de las dos opciones',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
