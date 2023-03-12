import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/answer/answer_model.dart';
import '../../providers/providers.dart';
import '../../repositories/questions_repository.dart';
import '../../widgets/info_widget.dart';
import '../../widgets/responsive_builder/responsive_builder.dart';

part './widgets/questions_list.dart';
part './widgets/single_question.dart';
part './widgets/questions_page_large.dart';
part './widgets/questions_page_small.dart';

class QuestionsPage extends ConsumerWidget {
  const QuestionsPage({super.key, this.currentQuestionPosition});

  final int? currentQuestionPosition;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveBuilder(
        smallScreen: _QuestionPageSmall(
          currentQuestionPosition: currentQuestionPosition,
        ),
        largeScreen: _QuestionPageLarge(
          currentQuestionPosition: currentQuestionPosition,
        ));
  }
}
