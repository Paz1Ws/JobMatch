import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AplicattionsContainer extends StatelessWidget {
  final String title;
  final String body;
  final String imageUrl;

  const AplicattionsContainer({
    super.key,
    required this.title,
    required this.body,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 50.0,
          ),
          const SizedBox(width: 10.0),
          Padding(
            padding: const EdgeInsets.only(right: 30, top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                const SizedBox(height: 5.0),
                const SingleChildScrollView(
                  child: Text(
                    "Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumvvvvLorem ipsumvvLorem ipsumv",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
