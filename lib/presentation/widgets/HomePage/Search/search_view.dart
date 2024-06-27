import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:job_match_app/config/Languajes/flutter_gen/gen_l10n/app_localizations.dart';

class SearchView extends StatelessWidget {
  final Map<String, String> popularProfiles = {
    'Software Engineer': '50',
    'Data Scientist': '60',
    'Web Developer': '40',
    'Mobile App Developer': '45',
    'Cloud Architect': '55',
    'UI/UX Designer': '35',
  };

  final Map<String, String> popularCompanies = {
    'Google': 'Mountain View, CA',
    'Apple': 'Cupertino, CA',
    'Microsoft': 'Redmond, WA',
    'Amazon': 'Seattle, WA',
    'Facebook': 'Menlo Park, CA',
    'Netflix': 'Los Gatos, CA',
  };

  final List<String> companyLogos = [
    'https://cdn2.hubspot.net/hubfs/53/image8-2.jpg',
    'https://1000logos.net/wp-content/uploads/2016/10/Apple-Logo.jpg',
    'https://blogs.microsoft.com/wp-content/uploads/prod/2012/08/8867.Microsoft_5F00_Logo_2D00_for_2D00_screen.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa9Mdeo4S4YXDOaI4Xm53DaaHVlccVG_j7Yg&s',
    'https://as1.ftcdn.net/v2/jpg/05/43/99/34/1000_F_543993425_MHEjNzFuemuEzA29DyhbXnwkyAdmscBB.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmyLJ2v4bct5tys85j1Y9WJplxP0rhJSBkKA&s',
  ];
  final List<String> hourlySalaries = [
    '20/hr',
    '25/hr',
    '18/hr',
    '30/hr',
    '22/hr',
  ];

  SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Descubre tu nuevo trabajo',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Icon(Icons.search),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText:
                                  '${AppLocalizations.of(context)?.buscar}',
                            ),
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(width: 10),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(FontAwesomeIcons.sliders)),
                  ],
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${AppLocalizations.of(context)?.paraTi}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        5,
                        (index) => Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.3,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: FittedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            20.0), // Round image
                                        child: Image.network(
                                          companyLogos[index],
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          fit: BoxFit
                                              .cover, // Adjust image fit as needed
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      popularProfiles.keys.elementAt(index),
                                      style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '${popularCompanies.keys.elementAt(index)} - ${popularCompanies.values.elementAt(index)}',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      hourlySalaries[index],
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    '${AppLocalizations.of(context)?.vistosRecientemente}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      3,
                      (index) => Container(
                        alignment: Alignment.bottomLeft,
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.25,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        20.0), // Round image
                                    child: Image.network(
                                      companyLogos[index + 2],
                                      width: MediaQuery.of(context).size.width *
                                          1.30,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                      fit: BoxFit
                                          .cover, // Adjust image fit as needed
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  popularProfiles.keys.elementAt(index + 2),
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${popularCompanies.keys.elementAt(index + 2)} - ${popularCompanies.values.elementAt(index + 2)}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  hourlySalaries[index + 2],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
