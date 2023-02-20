import 'package:flutter/material.dart';
import '../../../learn_more/learn_more_page.dart';
import '../../../../widgets/buttons/primary_button.dart';
import '../../../../widgets/uni_logo.dart';

class InfoColumn extends StatelessWidget {
  const InfoColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const UniLogo(),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'With FAIR (findable, accessible, interoperable, and reusable) as a foundation, the Institute of Data Science (IDS) has an emerging focus on responsible data science by design. The Responsibility Matrix is developed as a general framework to explicitly design responsibility in data science projects. The Matrix stimulates thinking along dimensions that data scientists may be prone to overlook. The matrix helps you achieve the “responsible by design” as an integral part of your project by introducing eight dimensions composed of four components and four scopes. Within a two-dimensional space several questions arise whose answer will identify the responsibilities and outlook of the project.',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: PrimaryButton(
            onPressed: () {
              Navigator.of(context).pushNamed(LearnMorePage.routeName);
            },
            isPrimary: false,
            child: const Text(
              'Learn More',
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
