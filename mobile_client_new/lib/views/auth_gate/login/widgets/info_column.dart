import 'package:flutter/material.dart';
import 'package:mobile_client_new/widgets/uni_logo.dart';

class InfoColumn extends StatelessWidget {
  const InfoColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const UniLogo(),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent euismod convallis tincidunt. Vestibulum pharetra lectus sit amet elit placerat, ac volutpat velit sagittis. Proin et commodo lectus. Sed nec quam vitae odio ornare condimentum eu ut ipsum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline6,
          ),
        )
      ],
    );
  }
}
