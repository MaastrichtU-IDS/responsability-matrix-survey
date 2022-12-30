import 'package:flutter/material.dart';
import '../../../models/question/question_model.dart';

class SingleQuestion extends StatefulWidget {
  const SingleQuestion(
      {super.key,
      required this.questionModel,
      this.textController,
      this.onAnswer,
      this.initialAnswer = ""});

  final QuestionModel questionModel;

  final String initialAnswer;

  final Function(String)? onAnswer;

  final TextEditingController? textController;

  @override
  State<SingleQuestion> createState() => _SingleQuestionState();
}

class _SingleQuestionState extends State<SingleQuestion>
    with SingleTickerProviderStateMixin {
  late TextEditingController _textEditingController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _textEditingController = widget.textController ?? TextEditingController();
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Question No. ${widget.questionModel.position}",
                  style: Theme.of(context).textTheme.headline6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Scope: ${widget.questionModel.scope}",
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(width: 10),
                  Text("Component: ${widget.questionModel.component}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                widget.questionModel.question,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.w500, height: 1.5),
              ),
              const Divider(),
              TextFormField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  labelText: "Answer",
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
                    widget.onAnswer?.call(_textEditingController.text);
                  }
                },
                child: const Text('Submit'),
              ),
              Text(
                "Example answers",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
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
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
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
