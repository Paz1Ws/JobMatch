// import 'package:flutter/material.dart';
//   final List<String> _selectedIndexList = [];
//   final List<String> _options = [
//     'Software Development',
//     'Data Science',
//     'Product Management',
//     'UI/UX Design',
//     'Digital Marketing',
//     'Sales',
//     'Human Resources',
//     'Finance'
//   ];

//   Widget _buildChips() {
//     List<Widget> chips = [];

//     for (int i = 0; i < _options.length; i++) {
//       ChoiceChip choiceChip = ChoiceChip(
//         shadowColor: Colors.black,
//         selected: _selectedIndexList.contains(_options[i]),
//         label: Text(_options[i],
//             style: TextStyle(
//                 color: Theme.of(context).brightness == Brightness.dark
//                     ? Colors.black
//                     : Colors.white)),
//         elevation: 4,
//         pressElevation: 3,
//         backgroundColor: const Color.fromARGB(255, 211, 209, 209),
//         selectedColor: const Color.fromARGB(255, 222, 127, 19),
//         onSelected: (bool selected) {
//           setState(() {
//             if (selected) {
//               if (!_selectedIndexList.contains(_options[i])) {
//                 _selectedIndexList.add(_options[i]);
//               }
//             } else {
//               if (_selectedIndexList.contains(_options[i])) {
//                 _selectedIndexList.remove(_options[i]);
//               }
//             }
//           });
//         },
//       );

//       chips.add(Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 4),
//         child: choiceChip,
//       ));
//     }

//     return Wrap(
//       spacing: 5.0,
//       runSpacing: 3.0,
//       children: chips,
//     );
//   }