import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../controllers/project_controller/project_state.dart';
import '../../models/questionnaire/questionnaire_model.dart';
import '../../providers/providers.dart';
import '../../utils/pdf_creator/pdf_creator.dart';
import '../../widgets/buttons/primary_button.dart';

part './widgets/edit_questionnaire_dialog.dart';
part './widgets/project_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(projectProvider);
    final userState = ref.watch(authProvider);
    ref.listen<ProjectState>(projectProvider, (prev, next) {
      if ((prev?.questionnaire ?? null) != next.questionnaire &&
          next.questionnaire != null) {
        context.goNamed('dashboard');
      }
    });
    return SingleChildScrollView(
      primary: true,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'welcome_name',
              textScaleFactor: 1.2,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ).tr(namedArgs: {
              'name': userState.user?.username ?? 'User',
            }),
            const SizedBox(height: 20),
            state.questionnaires.isNotEmpty
                ? Wrap(children: [
                    for (int i = 0; i < state.questionnaires.length; i++)
                      ProjectCard(
                        questionnaire: state.questionnaires[i],
                        completion: state.completionPercentages[i],
                      )
                  ])
                : Center(child: const Text('no_project_found').tr()),
            const SizedBox(
              height: 25,
            ),
          ]),
    );
  }
}
