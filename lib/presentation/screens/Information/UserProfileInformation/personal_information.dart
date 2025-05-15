import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_match_app/infrastructure/provider/SignUpForm_prov.dart';
import 'package:job_match_app/infrastructure/provider/profile_information_prov.dart';
import 'package:job_match_app/presentation/widgets/ProfileInformation/PersonalInformation/options_container.dart';
import '../../../widgets/ProfileInformation/PersonalInformation/information_container.dart';

class SignUpForm extends ConsumerWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpVariables = ref.watch(signUpFormVariablesProvider);

    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: signUpVariables.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Personal Information",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                  ),
                  InformationContainer(
                    controller: signUpVariables.nameController,
                    labelText: 'Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  InformationContainer(
                    controller: signUpVariables.phoneNumberController,
                    keyboardType: TextInputType.phone,
                    labelText: 'Phone number',
                    validator: (value) {
                      if (value.toString().length != 9) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  InformationContainer(
                    controller: signUpVariables.professionController,
                    labelText: 'Main Profesión',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your main profession';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  InformationContainer(
                    controller: signUpVariables.placeOfResidenceController,
                    labelText: 'Place of residence',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your place of residence';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  InformationContainer(
                    controller: signUpVariables.levelOfEducationController,
                    labelText: 'Level of education',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your level of education';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  InformationContainer(
                    controller: signUpVariables.lastJobController,
                    labelText: 'Last job, position and company',
                  ),
                  const SizedBox(height: 16.0),
                  InformationContainer(
                    controller: signUpVariables.skillsController,
                    labelText: 'Skills (separate with commas)',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your skills';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  OptionsContainer(
                    onSelected: (language) =>
                        signUpVariables.selectedLanguage = language,
                    icon: const Icon(Icons.language),
                    text: 'Languaje',
                    text_button: 'Select',
                  ),
                  const SizedBox(height: 16.0),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      onPressed: () {
                        if (signUpVariables.formKey.currentState!.validate()) {
                          final candidateData = {
                            'name': signUpVariables.nameController.text,
                            'phone': signUpVariables.phoneNumberController.text,
                            'profession':
                                signUpVariables.professionController.text,
                            'studyCenter':
                                signUpVariables.studyCenterController.text,
                            'language': signUpVariables.selectedLanguage,
                            'levelOfEducation':
                                signUpVariables.levelOfEducationController.text,
                            'placeOfResidence':
                                signUpVariables.placeOfResidenceController.text,
                            'lastJob': signUpVariables.lastJobController.text
                                .split(',')
                                .map((skill) => skill.trim())
                                .toList(),
                            'skills': signUpVariables.skillsController.text
                                .split(',')
                                .map((skill) => skill.trim())
                                .toList(),
                          };

                          signUpVariables.candidateCollection
                              .add(candidateData);
                          ref
                              .read(change_page_valid)
                              .changePageValidMethod(true);
                        } else {
                          print("FormKey is null");
                        }
                      },
                      child: const Text(
                        'Save Information',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 220),
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
            ),
          ),
        ),
      ),
    );
  }
}
