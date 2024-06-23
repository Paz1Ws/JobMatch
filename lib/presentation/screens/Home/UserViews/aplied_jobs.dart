import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/theme_button.dart';

class AppliedJobs extends StatelessWidget {
  final int numberOfJobs;
  final String title;
  final String description;
  const AppliedJobs(
      {super.key,
      required this.numberOfJobs,
      this.title = '',
      this.description = ''});

  @override
  Widget build(BuildContext context) {
    Map<String, String> popularProfiles = {
      'Software Engineer': '50',
      'Data Scientist': '60',
      'Web Developer': '40',
      'Mobile App Developer': '45',
      'Cloud Architect': '55',
      'UI/UX Designer': '35',
    };

    Map<String, String> popularCompanies = {
      'Google': 'Mountain View, CA',
      'Apple': 'Cupertino, CA',
      'Microsoft': 'Redmond, WA',
      'Amazon': 'Seattle, WA',
      'Facebook': 'Menlo Park, CA',
      'Netflix': 'Los Gatos, CA',
    };

    List<String> companyLogos = [
      'https://cdn2.hubspot.net/hubfs/53/image8-2.jpg',
      'https://1000logos.net/wp-content/uploads/2016/10/Apple-Logo.jpg',
      'https://blogs.microsoft.com/wp-content/uploads/prod/2012/08/8867.Microsoft_5F00_Logo_2D00_for_2D00_screen.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa9Mdeo4S4YXDOaI4Xm53DaaHVlccVG_j7Yg&s',
      'https://as1.ftcdn.net/v2/jpg/05/43/99/34/1000_F_543993425_MHEjNzFuemuEzA29DyhbXnwkyAdmscBB.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmyLJ2v4bct5tys85j1Y9WJplxP0rhJSBkKA&s',
    ];
    List<String> hourlySalaries = [
      '20/hr',
      '25/hr',
      '18/hr',
      '30/hr',
      '22/hr',
    ];
    return Column(
      children: [
        const Text(
          'My Jobs',
          style: TextStyle(
            color: Colors.orange,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              addAutomaticKeepAlives: true,
              itemCount: numberOfJobs,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print('Job $index tapped');
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: FittedBox(
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(20.0), // Round image
                            child: Image.network(
                              companyLogos[index],
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.cover, // Adjust image fit as needed
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        // Wrap content in Expanded for scrollable text
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              popularProfiles.keys.elementAt(index),
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              popularCompanies.keys.elementAt(index),
                              maxLines: 3, // Limit lines for description
                              overflow: TextOverflow
                                  .ellipsis, // Add ellipsis if overflow
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 2.0,
                            ),
                            const SizedBox(height: 10.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
