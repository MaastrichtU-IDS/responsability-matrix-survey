import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/providers.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/uni_logo.dart';

part 'widgets/info_column.dart';
part 'widgets/orcid_login_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  static const routeName = 'login';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: max(MediaQuery.of(context).size.width / 3.5, 1000),
            child: OverflowBar(
              spacing: 16.0,
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
                    child: OrcIDLoginButton(
                      onPressed: ref.read(authProvider.notifier).login,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
