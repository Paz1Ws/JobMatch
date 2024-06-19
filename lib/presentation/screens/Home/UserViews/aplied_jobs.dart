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
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(20.0), // Round image
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUhSDOVtjlWAcBcmqSO2Hzk2E3EdpLeR3YzA&s',
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.cover, // Adjust image fit as needed
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      const Expanded(
                        // Wrap content in Expanded for scrollable text
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Job Title',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Job Description - This is a longer description that may overflow the container.',
                              maxLines: 3, // Limit lines for description
                              overflow: TextOverflow
                                  .ellipsis, // Add ellipsis if overflow
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 1.0,
                            )
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
