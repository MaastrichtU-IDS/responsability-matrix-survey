import 'package:flutter/material.dart';
import 'package:mobile_client_new/views/auth_gate/register/register_page.dart';
import 'package:mobile_client_new/widgets/buttons/primary_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.onLoginPressed});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLoginPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          validator: (value) =>
              (value?.isEmpty ?? true) ? 'Email is required' : null,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              labelText: 'Email', border: OutlineInputBorder()),
        ),
        const SizedBox(height: 16.0),
        TextFormField(
          controller: passwordController,
          obscureText: true,
          validator: (value) =>
              (value?.isEmpty ?? true) ? 'Password is required' : null,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
              labelText: 'Password', border: OutlineInputBorder()),
        ),
        const SizedBox(height: 24.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              isPrimary: false,
              onPressed: () {
                Navigator.of(context).pushNamed(RegisterPage.routeName);
              },
              child:
                  const Text("Register", style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(width: 8.0),
            PrimaryButton(
              onPressed: onLoginPressed,
              child: const Text("Login"),
            ),
          ],
        ),
      ],
    );
  }
}
