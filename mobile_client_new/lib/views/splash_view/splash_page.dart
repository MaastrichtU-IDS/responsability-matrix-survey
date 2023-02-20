import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_client_new/widgets/uni_logo.dart';
import '../auth_gate/login/login_page.dart';
import '../auth_gate/register/register_page.dart';
import '../root/root.dart';
import '../../controllers/splash_controller/splash_controller.dart';
import '../../controllers/splash_controller/splash_controller_states.dart';

final splashPageController =
    StateNotifierProvider<SplashController, SplashControllerStates>((ref) {
  return SplashController();
});

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SplashControllerStates>(splashPageController, (previous, next) {
      next.mapOrNull(
        authenticated: (value) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(RootPage.routeName, (route) => false);
        },
        unauthenticated: (value) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(LoginPage.routeName, (route) => false);
        },
        authenticatedNotRegistered: (value) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              RegisterPage.routeName, (route) => false);
        },
      );
    });
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(splashPageController.notifier).checkAuthentication();
    });

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            UniLogo(),
            SizedBox(width: 10),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
