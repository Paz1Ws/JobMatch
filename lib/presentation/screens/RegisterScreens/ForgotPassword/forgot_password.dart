import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_match_app/config/Languajes/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:job_match_app/presentation/widgets/LoginWidgets/snackbar.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: () {
            myDialogBox(context);
          },
          child: Text(
            "${AppLocalizations.of(context)?.olvidasteTuContrasena}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }

  void myDialogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Forgot Your Password",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    cursorColor: const Color.fromARGB(255, 0, 0, 0),
                    controller: emailController,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    decoration: InputDecoration(
                      labelText: "Enter the Email",
                      hintText: "eg abc@gmail.com",
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      labelStyle:
                          const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 243, 33, 33)),
                    onPressed: () async {
                      await auth
                          .sendPasswordResetEmail(email: emailController.text)
                          .then((value) {
                        // if success then show this message
                        showSnackBar(context,
                            "We have send you the reset password link to your email id, Please check it");
                      }).onError((error, stackTrace) {
                        // if unsuccess then show error message
                        showSnackBar(context, error.toString());
                      });
                      // terminate the dialog after send the forgot password link
                      Navigator.pop(context);
                      // clear the text field
                      emailController.clear();
                    },

                    // if we remember the password then we can easily login
                    // if we forget the password then we apply this method
                    child: const Text(
                      "Send",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
