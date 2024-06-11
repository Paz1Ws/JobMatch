import 'package:flutter/material.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/Login/Google/login_with_google.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/Login/login_screen.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/SignUp/sign_up_screen.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/ForgotPassword/forgot_password.dart';
import 'package:job_match_app/presentation/screens/HomeViews/home_view_user.dart';

import 'package:job_match_app/presentation/widgets/LoginWidgets/login_button.dart';
import 'package:job_match_app/presentation/widgets/LoginWidgets/snackbar.dart';
import 'package:job_match_app/presentation/widgets/LoginWidgets/text_field_input.dart';

import '../../../../../infrastructure/services/authentication.dart';

class RucLoginScreen extends StatefulWidget {
  const RucLoginScreen({super.key});

  @override
  State<RucLoginScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<RucLoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethod().loginUser(
        email: emailController.text, password: passwordController.text);

    if (res == "success") {
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ScreenUser(),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height / 2.7,
                child: Image.asset(
                  'assets/images/LoginImage.png',
                  fit: BoxFit.contain,
                ),
              ),
              TextFieldInput(
                icon: Icons.person,
                textEditingController: emailController,
                hintText: 'Enter your RUC',
                textInputType: TextInputType.text,
              ),
              TextFieldInput(
                icon: Icons.lock,
                textEditingController: passwordController,
                hintText: 'Phone number asociated with RUC',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const ForgotPassword(),
              MyButtons(onTap: loginUser, text: "Log In"),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  surfaceTintColor: const Color.fromARGB(255, 255, 151, 151),
                  backgroundColor: const Color.fromARGB(255, 247, 175, 67),
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                child: const Text(
                  "For Users",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container socialIcon(image) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFedf0f8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black45,
          width: 2,
        ),
      ),
      child: Image.network(
        image,
        height: 40,
      ),
    );
  }
}
