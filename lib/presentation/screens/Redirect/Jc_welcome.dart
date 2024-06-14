import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:job_match_app/presentation/widgets/theme_button.dart';

class JcWelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(left: 0, top: 5, right: 1),
            child: ThemeButton(),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Positioned(
            right: 30,
            child: FilledButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 243, 89, 33)),
              ),
              onPressed: () {
                context.go('/userlogin');
              },
              child: Text('Candidato'),
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: Expanded(
              child: Image.asset(
                'assets/images/JcPhoto.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16),
          Positioned(
            right: 100,
            bottom: 350,
            child: FilledButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 243, 89, 33)),
              ),
              onPressed: () {
                context.go('/enterpriselogin');
              },
              child: Text('Empresa'),
            ),
          ),
        ],
      ),
    );
  }
}
