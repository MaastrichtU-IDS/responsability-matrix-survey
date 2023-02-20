import 'package:flutter/material.dart';

class UniLogo extends StatelessWidget {
  const UniLogo({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'login-hero',
      child: Image.asset(
        'assets/images/university_logo.png',
        width: width,
        height: height,
      ),
    );
  }
}
