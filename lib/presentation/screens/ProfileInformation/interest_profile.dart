import 'package:flutter/material.dart';

class SignUpInterest extends StatefulWidget {
  const SignUpInterest({super.key});

  @override
  _SignUpInterestState createState() => _SignUpInterestState();
}

class _SignUpInterestState extends State<SignUpInterest>
    with AutomaticKeepAliveClientMixin<SignUpInterest> {
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
        selected: _selectedIndexList.contains(_options[i]),
        label: Text(_options[i], style: const TextStyle(color: Colors.white)),
        avatar: _selectedIndexList.contains(_options[i])
            ? const Icon(
                Icons.check,
                color: Colors.white,
              )
            : null,
        elevation: 4,
        pressElevation: 3,
        shadowColor: Colors.grey,
        backgroundColor: Colors.grey[800],
        selectedColor: Colors.blue[700],
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _buildChips(),
    );
  }
}
