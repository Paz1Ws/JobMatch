import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_match_app/presentation/screens/Home/EnterpriseViews/home_view_company.dart';
import 'package:job_match_app/presentation/screens/Home/UserViews/home_view_user.dart';
import 'package:job_match_app/presentation/screens/LoaderScreen/loader_screen.dart';
import 'package:job_match_app/presentation/screens/Information/UserProfileInformation/main_profile_information.dart';
import 'package:job_match_app/presentation/screens/JC%20Redirect/Jc_welcome.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/Login/ForEnterprises/enterprises_login.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/Login/ForUsers/users_login.dart';
import 'package:job_match_app/presentation/screens/RegisterScreens/RegisterScreens.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/Profile/Settings/settings_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../presentation/widgets/HomePage/Chat/common_chat.dart';

import 'package:animate_do/animate_do.dart';

final user = FirebaseAuth.instance.currentUser;

final firestore = FirebaseFirestore.instance.collection('users_registered');
alreadyRegistered() {
  if (firestore.doc(user!.uid).get().then((value) => value.exists) == true) {
    return true;
  } else {
    return false;
  }
}

_checkLogin(BuildContext context) {
  if (user != null && alreadyRegistered == true) {
    return '/user_home';
  } else {
    return '/fill_information';
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
      builder: (context, state) => FadeIn(child: const JcWelcomeScreen()),
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
      builder: (context, state) => FadeIn(
        child: alreadyRegistered() == true
            ? const UserScreen()
            : const ProfilePageIndicator(),
      ),
    ),
    GoRoute(
      path: '/user_home_true',
      builder: (context, state) => FadeIn(child: const UserScreen()),
    ),
    GoRoute(
        path: '/company_home',
        builder: (context, state) => const CompanyScreen()),
    GoRoute(
      path: '/user_profile_information',
      builder: (context, state) => const AccountScreen(),
    ),
    GoRoute(path: '/chat', builder: (context, state) => const MainChatScreen()),
    GoRoute(
        path: '/fill_information',
        builder: (context, state) => const ProfilePageIndicator())
  ],
);
