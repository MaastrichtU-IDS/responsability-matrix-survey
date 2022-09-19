import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_client_new/repositories/user_repository.dart';
import 'package:mobile_client_new/services/graphql/mutations/create_user_mutation.dart';
import 'package:mobile_client_new/utils/instance_controller/instance_controller.dart';
import 'package:mobile_client_new/views/splash_view/splash_page.dart';
import 'autg_gate_states.dart';

/// Controler for [AuthGatePage]
/// Includes logic for login
class AuthGateController extends StateNotifier<AuthGateStates> {
  AuthGateController(this.ref) : super(const AuthGateStates.initial());

  final Ref ref;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserRepository _userRepository =
      InstanceController()[UserRepository] as UserRepository;

  void loginWithEmailAndPassword(String email, String password) async {
    state = const AuthGateStates.loading();
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (credential.user == null) {
        state = const AuthGateStates.error("Oops, something went wrong");
        state = const AuthGateStates.initial();
        return;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        state = const AuthGateStates.error("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        state = const AuthGateStates.error(
            "Wrong password provided for that user.");
      } else if (e.code == 'invalid-email') {
        state = const AuthGateStates.error("Invalid email.");
      } else {
        state = const AuthGateStates.error("Oops, something went wrong");
      }
      state = const AuthGateStates.initial();
    }
  }

  void createAccountWithEmailAndPassword(
      String email, String password, String username) async {
    state = const AuthGateStates.loading();
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user == null) {
        state = const AuthGateStates.error("Oops, something went wrong");
        state = const AuthGateStates.initial();
        return;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        state =
            const AuthGateStates.error("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        state = const AuthGateStates.error(
            "The account already exists for that email.");
      } else if (e.code == 'invalid-email') {
        state = const AuthGateStates.error("Invalid email.");
      } else {
        state = const AuthGateStates.error("Oops, something went wrong");
      }
      state = const AuthGateStates.initial();
    }
    await _userRepository.createUser(CreateUserMutationArgs(
      uuid: _auth.currentUser!.uid,
      email: email,
      username: username,
    ));

    FirebaseAuth.instance.signOut();
  }
}
