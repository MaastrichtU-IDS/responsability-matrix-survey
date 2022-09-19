import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_client_new/controllers/auth_gate/autg_gate_states.dart';
import 'package:mobile_client_new/controllers/auth_gate/auth_gate_controller.dart';
import 'package:mobile_client_new/views/auth_gate/register/register_page.dart';
import 'package:mobile_client_new/views/splash_view/splash_page.dart';
import 'package:mobile_client_new/widgets/uni_logo.dart';
import 'package:mobile_client_new/widgets/buttons/primary_button.dart';
import 'package:mobile_client_new/widgets/text_fields/generic_text_field.dart';

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
          child: SizedBox(
            height: double.infinity,
            width: max(MediaQuery.of(context).size.width / 3.5, 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const UniLogo(),
                const SizedBox(height: 48.0),
                GenericTextField(
                    hText: "Email",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    }),
                const SizedBox(height: 8.0),
                GenericTextField(
                    hText: "Password",
                    controller: passwordController,
                    obscureText: true,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    }),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PrimaryButton(
                      isPrimary: false,
                      onPressed: () {
                        Navigator.of(context).pushNamed(RegisterPage.routeName);
                      },
                      child: const Text("Register",
                          style: TextStyle(color: Colors.black)),
                    ),
                    const SizedBox(width: 8.0),
                    PrimaryButton(
                        child: const Text("Login"),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ref
                                .read(authGateControllerProvider.originProvider)
                                .loginWithEmailAndPassword(emailController.text,
                                    passwordController.text);
                          }
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
