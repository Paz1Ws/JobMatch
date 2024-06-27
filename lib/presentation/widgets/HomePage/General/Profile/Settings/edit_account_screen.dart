import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:job_match_app/infrastructure/provider/cv_recognizer.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/Profile/Settings/pick_image.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/Profile/Settings/list_interest.dart';

import '../../../../../../config/Languajes/flutter_gen/gen_l10n/app_localizations.dart';

class EditAccountScreen extends ConsumerStatefulWidget {
  const EditAccountScreen({super.key});

  @override
  ConsumerState<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends ConsumerState<EditAccountScreen> {
  final List<String> _selectedIndexList = [];

  Widget _buildChips() {
    return Wrap(
      spacing: 5.0,
      runSpacing: 3.0,
      children: List.generate(_options.length, (i) {
        return ChoiceChip(
          shadowColor: Colors.black,
          selected: _selectedIndexList.contains(_options[i]),
          label: Text(_options[i], style: TextStyle(color: _getTextColor())),
          elevation: 4,
          pressElevation: 3,
          backgroundColor: const Color.fromARGB(255, 211, 209, 209),
          selectedColor: const Color.fromARGB(255, 222, 127, 19),
          onSelected: (bool selected) => setState(() {
            if (selected) {
              if (!_selectedIndexList.contains(_options[i])) {
                _selectedIndexList.add(_options[i]);
              }
            } else {
              _selectedIndexList.remove(_options[i]);
            }
          }),
        );
      }),
    );
  }

  Color _getTextColor() {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.black
        : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '${AppLocalizations.of(context)?.editarPerfil}',
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LinearProgressIndicator(
                        value:
                            0.75, // Add appropriate value for progress indicator
                        backgroundColor: Colors.grey[200],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Color.fromARGB(255, 222, 127, 19)),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        '${AppLocalizations.of(context)?.fotos}',
                        style: const TextStyle(
                            fontSize: 32.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Main photo section (medium-large)
                          Expanded(
                            child: PickImageWidget(
                              image: true,
                              height: MediaQuery.of(context).size.height *
                                  0.5, // Adjust height as needed
                              width: MediaQuery.of(context).size.width / 1.5,
                              onPickImage: () {},
                            ),
                          ),
                          const SizedBox(width: 16.0),

                          Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              PickImageWidget(
                                image: false,
                                height:
                                    MediaQuery.of(context).size.height * 0.14,
                                width: MediaQuery.of(context).size.width / 4,
                                onPickImage: () {},
                              ),
                              const SizedBox(height: 8.0),
                              PickImageWidget(
                                image: false,
                                height: MediaQuery.of(context).size.height *
                                    0.15, // Adjust height as needed
                                width: MediaQuery.of(context).size.width / 4,
                                onPickImage: () {},
                              ),
                              const SizedBox(height: 8.0),
                              PickImageWidget(
                                image: false,
                                height: MediaQuery.of(context).size.height *
                                    0.15, // Adjust height as needed
                                width: MediaQuery.of(context).size.width / 4,
                                onPickImage: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),

                      // About me section
                      Text('${AppLocalizations.of(context)?.acercaDeMi}',
                          style: const TextStyle(
                              fontSize: 32.0, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8.0),
                      user?.userInfo.description == null
                          ? TextField(
                              decoration: InputDecoration(
                                hintText: 'Share a few words about yourself...',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              maxLines: 3,
                            )
                          : Text(user!.userInfo.description ?? ''),

                      const SizedBox(height: 16.0),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: [
                          Text(
                            '${AppLocalizations.of(context)?.misIntereses}',
                            style: const TextStyle(
                                fontSize: 32.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          _buildChips(),
                        ],
                      ),
                      const SizedBox(height: 8.0),

                      // My details section
                      Text('${AppLocalizations.of(context)?.misDatos}',
                          style: const TextStyle(
                              fontSize: 32.0, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8.0),
                      // Personal Information section
                      Text(
                          '${AppLocalizations.of(context)?.informacionPersonal}',
                          style: const TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const Icon(
                              Icons.person), // Add appropriate icon for name
                          const SizedBox(width: 10),
                          Text('${AppLocalizations.of(context)?.nombre}'),
                          const Spacer(),
                          TextButton(
                            onPressed:
                                () {}, // Add functionality here (e.g., edit location)
                            child: Text(user?.personalInfo.names ?? 'Name'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                              Icons.cake), // Add appropriate icon for name
                          const SizedBox(width: 10),
                          Text(
                            '${AppLocalizations.of(context)?.fechaDeNacimiento}',
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed:
                                () {}, // Add functionality here (e.g., edit location)
                            child: Text(
                                user?.personalInfo.birthdate ?? 'Birthdate'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                              Icons.cake), // Add appropriate icon for name
                          const SizedBox(width: 10),
                          Text(
                            '${AppLocalizations.of(context)?.direccion}',
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed:
                                () {}, // Add functionality here (e.g., edit location)
                            child: Text(user?.personalInfo.address ?? 'Adress'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                              Icons.phone), // Add appropriate icon for phone
                          const SizedBox(width: 10),
                          Text(
                            '${AppLocalizations.of(context)?.telefono}',
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              // Add functionality here (e.g., edit phone number)
                            },
                            child: const Text(
                                'Teléfono'), // Handle case where phone number might be null
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                              Icons.email), // Add appropriate icon for email
                          const SizedBox(width: 10),
                          Text(
                            '${AppLocalizations.of(context)?.correoElectronico}',
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed:
                                () {}, // Add functionality here (e.g., edit location)
                            child: const Text(
                                //user?.personalInfo.address ??
                                'Email'), // Handle case where email might be null
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),

                      // Work Experience section
                      const Text('Experiencia',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const Icon(Icons
                              .work), // Add appropriate icon for occupation
                          const SizedBox(width: 10),
                          Text(
                            '${AppLocalizations.of(context)?.ocupacion}',
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              user?.experience.professional.last.position ??
                                  'Occupation',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Ionicons
                              .briefcase), // Add appropriate icon for experience
                          const SizedBox(width: 10),
                          Text(
                            '${AppLocalizations.of(context)?.lugarDeTrabajo}',
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed:
                                () {}, // Add functionality here (e.g., edit location)
                            child: Text(
                              user?.experience.professional.last.company ??
                                  'Place of work',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),

                      // Education section
                      const Text('Educación',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold)),

                      Row(
                        children: [
                          const Icon(Icons
                              .school), // Add appropriate icon for education
                          const SizedBox(width: 10),
                          const Text('Educación:'),
                          const Spacer(),
                          TextButton(
                            onPressed:
                                () {}, // Add functionality here (e.g., edit location)
                            child: Text(user?.education.status ?? 'Education'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const Icon(Icons
                              .school), // Add appropriate icon for education
                          const SizedBox(width: 10),
                          Text(
                            '${AppLocalizations.of(context)?.lugarDeEstudio}',
                          ),
                          const SizedBox(width: 80),
                          Expanded(
                            child: TextButton(
                              onPressed:
                                  () {}, // Add functionality here (e.g., edit location)
                              child: Text(
                                user?.education.studyCenter ?? 'Place of study',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const Icon(Icons
                              .school), // Add appropriate icon for education
                          const SizedBox(width: 10),
                          Text(
                            '${AppLocalizations.of(context)?.carrera}',
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed:
                                () {}, // Add functionality here (e.g., edit location)
                            child: Text(user?.education.yield ??
                                'Career'), // Handle case where career might be null
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const Icon(Icons
                              .school), // Add appropriate icon for education
                          const SizedBox(width: 10),
                          Text(
                            '${AppLocalizations.of(context)?.certificados}',
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed:
                                  () {}, // Add functionality here (e.g., edit location)
                              child: Text(
                                user?.experience.certificates.length
                                        .toString() ??
                                    'Certificates',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ), // Handle case where career might be null
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      // Skills section

                      Row(
                        children: [
                          const Icon(
                              Icons.work), // Add appropriate icon for skills
                          const SizedBox(width: 10),
                          Text(
                            '${AppLocalizations.of(context)?.habilidades}',
                          ),
                          const SizedBox(width: 40),
                          Expanded(
                            child: TextButton(
                              onPressed:
                                  () {}, // Add functionality here (e.g., edit location)
                              child: Text(
                                user?.skills.toString().substring(
                                        1, user.skills.toString().length - 1) ??
                                    'Skills',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),

                      // Additional Information section
                      Text(
                          '${AppLocalizations.of(context)?.informacionAdicional}',
                          style: const TextStyle(
                              fontSize: 32.0, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const Icon(Icons
                              .language), // Add appropriate icon for languages
                          const SizedBox(width: 10),
                          Text(
                            '${AppLocalizations.of(context)?.idiomas}',
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed:
                                () {}, // Add functionality here (e.g., edit location)
                            child: const Text('Español, Inglés'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons
                              .location_pin), // Add appropriate icon for location
                          const SizedBox(width: 10),
                          Text(
                            '${AppLocalizations.of(context)?.ubicacion}',
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed:
                                () {}, // Add functionality here (e.g., edit location)
                            child: Text(
                              '${user!.personalInfo.country}, ${user.personalInfo.city}',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                    ]))));
  }
}

final List<String> _options = [
  "SEO Specialist",
  "Content Marketing Specialist",
  "Sales Representative",
  "Account Executive",
  "Business Development Manager",
  "Software Engineer",
  "Web Developer",
  "Mobile Developer",
  "Machine Learning Engineer",
  "Product Manager",
  "Product Owner",
  "Desing",
  "Interaction Designer",
  "Digital Marketing Specialist",
  "HR Generalist",
  "Recruiting Specialist",
  "Training and Development Manager",
  "Financial Analyst",
  "Accountant",
  "Auditor",
  "Teacher",
  "Professor",
  "Educational Technologist",
  "Doctor",
  "Nurse",
  "Therapist",
  "Musician", // Added "Musician" as a non-profession interest
  "Artist", // Added "Artist" as a non-profession interest
  // Add more roles or interests as needed
];
