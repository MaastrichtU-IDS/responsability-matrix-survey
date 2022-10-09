import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../controllers/auth_gate/autg_gate_states.dart';
import '../../../controllers/auth_gate/auth_gate_controller.dart';
import 'widgets/info_column.dart';
import 'widgets/login_form.dart';
import '../../splash_view/splash_page.dart';

final authGateControllerProvider =
    StateNotifierProvider<AuthGateController, AuthGateStates>(
        (ref) => AuthGateController(ref));

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  static const routeName = 'login';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthGateStates>(
      authGateControllerProvider,
      (previous, next) {
        next.mapOrNull(
          error: (value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(value.error),
              ),
            );
          },
          toSplash: (_) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                SplashPage.routeName, (route) => false);
          },
        );
      },
    );
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: max(MediaQuery.of(context).size.width / 3.5, 1000),
              child: OverflowBar(
                spacing: 16.0,
                overflowDirection: VerticalDirection.down,
                overflowAlignment: OverflowBarAlignment.center,
                overflowSpacing: 16.0,
                alignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: max(MediaQuery.of(context).size.width / 6, 400),
                      child: const InfoColumn()),
                  const SizedBox(width: 32.0),
                  SizedBox(
                    width: max(MediaQuery.of(context).size.width / 6, 400),
                    child: LoginForm(
                      emailController: emailController,
                      passwordController: passwordController,
                      onLoginPressed: () {
                        if (formKey.currentState!.validate()) {
                          ref
                              .read(authGateControllerProvider.originProvider)
                              .loginWithEmailAndPassword(emailController.text,
                                  passwordController.text);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
