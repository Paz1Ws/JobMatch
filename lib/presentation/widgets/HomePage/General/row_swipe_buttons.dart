import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';

class RowSwipeButtons extends StatelessWidget {
  const RowSwipeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 40,
            icon: const Icon(Ionicons.refresh_circle_sharp),
            color: const Color.fromARGB(255, 0, 207, 107),
            onPressed: () {
              // Acción al presionar el botón 1
            },
          ),
          IconButton(
            icon: const Icon(Ionicons.heart_circle_sharp),
            color: Colors.red,
            onPressed: () {
              // Acción al presionar el botón 2
            },
            iconSize: 70,
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.star),
            color: const Color.fromARGB(255, 255, 200, 18),
            onPressed: () {
              // Acción al presionar el botón 3
            },
          ),
          IconButton(
            icon: const Icon(Ionicons.close_circle_outline),
            color: Colors.grey,
            onPressed: () {
              // Acción al presionar el botón 4
            },
            iconSize: 70,
          ),
          IconButton(
            iconSize: 40,
            icon: const Icon(FontAwesomeIcons.bolt),
            color: const Color.fromARGB(255, 12, 137, 240),
            onPressed: () {
              // Acción al presionar el botón 5
            },
          ),
        ],
      ),
    );
  }
}
