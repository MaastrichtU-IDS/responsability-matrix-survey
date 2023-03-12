import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Icon(
          Icons.info_outline,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
