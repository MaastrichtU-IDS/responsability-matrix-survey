part of '../questions_page.dart';

final selectedProvider = StateProvider.autoDispose<int>((ref) {
  return -1;
});

class QuestionList extends ConsumerWidget {
  const QuestionList({Key? key, required this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionsProvider);
    return SizedBox(
      width: width,
      height: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<Component>(
                  decoration: InputDecoration(
                    labelText: 'component'.tr(),
                  ),
                  value: state.component,
                  items: [
                    const DropdownMenuItem<Component>(child: Text('All')),
                    ...Component.values
                        .map((e) => DropdownMenuItem<Component>(
                              value: e,
                              child: Text(e.name).tr(),
                            ))
                        .toList()
                  ],
                  onChanged: (value) {
                    ref
                        .read(questionsProvider.notifier)
                        .setScopeAndComponent(state.scope, value);
                  },
                ),
              ),
              const Spacer(),
              Expanded(
                child: DropdownButtonFormField<Scope>(
                  decoration: InputDecoration(
                    labelText: 'scope'.tr(),
                  ),
                  value: state.scope,
                  items: [
                    DropdownMenuItem<Scope>(child: const Text('all').tr()),
                    ...Scope.values
                        .map((e) => DropdownMenuItem<Scope>(
                              value: e,
                              child: Text(e.name).tr(),
                            ))
                        .toList()
                  ],
                  onChanged: (value) {
                    ref
                        .read(questionsProvider.notifier)
                        .setScopeAndComponent(value, state.component);
                  },
                ),
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
            primary: true,
            itemCount: state.questions.length,
            itemBuilder: (context, index) {
              final question = state.questions[index];
              final selected = ref.watch(selectedProvider);
              final status = state.answerStatuses.containsKey(question.position)
                  ? state.answerStatuses[question.position]
                  : AnswerStatus.applicable;
              final isAnswered =
                  state.answeredQuestions.contains(question.position);

              final answerStatusData = answerStatusItems[status];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  isThreeLine: true,
                  title: Text(
                    question.question,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, height: 1.5),
                  ),
                  subtitle: OverflowBar(
                    children: [
                      Text(
                        status!.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, height: 1.5),
                      ).tr(),
                      Icon(
                        answerStatusData?.icon,
                        color: answerStatusData?.color,
                      )
                    ],
                  ),
                  leading: Text('${index + 1}'),
                  selected: selected == question.position,
                  selectedColor: Colors.blue,
                  trailing: isAnswered
                      ? const Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : const Icon(Icons.close, color: Colors.red),
                  onTap: () {
                    ref.read(selectedProvider.notifier).state =
                        question.position;
                    context.go('/questions/${question.position}');
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
