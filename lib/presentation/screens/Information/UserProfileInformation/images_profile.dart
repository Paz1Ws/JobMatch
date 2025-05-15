import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_match_app/infrastructure/provider/profile_information_prov.dart';
import 'package:job_match_app/presentation/widgets/ProfileInformation/PhotoZone/image_container.dart';

class PhotoSection extends ConsumerStatefulWidget {
  const PhotoSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PhotoSectionState();
  }
}

class _PhotoSectionState extends ConsumerState<PhotoSection> {
  Uint8List? _image;

  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * 0.58,
                left: 20.0,
                right: 20.0),
            child: Positioned(
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
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.84,
              left: 130.0,
            ),
            child: ElevatedButton(
              onPressed: () {
                _image != null
                    ? ref.read(change_page_valid).changePageValidMethod(true)
                    : ref.read(change_page_valid).changePageValidMethod(false);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              child: const Text(
                'Save Photos',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 200, top: MediaQuery.sizeOf(context).height / 1.11),
              child: Text(
                'Only Swipe ->',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          )
        ],
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
                        // _pickImageFromGallery();
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
                        // _pickImageFromCamera();
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
}
//   Future _pickImageFromGallery() async {
//     final returnImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (returnImage == null) return;
//     setState(() {
//       selectedImage = File(returnImage.path);
//       _image = File(returnImage.path).readAsBytesSync();
//     });
//     Navigator.of(context).pop(); //close the model sheet
//   }

//   Future _pickImageFromCamera() async {
//     final returnImage =
//         await ImagePicker().pickImage(source: ImageSource.camera);
//     if (returnImage == null) return;
//     setState(() {
//       selectedImage = File(returnImage.path);
//       _image = File(returnImage.path).readAsBytesSync();
//     });
//     Navigator.of(context).pop();
//   }
// }
