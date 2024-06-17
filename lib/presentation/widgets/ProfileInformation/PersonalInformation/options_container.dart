import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OptionsContainer extends StatefulWidget {
  final Function(String) onSelected;
  final Icon icon;
  final String text;
  final String text_button;
  const OptionsContainer({
    super.key,
    required this.onSelected,
    required this.icon,
    required this.text,
    required this.text_button,
  });

  @override
  State<OptionsContainer> createState() => _OptionsContainerState();
}

class _OptionsContainerState extends State<OptionsContainer> {
  final List<String> _languages = [
    "Spanish",
    "English",
    "Portuguese",
    "French",
    "Japanese"
  ];
  String _selectedLanguage = "Spanish";
  final List<String> _typeJobs = [
    "Full-time",
    "Part-time",
    "Internship",
    "Remote",
    "Variaty"
  ];
  String _selectedTypeJob = "Full-time";

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      widget.icon,
      const SizedBox(width: 10),
      Expanded(
        child: Text(widget.text),
      ),
      Expanded(
        child: CupertinoButton(
          color: Colors.orangeAccent,
          child: FittedBox(
            fit: BoxFit.none,
            child: Row(
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    widget.text == "Types of Jobs Offered"
                        ? _selectedTypeJob
                        : _selectedLanguage,
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.black
                            : Colors.white,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.arrow_right),
              ],
            ),
          ),
          onPressed: () => showCupertinoModalPopup(
            barrierColor: const Color.fromRGBO(0, 0, 0, 0.5),
            context: context,
            builder: (_) => SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              child: CupertinoPicker(
                squeeze: 1.5,
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ? Colors.black
                    : Colors.white,
                itemExtent: 26,
                onSelectedItemChanged: (index) {
                  setState(() {
                    if (widget.text == "Types of Jobs Offered") {
                      _selectedTypeJob = _typeJobs[index];
                      widget.onSelected(_selectedTypeJob);
                    } else {
                      _selectedLanguage = _languages[index];
                      widget.onSelected(_selectedLanguage);
                    }
                  });
                },
                children: widget.text == "Types of Jobs Offered"
                    ? _typeJobs.map((typeJob) => Text(typeJob)).toList()
                    : _languages.map((language) => Text(language)).toList(),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
