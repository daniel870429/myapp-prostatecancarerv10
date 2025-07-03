// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'psa_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PsaLog {
  int get id;
  double get value;
  DateTime get recordedAt;
  String get userId;
  String? get notes;
  String? get contextNotes;
  PsaLogSource get source;

  /// Create a copy of PsaLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PsaLogCopyWith<PsaLog> get copyWith =>
      _$PsaLogCopyWithImpl<PsaLog>(this as PsaLog, _$identity);

  /// Serializes this PsaLog to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PsaLog &&
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

  @override
  String toString() {
    return 'PsaLog(id: $id, value: $value, recordedAt: $recordedAt, userId: $userId, notes: $notes, contextNotes: $contextNotes, source: $source)';
  }
}

/// @nodoc
abstract mixin class $PsaLogCopyWith<$Res> {
  factory $PsaLogCopyWith(PsaLog value, $Res Function(PsaLog) _then) =
      _$PsaLogCopyWithImpl;
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
class _$PsaLogCopyWithImpl<$Res> implements $PsaLogCopyWith<$Res> {
  _$PsaLogCopyWithImpl(this._self, this._then);

  final PsaLog _self;
  final $Res Function(PsaLog) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      recordedAt: null == recordedAt
          ? _self.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      contextNotes: freezed == contextNotes
          ? _self.contextNotes
          : contextNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as PsaLogSource,
    ));
  }
}

/// Adds pattern-matching-related methods to [PsaLog].
extension PsaLogPatterns on PsaLog {
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
    TResult Function(_PsaLog value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PsaLog() when $default != null:
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
    TResult Function(_PsaLog value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PsaLog():
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
    TResult? Function(_PsaLog value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PsaLog() when $default != null:
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
    TResult Function(int id, double value, DateTime recordedAt, String userId,
            String? notes, String? contextNotes, PsaLogSource source)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PsaLog() when $default != null:
        return $default(_that.id, _that.value, _that.recordedAt, _that.userId,
            _that.notes, _that.contextNotes, _that.source);
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
    TResult Function(int id, double value, DateTime recordedAt, String userId,
            String? notes, String? contextNotes, PsaLogSource source)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PsaLog():
        return $default(_that.id, _that.value, _that.recordedAt, _that.userId,
            _that.notes, _that.contextNotes, _that.source);
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
    TResult? Function(int id, double value, DateTime recordedAt, String userId,
            String? notes, String? contextNotes, PsaLogSource source)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PsaLog() when $default != null:
        return $default(_that.id, _that.value, _that.recordedAt, _that.userId,
            _that.notes, _that.contextNotes, _that.source);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PsaLog extends PsaLog {
  const _PsaLog(
      {required this.id,
      required this.value,
      required this.recordedAt,
      required this.userId,
      this.notes,
      this.contextNotes,
      this.source = PsaLogSource.userUploaded})
      : super._();
  factory _PsaLog.fromJson(Map<String, dynamic> json) => _$PsaLogFromJson(json);

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

  /// Create a copy of PsaLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PsaLogCopyWith<_PsaLog> get copyWith =>
      __$PsaLogCopyWithImpl<_PsaLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PsaLogToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PsaLog &&
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

  @override
  String toString() {
    return 'PsaLog(id: $id, value: $value, recordedAt: $recordedAt, userId: $userId, notes: $notes, contextNotes: $contextNotes, source: $source)';
  }
}

/// @nodoc
abstract mixin class _$PsaLogCopyWith<$Res> implements $PsaLogCopyWith<$Res> {
  factory _$PsaLogCopyWith(_PsaLog value, $Res Function(_PsaLog) _then) =
      __$PsaLogCopyWithImpl;
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
class __$PsaLogCopyWithImpl<$Res> implements _$PsaLogCopyWith<$Res> {
  __$PsaLogCopyWithImpl(this._self, this._then);

  final _PsaLog _self;
  final $Res Function(_PsaLog) _then;

  /// Create a copy of PsaLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? value = null,
    Object? recordedAt = null,
    Object? userId = null,
    Object? notes = freezed,
    Object? contextNotes = freezed,
    Object? source = null,
  }) {
    return _then(_PsaLog(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      recordedAt: null == recordedAt
          ? _self.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      contextNotes: freezed == contextNotes
          ? _self.contextNotes
          : contextNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as PsaLogSource,
    ));
  }
}

// dart format on
