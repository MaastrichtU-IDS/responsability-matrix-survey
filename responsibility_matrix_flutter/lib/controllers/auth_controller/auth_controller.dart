import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:responsibility_matrix_flutter/controllers/auth_controller/auth_state.dart';

class AuthController extends StateNotifier<AuthState> {
  AuthController()
      : super(
            AuthState(isAuthenticated: false, isRegistered: false, user: null));

  final String orcidCallbackUrl = const String.fromEnvironment(
      'ORCID_CALLBACK_URL',
      defaultValue:
          'https://orcid.org/oauth/authorize?client_id=APP-YJFAMCMI8NXB9AAW&response_type=code&scope=/authenticate&redirect_uri=https://localhost.nip.io/#/');
  final String callbackUrl =
      const String.fromEnvironment('CALLBACK_URL', defaultValue: 'http');

  void authenticate() async {
    final result = await FlutterWebAuth2.authenticate(
        url: orcidCallbackUrl, callbackUrlScheme: callbackUrl);

    print(result);
  }
}
