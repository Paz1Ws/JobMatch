import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_match_app/presentation/screens/HomeViews/home_view_company.dart';
import 'package:job_match_app/presentation/screens/HomeViews/home_view_user.dart';
import 'package:job_match_app/presentation/screens/LoaderScreen/loader_screen.dart';
import 'package:job_match_app/presentation/screens/ProfileInformation/main_profile_information.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/Login/login_screen.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/RegisterScreens.dart';

_checkLogin(BuildContext context) {
  final user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    return '/login';
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
      path: '/login',
      builder: (context, state) => const LoginScreen(),
      redirect: (context, state) => _checkLogin(context),
    ),
    GoRoute(
      path: '/user_home',
      builder: (context, state) => const ProfilePageIndicator(),
    ),
    GoRoute(
        path: '/company_home',
        builder: (context, state) => const CompanyScreen()),
  ],
);
