import 'dart:typed_data';
import 'package:flutter/material.dart';

class PhotoSelectionButton extends StatefulWidget {
  final VoidCallback onPickImage; // Callback triggered on image selection
  final String placeholderAsset; // Path to placeholder image (optional)
  final Uint8List? image; // Imagen para este botón específico
  final double height;
  final double width;
  const PhotoSelectionButton({
    super.key,
    required this.height,
    required this.width,
    required this.onPickImage,
    required this.image,
    required this.placeholderAsset,
  });

  @override
  State<PhotoSelectionButton> createState() => _PhotoSelectionButtonState();
}

class _PhotoSelectionButtonState extends State<PhotoSelectionButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Container for displaying image or placeholder
        Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: widget.image != null
                ? DecorationImage(
                    image: MemoryImage(widget.image!),
                    fit: BoxFit.fill,
                  )
                : (widget.placeholderAsset.isNotEmpty
                    ? DecorationImage(
                        image: AssetImage(widget.placeholderAsset),
                        fit: BoxFit.fill,
                      )
                    : null),
          ),
        ),

        // Button for selecting image
        Positioned(
          bottom: 10.0,
          right: 10.0,
          child: IconButton(
            onPressed: () => widget.onPickImage(),
            icon: const Icon(Icons.add_a_photo),
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            iconSize: 30.0, // Adjust icon size as needed
          ),
        ),
      ],
    );
  }
}
