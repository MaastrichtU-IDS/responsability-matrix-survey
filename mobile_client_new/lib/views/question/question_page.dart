import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controllers/question_controller/question_controller.dart';
import '../../controllers/question_controller/questions_list_provider.dart';
import '../../models/answer/answer_model.dart';
import '../../models/question/question_model.dart';
import '../../repositories/questions_repository.dart';
import '../home/home_page.dart';
import 'widgets/questions_list.dart';
import 'widgets/single_question.dart';
import '../../widgets/info_widget.dart';
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
                  const QuestionList(),
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
