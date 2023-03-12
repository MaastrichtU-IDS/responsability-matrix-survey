part of '../home_page.dart';

class ProjectCard extends ConsumerWidget {
  const ProjectCard(
      {super.key, required this.questionnaire, required this.completion});
  final QuestionnaireModel questionnaire;
  final double completion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IntrinsicHeight(
      child: SizedBox(
        width: 400,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(questionnaire.title,
                    textScaleFactor: 1.2,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).primaryColor,
                        )),
                Text(
                  questionnaire.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('completion_percentage',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).primaryColor,
                        )).tr(namedArgs: {
                  'percentage': '${completion * 100 ~/ 1}',
                }),
                const SizedBox(
                  height: 10,
                ),
                LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    minHeight: 15,
                    value: completion),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _getSelectButton(ref, questionnaire),
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
                                    id: questionnaire.id,
                                    title: questionnaire.title,
                                    description: questionnaire.description),
                              );
                            },
                            child: const Text('edit').tr(),
                          ),
                          PopupMenuItem(
                              value: 'pdf',
                              onTap: () async {
                                PdfCreator.createPdfFromQuestionnaire(
                                    questionnaire);
                              },
                              child: const Text('export_to_pdf').tr()),
                          PopupMenuItem(
                            value: 'delete',
                            onTap: () async {
                              final bool? confirm = await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('delete_project')
                                          .tr(namedArgs: {
                                        'project': questionnaire.title,
                                      }),
                                      content: const Text(
                                              'delete_project_confirmation')
                                          .tr(),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(true);
                                            },
                                            style: TextButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                foregroundColor: Colors.white),
                                            child: const Text(
                                              'yes',
                                            ).tr()),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(false);
                                            },
                                            child: const Text('no').tr()),
                                      ],
                                    );
                                  }) as bool;

                              if (confirm ?? false) {
                                ref
                                    .read(projectProvider.notifier)
                                    .deleteQuestionnaire(questionnaire.id);
                              }
                            },
                            child: const Text('delete').tr(),
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

  Widget _getSelectButton(WidgetRef ref, QuestionnaireModel questionnaire) {
    return ((ref.read(projectProvider).questionnaire?.id ?? '') !=
            questionnaire.id)
        ? PrimaryButton(
            child: const Text('select').tr(),
            onPressed: () {
              ref
                  .read(projectProvider.notifier)
                  .selectQuestionnaire(questionnaire.id);
              ref.read(shellProvider.notifier).navigateTo('dashboard');
            },
          )
        : PrimaryButton(
            isPrimary: false,
            onPressed: () {
              ref.read(projectProvider.notifier).deselectQuestionnaire();
            },
            child: const Text('deselect', style: TextStyle(color: Colors.black))
                .tr(),
          );
  }
}
