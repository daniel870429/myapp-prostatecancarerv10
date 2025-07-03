// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SymptomLogImpl _$$SymptomLogImplFromJson(Map<String, dynamic> json) =>
    _$SymptomLogImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      severity: (json['severity'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      comments: json['comments'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$$SymptomLogImplToJson(_$SymptomLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'severity': instance.severity,
      'timestamp': instance.timestamp.toIso8601String(),
      'comments': instance.comments,
      'userId': instance.userId,
    };
