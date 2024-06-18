import 'package:flutter/material.dart';
import 'package:job_match_app/presentation/widgets/HomePage/Users/Jobs/container_jobs.dart';

class AppliedJobs extends StatelessWidget {
  final int numberOfJobs;

  const AppliedJobs({super.key, required this.numberOfJobs});

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
        const SizedBox(height: 10.0),
        ListView.builder(
          addAutomaticKeepAlives: true,
          itemCount: numberOfJobs,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: AplicattionsContainer(
                title: 'Job Title',
                body: 'Job Description',
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUhSDOVtjlWAcBcmqSO2Hzk2E3EdpLeR3YzA&s',
              ),
            );
          },
        ),
      ],
    );
  }
}
