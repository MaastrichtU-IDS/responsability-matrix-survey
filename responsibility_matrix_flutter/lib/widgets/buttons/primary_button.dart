import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, required this.child, this.isPrimary = true, this.onPressed});

  final VoidCallback? onPressed;
  final Widget child;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isPrimary ? Theme.of(context).primaryColor : Colors.white,
          //minimumSize: Size(88, 36),
          padding: const EdgeInsets.all(12),
          fixedSize: const Size(144, 36),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
        ),
        child: isPrimary
            ? child
            : DefaultTextStyle(
                style: const TextStyle(
                  color: Colors.black,
                ),
                child: child,
              ),
      ),
    );
  }
}
