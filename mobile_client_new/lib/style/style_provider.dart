import 'package:flutter/material.dart';
import 'colors.dart';
import 'margins.dart';
import 'texts.dart';

/// Custom style provider for the app.
/// 
/// Accessible through [StyleProvider.of].
class StyleProvider extends InheritedWidget {
  StyleProvider({Key? key, required Widget child})
      : super(key: key, child: child);

  final AppColors colors = AppColors();

  final Margins margins = const Margins();

  final Texts texts = Texts();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static StyleProvider of(BuildContext context) {
    final StyleProvider? result =
        context.dependOnInheritedWidgetOfExactType<StyleProvider>();
    assert(result != null, 'No StyleProvider found in context');
    return result!;
  }
}
