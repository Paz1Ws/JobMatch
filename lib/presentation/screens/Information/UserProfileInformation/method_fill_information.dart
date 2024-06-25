// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:job_match_app/domain/models/user_model.dart';
import 'package:job_match_app/infrastructure/provider/ai_recognition.dart';
import 'package:job_match_app/infrastructure/provider/cv_recognizer.dart';
import 'package:job_match_app/infrastructure/provider/profile_information_prov.dart';
import 'package:job_match_app/presentation/screens/Information/UserProfileInformation/loader_fill_information.dart';

class MethodsFillInformation extends ConsumerStatefulWidget {
  const MethodsFillInformation({super.key});

  @override
  _MethodsFillInformationState createState() => _MethodsFillInformationState();
}

class _MethodsFillInformationState
    extends ConsumerState<MethodsFillInformation> {
  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userProvider);

    return ref.watch(loadingCV) == true
        ? const Scaffold(body: LoaderFillInformation())
        : Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Select a method\nto fill your information',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      ref.read(loadingCV.notifier).state = true;
                      final result = await FilePicker.platform.pickFiles(
                        allowMultiple: false,
                        type: FileType.any,
                      );
                      if (result != null) {
                        final filePath = result.files.single.path;
                        await CVRecognizer().recognizeCV(filePath!, ref);
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 199, 143, 143)),
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/CV.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Uploading CV',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      AIRecognizer().AIRecognization("hi", ref);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/AI.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'By AI recognition',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 200),
                    child: ElevatedButton.icon(
                      icon: Icon(
                        user == null ? FontAwesomeIcons.pen : Icons.person,
                        color: Colors.amber,
                      ),
                      label: Text(
                        user == null
                            ? 'Fill by typing'
                            : 'Welcome ${user.personalInfo.names}',
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        user == null
                            ? ref
                                .read(change_page_valid)
                                .changePageValidMethod(true)
                            : context.go('/user_home_true');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: ref.watch(change_page_valid).changepageValid &&
                        user == null,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 220),
                      child: Text(
                        'Swipe to continue',
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
            ),
          );
  }
}
