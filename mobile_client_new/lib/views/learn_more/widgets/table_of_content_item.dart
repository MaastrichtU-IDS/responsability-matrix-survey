import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TableOfContentItem extends StatelessWidget {
  const TableOfContentItem(
      {super.key, required this.title, required this.jumpKey, this.level = 0});

  final String title;
  final GlobalKey jumpKey;
  final int level;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scrollable.ensureVisible(jumpKey.currentContext!,
            duration: const Duration(milliseconds: 500));
      },
      child: Container(
        padding: EdgeInsets.only(
            left: 16 + (level + 1) * 16, top: 8, bottom: 8, right: 16),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline3!.copyWith(
              fontSize: 24 - level * 2,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface,
              decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}
