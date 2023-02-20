import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controllers/questionaire_controller/questionnaire_controller.dart';
import '../../controllers/questionaire_controller/questionnaire_controller_states.dart';
import '../../repositories/user_repository.dart';
import '../../utils/instance_controller/instance_controller.dart';
import '../dahsboard/dashboard.dart';
import 'widgets/project_card.dart';
import '../root/root.dart';

final questionnaireController = StateNotifierProvider<QuestionnaireController,
    QuestionnaireControllerStates>((ref) {
  return QuestionnaireController(ref);
});

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);

  static const String routeName = 'home';

  final UserRepository _userRepository = InstanceController()[UserRepository];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionnaireController);
    ref.listen<QuestionnaireControllerStates>(questionnaireController,
        (prev, next) {
      next.mapOrNull(
        selected: (value) {
          ref.read(navController.notifier).navigateTo(DashboardPage.routeName);
        },
      );
    });
    return SingleChildScrollView(
      primary: true,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome ${_userRepository.user!.username}!',
              textScaleFactor: 1.2,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            const SizedBox(height: 20),
            state.questionnaires.isNotEmpty
                ? Wrap(children: [
                    for (int i = 0; i < state.questionnaires.length; i++)
                      ProjectCard(index: i)
                  ])
                : const Center(child: Text('No project found')),
            const SizedBox(
              height: 25,
            ),
          ]),
    );
  }
}
