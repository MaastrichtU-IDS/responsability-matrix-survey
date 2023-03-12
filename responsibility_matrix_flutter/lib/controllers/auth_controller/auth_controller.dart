import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_state.dart';
import '../../providers/providers.dart';
import '../../repositories/auth_repository.dart';
import '../../repositories/questionnaire_repository.dart';
import '../../repositories/questions_repository.dart';
import '../../repositories/user_repository.dart';
import '../../services/graphql/graphql_service.dart';
import '../../services/graphql/mutations/create_user_mutation.dart';
import '../../utils/instance_controller/instance_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthController extends StateNotifier<AuthState> {
  AuthController(
    this.ref,
  ) : super(AuthState(isAuthenticated: false, isRegistered: false, user: null));
  final Ref ref;

  final GraphQLService graphQLService =
      InstanceController().getByType<GraphQLService>();

  final AuthRepository authRepository =
      InstanceController().getByType<AuthRepository>();

  final UserRepository userRepository =
      InstanceController().getByType<UserRepository>();

  final QuestionnaireRepository questionnaireRepository =
      InstanceController().getByType<QuestionnaireRepository>();

  Future<void> checkAuthentication() async {
    if (authRepository.isCodePresent && !authRepository.isTokenPresent) {
      await graphQLService.tokenProvider();
    }
    if (authRepository.isTokenPresent) {
      final response = await userRepository.getUser(authRepository.uuid!);
      if (response != null) {
        await initAll();
        state = state.copyWith(
            isAuthenticated: true, isRegistered: true, user: response);
        return;
      }
      final newUser = await userRepository.createUser(CreateUserMutationArgs(
          uuid: authRepository.uuid!, username: authRepository.userName!));
      if (newUser != null) {
        await initAll();
        state = state.copyWith(
            isAuthenticated: true, isRegistered: true, user: newUser);
        return;
      }
      return;
    }
    state =
        state.copyWith(isAuthenticated: false, isRegistered: false, user: null);
  }

  Future<void> initAll() async {
    ref.read(loadingProvider.notifier).startLoading();
    await InstanceController().getByType<QuestionsRepository>().init();
    await ref.read(projectProvider.notifier).refresh();
    ref.read(loadingProvider.notifier).stopLoading();
  }

  void login() {
    if (kIsWeb) {
      _loginWeb();
      return;
    }
    throw UnimplementedError('Not implemented for other than web');
  }

  void _loginWeb() async {
    final url = Uri.parse(authRepository.authUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, webOnlyWindowName: '_self');
    } else {
      throw 'Could not launch $url';
    }
  }

  void logout() {
    authRepository.clearAll();
    state =
        state.copyWith(isAuthenticated: false, isRegistered: false, user: null);
  }
}
