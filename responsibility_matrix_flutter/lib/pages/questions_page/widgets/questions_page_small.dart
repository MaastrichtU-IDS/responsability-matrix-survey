part of '../questions_page.dart';

class _QuestionPageSmall extends ConsumerWidget {
  const _QuestionPageSmall({Key? key, this.currentQuestionPosition})
      : super(key: key);

  final int? currentQuestionPosition;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (currentQuestionPosition == null) {
      return _buildQuestionList(context);
    } else {
      return _buildQuestion(context, currentQuestionPosition!);
    }
  }

  Widget _buildQuestionList(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            const Expanded(
              child: QuestionList(
                width: double.infinity,
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

  Widget _buildQuestion(BuildContext context, int index) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  context.go('/questions');
                },
              ),
            ),
            Expanded(
              child: SingleQuestion(
                questionPosition: index,
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
