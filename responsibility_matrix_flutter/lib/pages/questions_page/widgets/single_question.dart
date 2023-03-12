part of '../questions_page.dart';

class SingleQuestion extends ConsumerStatefulWidget {
  const SingleQuestion({super.key, required this.questionPosition});

  final int questionPosition;

  @override
  ConsumerState<SingleQuestion> createState() => _SingleQuestionState();
}

class _SingleQuestionState extends ConsumerState<SingleQuestion> {
  final _textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _textEditingController.text =
        ref.read(questionProviderFamily(widget.questionPosition)).currentText;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(questionProviderFamily(widget.questionPosition));
    ref.listen<String?>(
      questionProviderFamily(widget.questionPosition)
          .select((value) => value.currentText),
      (previous, next) {
        if (next?.isEmpty ?? true) {
          _textEditingController.clear();
        }
      },
    );
    return SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('question_id', style: Theme.of(context).textTheme.titleLarge)
                  .tr(namedArgs: {
                'question_id': state.questionCode,
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('component_name',
                          style: Theme.of(context).textTheme.bodyLarge)
                      .tr(namedArgs: {
                    'component_name': state.question.component.tr(),
                  }),
                  const SizedBox(width: 10),
                  Text('scope_name',
                          style: Theme.of(context).textTheme.bodyLarge)
                      .tr(namedArgs: {
                    'scope_name': state.question.scope.tr(),
                  }),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                state.question.question,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w500, height: 1.5),
              ),
              const Divider(),
              DropdownButtonFormField<AnswerStatus>(
                value: state.currentStatus,
                decoration: InputDecoration(
                  labelText: 'answer_status'.tr(),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'answer_status_required'.tr();
                  }
                  return null;
                },
                items: AnswerStatus.values
                    .map<DropdownMenuItem<AnswerStatus>>(
                        (e) => DropdownMenuItem<AnswerStatus>(
                              value: e,
                              child: Row(children: [
                                Icon(
                                  answerStatusItems[e]!.icon,
                                  color: answerStatusItems[e]!.color,
                                ),
                                const SizedBox(width: 10),
                                Text(e.name).tr(),
                              ]),
                            ))
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  ref
                      .read(questionProviderFamily(widget.questionPosition)
                          .notifier)
                      .setStatus(value);
                },
              ),
              const Divider(),
              TextFormField(
                controller: _textEditingController,
                onChanged: (value) {
                  ref
                      .read(questionProviderFamily(widget.questionPosition)
                          .notifier)
                      .setTextField(value);
                },
                decoration: InputDecoration(
                  labelText: 'answer'.tr(),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if ((value == null || value.isEmpty) &&
                      state.currentStatus == AnswerStatus.applicable) {
                    return 'answer_required'.tr();
                  }
                  return null;
                },
                minLines: 5,
                maxLines: 10,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ref
                            .read(
                                questionProviderFamily(widget.questionPosition)
                                    .notifier)
                            .answerQuestion();
                      }
                    },
                    child: const Text('submit').tr(),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ref
                            .read(
                                questionProviderFamily(widget.questionPosition)
                                    .notifier)
                            .clearAnswer();
                      },
                      child: const Text('clear_answer').tr(),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red)),
                ],
              ),
              Text(
                'example_answer',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w500, height: 1.5),
              ).tr(),
              const Divider(),
              SizedBox(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectableText(
                      state.question.exampleAnswer,
                      textAlign: TextAlign.center,
                      textScaleFactor: .7,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w500, height: 1.5),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class AnswerStatusData {
  const AnswerStatusData({required this.color, required this.icon});

  final Color color;
  final IconData icon;
}

const answerStatusItems = <AnswerStatus, AnswerStatusData>{
  AnswerStatus.applicable:
      AnswerStatusData(color: Colors.green, icon: Icons.check_circle_outline),
  AnswerStatus.notApplicable:
      AnswerStatusData(color: Colors.red, icon: Icons.cancel_outlined),
  AnswerStatus.dontKnow:
      AnswerStatusData(color: Colors.grey, icon: Icons.help_outline),
};
