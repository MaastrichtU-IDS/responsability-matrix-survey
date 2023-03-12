import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef RouteGuard = String? Function(String route);

class ShellController extends StateNotifier<String> {
  ShellController({required String initialRoute}) : super(initialRoute);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  String? navigateTo(String route) {
    state = route;
    return null;
  }
}
