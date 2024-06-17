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
// For companies
final enterpriseCollectionProvider = Provider((ref) {
  final firestore = ref.watch(firestoreProvider);
  return firestore.collection('enterprises');
});
var typeJobProvider = Provider((ref) => '');
final mainActivityProvider = Provider((ref) => TextEditingController());
final legalRepresentativeProvider = Provider((ref) => TextEditingController());
final socialReasonProvider = Provider((ref) => TextEditingController());
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
  // For companies

  final CollectionReference enterpriseCollection;
  final TextEditingController mainActivity;
  final TextEditingController legalRepresentative;
  final TextEditingController socialReason;

  String selectedLanguage;
  String typeJob;

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
    required this.typeJob,
    required this.levelOfEducationController,
    required this.placeOfResidenceController,
    required this.lastJobController,
    // For companies
    required this.enterpriseCollection,
    required this.mainActivity,
    required this.legalRepresentative,
    required this.socialReason,
  });
}

final signUpFormVariablesProvider = Provider((ref) {
  // For users
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
  // For companies
  final enterpriseCollection = ref.watch(enterpriseCollectionProvider);
  final typeJob = ref.watch(typeJobProvider);
  final mainActivityController = ref.watch(mainActivityProvider);
  final legalRepresentativeController = ref.watch(legalRepresentativeProvider);
  final socialReasonController = ref.watch(socialReasonProvider);

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
    typeJob: typeJob,
    lastJobController: lastJobController,
    levelOfEducationController: levelOfEducationController,
    placeOfResidenceController: placeOfResidenceController,
    // For companies
    enterpriseCollection: enterpriseCollection,
    mainActivity: mainActivityController,
    legalRepresentative: legalRepresentativeController,
    socialReason: socialReasonController,
  );
});
