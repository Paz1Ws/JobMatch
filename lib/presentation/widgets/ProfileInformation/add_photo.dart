import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotosSection extends StatefulWidget {
  const PhotosSection({super.key});

  @override
  State<PhotosSection> createState() => _PhotosSectionState();
}

class _PhotosSectionState extends State<PhotosSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agrega una foto de perfil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '¡Agrega una foto de perfil!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Agregar foto'),
            ),
          ],
        ),
      ),
    );
  }
}
