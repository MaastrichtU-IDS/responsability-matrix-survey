import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/questionnaire/questionnaire_model.dart';

part 'project_state.freezed.dart';

@freezed
class ProjectState with _$ProjectState {
  factory ProjectState({
    required QuestionnaireModel? questionnaire,
    required List<QuestionnaireModel> questionnaires,
    required List<double> completionPercentages,
  }) = _ProjectState;
}
