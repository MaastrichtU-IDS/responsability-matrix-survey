part of '../questions_page.dart';

class _QuestionPageLarge extends ConsumerWidget {
  const _QuestionPageLarge({Key? key, this.currentQuestionPosition})
      : super(key: key);

  final int? currentQuestionPosition;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  QuestionList(
                    width: MediaQuery.of(context).size.width / 2.8,
                  ),
                  const VerticalDivider(
                    width: 50,
                  ),
                  Expanded(
                    child: currentQuestionPosition != null
                        ? SingleQuestion(
                            key: ValueKey(currentQuestionPosition),
                            questionPosition: currentQuestionPosition!,
                          )
                        : Container(),
                  )
                ],
              ),
            ),
            const Divider(),
            InfoWidget(text: 'info_questions'.tr()),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
