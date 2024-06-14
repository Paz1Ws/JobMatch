import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_match_app/infrastructure/provider/profile_information_prov.dart';
import 'package:job_match_app/presentation/screens/ProfileInformation/images_profile.dart';
import 'package:job_match_app/presentation/screens/ProfileInformation/interest_profile.dart';
import 'package:job_match_app/presentation/screens/ProfileInformation/personal_information.dart';
import 'package:job_match_app/presentation/widgets/theme_button.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfilePageIndicator extends ConsumerWidget {
  const ProfilePageIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = PageController(initialPage: 0);
    final currentPageIndex = ref.watch(change_page);

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBar(
                  toolbarHeight: 60,
                  actions: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 300),
                      child: IconButton(
                        iconSize: 40,
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          ref.read(change_page).changePage = 0;
                          pageController.jumpToPage(0);
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 0, top: 5, right: 1),
                      child: ThemeButton(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
              child: LinearPercentIndicator(
                barRadius: const Radius.circular(10),
                lineHeight: 10.0,
                percent: currentPageIndex.changePage / 2,
                progressColor: Colors.orangeAccent,
                backgroundColor: Colors.grey[300],
              ),
            ),
            PageView(
              controller: pageController,
              onPageChanged: (index) =>
                  ref.read(change_page).changePage = index,
              physics: ref.watch(change_page).changePage == 2
                  ? const NeverScrollableScrollPhysics()
                  : null,
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
}
