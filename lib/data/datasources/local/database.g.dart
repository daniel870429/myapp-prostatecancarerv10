// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SymptomLogsTable extends SymptomLogs
    with TableInfo<$SymptomLogsTable, SymptomLogDbEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SymptomLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _severityMeta =
      const VerificationMeta('severity');
  @override
  late final GeneratedColumn<int> severity = GeneratedColumn<int>(
      'severity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _commentsMeta =
      const VerificationMeta('comments');
  @override
  late final GeneratedColumn<String> comments = GeneratedColumn<String>(
      'comments', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, severity, timestamp, comments];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'symptom_logs';
  @override
  VerificationContext validateIntegrity(Insertable<SymptomLogDbEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('severity')) {
      context.handle(_severityMeta,
          severity.isAcceptableOrUnknown(data['severity']!, _severityMeta));
    } else if (isInserting) {
      context.missing(_severityMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('comments')) {
      context.handle(_commentsMeta,
          comments.isAcceptableOrUnknown(data['comments']!, _commentsMeta));
    } else if (isInserting) {
      context.missing(_commentsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SymptomLogDbEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SymptomLogDbEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      severity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}severity'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      comments: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comments'])!,
    );
  }

  @override
  $SymptomLogsTable createAlias(String alias) {
    return $SymptomLogsTable(attachedDatabase, alias);
  }
}

class SymptomLogDbEntity extends DataClass
    implements Insertable<SymptomLogDbEntity> {
  final int id;
  final String name;
  final int severity;
  final DateTime timestamp;
  final String comments;
  const SymptomLogDbEntity(
      {required this.id,
      required this.name,
      required this.severity,
      required this.timestamp,
      required this.comments});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['severity'] = Variable<int>(severity);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['comments'] = Variable<String>(comments);
    return map;
  }

  SymptomLogsCompanion toCompanion(bool nullToAbsent) {
    return SymptomLogsCompanion(
      id: Value(id),
      name: Value(name),
      severity: Value(severity),
      timestamp: Value(timestamp),
      comments: Value(comments),
    );
  }

  factory SymptomLogDbEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SymptomLogDbEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      severity: serializer.fromJson<int>(json['severity']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      comments: serializer.fromJson<String>(json['comments']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'severity': serializer.toJson<int>(severity),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'comments': serializer.toJson<String>(comments),
    };
  }

  SymptomLogDbEntity copyWith(
          {int? id,
          String? name,
          int? severity,
          DateTime? timestamp,
          String? comments}) =>
      SymptomLogDbEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        severity: severity ?? this.severity,
        timestamp: timestamp ?? this.timestamp,
        comments: comments ?? this.comments,
      );
  SymptomLogDbEntity copyWithCompanion(SymptomLogsCompanion data) {
    return SymptomLogDbEntity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      severity: data.severity.present ? data.severity.value : this.severity,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      comments: data.comments.present ? data.comments.value : this.comments,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SymptomLogDbEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('severity: $severity, ')
          ..write('timestamp: $timestamp, ')
          ..write('comments: $comments')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, severity, timestamp, comments);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SymptomLogDbEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.severity == this.severity &&
          other.timestamp == this.timestamp &&
          other.comments == this.comments);
}

class SymptomLogsCompanion extends UpdateCompanion<SymptomLogDbEntity> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> severity;
  final Value<DateTime> timestamp;
  final Value<String> comments;
  const SymptomLogsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.severity = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.comments = const Value.absent(),
  });
  SymptomLogsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int severity,
    required DateTime timestamp,
    required String comments,
  })  : name = Value(name),
        severity = Value(severity),
        timestamp = Value(timestamp),
        comments = Value(comments);
  static Insertable<SymptomLogDbEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? severity,
    Expression<DateTime>? timestamp,
    Expression<String>? comments,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (severity != null) 'severity': severity,
      if (timestamp != null) 'timestamp': timestamp,
      if (comments != null) 'comments': comments,
    });
  }

  SymptomLogsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? severity,
      Value<DateTime>? timestamp,
      Value<String>? comments}) {
    return SymptomLogsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      severity: severity ?? this.severity,
      timestamp: timestamp ?? this.timestamp,
      comments: comments ?? this.comments,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (severity.present) {
      map['severity'] = Variable<int>(severity.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (comments.present) {
      map['comments'] = Variable<String>(comments.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SymptomLogsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('severity: $severity, ')
          ..write('timestamp: $timestamp, ')
          ..write('comments: $comments')
          ..write(')'))
        .toString();
  }
}

class $PsaLogsTable extends PsaLogs
    with TableInfo<$PsaLogsTable, PsaLogDbEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PsaLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
      'value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _recordedAtMeta =
      const VerificationMeta('recordedAt');
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
      'recorded_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _contextNotesMeta =
      const VerificationMeta('contextNotes');
  @override
  late final GeneratedColumn<String> contextNotes = GeneratedColumn<String>(
      'context_notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<PsaLogSource, int> source =
      GeneratedColumn<int>('source', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<PsaLogSource>($PsaLogsTable.$convertersource);
  @override
  List<GeneratedColumn> get $columns =>
      [id, value, recordedAt, userId, notes, contextNotes, source];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'psa_logs';
  @override
  VerificationContext validateIntegrity(Insertable<PsaLogDbEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
          _recordedAtMeta,
          recordedAt.isAcceptableOrUnknown(
              data['recorded_at']!, _recordedAtMeta));
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('context_notes')) {
      context.handle(
          _contextNotesMeta,
          contextNotes.isAcceptableOrUnknown(
              data['context_notes']!, _contextNotesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PsaLogDbEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PsaLogDbEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}value'])!,
      recordedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}recorded_at'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      contextNotes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}context_notes']),
      source: $PsaLogsTable.$convertersource.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}source'])!),
    );
  }

  @override
  $PsaLogsTable createAlias(String alias) {
    return $PsaLogsTable(attachedDatabase, alias);
  }

  static TypeConverter<PsaLogSource, int> $convertersource =
      const PsaLogSourceConverter();
}

class PsaLogDbEntity extends DataClass implements Insertable<PsaLogDbEntity> {
  final int id;
  final double value;
  final DateTime recordedAt;
  final String userId;
  final String? notes;
  final String? contextNotes;
  final PsaLogSource source;
  const PsaLogDbEntity(
      {required this.id,
      required this.value,
      required this.recordedAt,
      required this.userId,
      this.notes,
      this.contextNotes,
      required this.source});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['value'] = Variable<double>(value);
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || contextNotes != null) {
      map['context_notes'] = Variable<String>(contextNotes);
    }
    {
      map['source'] =
          Variable<int>($PsaLogsTable.$convertersource.toSql(source));
    }
    return map;
  }

  PsaLogsCompanion toCompanion(bool nullToAbsent) {
    return PsaLogsCompanion(
      id: Value(id),
      value: Value(value),
      recordedAt: Value(recordedAt),
      userId: Value(userId),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      contextNotes: contextNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(contextNotes),
      source: Value(source),
    );
  }

  factory PsaLogDbEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PsaLogDbEntity(
      id: serializer.fromJson<int>(json['id']),
      value: serializer.fromJson<double>(json['value']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
      userId: serializer.fromJson<String>(json['userId']),
      notes: serializer.fromJson<String?>(json['notes']),
      contextNotes: serializer.fromJson<String?>(json['contextNotes']),
      source: serializer.fromJson<PsaLogSource>(json['source']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'value': serializer.toJson<double>(value),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
      'userId': serializer.toJson<String>(userId),
      'notes': serializer.toJson<String?>(notes),
      'contextNotes': serializer.toJson<String?>(contextNotes),
      'source': serializer.toJson<PsaLogSource>(source),
    };
  }

  PsaLogDbEntity copyWith(
          {int? id,
          double? value,
          DateTime? recordedAt,
          String? userId,
          Value<String?> notes = const Value.absent(),
          Value<String?> contextNotes = const Value.absent(),
          PsaLogSource? source}) =>
      PsaLogDbEntity(
        id: id ?? this.id,
        value: value ?? this.value,
        recordedAt: recordedAt ?? this.recordedAt,
        userId: userId ?? this.userId,
        notes: notes.present ? notes.value : this.notes,
        contextNotes:
            contextNotes.present ? contextNotes.value : this.contextNotes,
        source: source ?? this.source,
      );
  PsaLogDbEntity copyWithCompanion(PsaLogsCompanion data) {
    return PsaLogDbEntity(
      id: data.id.present ? data.id.value : this.id,
      value: data.value.present ? data.value.value : this.value,
      recordedAt:
          data.recordedAt.present ? data.recordedAt.value : this.recordedAt,
      userId: data.userId.present ? data.userId.value : this.userId,
      notes: data.notes.present ? data.notes.value : this.notes,
      contextNotes: data.contextNotes.present
          ? data.contextNotes.value
          : this.contextNotes,
      source: data.source.present ? data.source.value : this.source,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PsaLogDbEntity(')
          ..write('id: $id, ')
          ..write('value: $value, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('userId: $userId, ')
          ..write('notes: $notes, ')
          ..write('contextNotes: $contextNotes, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, value, recordedAt, userId, notes, contextNotes, source);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PsaLogDbEntity &&
          other.id == this.id &&
          other.value == this.value &&
          other.recordedAt == this.recordedAt &&
          other.userId == this.userId &&
          other.notes == this.notes &&
          other.contextNotes == this.contextNotes &&
          other.source == this.source);
}

class PsaLogsCompanion extends UpdateCompanion<PsaLogDbEntity> {
  final Value<int> id;
  final Value<double> value;
  final Value<DateTime> recordedAt;
  final Value<String> userId;
  final Value<String?> notes;
  final Value<String?> contextNotes;
  final Value<PsaLogSource> source;
  const PsaLogsCompanion({
    this.id = const Value.absent(),
    this.value = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.userId = const Value.absent(),
    this.notes = const Value.absent(),
    this.contextNotes = const Value.absent(),
    this.source = const Value.absent(),
  });
  PsaLogsCompanion.insert({
    this.id = const Value.absent(),
    required double value,
    required DateTime recordedAt,
    required String userId,
    this.notes = const Value.absent(),
    this.contextNotes = const Value.absent(),
    required PsaLogSource source,
  })  : value = Value(value),
        recordedAt = Value(recordedAt),
        userId = Value(userId),
        source = Value(source);
  static Insertable<PsaLogDbEntity> custom({
    Expression<int>? id,
    Expression<double>? value,
    Expression<DateTime>? recordedAt,
    Expression<String>? userId,
    Expression<String>? notes,
    Expression<String>? contextNotes,
    Expression<int>? source,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (value != null) 'value': value,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (userId != null) 'user_id': userId,
      if (notes != null) 'notes': notes,
      if (contextNotes != null) 'context_notes': contextNotes,
      if (source != null) 'source': source,
    });
  }

  PsaLogsCompanion copyWith(
      {Value<int>? id,
      Value<double>? value,
      Value<DateTime>? recordedAt,
      Value<String>? userId,
      Value<String?>? notes,
      Value<String?>? contextNotes,
      Value<PsaLogSource>? source}) {
    return PsaLogsCompanion(
      id: id ?? this.id,
      value: value ?? this.value,
      recordedAt: recordedAt ?? this.recordedAt,
      userId: userId ?? this.userId,
      notes: notes ?? this.notes,
      contextNotes: contextNotes ?? this.contextNotes,
      source: source ?? this.source,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (contextNotes.present) {
      map['context_notes'] = Variable<String>(contextNotes.value);
    }
    if (source.present) {
      map['source'] =
          Variable<int>($PsaLogsTable.$convertersource.toSql(source.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PsaLogsCompanion(')
          ..write('id: $id, ')
          ..write('value: $value, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('userId: $userId, ')
          ..write('notes: $notes, ')
          ..write('contextNotes: $contextNotes, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueItemsTable extends SyncQueueItems
    with TableInfo<$SyncQueueItemsTable, SyncQueueItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _operationMeta =
      const VerificationMeta('operation');
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
      'operation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entityTypeMeta =
      const VerificationMeta('entityType');
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entityIdMeta =
      const VerificationMeta('entityId');
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
      'entity_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _payloadMeta =
      const VerificationMeta('payload');
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
      'payload', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, operation, entityType, entityId, payload, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue_items';
  @override
  VerificationContext validateIntegrity(Insertable<SyncQueueItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('operation')) {
      context.handle(_operationMeta,
          operation.isAcceptableOrUnknown(data['operation']!, _operationMeta));
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
          _entityTypeMeta,
          entityType.isAcceptableOrUnknown(
              data['entity_type']!, _entityTypeMeta));
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(_entityIdMeta,
          entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta));
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(_payloadMeta,
          payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta));
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      operation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}operation'])!,
      entityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      entityId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_id'])!,
      payload: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $SyncQueueItemsTable createAlias(String alias) {
    return $SyncQueueItemsTable(attachedDatabase, alias);
  }
}

class SyncQueueItem extends DataClass implements Insertable<SyncQueueItem> {
  final int id;
  final String operation;
  final String entityType;
  final String entityId;
  final String payload;
  final DateTime createdAt;
  const SyncQueueItem(
      {required this.id,
      required this.operation,
      required this.entityType,
      required this.entityId,
      required this.payload,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['operation'] = Variable<String>(operation);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['payload'] = Variable<String>(payload);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SyncQueueItemsCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueItemsCompanion(
      id: Value(id),
      operation: Value(operation),
      entityType: Value(entityType),
      entityId: Value(entityId),
      payload: Value(payload),
      createdAt: Value(createdAt),
    );
  }

  factory SyncQueueItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueItem(
      id: serializer.fromJson<int>(json['id']),
      operation: serializer.fromJson<String>(json['operation']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      payload: serializer.fromJson<String>(json['payload']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'operation': serializer.toJson<String>(operation),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'payload': serializer.toJson<String>(payload),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SyncQueueItem copyWith(
          {int? id,
          String? operation,
          String? entityType,
          String? entityId,
          String? payload,
          DateTime? createdAt}) =>
      SyncQueueItem(
        id: id ?? this.id,
        operation: operation ?? this.operation,
        entityType: entityType ?? this.entityType,
        entityId: entityId ?? this.entityId,
        payload: payload ?? this.payload,
        createdAt: createdAt ?? this.createdAt,
      );
  SyncQueueItem copyWithCompanion(SyncQueueItemsCompanion data) {
    return SyncQueueItem(
      id: data.id.present ? data.id.value : this.id,
      operation: data.operation.present ? data.operation.value : this.operation,
      entityType:
          data.entityType.present ? data.entityType.value : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      payload: data.payload.present ? data.payload.value : this.payload,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueItem(')
          ..write('id: $id, ')
          ..write('operation: $operation, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, operation, entityType, entityId, payload, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueItem &&
          other.id == this.id &&
          other.operation == this.operation &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.payload == this.payload &&
          other.createdAt == this.createdAt);
}

class SyncQueueItemsCompanion extends UpdateCompanion<SyncQueueItem> {
  final Value<int> id;
  final Value<String> operation;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> payload;
  final Value<DateTime> createdAt;
  const SyncQueueItemsCompanion({
    this.id = const Value.absent(),
    this.operation = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.payload = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SyncQueueItemsCompanion.insert({
    this.id = const Value.absent(),
    required String operation,
    required String entityType,
    required String entityId,
    required String payload,
    this.createdAt = const Value.absent(),
  })  : operation = Value(operation),
        entityType = Value(entityType),
        entityId = Value(entityId),
        payload = Value(payload);
  static Insertable<SyncQueueItem> custom({
    Expression<int>? id,
    Expression<String>? operation,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? payload,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (operation != null) 'operation': operation,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (payload != null) 'payload': payload,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SyncQueueItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? operation,
      Value<String>? entityType,
      Value<String>? entityId,
      Value<String>? payload,
      Value<DateTime>? createdAt}) {
    return SyncQueueItemsCompanion(
      id: id ?? this.id,
      operation: operation ?? this.operation,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueItemsCompanion(')
          ..write('id: $id, ')
          ..write('operation: $operation, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SymptomLogsTable symptomLogs = $SymptomLogsTable(this);
  late final $PsaLogsTable psaLogs = $PsaLogsTable(this);
  late final $SyncQueueItemsTable syncQueueItems = $SyncQueueItemsTable(this);
  late final SymptomLogDao symptomLogDao = SymptomLogDao(this as AppDatabase);
  late final PsaLogDao psaLogDao = PsaLogDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [symptomLogs, psaLogs, syncQueueItems];
}

typedef $$SymptomLogsTableCreateCompanionBuilder = SymptomLogsCompanion
    Function({
  Value<int> id,
  required String name,
  required int severity,
  required DateTime timestamp,
  required String comments,
});
typedef $$SymptomLogsTableUpdateCompanionBuilder = SymptomLogsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<int> severity,
  Value<DateTime> timestamp,
  Value<String> comments,
});

class $$SymptomLogsTableFilterComposer
    extends Composer<_$AppDatabase, $SymptomLogsTable> {
  $$SymptomLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get severity => $composableBuilder(
      column: $table.severity, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get comments => $composableBuilder(
      column: $table.comments, builder: (column) => ColumnFilters(column));
}

class $$SymptomLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $SymptomLogsTable> {
  $$SymptomLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get severity => $composableBuilder(
      column: $table.severity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get comments => $composableBuilder(
      column: $table.comments, builder: (column) => ColumnOrderings(column));
}

class $$SymptomLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SymptomLogsTable> {
  $$SymptomLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get severity =>
      $composableBuilder(column: $table.severity, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get comments =>
      $composableBuilder(column: $table.comments, builder: (column) => column);
}

class $$SymptomLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SymptomLogsTable,
    SymptomLogDbEntity,
    $$SymptomLogsTableFilterComposer,
    $$SymptomLogsTableOrderingComposer,
    $$SymptomLogsTableAnnotationComposer,
    $$SymptomLogsTableCreateCompanionBuilder,
    $$SymptomLogsTableUpdateCompanionBuilder,
    (
      SymptomLogDbEntity,
      BaseReferences<_$AppDatabase, $SymptomLogsTable, SymptomLogDbEntity>
    ),
    SymptomLogDbEntity,
    PrefetchHooks Function()> {
  $$SymptomLogsTableTableManager(_$AppDatabase db, $SymptomLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SymptomLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SymptomLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SymptomLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> severity = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<String> comments = const Value.absent(),
          }) =>
              SymptomLogsCompanion(
            id: id,
            name: name,
            severity: severity,
            timestamp: timestamp,
            comments: comments,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int severity,
            required DateTime timestamp,
            required String comments,
          }) =>
              SymptomLogsCompanion.insert(
            id: id,
            name: name,
            severity: severity,
            timestamp: timestamp,
            comments: comments,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SymptomLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SymptomLogsTable,
    SymptomLogDbEntity,
    $$SymptomLogsTableFilterComposer,
    $$SymptomLogsTableOrderingComposer,
    $$SymptomLogsTableAnnotationComposer,
    $$SymptomLogsTableCreateCompanionBuilder,
    $$SymptomLogsTableUpdateCompanionBuilder,
    (
      SymptomLogDbEntity,
      BaseReferences<_$AppDatabase, $SymptomLogsTable, SymptomLogDbEntity>
    ),
    SymptomLogDbEntity,
    PrefetchHooks Function()>;
typedef $$PsaLogsTableCreateCompanionBuilder = PsaLogsCompanion Function({
  Value<int> id,
  required double value,
  required DateTime recordedAt,
  required String userId,
  Value<String?> notes,
  Value<String?> contextNotes,
  required PsaLogSource source,
});
typedef $$PsaLogsTableUpdateCompanionBuilder = PsaLogsCompanion Function({
  Value<int> id,
  Value<double> value,
  Value<DateTime> recordedAt,
  Value<String> userId,
  Value<String?> notes,
  Value<String?> contextNotes,
  Value<PsaLogSource> source,
});

class $$PsaLogsTableFilterComposer
    extends Composer<_$AppDatabase, $PsaLogsTable> {
  $$PsaLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
      column: $table.recordedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contextNotes => $composableBuilder(
      column: $table.contextNotes, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<PsaLogSource, PsaLogSource, int> get source =>
      $composableBuilder(
          column: $table.source,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$PsaLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $PsaLogsTable> {
  $$PsaLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
      column: $table.recordedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contextNotes => $composableBuilder(
      column: $table.contextNotes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));
}

class $$PsaLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PsaLogsTable> {
  $$PsaLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
      column: $table.recordedAt, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get contextNotes => $composableBuilder(
      column: $table.contextNotes, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PsaLogSource, int> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);
}

class $$PsaLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PsaLogsTable,
    PsaLogDbEntity,
    $$PsaLogsTableFilterComposer,
    $$PsaLogsTableOrderingComposer,
    $$PsaLogsTableAnnotationComposer,
    $$PsaLogsTableCreateCompanionBuilder,
    $$PsaLogsTableUpdateCompanionBuilder,
    (
      PsaLogDbEntity,
      BaseReferences<_$AppDatabase, $PsaLogsTable, PsaLogDbEntity>
    ),
    PsaLogDbEntity,
    PrefetchHooks Function()> {
  $$PsaLogsTableTableManager(_$AppDatabase db, $PsaLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PsaLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PsaLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PsaLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> value = const Value.absent(),
            Value<DateTime> recordedAt = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> contextNotes = const Value.absent(),
            Value<PsaLogSource> source = const Value.absent(),
          }) =>
              PsaLogsCompanion(
            id: id,
            value: value,
            recordedAt: recordedAt,
            userId: userId,
            notes: notes,
            contextNotes: contextNotes,
            source: source,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required double value,
            required DateTime recordedAt,
            required String userId,
            Value<String?> notes = const Value.absent(),
            Value<String?> contextNotes = const Value.absent(),
            required PsaLogSource source,
          }) =>
              PsaLogsCompanion.insert(
            id: id,
            value: value,
            recordedAt: recordedAt,
            userId: userId,
            notes: notes,
            contextNotes: contextNotes,
            source: source,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PsaLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PsaLogsTable,
    PsaLogDbEntity,
    $$PsaLogsTableFilterComposer,
    $$PsaLogsTableOrderingComposer,
    $$PsaLogsTableAnnotationComposer,
    $$PsaLogsTableCreateCompanionBuilder,
    $$PsaLogsTableUpdateCompanionBuilder,
    (
      PsaLogDbEntity,
      BaseReferences<_$AppDatabase, $PsaLogsTable, PsaLogDbEntity>
    ),
    PsaLogDbEntity,
    PrefetchHooks Function()>;
typedef $$SyncQueueItemsTableCreateCompanionBuilder = SyncQueueItemsCompanion
    Function({
  Value<int> id,
  required String operation,
  required String entityType,
  required String entityId,
  required String payload,
  Value<DateTime> createdAt,
});
typedef $$SyncQueueItemsTableUpdateCompanionBuilder = SyncQueueItemsCompanion
    Function({
  Value<int> id,
  Value<String> operation,
  Value<String> entityType,
  Value<String> entityId,
  Value<String> payload,
  Value<DateTime> createdAt,
});

class $$SyncQueueItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueItemsTable> {
  $$SyncQueueItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$SyncQueueItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueItemsTable> {
  $$SyncQueueItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$SyncQueueItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueItemsTable> {
  $$SyncQueueItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => column);

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SyncQueueItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SyncQueueItemsTable,
    SyncQueueItem,
    $$SyncQueueItemsTableFilterComposer,
    $$SyncQueueItemsTableOrderingComposer,
    $$SyncQueueItemsTableAnnotationComposer,
    $$SyncQueueItemsTableCreateCompanionBuilder,
    $$SyncQueueItemsTableUpdateCompanionBuilder,
    (
      SyncQueueItem,
      BaseReferences<_$AppDatabase, $SyncQueueItemsTable, SyncQueueItem>
    ),
    SyncQueueItem,
    PrefetchHooks Function()> {
  $$SyncQueueItemsTableTableManager(
      _$AppDatabase db, $SyncQueueItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> operation = const Value.absent(),
            Value<String> entityType = const Value.absent(),
            Value<String> entityId = const Value.absent(),
            Value<String> payload = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              SyncQueueItemsCompanion(
            id: id,
            operation: operation,
            entityType: entityType,
            entityId: entityId,
            payload: payload,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String operation,
            required String entityType,
            required String entityId,
            required String payload,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              SyncQueueItemsCompanion.insert(
            id: id,
            operation: operation,
            entityType: entityType,
            entityId: entityId,
            payload: payload,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncQueueItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SyncQueueItemsTable,
    SyncQueueItem,
    $$SyncQueueItemsTableFilterComposer,
    $$SyncQueueItemsTableOrderingComposer,
    $$SyncQueueItemsTableAnnotationComposer,
    $$SyncQueueItemsTableCreateCompanionBuilder,
    $$SyncQueueItemsTableUpdateCompanionBuilder,
    (
      SyncQueueItem,
      BaseReferences<_$AppDatabase, $SyncQueueItemsTable, SyncQueueItem>
    ),
    SyncQueueItem,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SymptomLogsTableTableManager get symptomLogs =>
      $$SymptomLogsTableTableManager(_db, _db.symptomLogs);
  $$PsaLogsTableTableManager get psaLogs =>
      $$PsaLogsTableTableManager(_db, _db.psaLogs);
  $$SyncQueueItemsTableTableManager get syncQueueItems =>
      $$SyncQueueItemsTableTableManager(_db, _db.syncQueueItems);
}

mixin _$SymptomLogDaoMixin on DatabaseAccessor<AppDatabase> {
  $SymptomLogsTable get symptomLogs => attachedDatabase.symptomLogs;
}
mixin _$PsaLogDaoMixin on DatabaseAccessor<AppDatabase> {
  $PsaLogsTable get psaLogs => attachedDatabase.psaLogs;
}
