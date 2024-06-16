import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_match_app/presentation/widgets/ProfileInformation/PhotoZone/image_container.dart';

class PhotoSection extends StatefulWidget {
  const PhotoSection({super.key});

  @override
  State<PhotoSection> createState() => _PhotoSectionState();
}

class _PhotoSectionState extends State<PhotoSection> {
  Uint8List? _image;

  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        // Wrap the content with SafeArea
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 20),
                  child: Text(
                    "Photo Zone",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(bottom: 120),
                  child: Center(
                    child: PhotoSelectionButton(
                      placeholderAsset: "assets/images/BorderImageBig.png",
                      height: MediaQuery.of(context).size.height / 2.5,
                      width: MediaQuery.of(context).size.width / 1.5,
                      onPickImage: () {
                        showImagePickerOption(context);
                      },
                      image: _image,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              // Position the row of buttons at the bottom
              bottom: 80.0, // Adjust the bottom padding as needed
              left: 10.0,
              right: 10.0,
              child: Row(
                children: [
                  Expanded(
                    child: PhotoSelectionButton(
                      placeholderAsset: "assets/images/BorderImage.png",
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width / 3,
                      onPickImage: () {
                        showImagePickerOption(context);
                      },
                      image: null,
                    ),
                  ),
                  const SizedBox(
                      width: 10), // Add spacing between buttons (optional
                  Expanded(
                    child: PhotoSelectionButton(
                      placeholderAsset: "assets/images/BorderImage.png",
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width / 3,
                      onPickImage: () {
                        showImagePickerOption(context);
                      },
                      image: null,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: PhotoSelectionButton(
                      placeholderAsset: "assets/images/BorderImage.png",
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width / 3,
                      onPickImage: () {
                        showImagePickerOption(context);
                      },
                      image: null,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20.0,
              right: 20.0,
              child: ElevatedButton(
                onPressed: () {
                  // Add your logic here
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                child: Text(
                  'Swipe to continue',
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.orange,
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6,
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
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
                      onTap: () {
                        _pickImageFromCamera();
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
          ),
        );
      },
    );
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
