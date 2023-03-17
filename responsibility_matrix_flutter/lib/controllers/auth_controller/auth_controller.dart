import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsibility_matrix_flutter/services/restart_service/restart_app.dart';
import 'package:responsibility_matrix_flutter/services/snackbar_service/snackbar_service.dart';
import 'package:url_launcher/url_launcher.dart';

import 'auth_state.dart';
import '../../providers/providers.dart';
import '../../repositories/concrete/auth_repository/auth_repository.dart';
import '../../repositories/concrete/questionnaire_repository.dart';
import '../../repositories/concrete/questions_repository.dart';
import '../../repositories/concrete/user_repository.dart';
import '../../services/graphql/graphql_service.dart';
import '../../services/graphql/mutations/create_user_mutation.dart';
import '../../utils/instance_controller/instance_controller.dart';

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

  final SnackBarService snackBarService =
      InstanceController().getByType<SnackBarService>();

  Future<void> checkAuthentication() async {
    if (authRepository.isCodePresent && !authRepository.isTokenPresent) {
      await graphQLService.tokenProvider();
    }
    if (authRepository.isTokenPresent) {
      final response = await userRepository.getUser(authRepository.uuid!);

      if (response.hasData) {
        await initAll();
        state = state.copyWith(
            isAuthenticated: true, isRegistered: true, user: response.data);
        return;
      }
      if (await _createNewUser()) {
        return;
      }
    }
    snackBarService
        .showErrorMessage('Error while logging in. Please try again later.');

    await Future.delayed(const Duration(seconds: 2));

    authRepository.clearAll();

    state =
        state.copyWith(isAuthenticated: false, isRegistered: false, user: null);
  }

  Future<bool> _createNewUser() async {
    final newUser = await userRepository.createUser(CreateUserMutationArgs(
        uuid: authRepository.uuid!, username: authRepository.userName!));

    if (newUser.hasError) {
      snackBarService.showErrorMessage(newUser.error?.toString() ?? 'error',
          clear: true);

      return false;
    }

    if (newUser.hasData) {
      await initAll();
      state = state.copyWith(
          isAuthenticated: true, isRegistered: true, user: newUser.data);
      return true;
    }
    return false;
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
