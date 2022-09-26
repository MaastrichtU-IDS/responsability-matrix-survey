import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_client_new/controllers/questionaire_controller/questionnaire_controller.dart';
import 'package:mobile_client_new/controllers/questionaire_controller/questionnaire_controller_states.dart';
import 'package:mobile_client_new/models/questionnaire/questionnaire_model.dart';
import 'package:mobile_client_new/repositories/questions_repository.dart';
import 'package:mobile_client_new/repositories/user_repository.dart';
import 'package:mobile_client_new/utils/instance_controller/instance_controller.dart';
import 'package:mobile_client_new/utils/pdf_creator/pdf_creator.dart';
import 'package:mobile_client_new/views/dahsboard/dashboard.dart';
import 'package:mobile_client_new/views/home/edit_questionnaire_dialog.dart';
import 'package:mobile_client_new/views/root/root.dart';
import 'package:mobile_client_new/widgets/buttons/primary_button.dart';
import 'package:mobile_client_new/widgets/navbar/nav_bar_controller.dart';

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
    return IntrinsicHeight(
      child: SizedBox(
        width: 400,
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
                  maxLines: 2,
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
                    _getSelectButton(ref, questionnaireModel),
                    const SizedBox(width: 10),
                    PopupMenuButton(
                      itemBuilder: (context) {
                        return <PopupMenuItem<String>>[
                          PopupMenuItem(
                            value: "edit",
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => EditQuestionnaireDialog(
                                    id: questionnaireModel.id,
                                    title: questionnaireModel.title,
                                    description:
                                        questionnaireModel.description),
                              );
                            },
                            child: Text("Edit"),
                          ),
                          PopupMenuItem(
                              value: "pdf",
                              onTap: () {
                                PdfCreator.createPdfFromQuestionairee(
                                    questionnaireModel);
                              },
                              child: Text("Export to PDF")),
                          PopupMenuItem(
                            value: "delete",
                            onTap: () async {
                              bool? confirm = await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                          "Delete Questionnaire: ${questionnaireModel.title}"),
                                      content: const Text(
                                          "Are you sure you want to delete this questionnaire?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(true);
                                            },
                                            child: const Text("Yes")),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(false);
                                            },
                                            child: const Text("No")),
                                      ],
                                    );
                                  }) as bool;

                              if (confirm) {
                                await ref
                                    .read(
                                        questionnaireController.originProvider)
                                    .deleteQuestionnaire(questionnaireModel);
                              }
                            },
                            child: const Text("Delete"),
                          ),
                        ];
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getSelectButton(
      WidgetRef ref, QuestionnaireModel questionnaireModel) {
    return ((ref
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
            child:
                const Text("Deselect", style: TextStyle(color: Colors.black)),
          );
  }
}
