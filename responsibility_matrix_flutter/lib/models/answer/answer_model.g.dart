// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnswerModel _$$_AnswerModelFromJson(Map<String, dynamic> json) =>
    _$_AnswerModel(
      id: json['id'] as String,
      component: json['component'] as String,
      scope: json['scope'] as String,
      answer: json['answer'] as String,
      status: json['status'] as String? ?? 'applicable',
      position: json['position'] as int,
    );

Map<String, dynamic> _$$_AnswerModelToJson(_$_AnswerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'component': instance.component,
      'scope': instance.scope,
      'answer': instance.answer,
      'status': instance.status,
      'position': instance.position,
    };
