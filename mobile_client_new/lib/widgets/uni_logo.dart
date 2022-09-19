import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      child: SvgPicture.asset(
        'assets/images/university_logo.svg',
        width: width,
        height: height,
        placeholderBuilder: (BuildContext context) =>
            const CircularProgressIndicator(),
      ),
    );
  }
}
