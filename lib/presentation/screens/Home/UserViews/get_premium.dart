import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:job_match_app/presentation/widgets/ProfileInformation/curved_painter.dart';

class GetPremiumScreen extends StatelessWidget {
  const GetPremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                end: Alignment(0.0, 0.4),
                begin: Alignment(0.0, -1),
                colors: <Color>[
                  Color.fromARGB(255, 218, 10, 79),
                  Colors.deepOrange,
                ],
              ),
            ),
          ),
          const CustomPaint(
              painter: CurvedPainter(
            color: Colors.transparent,
          )),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/Premium.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Coming Soon...',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
