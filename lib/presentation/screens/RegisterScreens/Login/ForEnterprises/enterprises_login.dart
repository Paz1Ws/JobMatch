import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_match_app/presentation/screens/CompanyProfileInformation/main_profile_information.dart';
import 'package:job_match_app/presentation/screens/HomeViews/home_view_company.dart';
import 'package:job_match_app/presentation/screens/UserProfileInformation/main_profile_information.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/ForgotPassword/forgot_password.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/Login/ForUsers/users_login.dart';
import 'package:job_match_app/presentation/widgets/LoginWidgets/login_button.dart';
import 'package:job_match_app/presentation/widgets/LoginWidgets/text_field_input.dart';
import 'package:job_match_app/presentation/widgets/theme_button.dart';
import '../../../../widgets/ProfileInformation/curved_painter.dart';
import 'package:dio/dio.dart';

class RucLoginScreen extends StatefulWidget {
  const RucLoginScreen({super.key});

  @override
  State<RucLoginScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<RucLoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser;
  bool isLoading = false;
  final Dio _dio = Dio();
  void verifyRuc() async {
    try {
      final response = await _dio.get(
          'https://api.sunat.dev/ruc-premium/20100190797?apikey=B6IWa9QHQs7jOrrmLfBsj4xQ1K2f4gpFFMT82av4pjf4ExXP9CfYOyLcGfzEwGOR');
      final Map<String, dynamic> jsonData = response.data;

      String ruc = jsonData['body']['numeroRuc'];
      String name = jsonData['body']['nombreComercial'];

      if (response.statusCode == 200) {
        print(ruc.toString());
        print(name.toString());
        Navigator.of(context).pushReplacement(user == null
            ? MaterialPageRoute(
                builder: (context) => const ProfilePageCompanies(),
              )
            : MaterialPageRoute(
                builder: (context) => const CompanyScreen(),
              ));
      } else {
        throw false;
      }
    } catch (e) {
      throw Exception('Error : $e');
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color.fromARGB(255, 28, 27, 27)
            : Colors.white,
        body: SafeArea(
          child: Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment(0.0, 0.4),
                  begin: Alignment(0.0, -1),
                  colors: <Color>[
                    Colors.pink,
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
              ),
            ),
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
                  height: height * 1.2,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.sizeOf(context).height * 0.43,
                    bottom: 0.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Column(
                    children: [
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
                      MyButtons(onTap: verifyRuc, text: "Log In"),
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
                              builder: (context) => const LoginScreen(),
                            ),
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
              ],
            ),
          ]),
        ));
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
