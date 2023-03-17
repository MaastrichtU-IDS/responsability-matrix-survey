import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'repositories/concrete/user_repository.dart';
import 'pages/dashboard_page/dashboard_page.dart';
import 'pages/home_page/home_page.dart';
import 'pages/learn_more_page/learn_more_page.dart';
import 'pages/login_page/login_page.dart';
import 'pages/questions_page/questions_page.dart';
import 'pages/shell_page/shell_page.dart';

import 'pages/splash_page/splash_page.dart';
import 'repositories/concrete/auth_repository/auth_repository.dart';
import 'utils/instance_controller/instance_controller.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

NoTransitionPage<dynamic> _noTransitionBuilder(
    GoRouterState state, Widget child) {
  return NoTransitionPage(
    key: state.pageKey,
    child: child,
  );
}

final AuthRepository authRepository =
    InstanceController().getByType<AuthRepository>();

final UserRepository userRepository =
    InstanceController().getByType<UserRepository>();

final router = GoRouter(
    initialLocation: '/',
    navigatorKey: rootNavigatorKey,
    redirect: (context, state) {
      if (state.location == '/learn-more') {
        return null;
      }
      if (!authRepository.isCodePresent && !authRepository.isTokenPresent) {
        return '/login';
      }
      if (authRepository.isCodePresent && !authRepository.isTokenPresent) {
        return '/';
      }
      if (authRepository.isTokenPresent && userRepository.user == null) {
        return '/';
      }
      return null;
    },
    routes: [
      GoRoute(
          path: '/',
          name: 'splash',
          pageBuilder: (context, state) {
            return MaterialPage<void>(
              key: state.pageKey,
              child: const SplashPage(),
            );
          }),
      GoRoute(
          path: '/login',
          name: 'login',
          pageBuilder: (context, state) {
            return MaterialPage<void>(
              key: state.pageKey,
              child: const LoginPage(),
            );
          }),
      GoRoute(
        path: '/learn-more',
        name: 'learn-more',
        pageBuilder: (context, state) {
          return MaterialPage<void>(
            key: state.pageKey,
            child: const LearnMorePage(),
          );
        },
      ),
      ShellRoute(
          navigatorKey: shellNavigatorKey,
          builder: (context, state, child) => ShellPage(child: child),
          routes: [
            GoRoute(
              path: '/home',
              name: 'home',
              pageBuilder: (context, state) =>
                  _noTransitionBuilder(state, const HomePage()),
            ),
            GoRoute(
                path: '/dashboard',
                name: 'dashboard',
                pageBuilder: (context, state) =>
                    _noTransitionBuilder(state, const DashboardPage())),
            GoRoute(
                path: '/questions',
                name: 'questions',
                pageBuilder: (context, state) =>
                    _noTransitionBuilder(state, const QuestionsPage())),
            GoRoute(
                path: '/questions/:id',
                name: 'questionsWithId',
                pageBuilder: (context, state) => _noTransitionBuilder(
                    state,
                    QuestionsPage(
                      currentQuestionPosition: int.parse(state.params['id']!),
                    ))),
          ])
    ]);
