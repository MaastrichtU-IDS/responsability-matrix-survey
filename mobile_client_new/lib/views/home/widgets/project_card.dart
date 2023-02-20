import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/questionnaire/questionnaire_model.dart';
import '../../../repositories/questions_repository.dart';
import '../../../utils/instance_controller/instance_controller.dart';
import '../../../utils/pdf_creator/pdf_creator.dart';
import '../edit_questionnaire_dialog.dart';
import '../home_page.dart';
import '../../../widgets/buttons/primary_button.dart';

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(questionnaireModel.title,
                    textScaleFactor: 1.2,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).primaryColor,
                        )),
                Text(
                  questionnaireModel.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Completion : ${complation * 100 ~/ 1}%',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                            value: 'edit',
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
                            child: const Text('Edit'),
                          ),
                          PopupMenuItem(
                              value: 'pdf',
                              onTap: () async {
                                
                                PdfCreator.createPdfFromQuestionairee(
                                    state.questionnaires[index]);
                              },
                              child: const Text('Export to PDF')),
                          PopupMenuItem(
                            value: 'delete',
                            onTap: () async {
                              final bool? confirm = await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                          'Delete Project: ${questionnaireModel.title}'),
                                      content: const Text(
                                          'Are you sure you want to delete this project?'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(true);
                                            },
                                            style: TextButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                foregroundColor: Colors.white),
                                            child: const Text(
                                              'Yes',
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(false);
                                            },
                                            child: const Text('No')),
                                      ],
                                    );
                                  }) as bool;

                              if (confirm ?? false) {
                                await ref
                                    .read(questionnaireController.notifier)
                                    .deleteQuestionnaire(questionnaireModel);
                              }
                            },
                            child: const Text('Delete'),
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
                    .read(questionnaireController.notifier)
                    .selectedQuestionnaire
                    ?.id ??
                '') !=
            questionnaireModel.id)
        ? PrimaryButton(
            child: const Text('Select'),
            onPressed: () {
              ref
                  .read(questionnaireController.notifier)
                  .selectQuestionnarie(questionnaireModel);
            },
          )
        : PrimaryButton(
            isPrimary: false,
            onPressed: () {
              ref
                  .read(questionnaireController.notifier)
                  .deselectQuestionnarie();
            },
            child:
                const Text('Deselect', style: TextStyle(color: Colors.black)),
          );
  }
}
