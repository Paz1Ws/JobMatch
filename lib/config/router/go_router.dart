import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_match_app/presentation/screens/HomeViews/home_view_company.dart';
import 'package:job_match_app/presentation/screens/HomeViews/home_view_user.dart';
import 'package:job_match_app/presentation/screens/LoaderScreen/loader_screen.dart';
import 'package:job_match_app/presentation/screens/UserProfileInformation/main_profile_information.dart';
import 'package:job_match_app/presentation/screens/Redirect/Jc_welcome.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/Login/ForEnterprises/enterprises_login.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/Login/ForUsers/users_login.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/RegisterScreens.dart';
import 'package:job_match_app/presentation/widgets/ProfileInformation/PhotoZone/add_photo.dart';

_checkLogin(BuildContext context) {
  final user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    return '/JcWelcomeScreen';
  } else {
    return '/user_home';
  }
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>
          ScreenLoader(userData: _checkLogin(context) == '/user_home'),
    ),
    GoRoute(
      path: '/JcWelcomeScreen',
      builder: (context, state) => const JcWelcomeScreen(),
    ),
    GoRoute(
      path: '/userlogin',
      builder: (context, state) => const LoginScreen(),
      redirect: (context, state) => _checkLogin(context),
    ),
    GoRoute(
      path: '/enterpriselogin',
      builder: (context, state) => const RucLoginScreen(),
      redirect: (context, state) => _checkLogin(context),
    ),
    GoRoute(
      path: '/user_home',
      builder: (context, state) => const ProfilePageIndicator(),
      redirect: (context, state) => _checkLogin(context),
    ),
    GoRoute(
      path: '/company_home',
      builder: (context, state) => const CompanyScreen(),
      redirect: (context, state) => _checkLogin(context),
    ),
  ],
);
