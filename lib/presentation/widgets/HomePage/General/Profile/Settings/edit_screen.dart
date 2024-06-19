import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';

import 'edit_item.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  String gender = "man";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Ionicons.chevron_back_outline),
        ),
        leadingWidth: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Ionicons.checkmark, color: Colors.orange),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Edit Account",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              EditItem(
                icon: const Icon(
                  Ionicons.image_outline,
                ),
                title: "Profile Photo",
                widget: Column(
                  children: [
                    const Icon(
                      Ionicons.person_outline,
                      size: 100,
                      color: Colors.grey,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.lightBlueAccent,
                      ),
                      child: const Text("Upload Image"),
                    )
                  ],
                ),
              ),
              EditItem(
                icon: const Icon(
                  Ionicons.person_outline,
                ),
                title: "Full Name",
                widget: const TextField(),
              ),
              const SizedBox(
                height: 40,
              ),
              EditItem(
                icon: const Icon(FontAwesomeIcons.genderless),
                title: "Gender",
                widget: Padding(
                  padding: const EdgeInsets.only(left: 55, top: 10),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            gender = "man";
                          });
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: gender == "man"
                              ? Colors.orange
                              : Colors.grey.shade200,
                          fixedSize: const Size(50, 50),
                        ),
                        icon: Icon(
                          Ionicons.male,
                          color: gender == "man" ? Colors.white : Colors.black,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            gender = "woman";
                          });
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: gender == "woman"
                              ? Colors.orange
                              : Colors.grey.shade200,
                          fixedSize: const Size(50, 50),
                        ),
                        icon: Icon(
                          Ionicons.female,
                          color:
                              gender == "woman" ? Colors.white : Colors.black,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              EditItem(
                icon: const Icon(
                  Ionicons.calendar_outline,
                ),
                widget: const TextField(
                  keyboardType: TextInputType.number,
                ),
                title: "Age",
              ),
              const SizedBox(height: 40),
              EditItem(
                icon: const Icon(
                  Ionicons.mail_outline,
                ),
                widget: const TextField(),
                title: "Email",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
