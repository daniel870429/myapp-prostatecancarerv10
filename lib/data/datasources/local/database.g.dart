// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
mixin _$SymptomLogDaoMixin on DatabaseAccessor<AppDatabase> {
  $SymptomLogEntriesTable get symptomLogEntries =>
      attachedDatabase.symptomLogEntries;
}
mixin _$PsaLogDaoMixin on DatabaseAccessor<AppDatabase> {
  $PsaLogEntriesTable get psaLogEntries => attachedDatabase.psaLogEntries;
}

class $SymptomLogEntriesTable extends SymptomLogEntries
    with TableInfo<$SymptomLogEntriesTable, SymptomLogEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SymptomLogEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _symptomNameMeta =
      const VerificationMeta('symptomName');
  @override
  late final GeneratedColumn<String> symptomName = GeneratedColumn<String>(
      'symptom_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _severityMeta =
      const VerificationMeta('severity');
  @override
  late final GeneratedColumn<int> severity = GeneratedColumn<int>(
      'severity', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _recordedAtMeta =
      const VerificationMeta('recordedAt');
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
      'recorded_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, symptomName, severity, recordedAt, notes, userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'symptom_log_entries';
  @override
  VerificationContext validateIntegrity(Insertable<SymptomLogEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('symptom_name')) {
      context.handle(
          _symptomNameMeta,
          symptomName.isAcceptableOrUnknown(
              data['symptom_name']!, _symptomNameMeta));
    } else if (isInserting) {
      context.missing(_symptomNameMeta);
    }
    if (data.containsKey('severity')) {
      context.handle(_severityMeta,
          severity.isAcceptableOrUnknown(data['severity']!, _severityMeta));
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
          _recordedAtMeta,
          recordedAt.isAcceptableOrUnknown(
              data['recorded_at']!, _recordedAtMeta));
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SymptomLogEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SymptomLogEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      symptomName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}symptom_name'])!,
      severity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}severity'])!,
      recordedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}recorded_at'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
    );
  }

  @override
  $SymptomLogEntriesTable createAlias(String alias) {
    return $SymptomLogEntriesTable(attachedDatabase, alias);
  }
}

class SymptomLogEntry extends DataClass implements Insertable<SymptomLogEntry> {
  final int id;
  final String symptomName;
  final int severity;
  final DateTime recordedAt;
  final String? notes;
  final String userId;
  const SymptomLogEntry(
      {required this.id,
      required this.symptomName,
      required this.severity,
      required this.recordedAt,
      this.notes,
      required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['symptom_name'] = Variable<String>(symptomName);
    map['severity'] = Variable<int>(severity);
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['user_id'] = Variable<String>(userId);
    return map;
  }

  SymptomLogEntriesCompanion toCompanion(bool nullToAbsent) {
    return SymptomLogEntriesCompanion(
      id: Value(id),
      symptomName: Value(symptomName),
      severity: Value(severity),
      recordedAt: Value(recordedAt),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      userId: Value(userId),
    );
  }

  factory SymptomLogEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SymptomLogEntry(
      id: serializer.fromJson<int>(json['id']),
      symptomName: serializer.fromJson<String>(json['symptomName']),
      severity: serializer.fromJson<int>(json['severity']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
      notes: serializer.fromJson<String?>(json['notes']),
      userId: serializer.fromJson<String>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'symptomName': serializer.toJson<String>(symptomName),
      'severity': serializer.toJson<int>(severity),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
      'notes': serializer.toJson<String?>(notes),
      'userId': serializer.toJson<String>(userId),
    };
  }

  SymptomLogEntry copyWith(
          {int? id,
          String? symptomName,
          int? severity,
          DateTime? recordedAt,
          Value<String?> notes = const Value.absent(),
          String? userId}) =>
      SymptomLogEntry(
        id: id ?? this.id,
        symptomName: symptomName ?? this.symptomName,
        severity: severity ?? this.severity,
        recordedAt: recordedAt ?? this.recordedAt,
        notes: notes.present ? notes.value : this.notes,
        userId: userId ?? this.userId,
      );
  SymptomLogEntry copyWithCompanion(SymptomLogEntriesCompanion data) {
    return SymptomLogEntry(
      id: data.id.present ? data.id.value : this.id,
      symptomName:
          data.symptomName.present ? data.symptomName.value : this.symptomName,
      severity: data.severity.present ? data.severity.value : this.severity,
      recordedAt:
          data.recordedAt.present ? data.recordedAt.value : this.recordedAt,
      notes: data.notes.present ? data.notes.value : this.notes,
      userId: data.userId.present ? data.userId.value : this.userId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SymptomLogEntry(')
          ..write('id: $id, ')
          ..write('symptomName: $symptomName, ')
          ..write('severity: $severity, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('notes: $notes, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, symptomName, severity, recordedAt, notes, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SymptomLogEntry &&
          other.id == this.id &&
          other.symptomName == this.symptomName &&
          other.severity == this.severity &&
          other.recordedAt == this.recordedAt &&
          other.notes == this.notes &&
          other.userId == this.userId);
}

class SymptomLogEntriesCompanion extends UpdateCompanion<SymptomLogEntry> {
  final Value<int> id;
  final Value<String> symptomName;
  final Value<int> severity;
  final Value<DateTime> recordedAt;
  final Value<String?> notes;
  final Value<String> userId;
  const SymptomLogEntriesCompanion({
    this.id = const Value.absent(),
    this.symptomName = const Value.absent(),
    this.severity = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.userId = const Value.absent(),
  });
  SymptomLogEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String symptomName,
    this.severity = const Value.absent(),
    required DateTime recordedAt,
    this.notes = const Value.absent(),
    required String userId,
  })  : symptomName = Value(symptomName),
        recordedAt = Value(recordedAt),
        userId = Value(userId);
  static Insertable<SymptomLogEntry> custom({
    Expression<int>? id,
    Expression<String>? symptomName,
    Expression<int>? severity,
    Expression<DateTime>? recordedAt,
    Expression<String>? notes,
    Expression<String>? userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (symptomName != null) 'symptom_name': symptomName,
      if (severity != null) 'severity': severity,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (notes != null) 'notes': notes,
      if (userId != null) 'user_id': userId,
    });
  }

  SymptomLogEntriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? symptomName,
      Value<int>? severity,
      Value<DateTime>? recordedAt,
      Value<String?>? notes,
      Value<String>? userId}) {
    return SymptomLogEntriesCompanion(
      id: id ?? this.id,
      symptomName: symptomName ?? this.symptomName,
      severity: severity ?? this.severity,
      recordedAt: recordedAt ?? this.recordedAt,
      notes: notes ?? this.notes,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (symptomName.present) {
      map['symptom_name'] = Variable<String>(symptomName.value);
    }
    if (severity.present) {
      map['severity'] = Variable<int>(severity.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SymptomLogEntriesCompanion(')
          ..write('id: $id, ')
          ..write('symptomName: $symptomName, ')
          ..write('severity: $severity, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('notes: $notes, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class $PsaLogEntriesTable extends PsaLogEntries
    with TableInfo<$PsaLogEntriesTable, PsaLogEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PsaLogEntriesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contextNotesMeta =
      const VerificationMeta('contextNotes');
  @override
  late final GeneratedColumn<String> contextNotes = GeneratedColumn<String>(
      'context_notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<domain.PsaLogSource, int> source =
      GeneratedColumn<int>('source', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: const Constant(0))
          .withConverter<domain.PsaLogSource>(
              $PsaLogEntriesTable.$convertersource);
  @override
  List<GeneratedColumn> get $columns =>
      [id, value, recordedAt, notes, userId, contextNotes, source];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'psa_log_entries';
  @override
  VerificationContext validateIntegrity(Insertable<PsaLogEntry> instance,
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
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
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
  PsaLogEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PsaLogEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}value'])!,
      recordedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}recorded_at'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      contextNotes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}context_notes']),
      source: $PsaLogEntriesTable.$convertersource.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}source'])!),
    );
  }

  @override
  $PsaLogEntriesTable createAlias(String alias) {
    return $PsaLogEntriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<domain.PsaLogSource, int, int> $convertersource =
      const EnumIndexConverter<domain.PsaLogSource>(domain.PsaLogSource.values);
}

class PsaLogEntry extends DataClass implements Insertable<PsaLogEntry> {
  final int id;
  final double value;
  final DateTime recordedAt;
  final String? notes;
  final String userId;
  final String? contextNotes;
  final domain.PsaLogSource source;
  const PsaLogEntry(
      {required this.id,
      required this.value,
      required this.recordedAt,
      this.notes,
      required this.userId,
      this.contextNotes,
      required this.source});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['value'] = Variable<double>(value);
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || contextNotes != null) {
      map['context_notes'] = Variable<String>(contextNotes);
    }
    {
      map['source'] =
          Variable<int>($PsaLogEntriesTable.$convertersource.toSql(source));
    }
    return map;
  }

  PsaLogEntriesCompanion toCompanion(bool nullToAbsent) {
    return PsaLogEntriesCompanion(
      id: Value(id),
      value: Value(value),
      recordedAt: Value(recordedAt),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      userId: Value(userId),
      contextNotes: contextNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(contextNotes),
      source: Value(source),
    );
  }

  factory PsaLogEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PsaLogEntry(
      id: serializer.fromJson<int>(json['id']),
      value: serializer.fromJson<double>(json['value']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
      notes: serializer.fromJson<String?>(json['notes']),
      userId: serializer.fromJson<String>(json['userId']),
      contextNotes: serializer.fromJson<String?>(json['contextNotes']),
      source: $PsaLogEntriesTable.$convertersource
          .fromJson(serializer.fromJson<int>(json['source'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'value': serializer.toJson<double>(value),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
      'notes': serializer.toJson<String?>(notes),
      'userId': serializer.toJson<String>(userId),
      'contextNotes': serializer.toJson<String?>(contextNotes),
      'source': serializer
          .toJson<int>($PsaLogEntriesTable.$convertersource.toJson(source)),
    };
  }

  PsaLogEntry copyWith(
          {int? id,
          double? value,
          DateTime? recordedAt,
          Value<String?> notes = const Value.absent(),
          String? userId,
          Value<String?> contextNotes = const Value.absent(),
          domain.PsaLogSource? source}) =>
      PsaLogEntry(
        id: id ?? this.id,
        value: value ?? this.value,
        recordedAt: recordedAt ?? this.recordedAt,
        notes: notes.present ? notes.value : this.notes,
        userId: userId ?? this.userId,
        contextNotes:
            contextNotes.present ? contextNotes.value : this.contextNotes,
        source: source ?? this.source,
      );
  PsaLogEntry copyWithCompanion(PsaLogEntriesCompanion data) {
    return PsaLogEntry(
      id: data.id.present ? data.id.value : this.id,
      value: data.value.present ? data.value.value : this.value,
      recordedAt:
          data.recordedAt.present ? data.recordedAt.value : this.recordedAt,
      notes: data.notes.present ? data.notes.value : this.notes,
      userId: data.userId.present ? data.userId.value : this.userId,
      contextNotes: data.contextNotes.present
          ? data.contextNotes.value
          : this.contextNotes,
      source: data.source.present ? data.source.value : this.source,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PsaLogEntry(')
          ..write('id: $id, ')
          ..write('value: $value, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('notes: $notes, ')
          ..write('userId: $userId, ')
          ..write('contextNotes: $contextNotes, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, value, recordedAt, notes, userId, contextNotes, source);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PsaLogEntry &&
          other.id == this.id &&
          other.value == this.value &&
          other.recordedAt == this.recordedAt &&
          other.notes == this.notes &&
          other.userId == this.userId &&
          other.contextNotes == this.contextNotes &&
          other.source == this.source);
}

class PsaLogEntriesCompanion extends UpdateCompanion<PsaLogEntry> {
  final Value<int> id;
  final Value<double> value;
  final Value<DateTime> recordedAt;
  final Value<String?> notes;
  final Value<String> userId;
  final Value<String?> contextNotes;
  final Value<domain.PsaLogSource> source;
  const PsaLogEntriesCompanion({
    this.id = const Value.absent(),
    this.value = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.userId = const Value.absent(),
    this.contextNotes = const Value.absent(),
    this.source = const Value.absent(),
  });
  PsaLogEntriesCompanion.insert({
    this.id = const Value.absent(),
    required double value,
    required DateTime recordedAt,
    this.notes = const Value.absent(),
    required String userId,
    this.contextNotes = const Value.absent(),
    this.source = const Value.absent(),
  })  : value = Value(value),
        recordedAt = Value(recordedAt),
        userId = Value(userId);
  static Insertable<PsaLogEntry> custom({
    Expression<int>? id,
    Expression<double>? value,
    Expression<DateTime>? recordedAt,
    Expression<String>? notes,
    Expression<String>? userId,
    Expression<String>? contextNotes,
    Expression<int>? source,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (value != null) 'value': value,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (notes != null) 'notes': notes,
      if (userId != null) 'user_id': userId,
      if (contextNotes != null) 'context_notes': contextNotes,
      if (source != null) 'source': source,
    });
  }

  PsaLogEntriesCompanion copyWith(
      {Value<int>? id,
      Value<double>? value,
      Value<DateTime>? recordedAt,
      Value<String?>? notes,
      Value<String>? userId,
      Value<String?>? contextNotes,
      Value<domain.PsaLogSource>? source}) {
    return PsaLogEntriesCompanion(
      id: id ?? this.id,
      value: value ?? this.value,
      recordedAt: recordedAt ?? this.recordedAt,
      notes: notes ?? this.notes,
      userId: userId ?? this.userId,
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
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (contextNotes.present) {
      map['context_notes'] = Variable<String>(contextNotes.value);
    }
    if (source.present) {
      map['source'] = Variable<int>(
          $PsaLogEntriesTable.$convertersource.toSql(source.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PsaLogEntriesCompanion(')
          ..write('id: $id, ')
          ..write('value: $value, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('notes: $notes, ')
          ..write('userId: $userId, ')
          ..write('contextNotes: $contextNotes, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SymptomLogEntriesTable symptomLogEntries =
      $SymptomLogEntriesTable(this);
  late final $PsaLogEntriesTable psaLogEntries = $PsaLogEntriesTable(this);
  late final SymptomLogDao symptomLogDao = SymptomLogDao(this as AppDatabase);
  late final PsaLogDao psaLogDao = PsaLogDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [symptomLogEntries, psaLogEntries];
}

typedef $$SymptomLogEntriesTableCreateCompanionBuilder
    = SymptomLogEntriesCompanion Function({
  Value<int> id,
  required String symptomName,
  Value<int> severity,
  required DateTime recordedAt,
  Value<String?> notes,
  required String userId,
});
typedef $$SymptomLogEntriesTableUpdateCompanionBuilder
    = SymptomLogEntriesCompanion Function({
  Value<int> id,
  Value<String> symptomName,
  Value<int> severity,
  Value<DateTime> recordedAt,
  Value<String?> notes,
  Value<String> userId,
});

class $$SymptomLogEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $SymptomLogEntriesTable> {
  $$SymptomLogEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get symptomName => $composableBuilder(
      column: $table.symptomName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get severity => $composableBuilder(
      column: $table.severity, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
      column: $table.recordedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));
}

class $$SymptomLogEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $SymptomLogEntriesTable> {
  $$SymptomLogEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get symptomName => $composableBuilder(
      column: $table.symptomName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get severity => $composableBuilder(
      column: $table.severity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
      column: $table.recordedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));
}

class $$SymptomLogEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SymptomLogEntriesTable> {
  $$SymptomLogEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get symptomName => $composableBuilder(
      column: $table.symptomName, builder: (column) => column);

  GeneratedColumn<int> get severity =>
      $composableBuilder(column: $table.severity, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
      column: $table.recordedAt, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);
}

class $$SymptomLogEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SymptomLogEntriesTable,
    SymptomLogEntry,
    $$SymptomLogEntriesTableFilterComposer,
    $$SymptomLogEntriesTableOrderingComposer,
    $$SymptomLogEntriesTableAnnotationComposer,
    $$SymptomLogEntriesTableCreateCompanionBuilder,
    $$SymptomLogEntriesTableUpdateCompanionBuilder,
    (
      SymptomLogEntry,
      BaseReferences<_$AppDatabase, $SymptomLogEntriesTable, SymptomLogEntry>
    ),
    SymptomLogEntry,
    PrefetchHooks Function()> {
  $$SymptomLogEntriesTableTableManager(
      _$AppDatabase db, $SymptomLogEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SymptomLogEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SymptomLogEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SymptomLogEntriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> symptomName = const Value.absent(),
            Value<int> severity = const Value.absent(),
            Value<DateTime> recordedAt = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String> userId = const Value.absent(),
          }) =>
              SymptomLogEntriesCompanion(
            id: id,
            symptomName: symptomName,
            severity: severity,
            recordedAt: recordedAt,
            notes: notes,
            userId: userId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String symptomName,
            Value<int> severity = const Value.absent(),
            required DateTime recordedAt,
            Value<String?> notes = const Value.absent(),
            required String userId,
          }) =>
              SymptomLogEntriesCompanion.insert(
            id: id,
            symptomName: symptomName,
            severity: severity,
            recordedAt: recordedAt,
            notes: notes,
            userId: userId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SymptomLogEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SymptomLogEntriesTable,
    SymptomLogEntry,
    $$SymptomLogEntriesTableFilterComposer,
    $$SymptomLogEntriesTableOrderingComposer,
    $$SymptomLogEntriesTableAnnotationComposer,
    $$SymptomLogEntriesTableCreateCompanionBuilder,
    $$SymptomLogEntriesTableUpdateCompanionBuilder,
    (
      SymptomLogEntry,
      BaseReferences<_$AppDatabase, $SymptomLogEntriesTable, SymptomLogEntry>
    ),
    SymptomLogEntry,
    PrefetchHooks Function()>;
typedef $$PsaLogEntriesTableCreateCompanionBuilder = PsaLogEntriesCompanion
    Function({
  Value<int> id,
  required double value,
  required DateTime recordedAt,
  Value<String?> notes,
  required String userId,
  Value<String?> contextNotes,
  Value<domain.PsaLogSource> source,
});
typedef $$PsaLogEntriesTableUpdateCompanionBuilder = PsaLogEntriesCompanion
    Function({
  Value<int> id,
  Value<double> value,
  Value<DateTime> recordedAt,
  Value<String?> notes,
  Value<String> userId,
  Value<String?> contextNotes,
  Value<domain.PsaLogSource> source,
});

class $$PsaLogEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $PsaLogEntriesTable> {
  $$PsaLogEntriesTableFilterComposer({
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

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contextNotes => $composableBuilder(
      column: $table.contextNotes, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<domain.PsaLogSource, domain.PsaLogSource, int>
      get source => $composableBuilder(
          column: $table.source,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$PsaLogEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $PsaLogEntriesTable> {
  $$PsaLogEntriesTableOrderingComposer({
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

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contextNotes => $composableBuilder(
      column: $table.contextNotes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));
}

class $$PsaLogEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PsaLogEntriesTable> {
  $$PsaLogEntriesTableAnnotationComposer({
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

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get contextNotes => $composableBuilder(
      column: $table.contextNotes, builder: (column) => column);

  GeneratedColumnWithTypeConverter<domain.PsaLogSource, int> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);
}

class $$PsaLogEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PsaLogEntriesTable,
    PsaLogEntry,
    $$PsaLogEntriesTableFilterComposer,
    $$PsaLogEntriesTableOrderingComposer,
    $$PsaLogEntriesTableAnnotationComposer,
    $$PsaLogEntriesTableCreateCompanionBuilder,
    $$PsaLogEntriesTableUpdateCompanionBuilder,
    (
      PsaLogEntry,
      BaseReferences<_$AppDatabase, $PsaLogEntriesTable, PsaLogEntry>
    ),
    PsaLogEntry,
    PrefetchHooks Function()> {
  $$PsaLogEntriesTableTableManager(_$AppDatabase db, $PsaLogEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PsaLogEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PsaLogEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PsaLogEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> value = const Value.absent(),
            Value<DateTime> recordedAt = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String?> contextNotes = const Value.absent(),
            Value<domain.PsaLogSource> source = const Value.absent(),
          }) =>
              PsaLogEntriesCompanion(
            id: id,
            value: value,
            recordedAt: recordedAt,
            notes: notes,
            userId: userId,
            contextNotes: contextNotes,
            source: source,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required double value,
            required DateTime recordedAt,
            Value<String?> notes = const Value.absent(),
            required String userId,
            Value<String?> contextNotes = const Value.absent(),
            Value<domain.PsaLogSource> source = const Value.absent(),
          }) =>
              PsaLogEntriesCompanion.insert(
            id: id,
            value: value,
            recordedAt: recordedAt,
            notes: notes,
            userId: userId,
            contextNotes: contextNotes,
            source: source,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PsaLogEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PsaLogEntriesTable,
    PsaLogEntry,
    $$PsaLogEntriesTableFilterComposer,
    $$PsaLogEntriesTableOrderingComposer,
    $$PsaLogEntriesTableAnnotationComposer,
    $$PsaLogEntriesTableCreateCompanionBuilder,
    $$PsaLogEntriesTableUpdateCompanionBuilder,
    (
      PsaLogEntry,
      BaseReferences<_$AppDatabase, $PsaLogEntriesTable, PsaLogEntry>
    ),
    PsaLogEntry,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SymptomLogEntriesTableTableManager get symptomLogEntries =>
      $$SymptomLogEntriesTableTableManager(_db, _db.symptomLogEntries);
  $$PsaLogEntriesTableTableManager get psaLogEntries =>
      $$PsaLogEntriesTableTableManager(_db, _db.psaLogEntries);
}
