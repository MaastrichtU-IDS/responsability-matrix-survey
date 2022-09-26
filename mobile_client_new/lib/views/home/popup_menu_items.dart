import 'package:flutter/material.dart';

class PopupMenuItemsWrapper {
  final String value;
  final String title;
  final VoidCallback onTap;

  const PopupMenuItemsWrapper({
    required this.title,
    required this.onTap,
    required this.value,
  });

  PopupMenuItem getItem(BuildContext context) {
    return PopupMenuItem(
      value: value,
      onTap: onTap,
      child: Text(title),
    );
  }
}
