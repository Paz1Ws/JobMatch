import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final pickImageFromGallery = Provider((ref) => _pickImageFromGallery);
final pickImageFromCamera = Provider((ref) => _pickImageFromCamera);
final imageProvider = StateProvider((ref) => null);
final showImagePickerOptionProvider = Provider((ref) {
  return (BuildContext context,
      void Function(Uint8List? imageData) updateImage) async {
    showModalBottomSheet(
      backgroundColor: Colors.blue[100],
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4.5,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final imageData = await _pickImageFromGallery();
                      if (imageData != null) {
                        final imageData = await _pickImageFromGallery();
                        if (imageData != null) {
                          updateImage(imageData);
                          Navigator.of(context).pop();
                        }
                      }
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 70,
                          ),
                          Text("Gallery")
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      // final image = await _pickImageFromCamera();
                      _pickImageFromCamera();
                      final imageData = await _pickImageFromCamera();
                      if (imageData != null) {
                        updateImage(imageData);
                        Navigator.of(context).pop();
                      }
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 70,
                          ),
                          Text("Camera")
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  };
});
Future<Uint8List?> _pickImageFromGallery() async {
  final picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: ImageSource.gallery);
  if (pickedImage != null) {
    return pickedImage.readAsBytes();
  } else {
    return null;
  }
}

Future<Uint8List?> _pickImageFromCamera() async {
  final picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: ImageSource.camera);
  if (pickedImage != null) {
    return pickedImage.readAsBytes();
  } else {
    return null;
  }
}
