import 'package:flutter/material.dart';

class EditItem extends StatelessWidget {
  final Widget widget;
  final String title;
  Icon icon;
  EditItem({
    super.key,
    required this.icon,
    required this.widget,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Icon(
            icon.icon,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 20),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 5,
          child: widget,
        )
      ],
    );
  }
}
