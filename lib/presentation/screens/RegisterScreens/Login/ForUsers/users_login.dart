import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/Login/Google/login_with_google.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/Login/ForEnterprises/enterprises_login.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/SignUp/sign_up_screen.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/ForgotPassword/forgot_password.dart';
import 'package:job_match_app/presentation/widgets/LoginWidgets/login_button.dart';
import 'package:job_match_app/presentation/widgets/LoginWidgets/snackbar.dart';
import 'package:job_match_app/presentation/widgets/LoginWidgets/text_field_input.dart';
import 'package:job_match_app/presentation/widgets/ProfileInformation/curved_painter.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/theme_button.dart';
import '../../../../../infrastructure/services/authentication.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<LoginScreen> {
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
      context.go('/user_home');
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? const Color.fromARGB(255, 28, 27, 27)
          : Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment(0.0, 0.4),
                  begin: Alignment(0.0, -1),
                  colors: <Color>[
                    Color.fromARGB(255, 202, 28, 86),
                    Colors.deepOrange,
                  ],
                ),
              ),
            ),
            CustomPaint(
                size: Size(
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height * 0.5,
                ),
                painter: CurvedPainter(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(255, 28, 27, 27)
                      : Colors.white,
                )),
            const Positioned(
              top: 0,
              right: 0,
              child: ThemeButton(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 500),
              child: Center(
                child: Image.asset(
                  'assets/images/JobMatch.png',
                  height: MediaQuery.sizeOf(context).height * 1.2,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.sizeOf(context).height * 0.35,
                    bottom: 0.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Column(
                    children: [
                      TextFieldInput(
                        icon: Icons.person,
                        textEditingController: emailController,
                        hintText: 'Enter your email',
                        textInputType: TextInputType.text,
                      ),
                      TextFieldInput(
                        icon: Icons.lock,
                        textEditingController: passwordController,
                        hintText: 'Enter your password',
                        textInputType: TextInputType.text,
                        isPass: true,
                      ),
                      const ForgotPassword(),
                      MyButtons(
                          onTap: loginUser, text: "Log In", disabled: false),
                      Row(
                        children: [
                          Expanded(
                            child: Container(height: 1, color: Colors.black26),
                          ),
                          const Text("  or  "),
                          Expanded(
                            child: Container(height: 1, color: Colors.black26),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 247, 175, 67),
                        ),
                        onPressed: () async {
                          await FirebaseServices().signInWithGoogle();
                          context.go('/user_home');
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 22),
                              child: Image.network(
                                "https://static-00.iconduck.com/assets.00/google-icon-512x512-tqc9el3r.png",
                                height: 35,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Continue with Google",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.black
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "SignUp",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          surfaceTintColor:
                              const Color.fromARGB(255, 255, 151, 151),
                          backgroundColor:
                              const Color.fromARGB(255, 247, 175, 67),
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const RucLoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "For Companies",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
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
