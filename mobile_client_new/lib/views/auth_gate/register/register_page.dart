import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_client_new/controllers/auth_gate/autg_gate_states.dart';
import 'package:mobile_client_new/views/auth_gate/login/login_page.dart';
import 'package:mobile_client_new/views/splash_view/splash_page.dart';
import 'package:mobile_client_new/widgets/uni_logo.dart';
import 'package:mobile_client_new/widgets/buttons/primary_button.dart';
import 'package:mobile_client_new/widgets/text_fields/generic_text_field.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static const String routeName = 'register';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
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
            height: MediaQuery.of(context).size.height * 0.8,
            width: max(MediaQuery.of(context).size.width / 3.5, 500),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const UniLogo(),
                  const SizedBox(height: 48.0),
                  TextFormField(
                    controller: usernameController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: passwordConfirmController,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PrimaryButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          isPrimary: false,
                          child: const Text(
                            "Back",
                            style: TextStyle(color: Colors.black),
                          )),
                      PrimaryButton(
                          child: const Text('Register'),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              ref
                                  .read(
                                      authGateControllerProvider.originProvider)
                                  .createAccountWithEmailAndPassword(
                                      emailController.text,
                                      passwordController.text,
                                      usernameController.text);
                            }
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
