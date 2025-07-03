// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'symptom_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SymptomLog _$SymptomLogFromJson(Map<String, dynamic> json) {
  return _SymptomLog.fromJson(json);
}

/// @nodoc
mixin _$SymptomLog {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get severity => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get comments => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  /// Serializes this SymptomLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SymptomLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SymptomLogCopyWith<SymptomLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymptomLogCopyWith<$Res> {
  factory $SymptomLogCopyWith(
          SymptomLog value, $Res Function(SymptomLog) then) =
      _$SymptomLogCopyWithImpl<$Res, SymptomLog>;
  @useResult
  $Res call(
      {int id,
      String name,
      int severity,
      DateTime timestamp,
      String comments,
      String userId});
}

/// @nodoc
class _$SymptomLogCopyWithImpl<$Res, $Val extends SymptomLog>
    implements $SymptomLogCopyWith<$Res> {
  _$SymptomLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SymptomLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? severity = null,
    Object? timestamp = null,
    Object? comments = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SymptomLogImplCopyWith<$Res>
    implements $SymptomLogCopyWith<$Res> {
  factory _$$SymptomLogImplCopyWith(
          _$SymptomLogImpl value, $Res Function(_$SymptomLogImpl) then) =
      __$$SymptomLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int severity,
      DateTime timestamp,
      String comments,
      String userId});
}

/// @nodoc
class __$$SymptomLogImplCopyWithImpl<$Res>
    extends _$SymptomLogCopyWithImpl<$Res, _$SymptomLogImpl>
    implements _$$SymptomLogImplCopyWith<$Res> {
  __$$SymptomLogImplCopyWithImpl(
      _$SymptomLogImpl _value, $Res Function(_$SymptomLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of SymptomLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? severity = null,
    Object? timestamp = null,
    Object? comments = null,
    Object? userId = null,
  }) {
    return _then(_$SymptomLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SymptomLogImpl implements _SymptomLog {
  const _$SymptomLogImpl(
      {required this.id,
      required this.name,
      required this.severity,
      required this.timestamp,
      required this.comments,
      required this.userId});

  factory _$SymptomLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$SymptomLogImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int severity;
  @override
  final DateTime timestamp;
  @override
  final String comments;
  @override
  final String userId;

  @override
  String toString() {
    return 'SymptomLog(id: $id, name: $name, severity: $severity, timestamp: $timestamp, comments: $comments, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SymptomLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, severity, timestamp, comments, userId);

  /// Create a copy of SymptomLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SymptomLogImplCopyWith<_$SymptomLogImpl> get copyWith =>
      __$$SymptomLogImplCopyWithImpl<_$SymptomLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SymptomLogImplToJson(
      this,
    );
  }
}

abstract class _SymptomLog implements SymptomLog {
  const factory _SymptomLog(
      {required final int id,
      required final String name,
      required final int severity,
      required final DateTime timestamp,
      required final String comments,
      required final String userId}) = _$SymptomLogImpl;

  factory _SymptomLog.fromJson(Map<String, dynamic> json) =
      _$SymptomLogImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get severity;
  @override
  DateTime get timestamp;
  @override
  String get comments;
  @override
  String get userId;

  /// Create a copy of SymptomLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SymptomLogImplCopyWith<_$SymptomLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
