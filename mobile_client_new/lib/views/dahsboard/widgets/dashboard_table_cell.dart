import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_client_new/consts/matrix_explanation.dart';
import 'package:mobile_client_new/repositories/questions_repository.dart';
import 'package:mobile_client_new/views/question/question_page.dart';
import 'package:mobile_client_new/views/root/root.dart';

class DashboardTableCell extends ConsumerWidget {
  const DashboardTableCell(
      {super.key,
      required this.scope,
      required this.component,
      required this.height});

  final Scope scope;
  final Component component;
  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            ref
                .read(questionsListController.notifier)
                .setScopeAndComponent(scope, component);
            ref.read(questionController.originProvider).clearQuestion();
            ref.read(navController.notifier).navigateTo(QuestionPage.routeName);
          },
          child: SizedBox(
            width: 150,
            child: SingleChildScrollView(
              child: Text(
                matrixExp[scope]![component]!,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w700, height: 1.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
