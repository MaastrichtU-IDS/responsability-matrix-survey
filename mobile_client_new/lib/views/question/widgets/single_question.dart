import 'package:flutter/material.dart';
import 'package:mobile_client_new/models/answer/answer_model.dart';
import '../../../models/question/question_model.dart';

class SingleQuestion extends StatefulWidget {
  const SingleQuestion(
      {super.key,
      required this.questionModel,
      required this.questionCode,
      this.textController,
      this.onAnswer,
      this.initialAnswerStatus = AnswerStatus.applicable,
      this.initialAnswer = ''});

  final QuestionModel questionModel;

  final String initialAnswer;

  final Function(String answer, AnswerStatus status)? onAnswer;

  final TextEditingController? textController;

  final AnswerStatus initialAnswerStatus;

  final String questionCode;

  @override
  State<SingleQuestion> createState() => _SingleQuestionState();
}

class _SingleQuestionState extends State<SingleQuestion>
    with SingleTickerProviderStateMixin {
  late TextEditingController _textEditingController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late AnswerStatus _answerStatus;

  @override
  void initState() {
    _textEditingController = widget.textController ?? TextEditingController();
    _answerStatus = widget.initialAnswerStatus;
    super.initState();
  }

  @override
  void dispose() {
    if (widget.textController == null) {
      _textEditingController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Question ID. ${widget.questionCode}',
                  style: Theme.of(context).textTheme.titleLarge),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Component: ${widget.questionModel.component}',
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(width: 10),
                  Text('Scope: ${widget.questionModel.scope}',
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                widget.questionModel.question,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w500, height: 1.5),
              ),
              const Divider(),
              DropdownButtonFormField<AnswerStatus>(
                value: _answerStatus,
                decoration: const InputDecoration(
                  labelText: 'Answer Status',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please select an answer status';
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
                                Text(answerStatusItems[e]!.text),
                              ]),
                            ))
                    .toList(),
                onChanged: (value) {
                  if (value == null || value == _answerStatus) {
                    return;
                  }
                  setState(() {
                    _answerStatus = value;
                  });
                  widget.onAnswer
                      ?.call(_textEditingController.text, _answerStatus);
                },
              ),
              const Divider(),
              TextFormField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  labelText: 'Answer',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                minLines: 5,
                maxLines: 10,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onAnswer
                        ?.call(_textEditingController.text, _answerStatus);
                  }
                },
                child: const Text('Submit'),
              ),
              Text(
                'Example answers',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w500, height: 1.5),
              ),
              const Divider(),
              SizedBox(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectableText(
                      widget.questionModel.exampleAnswer,
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
  const AnswerStatusData(
      {required this.text, required this.color, required this.icon});

  final String text;
  final Color color;
  final IconData icon;
}

const answerStatusItems = <AnswerStatus, AnswerStatusData>{
  AnswerStatus.applicable: AnswerStatusData(
      text: 'Applicable',
      color: Colors.green,
      icon: Icons.check_circle_outline),
  AnswerStatus.notApplicable: AnswerStatusData(
      text: 'Not Applicable', color: Colors.red, icon: Icons.cancel_outlined),
  AnswerStatus.dontKnow: AnswerStatusData(
      text: "It is applicable but, don't know how to answer",
      color: Colors.grey,
      icon: Icons.help_outline),

};
