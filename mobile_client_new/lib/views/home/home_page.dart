import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_client_new/controllers/questionaire_controller/questionnaire_controller.dart';
import 'package:mobile_client_new/controllers/questionaire_controller/questionnaire_controller_states.dart';
import 'package:mobile_client_new/repositories/questions_repository.dart';
import 'package:mobile_client_new/repositories/user_repository.dart';
import 'package:mobile_client_new/utils/instance_controller/instance_controller.dart';
import 'package:mobile_client_new/views/dahsboard/dashboard.dart';
import 'package:mobile_client_new/views/root/root.dart';
import 'package:mobile_client_new/widgets/buttons/primary_button.dart';

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
          ref
              .read(navController.originProvider)
              .navigateTo(DashboardPage.routeName);
        },
      );
    });
    return SingleChildScrollView(
      primary: true,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome ${_userRepository.user!.username}!',
              textScaleFactor: 1.2,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            const SizedBox(height: 20),
            state.questionnaires.isNotEmpty
                ? Wrap(direction: Axis.horizontal, children: [
                    for (int i = 0; i < state.questionnaires.length; i++)
                      ProjectCard(index: i)
                  ])
                : const Center(child: Text("No questionnaires found")),
            const SizedBox(
              height: 25,
            ),
          ]),
    );
  }
}

class ProjectCard extends ConsumerWidget {
  ProjectCard({super.key, required this.index});
  final int index;

  final QuestionsRepository _questionsRepository =
      InstanceController()[QuestionsRepository];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionnaireController);
    final questionnaireModel = state.questionnaires[index];
    final double complation = questionnaireModel.ClosedQuestions.length /
        _questionsRepository.allQuestions.length;
    return SizedBox(
      width: 400,
      height: 200,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(questionnaireModel.title,
                  textScaleFactor: 1.2,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Theme.of(context).primaryColor,
                      )),
              Text(
                questionnaireModel.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption,
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Completion : ${complation * 100 ~/ 1}%",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Theme.of(context).primaryColor,
                      )),
              const SizedBox(
                height: 10,
              ),
              LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  minHeight: 15,
                  value: complation),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ((ref
                                  .read(questionnaireController.originProvider)
                                  .selectedQuestionnaire
                                  ?.id ??
                              "") !=
                          questionnaireModel.id)
                      ? PrimaryButton(
                          child: const Text("Select"),
                          onPressed: () {
                            ref
                                .read(questionnaireController.originProvider)
                                .selectQuestionnarie(questionnaireModel);
                          },
                        )
                      : PrimaryButton(
                          isPrimary: false,
                          onPressed: () {
                            ref
                                .read(questionnaireController.originProvider)
                                .deselectQuestionnarie();
                          },
                          child: const Text("Deselect",
                              style: TextStyle(color: Colors.black)),
                        ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
