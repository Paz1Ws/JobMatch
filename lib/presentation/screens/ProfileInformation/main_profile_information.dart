import 'package:flutter/material.dart';
import 'package:job_match_app/presentation/screens/ProfileInformation/images_profile.dart';
import 'package:job_match_app/presentation/screens/ProfileInformation/interest_profile.dart';
import 'package:job_match_app/presentation/screens/ProfileInformation/personal_information.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfilePageIndicator extends StatefulWidget {
  const ProfilePageIndicator({super.key});

  @override
  _ProfilePageIndicatorState createState() => _ProfilePageIndicatorState();
}

class _ProfilePageIndicatorState extends State<ProfilePageIndicator>
    with AutomaticKeepAliveClientMixin {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 5,
              left: 0,
              right: 330,
              child: IconButton(
                iconSize: 40,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (_currentPageIndex > 0) {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
              child: LinearPercentIndicator(
                barRadius: const Radius.circular(10),
                lineHeight: 10.0,
                percent: (_currentPageIndex + 1) / 3,
                progressColor: Colors.orangeAccent,
                backgroundColor: Colors.grey[300],
              ),
            ),
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: const [
                SignUpForm(),
                PhotoSection(),
                SignUpInterest(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
