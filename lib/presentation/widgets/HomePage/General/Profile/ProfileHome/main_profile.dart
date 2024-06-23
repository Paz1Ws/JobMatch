import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:job_match_app/presentation/screens/Information/UserProfileInformation/main_profile_information.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/Profile/Settings/settings_profile.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/theme_button.dart';
import 'package:job_match_app/presentation/widgets/ProfileInformation/curved_painter.dart';

class MainProfileScreen extends StatefulWidget {
  const MainProfileScreen({super.key});

  @override
  _MainProfileScreenState createState() => _MainProfileScreenState();
}

class _MainProfileScreenState extends State<MainProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? const Color.fromARGB(255, 20, 20, 20)
          : Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.35,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            end: Alignment(0.0, 0.4),
            begin: Alignment(0.0, -1),
            colors: <Color>[
              Color.fromARGB(255, 218, 10, 79),
              Colors.deepOrange,
            ],
          ),
        ),
      ),
      CustomPaint(
          size: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.36,
          ),
          painter: CurvedPainter(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color.fromARGB(255, 20, 20, 20)
                : Colors.white,
          )),
      Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height * 0.18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            ClipOval(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 3,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color.fromARGB(170, 255, 255, 255)
                        : const Color.fromARGB(47, 0, 0, 0),
                  ),
                ),
                // TODO: Remove Padding
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 3),
                  child: Image.asset(
                    "assets/images/JcPhoto.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "JC",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            Text(
              "Entrepreneur of the year",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 218, 10, 79),
                      Colors.deepOrange,
                    ],
                  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstants.kWhite,
                        boxShadow: [
                          BoxShadow(
                            color: ColorConstants.kGrey.withOpacity(0.1),
                            spreadRadius: 10,
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AccountScreen()));
                        },
                        icon: const Icon(
                          Icons.settings,
                          size: 35,
                        ),
                        iconSize: 35,
                        color: ColorConstants.kGrey.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "SETTINGS",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorConstants.kGrey.withOpacity(0.8),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 85,
                        height: 85,
                        child: Stack(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: const LinearGradient(
                                  colors: [
                                    ColorConstants.primary_one,
                                    ColorConstants.primary_two
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        ColorConstants.kGrey.withOpacity(0.1),
                                    spreadRadius: 10,
                                    blurRadius: 15,
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                size: 45,
                                color: ColorConstants.kWhite,
                              ),
                            ),
                            Positioned(
                              bottom: 8,
                              right: 0,
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorConstants.kWhite,
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          ColorConstants.kGrey.withOpacity(0.1),
                                      spreadRadius: 10,
                                      blurRadius: 15,
                                      // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    color: ColorConstants.kPrimary,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        "Add Photos",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ColorConstants.kGrey.withOpacity(0.8)),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstants.kWhite,
                        boxShadow: [
                          BoxShadow(
                            color: ColorConstants.kGrey.withOpacity(0.1),
                            spreadRadius: 10,
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.book,
                        size: 35,
                        color: const Color.fromARGB(255, 23, 204, 51)
                            .withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Learning",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorConstants.kGrey.withOpacity(0.8),
                      ),
                    )
                  ],
                )
              ],
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.83,
              margin: const EdgeInsets.only(top: 10),
              height: MediaQuery.sizeOf(context).height / 15,
              decoration: BoxDecoration(
                color: ColorConstants.kPrimary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    iconSize: 45,
                    icon: const Icon(Icons.assistant),
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color.fromARGB(255, 20, 20, 20)
                        : Colors.white,
                    onPressed: () {},
                  ),
                  Text(
                    "Client Assistance ",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color.fromARGB(255, 20, 20, 20)
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
          child: Row(
            children: [
              Icon(
                FontAwesomeIcons.shieldHalved,
                color: ColorConstants.kGrey.withOpacity(0.5),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "All the rights reserved to JobMatch 2024",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}

/*
Title:ColorConstants
Purpose:ColorConstants
Created By:Kalpesh Khandla
*/

class ColorConstants {
  static const kWhite = Colors.white;

  static const kBlack = Colors.black;
  static const kGreen = Colors.green;
  static const kGrey = Colors.grey;
  static const kPrimary = Color(0xFFFD5C61);

// gradient
  static const yellow_one = Color(0xFFeec365);
  static const yellow_two = Color(0xFFde9024);
  static const primary_one = Color(0xFFfc3973);
  static const primary_two = Color(0xFFfd5f60);
}
