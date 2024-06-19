import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:job_match_app/infrastructure/provider/profile_information_prov.dart';
import 'package:job_match_app/presentation/screens/Information/CompanyProfileInformation/company_interest_profile.dart';
import 'package:job_match_app/presentation/screens/Information/CompanyProfileInformation/company_information.dart';
import 'package:job_match_app/presentation/screens/Information/UserProfileInformation/images_profile.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/theme_button.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfilePageCompanies extends ConsumerWidget {
  const ProfilePageCompanies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = PageController(initialPage: 0);
    final selectedIndex = ref.watch(change_page);

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(48),
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
                        onPressed: () => context.go('/JcWelcomeScreen'),
                      ),
                    ),
                    const ThemeButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: LinearPercentIndicator(
                fillColor: Colors.transparent,
                barRadius: const Radius.circular(10),
                lineHeight: 10.0,
                percent: selectedIndex.changePage.toDouble() / 2,
                progressColor: Colors.orangeAccent,
                backgroundColor: Colors.grey[300],
              ),
            ),
            PageView(
              controller: pageController,
              onPageChanged: (index) =>
                  ref.read(change_page).changePageMethod(index),
              children: const [
                SignUpFormCompanies(),
                PhotoSection(),
                SignUpInterestCompanies(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
