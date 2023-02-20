import 'package:flutter/material.dart';
import '../style/style_provider.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.info_outline,
          color: StyleProvider.of(context).colors.appPrimaryColor,
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
