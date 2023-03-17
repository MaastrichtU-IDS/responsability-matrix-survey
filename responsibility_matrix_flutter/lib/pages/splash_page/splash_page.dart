import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsibility_matrix_flutter/services/restart_service/restart_app.dart';

import '../../controllers/auth_controller/auth_state.dart';
import '../../providers/providers.dart';
import '../../widgets/uni_logo.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthState>(
      authProvider,
      (previous, next) {
        if (next.isAuthenticated && next.isRegistered)
          context.goNamed('home');
        else
          RestartApp.restart(context);
      },
    );
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.read(authProvider.notifier).checkAuthentication();
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
