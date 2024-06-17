import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:job_match_app/infrastructure/provider/SignUpForm_prov.dart';
import 'package:job_match_app/presentation/widgets/ProfileInformation/PersonalInformation/options_container.dart';
import '../../../widgets/ProfileInformation/PersonalInformation/information_container.dart';

class SignUpFormCompanies extends ConsumerWidget {
  const SignUpFormCompanies({super.key});

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
                    "Company Information",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                  ),
                  InformationContainer(
                    controller: signUpVariables.nameController,
                    labelText: 'Company Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the company name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  InformationContainer(
                    controller: signUpVariables.socialReason,
                    labelText: 'Social Reason',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the company name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  InformationContainer(
                    controller: signUpVariables.professionController,
                    labelText: 'Main Activity',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the main activity';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  InformationContainer(
                    controller: signUpVariables.placeOfResidenceController,
                    labelText: 'Localization',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the localization of the company';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  InformationContainer(
                    controller: signUpVariables.levelOfEducationController,
                    labelText: 'Legal Representative (Name, DNI, Charge)',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the level of education';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  const SizedBox(height: 16.0),
                  OptionsContainer(
                    onSelected: (typeJob) => signUpVariables.typeJob = typeJob,
                    icon: const Icon(FontAwesomeIcons.briefcase),
                    text: 'Types of Jobs Offered',
                    text_button: 'Select',
                  ),
                  const SizedBox(height: 16.0),
                  OptionsContainer(
                    onSelected: (language) =>
                        signUpVariables.selectedLanguage = language,
                    icon: const Icon(Icons.language),
                    text: 'Language',
                    text_button: 'Select',
                  ),
                  const SizedBox(height: 32.0),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 50),
                        backgroundColor: Colors.amber,
                      ),
                      onPressed: () {
                        if (signUpVariables.formKey.currentState != null) {
                          signUpVariables.formKey.currentState!.validate();
                          final companyData = {
                            'companyName': signUpVariables.nameController.text,
                            'language': signUpVariables.selectedLanguage,
                            'localization':
                                signUpVariables.placeOfResidenceController.text,
                            'typeJobs': signUpVariables.typeJob,
                            'mainActivity': signUpVariables.mainActivity.text,
                            'legalRepresentative':
                                signUpVariables.legalRepresentative.text,
                            'socialReason': signUpVariables.socialReason.text,
                          };

                          signUpVariables.enterpriseCollection.add(companyData);
                        } else {
                          null;
                        }
                      },
                      child: const Text(
                        'Save Changes',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
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
