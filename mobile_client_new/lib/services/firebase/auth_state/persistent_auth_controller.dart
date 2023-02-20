import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../utils/instance_controller/instance_controller.dart';
import 'auth_states.dart';

/// Controller for the watching AuthState.
///
/// When current AuthState is changed, it will notify the state to the state notifier.
class PersistentAuthController extends StateNotifier<AuthStates> {
  PersistentAuthController() : super(const AuthStates.initial()) {
    if (FirebaseAuth.instance.currentUser != null) {
      state = const AuthStates.authenticated();
    } else {
      state = const AuthStates.unauthenticated();
    }

    FirebaseAuth.instance.authStateChanges().listen((authState) {
      InstanceController()[Logger].i('AuthState Changed!: $authState');
      if (authState == null) {
        state = const AuthStates.unauthenticated();
      } else {
        state = const AuthStates.authenticated();
      }
    });
  }
}
