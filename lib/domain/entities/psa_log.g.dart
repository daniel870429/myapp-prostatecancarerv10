// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'psa_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PsaLogImpl _$$PsaLogImplFromJson(Map<String, dynamic> json) => _$PsaLogImpl(
      id: (json['id'] as num).toInt(),
      value: (json['value'] as num).toDouble(),
      recordedAt: DateTime.parse(json['recordedAt'] as String),
      userId: json['userId'] as String,
      notes: json['notes'] as String?,
      contextNotes: json['contextNotes'] as String?,
      source: $enumDecodeNullable(_$PsaLogSourceEnumMap, json['source']) ??
          PsaLogSource.userUploaded,
    );

Map<String, dynamic> _$$PsaLogImplToJson(_$PsaLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'recordedAt': instance.recordedAt.toIso8601String(),
      'userId': instance.userId,
      'notes': instance.notes,
      'contextNotes': instance.contextNotes,
      'source': _$PsaLogSourceEnumMap[instance.source]!,
    };

const _$PsaLogSourceEnumMap = {
  PsaLogSource.userUploaded: 'userUploaded',
  PsaLogSource.clinicianVerified: 'clinicianVerified',
};
