import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_match_app/presentation/screens/CompanyProfileInformation/main_companyProfile_information.dart';
import 'package:job_match_app/presentation/screens/HomeViews/home_view_company.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/ForgotPassword/forgot_password.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/Login/ForUsers/users_login.dart';
import 'package:job_match_app/presentation/widgets/LoginWidgets/login_button.dart';
import 'package:job_match_app/presentation/widgets/LoginWidgets/text_field_input.dart';
import 'package:job_match_app/presentation/widgets/theme_button.dart';
import '../../../../widgets/ProfileInformation/curved_painter.dart';
import 'package:dio/dio.dart';

class RucLoginScreen extends ConsumerStatefulWidget {
  const RucLoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SignupScreenState();
  }
}

class _SignupScreenState extends ConsumerState<RucLoginScreen> {
  TextEditingController rucController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  late String ruc;
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    rucController = TextEditingController();
    passwordController = TextEditingController();
    user = FirebaseAuth.instance.currentUser;
    isLoading = false;
  }

  final Dio _dio = Dio();
  void verifyRuc() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const ProfilePageCompanies(),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    rucController.dispose();
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
                        textEditingController: rucController,
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
                      MyButtons(
                        disabled: isLoading ? true : false,
                        onTap: isLoading ? null : verifyRuc,
                        text: isLoading ? 'Loading...' : 'Login',
                      ),
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
