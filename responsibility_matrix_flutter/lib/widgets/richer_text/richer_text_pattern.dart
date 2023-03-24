import 'package:flutter/widgets.dart';

class RicherTextPattern {
  final String name;
  final Pattern pattern;
  final int priority;
  final TextSpan Function(String text)? builder;

  RicherTextPattern({
    required this.name,
    required this.pattern,
    required this.builder,
    this.priority = 0,
  });

  List<Match> match(String text) => pattern.allMatches(text).toList();
}
