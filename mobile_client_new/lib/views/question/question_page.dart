import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../home/home_page.dart';
import '../../widgets/info_widget.dart';
import '../../controllers/question_controller/question_controller.dart';
import '../../controllers/question_controller/questions_list_provider.dart';
import '../../models/answer/answer_model.dart';
import '../../models/question/question_model.dart';
import 'widgets/questions_list.dart';
import 'widgets/single_question.dart';
import '../../utils/list_extensions/list_extensions.dart';

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
  AnswerStatus _status = AnswerStatus.applicable;

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
        final answerModel = ref
            .read(questionnaireController.notifier)
            .selectedQuestionnaire
            ?.ClosedQuestions
            .firstWhereOrNull<AnswerModel>(
                (element) => element.position == next.position);
        _textController.text = answerModel?.answer ?? '';

        final String statusString =
            answerModel?.status ?? AnswerStatus.applicable.name;

        _status = answerStatusFromString(statusString);
      }
    });

    _textController.text = ref
            .read(questionnaireController.notifier)
            .selectedQuestionnaire
            ?.ClosedQuestions
            .firstWhereOrNull<AnswerModel>(
                (element) => element.position == state?.position)
            ?.answer ??
        '';

    final String statusString = ref
            .read(questionnaireController.notifier)
            .selectedQuestionnaire
            ?.ClosedQuestions
            .firstWhereOrNull<AnswerModel>(
                (element) => element.position == state?.position)
            ?.status ??
        AnswerStatus.applicable.name;

    _status = answerStatusFromString(statusString);

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
                            questionCode: ref
                                .read(questionController.notifier)
                                .getQuestionCode(state.position),
                            textController: _textController,
                            initialAnswerStatus: _status,
                            onAnswer: (answer, status) async {
                              await ref
                                  .read(questionController.notifier)
                                  .answerQuestion(answer, status);
                              ref
                                  .read(questionsListController.notifier)
                                  .updateState();

                              await ref
                                  .read(questionnaireController.notifier)
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
                    'You can select the questions from the list and answer them.'),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
