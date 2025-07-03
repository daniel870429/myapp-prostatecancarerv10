// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'psa_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PsaLog _$PsaLogFromJson(Map<String, dynamic> json) {
  return _PsaLog.fromJson(json);
}

/// @nodoc
mixin _$PsaLog {
  int get id => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  DateTime get recordedAt => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get contextNotes => throw _privateConstructorUsedError;
  PsaLogSource get source => throw _privateConstructorUsedError;

  /// Serializes this PsaLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PsaLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PsaLogCopyWith<PsaLog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PsaLogCopyWith<$Res> {
  factory $PsaLogCopyWith(PsaLog value, $Res Function(PsaLog) then) =
      _$PsaLogCopyWithImpl<$Res, PsaLog>;
  @useResult
  $Res call(
      {int id,
      double value,
      DateTime recordedAt,
      String userId,
      String? notes,
      String? contextNotes,
      PsaLogSource source});
}

/// @nodoc
class _$PsaLogCopyWithImpl<$Res, $Val extends PsaLog>
    implements $PsaLogCopyWith<$Res> {
  _$PsaLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PsaLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? value = null,
    Object? recordedAt = null,
    Object? userId = null,
    Object? notes = freezed,
    Object? contextNotes = freezed,
    Object? source = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      recordedAt: null == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      contextNotes: freezed == contextNotes
          ? _value.contextNotes
          : contextNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as PsaLogSource,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PsaLogImplCopyWith<$Res> implements $PsaLogCopyWith<$Res> {
  factory _$$PsaLogImplCopyWith(
          _$PsaLogImpl value, $Res Function(_$PsaLogImpl) then) =
      __$$PsaLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      double value,
      DateTime recordedAt,
      String userId,
      String? notes,
      String? contextNotes,
      PsaLogSource source});
}

/// @nodoc
class __$$PsaLogImplCopyWithImpl<$Res>
    extends _$PsaLogCopyWithImpl<$Res, _$PsaLogImpl>
    implements _$$PsaLogImplCopyWith<$Res> {
  __$$PsaLogImplCopyWithImpl(
      _$PsaLogImpl _value, $Res Function(_$PsaLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of PsaLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? value = null,
    Object? recordedAt = null,
    Object? userId = null,
    Object? notes = freezed,
    Object? contextNotes = freezed,
    Object? source = null,
  }) {
    return _then(_$PsaLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      recordedAt: null == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      contextNotes: freezed == contextNotes
          ? _value.contextNotes
          : contextNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as PsaLogSource,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PsaLogImpl implements _PsaLog {
  const _$PsaLogImpl(
      {required this.id,
      required this.value,
      required this.recordedAt,
      required this.userId,
      this.notes,
      this.contextNotes,
      this.source = PsaLogSource.userUploaded});

  factory _$PsaLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$PsaLogImplFromJson(json);

  @override
  final int id;
  @override
  final double value;
  @override
  final DateTime recordedAt;
  @override
  final String userId;
  @override
  final String? notes;
  @override
  final String? contextNotes;
  @override
  @JsonKey()
  final PsaLogSource source;

  @override
  String toString() {
    return 'PsaLog(id: $id, value: $value, recordedAt: $recordedAt, userId: $userId, notes: $notes, contextNotes: $contextNotes, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PsaLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.contextNotes, contextNotes) ||
                other.contextNotes == contextNotes) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, value, recordedAt, userId, notes, contextNotes, source);

  /// Create a copy of PsaLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PsaLogImplCopyWith<_$PsaLogImpl> get copyWith =>
      __$$PsaLogImplCopyWithImpl<_$PsaLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PsaLogImplToJson(
      this,
    );
  }
}

abstract class _PsaLog implements PsaLog {
  const factory _PsaLog(
      {required final int id,
      required final double value,
      required final DateTime recordedAt,
      required final String userId,
      final String? notes,
      final String? contextNotes,
      final PsaLogSource source}) = _$PsaLogImpl;

  factory _PsaLog.fromJson(Map<String, dynamic> json) = _$PsaLogImpl.fromJson;

  @override
  int get id;
  @override
  double get value;
  @override
  DateTime get recordedAt;
  @override
  String get userId;
  @override
  String? get notes;
  @override
  String? get contextNotes;
  @override
  PsaLogSource get source;

  /// Create a copy of PsaLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PsaLogImplCopyWith<_$PsaLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
