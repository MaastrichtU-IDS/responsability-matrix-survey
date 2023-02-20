import 'package:flutter/material.dart';

class ContentItem extends StatelessWidget {
  const ContentItem(
      {super.key, required this.title, required this.content, this.level = 0});
  final String title;
  final String content;
  final int level;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      padding: EdgeInsets.only(
          left: 16 + (level + 1) * 16, top: 8, bottom: 8, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 24 - level * 4,
                ),
          ),
          Text(
            content,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 16 - level * 2,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface),
          ),
        ],
      ),
    );
  }
}
