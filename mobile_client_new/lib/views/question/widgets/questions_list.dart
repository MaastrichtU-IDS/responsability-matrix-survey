import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../repositories/questions_repository.dart';
import '../question_page.dart';

class QuestionList extends ConsumerStatefulWidget {
  const QuestionList({Key? key}) : super(key: key);

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