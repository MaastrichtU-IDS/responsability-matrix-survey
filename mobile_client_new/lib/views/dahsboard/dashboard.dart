import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_client_new/consts/matrix_explanation.dart';
import 'package:mobile_client_new/repositories/questions_repository.dart';
import 'package:mobile_client_new/style/style_provider.dart';
import 'package:mobile_client_new/views/question/question_page.dart';
import 'package:mobile_client_new/views/root/root.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  static const String routeName = 'dashboard';

  final rowHeight = 180.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      primary: true,
      child: Table(
        defaultColumnWidth: const FixedColumnWidth(175),
        defaultVerticalAlignment: TableCellVerticalAlignment.top,
        border: TableBorder.all(
            color: StyleProvider.of(context).colors.appPrimaryColor,
            style: BorderStyle.solid),
        children: [
          TableRow(
            children: [
              const SizedBox(
                height: 80,
              ),
              for (final scope in scopeExp.keys)
                Container(
                  height: 90,
                  color: scopeColors[scope],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          scope.name,
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        Text(
                          scopeExp[scope]!,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          for (final comp in componentExp.keys)
            TableRow(children: [
              Container(
                height: rowHeight,
                color: componentColors[comp],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comp.name,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      Text(
                        componentExp[comp]!,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              for (final scope in scopeExp.keys)
                SizedBox(
                  height: rowHeight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        ref
                            .read(questionsListController.notifier)
                            .setScopeAndComponent(scope, comp);
                        ref
                            .read(questionController.originProvider)
                            .clearQuestion();
                        ref
                            .read(navController.notifier)
                            .navigateTo(QuestionPage.routeName);
                      },
                      child: SingleChildScrollView(
                        child: Text(
                          matrixExp[scope]![comp]!,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              height: 1.5),
                        ),
                      ),
                    ),
                  ),
                ),
            ])
        ],
      ),
    );
  }
}
