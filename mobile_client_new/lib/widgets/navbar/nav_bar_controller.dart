import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef RouteGuard = String? Function(String route);

class NavBarController extends StateNotifier<String> {
  NavBarController({required String initalRoute}) : super(initalRoute);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final List<RouteGuard> _routeGuards = [];

  String? navigateTo(String route) {
    for (final guard in _routeGuards) {
      final error = guard(route);
      if (error != null) {
        return error;
      }
    }
    state = route;
    navigatorKey.currentState!.pushReplacementNamed(route);
    return null;
  }

  void addRouteGuard(RouteGuard guard) {
    _routeGuards.add(guard);
  }

  void removeRouteGuard(RouteGuard guard) {
    _routeGuards.remove(guard);
  }

  void clearRouteGuards() {
    _routeGuards.clear();
  }
}
