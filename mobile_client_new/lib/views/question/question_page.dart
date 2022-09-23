import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_client_new/controllers/question_controller/question_controller.dart';
import 'package:mobile_client_new/controllers/question_controller/questions_list_provider.dart';
import 'package:mobile_client_new/models/answer/answer_model.dart';
import 'package:mobile_client_new/models/question/question_model.dart';
import 'package:mobile_client_new/repositories/questions_repository.dart';
import 'package:mobile_client_new/views/home/home_page.dart';
import 'package:mobile_client_new/views/single_question/single_question.dart';
import 'package:mobile_client_new/widgets/info_widget.dart';
import "../../utils/list_extensions/list_extensions.dart";

final questionController =
    StateNotifierProvider<QuestionController, QuestionModel?>((ref) {
  return QuestionController(ref);
});

final questionsListController =
    StateNotifierProvider<QuestionsListController, List<QuestionModel>>((ref) {
  return QuestionsListController(ref);
});

class QuestionPage extends ConsumerStatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  static const String routeName = 'question';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuestionPageState();
}

class _QuestionPageState extends ConsumerState<QuestionPage> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(questionController);

    ref.listen<QuestionModel?>(questionController, (prev, next) {
      if (next != null) {
        _textController.text = ref
                .read(questionnaireController.originProvider)
                .selectedQuestionnaire
                ?.ClosedQuestions
                .firstWhereOrNull<AnswerModel>(
                    (element) => element.position == next.position)
                ?.answer ??
            "";
      }
    });

    _textController.text = ref
            .read(questionnaireController.originProvider)
            .selectedQuestionnaire
            ?.ClosedQuestions
            .firstWhereOrNull<AnswerModel>(
                (element) => element.position == state?.position)
            ?.answer ??
        "";

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  const _QuestionList(),
                  const VerticalDivider(
                    width: 50,
                  ),
                  Expanded(
                    child: state != null
                        ? SingleQuestion(
                            key: UniqueKey(),
                            questionModel: state,
                            textController: _textController,
                            onAnswer: (answer) async {
                              ref
                                  .read(questionController.originProvider)
                                  .answerQuestion(answer);
                              ref
                                  .read(questionsListController.originProvider)
                                  .updateState();
                              await ref
                                  .read(questionnaireController.originProvider)
                                  .updateState();
                            },
                          )
                        : Container(),
                  )
                ],
              ),
            ),
            const Divider(),
            const InfoWidget(
                text:
                    "You can select the questions from the list and answer them."),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class _QuestionList extends ConsumerStatefulWidget {
  const _QuestionList({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuestionListState();
}

class _QuestionListState extends ConsumerState {
  Scope? _scope;
  Component? _component;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(questionsListController);
    _scope = ref.watch(questionsListController.originProvider).scope;
    _component = ref.watch(questionsListController.originProvider).component;
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.8,
      height: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<Scope>(
                  decoration: const InputDecoration(
                    labelText: "Scope",
                  ),
                  value: _scope,
                  items: [
                    const DropdownMenuItem<Scope>(
                        value: null, child: Text('All')),
                    ...Scope.values
                        .map((e) => DropdownMenuItem<Scope>(
                              value: e,
                              child: Text(e.name),
                            ))
                        .toList()
                  ],
                  onChanged: (value) {
                    setState(() {
                      _scope = value;
                    });
                    ref
                        .read(questionsListController.notifier)
                        .setScopeAndComponent(_scope, _component);
                  },
                ),
              ),
              const Spacer(),
              Expanded(
                child: DropdownButtonFormField<Component>(
                  decoration: const InputDecoration(
                    labelText: "Component",
                  ),
                  value: _component,
                  items: [
                    const DropdownMenuItem<Component>(
                        value: null, child: Text('All')),
                    ...Component.values
                        .map((e) => DropdownMenuItem<Component>(
                              value: e,
                              child: Text(e.name),
                            ))
                        .toList()
                  ],
                  onChanged: (value) {
                    setState(() {
                      _component = value;
                    });
                    ref
                        .read(questionsListController.notifier)
                        .setScopeAndComponent(_scope, _component);
                  },
                ),
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
            primary: true,
            itemCount: state.length,
            itemBuilder: (context, index) {
              final question = state[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    question.question,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, height: 1.5),
                  ),
                  leading: Text(question.position.toString()),
                  selected: ref.watch(questionController)?.position ==
                      question.position,
                  selectedColor: Colors.blue,
                  trailing: ref
                          .watch(questionsListController.originProvider)
                          .isAnswered(question)
                      ? const Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : const Icon(Icons.close, color: Colors.red),
                  onTap: () {
                    ref
                        .read(questionController.originProvider)
                        .setQuestion(question);
                  },
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
