import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final formKeyProvider = Provider((ref) => GlobalKey<FormState>());

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

final candidateCollectionProvider = Provider((ref) {
  final firestore = ref.watch(firestoreProvider);
  return firestore.collection('candidates');
});

final nameControllerProvider = Provider((ref) => TextEditingController());

final phoneNumberControllerProvider =
    Provider((ref) => TextEditingController());

final professionControllerProvider = Provider((ref) => TextEditingController());
final levelOfEducationControllerProvider =
    Provider((ref) => TextEditingController());
final lastJobControllerProvider = Provider((ref) => TextEditingController());
final placeOfResidenceControllerProvider =
    Provider((ref) => TextEditingController());

final studyCenterControllerProvider =
    Provider((ref) => TextEditingController());

final skillsControllerProvider = Provider((ref) => TextEditingController());

var selectedLanguageProvider = Provider((ref) => '');
var isButtonEnabledProvider = Provider((ref) => false);

class SignUpFormVariables {
  final GlobalKey<FormState> formKey;
  final FirebaseFirestore firestore;
  final CollectionReference candidateCollection;
  final TextEditingController nameController;
  final TextEditingController professionController;
  final TextEditingController studyCenterController;
  final TextEditingController skillsController;
  final TextEditingController levelOfEducationController;
  final TextEditingController lastJobController;
  final TextEditingController placeOfResidenceController;
  final TextEditingController phoneNumberController;
  String selectedLanguage;

  SignUpFormVariables({
    required this.phoneNumberController,
    required this.formKey,
    required this.firestore,
    required this.candidateCollection,
    required this.nameController,
    required this.professionController,
    required this.studyCenterController,
    required this.skillsController,
    required this.selectedLanguage,
    required this.levelOfEducationController,
    required this.placeOfResidenceController,
    required this.lastJobController,
  });
}

final signUpFormVariablesProvider = Provider((ref) {
  final formKey = ref.watch(formKeyProvider);
  final firestore = ref.watch(firestoreProvider);
  final candidateCollection = ref.watch(candidateCollectionProvider);
  final nameController = ref.watch(nameControllerProvider);
  final phoneNumberController = ref.watch(phoneNumberControllerProvider);
  final professionController = ref.watch(professionControllerProvider);
  final studyCenterController = ref.watch(studyCenterControllerProvider);
  final skillsController = ref.watch(skillsControllerProvider);
  final lastJobController = ref.watch(lastJobControllerProvider);
  var selectedLanguage = ref.watch(selectedLanguageProvider);
  final placeOfResidenceController =
      ref.watch(placeOfResidenceControllerProvider);
  final levelOfEducationController =
      ref.watch(levelOfEducationControllerProvider);

  return SignUpFormVariables(
    phoneNumberController: phoneNumberController,
    formKey: formKey,
    firestore: firestore,
    candidateCollection: candidateCollection,
    nameController: nameController,
    professionController: professionController,
    studyCenterController: studyCenterController,
    skillsController: skillsController,
    selectedLanguage: selectedLanguage,
    lastJobController: lastJobController,
    levelOfEducationController: levelOfEducationController,
    placeOfResidenceController: placeOfResidenceController,
  );
});
