import 'package:flutter/material.dart';
import 'package:responsibility_matrix_flutter/widgets/richer_text/richer_text_pattern.dart';

class RicherText extends StatelessWidget {
  const RicherText(
      {super.key,
      required this.text,
      this.patterns = const [],
      this.defaultBuilder});

  final String text;
  final TextSpan Function(String text)? defaultBuilder;
  final List<RicherTextPattern> patterns;

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(children: [
        ..._buildTextSpans(text),
      ]),
    );
  }

  List<InlineSpan> _buildTextSpans(String text) {
    final List<_Span> spans = [];

    patterns.sort((a, b) => a.priority.compareTo(b.priority));

    for (final pattern in patterns) {
      final potentialSpans = pattern
          .match(text)
          .map((e) =>
              _Span(start: e.start, end: e.end, builder: pattern.builder))
          .toList();
      final notCollidingSpans = potentialSpans
          .where((e) => !spans.any((span) => span.collidesWith(e)))
          .toList();
      spans.addAll(notCollidingSpans);
    }

    spans.sort((a, b) => a.compareTo(b));

    int lastStart = 0;
    int lastEnd = 0;

    final List<_Span> result = [];

    while (lastEnd < text.length) {
      if (spans.any((element) => element.includes(lastEnd))) {
        if (lastStart != lastEnd) {
          result.add(_Span(start: lastStart, end: lastEnd));
        }
        final span = spans.firstWhere((element) => element.includes(lastEnd));
        result.add(span);
        lastStart = span.end;
        lastEnd = span.end;
      }
      lastEnd++;
    }

    if (lastStart != lastEnd) {
      result.add(_Span(
        start: lastStart,
        end: lastEnd,
      ));
    }

    return result
        .map((e) =>
            e.builder?.call(text.substring(e.start, e.end)) ??
            defaultBuilder?.call(text.substring(e.start, e.end)) ??
            TextSpan(text: text.substring(e.start, e.end)))
        .toList();
  }
}

class _Span {
  final int start;
  final int end;
  final TextSpan Function(String text)? builder;

  _Span({required this.start, required this.end, this.builder});

  bool collidesWith(_Span other) {
    return start < other.end && end > other.start;
  }

  bool includes(int index) {
    return index >= start && index < end;
  }

  int compareTo(_Span other) {
    return start.compareTo(other.start);
  }
}
