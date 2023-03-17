import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/loading_controller/loading_controller.dart';
import '../controllers/auth_controller/auth_controller.dart';
import '../controllers/auth_controller/auth_state.dart';
import '../controllers/project_controller/project_controller.dart';
import '../controllers/project_controller/project_state.dart';
import '../controllers/question_controller/question_controller.dart';
import '../controllers/question_controller/question_state.dart';
import '../controllers/questions_controller/questions_controller.dart';
import '../controllers/questions_controller/questions_state.dart';
import '../controllers/shell_controller/shell_controller.dart';
import '../models/answer/answer_model.dart';
import '../repositories/concrete/questions_repository.dart';
import '../utils/instance_controller/instance_controller.dart';

final loadingProvider = StateNotifierProvider<LoadingController, bool>((ref) {
  return LoadingController();
});

final authProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(ref);
});

final shellProvider = StateNotifierProvider<ShellController, String?>((ref) {
  return ShellController(initialRoute: '/dashboard');
});

final projectProvider =
    StateNotifierProvider<ProjectController, ProjectState>((ref) {
  return ProjectController(ref);
});

final questionsProvider =
    StateNotifierProvider<QuestionsController, QuestionsState>((ref) {
  return QuestionsController(ref);
});

final questionProviderFamily =
    StateNotifierProvider.family<QuestionController, QuestionState, int>(
        (ref, questionPosition) {
  final QuestionsRepository questionsRepository =
      InstanceController().getByType<QuestionsRepository>();

  final questionnaire = ref.read(projectProvider).questionnaire!;

  final answer = questionnaire.ClosedQuestions.any(
          (element) => element.position == questionPosition)
      ? questionnaire.ClosedQuestions.firstWhere(
          (element) => element.position == questionPosition)
      : null;
  return QuestionController(ref,
      questionnaire: questionnaire,
      question: questionsRepository.getQuestionByPosition(questionPosition),
      answer: answer,
      questionCode: questionsRepository.getQuestionCode(questionPosition),
      currentStatus: answer?.status ?? AnswerStatus.applicable,
      currentText: answer?.answer ?? '');
});
