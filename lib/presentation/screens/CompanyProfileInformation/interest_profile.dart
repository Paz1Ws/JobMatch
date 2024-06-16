import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:job_match_app/presentation/screens/HomeViews/home_view_user.dart';

class SignUpInterestCompanies extends StatefulWidget {
  const SignUpInterestCompanies({super.key});

  @override
  _SignUpInterestCompaniesState createState() =>
      _SignUpInterestCompaniesState();
}

class _SignUpInterestCompaniesState extends State<SignUpInterestCompanies>
    with AutomaticKeepAliveClientMixin<SignUpInterestCompanies> {
  @override
  bool get wantKeepAlive => true;

  final List<String> _selectedIndexList = [];
  final List<String> _options = [
    'Software Development',
    'Data Science',
    'Product Management',
    'UI/UX Design',
    'Digital Marketing',
    'Sales',
    'Human Resources',
    'Finance'
  ];

  Widget _buildChips() {
    List<Widget> chips = [];

    for (int i = 0; i < _options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        shadowColor: Colors.black,
        selected: _selectedIndexList.contains(_options[i]),
        label: Text(_options[i],
            style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.black
                    : Colors.white)),
        elevation: 4,
        pressElevation: 3,
        backgroundColor: const Color.fromARGB(255, 211, 209, 209),
        selectedColor: const Color.fromARGB(255, 222, 127, 19),
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              if (!_selectedIndexList.contains(_options[i])) {
                _selectedIndexList.add(_options[i]);
              }
            } else {
              if (_selectedIndexList.contains(_options[i])) {
                _selectedIndexList.remove(_options[i]);
              }
            }
          });
        },
      );

      chips.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: choiceChip,
      ));
    }

    return Wrap(
      spacing: 5.0,
      runSpacing: 3.0,
      children: chips,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50, left: 9),
              child: Text(
                'Tell us a few of you',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          counterText: '',
                          hintText: 'Make your profile shine...',
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                        maxLength: 2000,
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 60,
                  icon: const Icon(FontAwesomeIcons.instagram),
                  onPressed: () {
                    // Handle Instagram button press
                  },
                ),
                IconButton(
                  iconSize: 60,
                  icon: const Icon(Icons.facebook),
                  onPressed: () {
                    // Handle Facebook button press
                  },
                ),
                IconButton(
                  iconSize: 60,
                  icon: const Icon(FontAwesomeIcons.x),
                  onPressed: () {
                    // Handle Twitter button press
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            _selectedIndexList.isEmpty
                ? const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      'Please select your interests',
                      style: TextStyle(
                        color: Color.fromARGB(255, 239, 108, 0),
                      ),
                    ),
                  )
                : const SizedBox(),
            _buildChips(),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: const EdgeInsets.symmetric(
                      vertical: 16, horizontal: 16), // Add vertical padding
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const UserScreen(),
                    ),
                  );
                },
                child: Text("Let's begin your journey!",
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.black
                            : Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
