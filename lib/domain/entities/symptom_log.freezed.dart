// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'symptom_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SymptomLog {
  int get id;
  String get name;
  int get severity;
  DateTime get timestamp;
  String get comments;
  String get userId;

  /// Create a copy of SymptomLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SymptomLogCopyWith<SymptomLog> get copyWith =>
      _$SymptomLogCopyWithImpl<SymptomLog>(this as SymptomLog, _$identity);

  /// Serializes this SymptomLog to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SymptomLog &&
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

  @override
  String toString() {
    return 'SymptomLog(id: $id, name: $name, severity: $severity, timestamp: $timestamp, comments: $comments, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $SymptomLogCopyWith<$Res> {
  factory $SymptomLogCopyWith(
          SymptomLog value, $Res Function(SymptomLog) _then) =
      _$SymptomLogCopyWithImpl;
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
class _$SymptomLogCopyWithImpl<$Res> implements $SymptomLogCopyWith<$Res> {
  _$SymptomLogCopyWithImpl(this._self, this._then);

  final SymptomLog _self;
  final $Res Function(SymptomLog) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _self.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      comments: null == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [SymptomLog].
extension SymptomLogPatterns on SymptomLog {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SymptomLog value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SymptomLog() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SymptomLog value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SymptomLog():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SymptomLog value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SymptomLog() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String name, int severity, DateTime timestamp,
            String comments, String userId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SymptomLog() when $default != null:
        return $default(_that.id, _that.name, _that.severity, _that.timestamp,
            _that.comments, _that.userId);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String name, int severity, DateTime timestamp,
            String comments, String userId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SymptomLog():
        return $default(_that.id, _that.name, _that.severity, _that.timestamp,
            _that.comments, _that.userId);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String name, int severity, DateTime timestamp,
            String comments, String userId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SymptomLog() when $default != null:
        return $default(_that.id, _that.name, _that.severity, _that.timestamp,
            _that.comments, _that.userId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SymptomLog extends SymptomLog {
  const _SymptomLog(
      {required this.id,
      required this.name,
      required this.severity,
      required this.timestamp,
      required this.comments,
      required this.userId})
      : super._();
  factory _SymptomLog.fromJson(Map<String, dynamic> json) =>
      _$SymptomLogFromJson(json);

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

  /// Create a copy of SymptomLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SymptomLogCopyWith<_SymptomLog> get copyWith =>
      __$SymptomLogCopyWithImpl<_SymptomLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SymptomLogToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SymptomLog &&
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

  @override
  String toString() {
    return 'SymptomLog(id: $id, name: $name, severity: $severity, timestamp: $timestamp, comments: $comments, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class _$SymptomLogCopyWith<$Res>
    implements $SymptomLogCopyWith<$Res> {
  factory _$SymptomLogCopyWith(
          _SymptomLog value, $Res Function(_SymptomLog) _then) =
      __$SymptomLogCopyWithImpl;
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
class __$SymptomLogCopyWithImpl<$Res> implements _$SymptomLogCopyWith<$Res> {
  __$SymptomLogCopyWithImpl(this._self, this._then);

  final _SymptomLog _self;
  final $Res Function(_SymptomLog) _then;

  /// Create a copy of SymptomLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? severity = null,
    Object? timestamp = null,
    Object? comments = null,
    Object? userId = null,
  }) {
    return _then(_SymptomLog(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _self.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      comments: null == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
