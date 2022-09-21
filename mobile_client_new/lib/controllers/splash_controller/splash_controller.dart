import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_client_new/repositories/questionairee_repository.dart';
import 'package:mobile_client_new/repositories/questions_repository.dart';
import 'package:mobile_client_new/views/splash_view/splash_page.dart';
import 'splash_controller_states.dart';
import '../../models/user/user_model.dart';
import '../../repositories/user_repository.dart';
import '../../utils/instance_controller/instance_controller.dart';

/// Controller for [SplashPage]
///
/// It checks if the users' current state(not logged in, not registered, registered) and redirects to the appropriate page.
class SplashController extends StateNotifier<SplashControllerStates> {
  SplashController() : super(const SplashControllerStates.initial());

  final QuestionsRepository _questionsRepository =
      InstanceController()[QuestionsRepository] as QuestionsRepository;

  final QuestionnarieRepository _questionnarieRepository =
      InstanceController()[QuestionnarieRepository] as QuestionnarieRepository;

  void checkAuthentication() async {
    if (FirebaseAuth.instance.currentUser != null) {
      final userRepository =
          InstanceController()[UserRepository] as UserRepository;
      final UserModel? user =
          await userRepository.getUser(FirebaseAuth.instance.currentUser!.uid);
      if (user != null) {
        await _questionsRepository.init();
        await _questionnarieRepository.init();
        state = const SplashControllerStates.authenticated();
      } else {
        state = const SplashControllerStates.authenticatedNotRegistered();
      }
    } else {
      state = const SplashControllerStates.unauthenticated();
    }
  }
}
