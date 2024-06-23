import 'dart:typed_data';

import 'package:flutter/material.dart';

class PickImageWidget extends StatelessWidget {
  double height;
  double width;
  final VoidCallback onPickImage;
  PickImageWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.onPickImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Change profile picture');
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Center(
          child: Icon(Icons.add_a_photo, size: 40.0),
        ),
      ),
    );
  }
}
