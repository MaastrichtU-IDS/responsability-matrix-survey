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
      status: $enumDecodeNullable(_$AnswerStatusEnumMap, json['status']) ??
          AnswerStatus.applicable,
      position: json['position'] as int,
    );

Map<String, dynamic> _$$_AnswerModelToJson(_$_AnswerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'component': instance.component,
      'scope': instance.scope,
      'answer': instance.answer,
      'status': _$AnswerStatusEnumMap[instance.status]!,
      'position': instance.position,
    };

const _$AnswerStatusEnumMap = {
  AnswerStatus.applicable: 'applicable',
  AnswerStatus.notApplicable: 'notApplicable',
  AnswerStatus.dontKnow: 'dontKnow',
};
