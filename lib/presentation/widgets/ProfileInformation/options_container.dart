import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OptionsContainer extends StatefulWidget {
  final Function(String) onLanguageSelected; // Callback para el idioma elegido
  final Icon icon;
  final String text;
  final String text_button;
  const OptionsContainer({
    super.key,
    required this.onLanguageSelected,
    required this.icon,
    required this.text,
    required this.text_button,
  });

  @override
  State<OptionsContainer> createState() => _OptionsContainerState();
}

class _OptionsContainerState extends State<OptionsContainer> {
  final List<String> _languages = ["Español", "Inglés", "Francés"];

  String _selectedLanguage = "Español";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
                      _selectedLanguage,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
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
                  backgroundColor: Colors.white,
                  itemExtent: 26,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      _selectedLanguage = _languages[index];
                    });
                    widget.onLanguageSelected(_languages[index]);
                  },
                  children:
                      _languages.map((language) => Text(language)).toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
