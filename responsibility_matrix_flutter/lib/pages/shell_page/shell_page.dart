import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/providers.dart';
import '../../widgets/responsive_builder/responsive_builder.dart';
import '../../widgets/uni_logo.dart';

part './widgets/shell_page_large.dart';
part './widgets/shell_page_small.dart';
part './widgets/nav_bar_item.dart';
part './widgets/nav_bar.dart';
part './data/navigation_item.dart';
part './widgets/add_questionnaire_dialog.dart';

final rightItemsAlways = const [
  NavigationItem(title: 'Home', index: 0, route: 'home'),
];

final rightItemsWhenProjectSelected = const [
  NavigationItem(title: 'Questions', index: 1, route: 'questions'),
  NavigationItem(title: 'Dashboard', index: 2, route: 'dashboard'),
];

class ShellPage extends ConsumerWidget {
  const ShellPage({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<String?>(
      shellProvider,
      (previous, next) {
        if (next == null) return;
        context.goNamed(next);
      },
    );
    return ResponsiveBuilder(
        smallScreen: _ShellPageSmall(
          key: const Key('shell_page_small'),
          child: child,
        ),
        largeScreen: _ShellPageLarge(
          key: const Key('shell_page_large'),
          child: child,
        ));
  }
}
