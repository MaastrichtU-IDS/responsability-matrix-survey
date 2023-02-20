// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionModel _$$_QuestionModelFromJson(Map<String, dynamic> json) =>
    _$_QuestionModel(
      id: json['id'] as String,
      component: json['component'] as String,
      scope: json['scope'] as String,
      question: json['question'] as String,
      position: json['position'] as int,
      exampleAnswer: json['exampleAnswer'] as String? ?? '',
    );

Map<String, dynamic> _$$_QuestionModelToJson(_$_QuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'component': instance.component,
      'scope': instance.scope,
      'question': instance.question,
      'position': instance.position,
      'exampleAnswer': instance.exampleAnswer,
    };
