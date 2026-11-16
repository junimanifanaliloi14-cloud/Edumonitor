// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $StudentsTable extends Students with TableInfo<$StudentsTable, Student> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 200,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _createdByDeviceIdMeta = const VerificationMeta(
    'createdByDeviceId',
  );
  @override
  late final GeneratedColumn<String> createdByDeviceId =
      GeneratedColumn<String>(
        'created_by_device_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('local'),
      );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    displayName,
    notes,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'students';
  @override
  VerificationContext validateIntegrity(
    Insertable<Student> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('created_by_device_id')) {
      context.handle(
        _createdByDeviceIdMeta,
        createdByDeviceId.isAcceptableOrUnknown(
          data['created_by_device_id']!,
          _createdByDeviceIdMeta,
        ),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Student map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Student(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      createdByDeviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_device_id'],
      )!,
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $StudentsTable createAlias(String alias) {
    return $StudentsTable(attachedDatabase, alias);
  }
}

class Student extends DataClass implements Insertable<Student> {
  final String id;
  final String displayName;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdByDeviceId;
  final int revision;
  final DateTime? deletedAt;
  const Student({
    required this.id,
    required this.displayName,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.createdByDeviceId,
    required this.revision,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['display_name'] = Variable<String>(displayName);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['created_by_device_id'] = Variable<String>(createdByDeviceId);
    map['revision'] = Variable<int>(revision);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  StudentsCompanion toCompanion(bool nullToAbsent) {
    return StudentsCompanion(
      id: Value(id),
      displayName: Value(displayName),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      createdByDeviceId: Value(createdByDeviceId),
      revision: Value(revision),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Student.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Student(
      id: serializer.fromJson<String>(json['id']),
      displayName: serializer.fromJson<String>(json['displayName']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      createdByDeviceId: serializer.fromJson<String>(json['createdByDeviceId']),
      revision: serializer.fromJson<int>(json['revision']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'displayName': serializer.toJson<String>(displayName),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'createdByDeviceId': serializer.toJson<String>(createdByDeviceId),
      'revision': serializer.toJson<int>(revision),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Student copyWith({
    String? id,
    String? displayName,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdByDeviceId,
    int? revision,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => Student(
    id: id ?? this.id,
    displayName: displayName ?? this.displayName,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
    revision: revision ?? this.revision,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  Student copyWithCompanion(StudentsCompanion data) {
    return Student(
      id: data.id.present ? data.id.value : this.id,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      createdByDeviceId: data.createdByDeviceId.present
          ? data.createdByDeviceId.value
          : this.createdByDeviceId,
      revision: data.revision.present ? data.revision.value : this.revision,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Student(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    displayName,
    notes,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Student &&
          other.id == this.id &&
          other.displayName == this.displayName &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.createdByDeviceId == this.createdByDeviceId &&
          other.revision == this.revision &&
          other.deletedAt == this.deletedAt);
}

class StudentsCompanion extends UpdateCompanion<Student> {
  final Value<String> id;
  final Value<String> displayName;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> createdByDeviceId;
  final Value<int> revision;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const StudentsCompanion({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudentsCompanion.insert({
    required String id,
    required String displayName,
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       displayName = Value(displayName);
  static Insertable<Student> custom({
    Expression<String>? id,
    Expression<String>? displayName,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? createdByDeviceId,
    Expression<int>? revision,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (displayName != null) 'display_name': displayName,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdByDeviceId != null) 'created_by_device_id': createdByDeviceId,
      if (revision != null) 'revision': revision,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudentsCompanion copyWith({
    Value<String>? id,
    Value<String>? displayName,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? createdByDeviceId,
    Value<int>? revision,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return StudentsCompanion(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
      revision: revision ?? this.revision,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (createdByDeviceId.present) {
      map['created_by_device_id'] = Variable<String>(createdByDeviceId.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentsCompanion(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SubjectsTable extends Subjects with TableInfo<$SubjectsTable, Subject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 200,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _engineIdMeta = const VerificationMeta(
    'engineId',
  );
  @override
  late final GeneratedColumn<String> engineId = GeneratedColumn<String>(
    'engine_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('generic'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _createdByDeviceIdMeta = const VerificationMeta(
    'createdByDeviceId',
  );
  @override
  late final GeneratedColumn<String> createdByDeviceId =
      GeneratedColumn<String>(
        'created_by_device_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('local'),
      );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    engineId,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subjects';
  @override
  VerificationContext validateIntegrity(
    Insertable<Subject> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('engine_id')) {
      context.handle(
        _engineIdMeta,
        engineId.isAcceptableOrUnknown(data['engine_id']!, _engineIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('created_by_device_id')) {
      context.handle(
        _createdByDeviceIdMeta,
        createdByDeviceId.isAcceptableOrUnknown(
          data['created_by_device_id']!,
          _createdByDeviceIdMeta,
        ),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Subject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subject(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      engineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}engine_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      createdByDeviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_device_id'],
      )!,
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $SubjectsTable createAlias(String alias) {
    return $SubjectsTable(attachedDatabase, alias);
  }
}

class Subject extends DataClass implements Insertable<Subject> {
  final String id;
  final String name;
  final String engineId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdByDeviceId;
  final int revision;
  final DateTime? deletedAt;
  const Subject({
    required this.id,
    required this.name,
    required this.engineId,
    required this.createdAt,
    required this.updatedAt,
    required this.createdByDeviceId,
    required this.revision,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['engine_id'] = Variable<String>(engineId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['created_by_device_id'] = Variable<String>(createdByDeviceId);
    map['revision'] = Variable<int>(revision);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  SubjectsCompanion toCompanion(bool nullToAbsent) {
    return SubjectsCompanion(
      id: Value(id),
      name: Value(name),
      engineId: Value(engineId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      createdByDeviceId: Value(createdByDeviceId),
      revision: Value(revision),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Subject.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subject(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      engineId: serializer.fromJson<String>(json['engineId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      createdByDeviceId: serializer.fromJson<String>(json['createdByDeviceId']),
      revision: serializer.fromJson<int>(json['revision']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'engineId': serializer.toJson<String>(engineId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'createdByDeviceId': serializer.toJson<String>(createdByDeviceId),
      'revision': serializer.toJson<int>(revision),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Subject copyWith({
    String? id,
    String? name,
    String? engineId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdByDeviceId,
    int? revision,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => Subject(
    id: id ?? this.id,
    name: name ?? this.name,
    engineId: engineId ?? this.engineId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
    revision: revision ?? this.revision,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  Subject copyWithCompanion(SubjectsCompanion data) {
    return Subject(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      engineId: data.engineId.present ? data.engineId.value : this.engineId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      createdByDeviceId: data.createdByDeviceId.present
          ? data.createdByDeviceId.value
          : this.createdByDeviceId,
      revision: data.revision.present ? data.revision.value : this.revision,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Subject(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('engineId: $engineId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    engineId,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subject &&
          other.id == this.id &&
          other.name == this.name &&
          other.engineId == this.engineId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.createdByDeviceId == this.createdByDeviceId &&
          other.revision == this.revision &&
          other.deletedAt == this.deletedAt);
}

class SubjectsCompanion extends UpdateCompanion<Subject> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> engineId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> createdByDeviceId;
  final Value<int> revision;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const SubjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.engineId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SubjectsCompanion.insert({
    required String id,
    required String name,
    this.engineId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<Subject> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? engineId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? createdByDeviceId,
    Expression<int>? revision,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (engineId != null) 'engine_id': engineId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdByDeviceId != null) 'created_by_device_id': createdByDeviceId,
      if (revision != null) 'revision': revision,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SubjectsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? engineId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? createdByDeviceId,
    Value<int>? revision,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return SubjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      engineId: engineId ?? this.engineId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
      revision: revision ?? this.revision,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (engineId.present) {
      map['engine_id'] = Variable<String>(engineId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (createdByDeviceId.present) {
      map['created_by_device_id'] = Variable<String>(createdByDeviceId.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('engineId: $engineId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChaptersTable extends Chapters with TableInfo<$ChaptersTable, Chapter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChaptersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subjectIdMeta = const VerificationMeta(
    'subjectId',
  );
  @override
  late final GeneratedColumn<String> subjectId = GeneratedColumn<String>(
    'subject_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES subjects (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 200,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _createdByDeviceIdMeta = const VerificationMeta(
    'createdByDeviceId',
  );
  @override
  late final GeneratedColumn<String> createdByDeviceId =
      GeneratedColumn<String>(
        'created_by_device_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('local'),
      );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    subjectId,
    name,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chapters';
  @override
  VerificationContext validateIntegrity(
    Insertable<Chapter> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('subject_id')) {
      context.handle(
        _subjectIdMeta,
        subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('created_by_device_id')) {
      context.handle(
        _createdByDeviceIdMeta,
        createdByDeviceId.isAcceptableOrUnknown(
          data['created_by_device_id']!,
          _createdByDeviceIdMeta,
        ),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Chapter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Chapter(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      subjectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      createdByDeviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_device_id'],
      )!,
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $ChaptersTable createAlias(String alias) {
    return $ChaptersTable(attachedDatabase, alias);
  }
}

class Chapter extends DataClass implements Insertable<Chapter> {
  final String id;
  final String subjectId;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdByDeviceId;
  final int revision;
  final DateTime? deletedAt;
  const Chapter({
    required this.id,
    required this.subjectId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.createdByDeviceId,
    required this.revision,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['subject_id'] = Variable<String>(subjectId);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['created_by_device_id'] = Variable<String>(createdByDeviceId);
    map['revision'] = Variable<int>(revision);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  ChaptersCompanion toCompanion(bool nullToAbsent) {
    return ChaptersCompanion(
      id: Value(id),
      subjectId: Value(subjectId),
      name: Value(name),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      createdByDeviceId: Value(createdByDeviceId),
      revision: Value(revision),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Chapter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Chapter(
      id: serializer.fromJson<String>(json['id']),
      subjectId: serializer.fromJson<String>(json['subjectId']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      createdByDeviceId: serializer.fromJson<String>(json['createdByDeviceId']),
      revision: serializer.fromJson<int>(json['revision']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'subjectId': serializer.toJson<String>(subjectId),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'createdByDeviceId': serializer.toJson<String>(createdByDeviceId),
      'revision': serializer.toJson<int>(revision),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Chapter copyWith({
    String? id,
    String? subjectId,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdByDeviceId,
    int? revision,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => Chapter(
    id: id ?? this.id,
    subjectId: subjectId ?? this.subjectId,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
    revision: revision ?? this.revision,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  Chapter copyWithCompanion(ChaptersCompanion data) {
    return Chapter(
      id: data.id.present ? data.id.value : this.id,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      createdByDeviceId: data.createdByDeviceId.present
          ? data.createdByDeviceId.value
          : this.createdByDeviceId,
      revision: data.revision.present ? data.revision.value : this.revision,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Chapter(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    subjectId,
    name,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chapter &&
          other.id == this.id &&
          other.subjectId == this.subjectId &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.createdByDeviceId == this.createdByDeviceId &&
          other.revision == this.revision &&
          other.deletedAt == this.deletedAt);
}

class ChaptersCompanion extends UpdateCompanion<Chapter> {
  final Value<String> id;
  final Value<String> subjectId;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> createdByDeviceId;
  final Value<int> revision;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const ChaptersCompanion({
    this.id = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChaptersCompanion.insert({
    required String id,
    required String subjectId,
    required String name,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       subjectId = Value(subjectId),
       name = Value(name);
  static Insertable<Chapter> custom({
    Expression<String>? id,
    Expression<String>? subjectId,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? createdByDeviceId,
    Expression<int>? revision,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subjectId != null) 'subject_id': subjectId,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdByDeviceId != null) 'created_by_device_id': createdByDeviceId,
      if (revision != null) 'revision': revision,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChaptersCompanion copyWith({
    Value<String>? id,
    Value<String>? subjectId,
    Value<String>? name,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? createdByDeviceId,
    Value<int>? revision,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return ChaptersCompanion(
      id: id ?? this.id,
      subjectId: subjectId ?? this.subjectId,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
      revision: revision ?? this.revision,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<String>(subjectId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (createdByDeviceId.present) {
      map['created_by_device_id'] = Variable<String>(createdByDeviceId.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChaptersCompanion(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TopicsTable extends Topics with TableInfo<$TopicsTable, Topic> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TopicsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _chapterIdMeta = const VerificationMeta(
    'chapterId',
  );
  @override
  late final GeneratedColumn<String> chapterId = GeneratedColumn<String>(
    'chapter_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES chapters (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 200,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _createdByDeviceIdMeta = const VerificationMeta(
    'createdByDeviceId',
  );
  @override
  late final GeneratedColumn<String> createdByDeviceId =
      GeneratedColumn<String>(
        'created_by_device_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('local'),
      );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    chapterId,
    name,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'topics';
  @override
  VerificationContext validateIntegrity(
    Insertable<Topic> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('chapter_id')) {
      context.handle(
        _chapterIdMeta,
        chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta),
      );
    } else if (isInserting) {
      context.missing(_chapterIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('created_by_device_id')) {
      context.handle(
        _createdByDeviceIdMeta,
        createdByDeviceId.isAcceptableOrUnknown(
          data['created_by_device_id']!,
          _createdByDeviceIdMeta,
        ),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Topic map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Topic(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      chapterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chapter_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      createdByDeviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_device_id'],
      )!,
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $TopicsTable createAlias(String alias) {
    return $TopicsTable(attachedDatabase, alias);
  }
}

class Topic extends DataClass implements Insertable<Topic> {
  final String id;
  final String chapterId;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdByDeviceId;
  final int revision;
  final DateTime? deletedAt;
  const Topic({
    required this.id,
    required this.chapterId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.createdByDeviceId,
    required this.revision,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['chapter_id'] = Variable<String>(chapterId);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['created_by_device_id'] = Variable<String>(createdByDeviceId);
    map['revision'] = Variable<int>(revision);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  TopicsCompanion toCompanion(bool nullToAbsent) {
    return TopicsCompanion(
      id: Value(id),
      chapterId: Value(chapterId),
      name: Value(name),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      createdByDeviceId: Value(createdByDeviceId),
      revision: Value(revision),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Topic.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Topic(
      id: serializer.fromJson<String>(json['id']),
      chapterId: serializer.fromJson<String>(json['chapterId']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      createdByDeviceId: serializer.fromJson<String>(json['createdByDeviceId']),
      revision: serializer.fromJson<int>(json['revision']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'chapterId': serializer.toJson<String>(chapterId),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'createdByDeviceId': serializer.toJson<String>(createdByDeviceId),
      'revision': serializer.toJson<int>(revision),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Topic copyWith({
    String? id,
    String? chapterId,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdByDeviceId,
    int? revision,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => Topic(
    id: id ?? this.id,
    chapterId: chapterId ?? this.chapterId,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
    revision: revision ?? this.revision,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  Topic copyWithCompanion(TopicsCompanion data) {
    return Topic(
      id: data.id.present ? data.id.value : this.id,
      chapterId: data.chapterId.present ? data.chapterId.value : this.chapterId,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      createdByDeviceId: data.createdByDeviceId.present
          ? data.createdByDeviceId.value
          : this.createdByDeviceId,
      revision: data.revision.present ? data.revision.value : this.revision,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Topic(')
          ..write('id: $id, ')
          ..write('chapterId: $chapterId, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    chapterId,
    name,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Topic &&
          other.id == this.id &&
          other.chapterId == this.chapterId &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.createdByDeviceId == this.createdByDeviceId &&
          other.revision == this.revision &&
          other.deletedAt == this.deletedAt);
}

class TopicsCompanion extends UpdateCompanion<Topic> {
  final Value<String> id;
  final Value<String> chapterId;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> createdByDeviceId;
  final Value<int> revision;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const TopicsCompanion({
    this.id = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TopicsCompanion.insert({
    required String id,
    required String chapterId,
    required String name,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       chapterId = Value(chapterId),
       name = Value(name);
  static Insertable<Topic> custom({
    Expression<String>? id,
    Expression<String>? chapterId,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? createdByDeviceId,
    Expression<int>? revision,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chapterId != null) 'chapter_id': chapterId,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdByDeviceId != null) 'created_by_device_id': createdByDeviceId,
      if (revision != null) 'revision': revision,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TopicsCompanion copyWith({
    Value<String>? id,
    Value<String>? chapterId,
    Value<String>? name,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? createdByDeviceId,
    Value<int>? revision,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return TopicsCompanion(
      id: id ?? this.id,
      chapterId: chapterId ?? this.chapterId,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
      revision: revision ?? this.revision,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<String>(chapterId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (createdByDeviceId.present) {
      map['created_by_device_id'] = Variable<String>(createdByDeviceId.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TopicsCompanion(')
          ..write('id: $id, ')
          ..write('chapterId: $chapterId, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CompetenciesTable extends Competencies
    with TableInfo<$CompetenciesTable, Competency> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompetenciesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _topicIdMeta = const VerificationMeta(
    'topicId',
  );
  @override
  late final GeneratedColumn<String> topicId = GeneratedColumn<String>(
    'topic_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES topics (id)',
    ),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _createdByDeviceIdMeta = const VerificationMeta(
    'createdByDeviceId',
  );
  @override
  late final GeneratedColumn<String> createdByDeviceId =
      GeneratedColumn<String>(
        'created_by_device_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('local'),
      );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    topicId,
    description,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'competencies';
  @override
  VerificationContext validateIntegrity(
    Insertable<Competency> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('topic_id')) {
      context.handle(
        _topicIdMeta,
        topicId.isAcceptableOrUnknown(data['topic_id']!, _topicIdMeta),
      );
    } else if (isInserting) {
      context.missing(_topicIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('created_by_device_id')) {
      context.handle(
        _createdByDeviceIdMeta,
        createdByDeviceId.isAcceptableOrUnknown(
          data['created_by_device_id']!,
          _createdByDeviceIdMeta,
        ),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Competency map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Competency(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      topicId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}topic_id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      createdByDeviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_device_id'],
      )!,
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $CompetenciesTable createAlias(String alias) {
    return $CompetenciesTable(attachedDatabase, alias);
  }
}

class Competency extends DataClass implements Insertable<Competency> {
  final String id;
  final String topicId;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdByDeviceId;
  final int revision;
  final DateTime? deletedAt;
  const Competency({
    required this.id,
    required this.topicId,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.createdByDeviceId,
    required this.revision,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['topic_id'] = Variable<String>(topicId);
    map['description'] = Variable<String>(description);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['created_by_device_id'] = Variable<String>(createdByDeviceId);
    map['revision'] = Variable<int>(revision);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  CompetenciesCompanion toCompanion(bool nullToAbsent) {
    return CompetenciesCompanion(
      id: Value(id),
      topicId: Value(topicId),
      description: Value(description),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      createdByDeviceId: Value(createdByDeviceId),
      revision: Value(revision),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Competency.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Competency(
      id: serializer.fromJson<String>(json['id']),
      topicId: serializer.fromJson<String>(json['topicId']),
      description: serializer.fromJson<String>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      createdByDeviceId: serializer.fromJson<String>(json['createdByDeviceId']),
      revision: serializer.fromJson<int>(json['revision']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'topicId': serializer.toJson<String>(topicId),
      'description': serializer.toJson<String>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'createdByDeviceId': serializer.toJson<String>(createdByDeviceId),
      'revision': serializer.toJson<int>(revision),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Competency copyWith({
    String? id,
    String? topicId,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdByDeviceId,
    int? revision,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => Competency(
    id: id ?? this.id,
    topicId: topicId ?? this.topicId,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
    revision: revision ?? this.revision,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  Competency copyWithCompanion(CompetenciesCompanion data) {
    return Competency(
      id: data.id.present ? data.id.value : this.id,
      topicId: data.topicId.present ? data.topicId.value : this.topicId,
      description: data.description.present
          ? data.description.value
          : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      createdByDeviceId: data.createdByDeviceId.present
          ? data.createdByDeviceId.value
          : this.createdByDeviceId,
      revision: data.revision.present ? data.revision.value : this.revision,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Competency(')
          ..write('id: $id, ')
          ..write('topicId: $topicId, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    topicId,
    description,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Competency &&
          other.id == this.id &&
          other.topicId == this.topicId &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.createdByDeviceId == this.createdByDeviceId &&
          other.revision == this.revision &&
          other.deletedAt == this.deletedAt);
}

class CompetenciesCompanion extends UpdateCompanion<Competency> {
  final Value<String> id;
  final Value<String> topicId;
  final Value<String> description;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> createdByDeviceId;
  final Value<int> revision;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const CompetenciesCompanion({
    this.id = const Value.absent(),
    this.topicId = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CompetenciesCompanion.insert({
    required String id,
    required String topicId,
    required String description,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       topicId = Value(topicId),
       description = Value(description);
  static Insertable<Competency> custom({
    Expression<String>? id,
    Expression<String>? topicId,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? createdByDeviceId,
    Expression<int>? revision,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (topicId != null) 'topic_id': topicId,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdByDeviceId != null) 'created_by_device_id': createdByDeviceId,
      if (revision != null) 'revision': revision,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CompetenciesCompanion copyWith({
    Value<String>? id,
    Value<String>? topicId,
    Value<String>? description,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? createdByDeviceId,
    Value<int>? revision,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return CompetenciesCompanion(
      id: id ?? this.id,
      topicId: topicId ?? this.topicId,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
      revision: revision ?? this.revision,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (topicId.present) {
      map['topic_id'] = Variable<String>(topicId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (createdByDeviceId.present) {
      map['created_by_device_id'] = Variable<String>(createdByDeviceId.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompetenciesCompanion(')
          ..write('id: $id, ')
          ..write('topicId: $topicId, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SourceDocumentsTable extends SourceDocuments
    with TableInfo<$SourceDocumentsTable, SourceDocument> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SourceDocumentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileHashMeta = const VerificationMeta(
    'fileHash',
  );
  @override
  late final GeneratedColumn<String> fileHash = GeneratedColumn<String>(
    'file_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileTypeMeta = const VerificationMeta(
    'fileType',
  );
  @override
  late final GeneratedColumn<String> fileType = GeneratedColumn<String>(
    'file_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _createdByDeviceIdMeta = const VerificationMeta(
    'createdByDeviceId',
  );
  @override
  late final GeneratedColumn<String> createdByDeviceId =
      GeneratedColumn<String>(
        'created_by_device_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('local'),
      );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    filePath,
    fileHash,
    fileType,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'source_documents';
  @override
  VerificationContext validateIntegrity(
    Insertable<SourceDocument> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('file_hash')) {
      context.handle(
        _fileHashMeta,
        fileHash.isAcceptableOrUnknown(data['file_hash']!, _fileHashMeta),
      );
    } else if (isInserting) {
      context.missing(_fileHashMeta);
    }
    if (data.containsKey('file_type')) {
      context.handle(
        _fileTypeMeta,
        fileType.isAcceptableOrUnknown(data['file_type']!, _fileTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_fileTypeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('created_by_device_id')) {
      context.handle(
        _createdByDeviceIdMeta,
        createdByDeviceId.isAcceptableOrUnknown(
          data['created_by_device_id']!,
          _createdByDeviceIdMeta,
        ),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SourceDocument map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SourceDocument(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
      fileHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_hash'],
      )!,
      fileType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_type'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      createdByDeviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_device_id'],
      )!,
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $SourceDocumentsTable createAlias(String alias) {
    return $SourceDocumentsTable(attachedDatabase, alias);
  }
}

class SourceDocument extends DataClass implements Insertable<SourceDocument> {
  final String id;
  final String title;
  final String filePath;
  final String fileHash;
  final String fileType;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdByDeviceId;
  final int revision;
  final DateTime? deletedAt;
  const SourceDocument({
    required this.id,
    required this.title,
    required this.filePath,
    required this.fileHash,
    required this.fileType,
    required this.createdAt,
    required this.updatedAt,
    required this.createdByDeviceId,
    required this.revision,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['file_path'] = Variable<String>(filePath);
    map['file_hash'] = Variable<String>(fileHash);
    map['file_type'] = Variable<String>(fileType);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['created_by_device_id'] = Variable<String>(createdByDeviceId);
    map['revision'] = Variable<int>(revision);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  SourceDocumentsCompanion toCompanion(bool nullToAbsent) {
    return SourceDocumentsCompanion(
      id: Value(id),
      title: Value(title),
      filePath: Value(filePath),
      fileHash: Value(fileHash),
      fileType: Value(fileType),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      createdByDeviceId: Value(createdByDeviceId),
      revision: Value(revision),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory SourceDocument.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SourceDocument(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      filePath: serializer.fromJson<String>(json['filePath']),
      fileHash: serializer.fromJson<String>(json['fileHash']),
      fileType: serializer.fromJson<String>(json['fileType']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      createdByDeviceId: serializer.fromJson<String>(json['createdByDeviceId']),
      revision: serializer.fromJson<int>(json['revision']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'filePath': serializer.toJson<String>(filePath),
      'fileHash': serializer.toJson<String>(fileHash),
      'fileType': serializer.toJson<String>(fileType),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'createdByDeviceId': serializer.toJson<String>(createdByDeviceId),
      'revision': serializer.toJson<int>(revision),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  SourceDocument copyWith({
    String? id,
    String? title,
    String? filePath,
    String? fileHash,
    String? fileType,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdByDeviceId,
    int? revision,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => SourceDocument(
    id: id ?? this.id,
    title: title ?? this.title,
    filePath: filePath ?? this.filePath,
    fileHash: fileHash ?? this.fileHash,
    fileType: fileType ?? this.fileType,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
    revision: revision ?? this.revision,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  SourceDocument copyWithCompanion(SourceDocumentsCompanion data) {
    return SourceDocument(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      fileHash: data.fileHash.present ? data.fileHash.value : this.fileHash,
      fileType: data.fileType.present ? data.fileType.value : this.fileType,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      createdByDeviceId: data.createdByDeviceId.present
          ? data.createdByDeviceId.value
          : this.createdByDeviceId,
      revision: data.revision.present ? data.revision.value : this.revision,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SourceDocument(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('filePath: $filePath, ')
          ..write('fileHash: $fileHash, ')
          ..write('fileType: $fileType, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    filePath,
    fileHash,
    fileType,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SourceDocument &&
          other.id == this.id &&
          other.title == this.title &&
          other.filePath == this.filePath &&
          other.fileHash == this.fileHash &&
          other.fileType == this.fileType &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.createdByDeviceId == this.createdByDeviceId &&
          other.revision == this.revision &&
          other.deletedAt == this.deletedAt);
}

class SourceDocumentsCompanion extends UpdateCompanion<SourceDocument> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> filePath;
  final Value<String> fileHash;
  final Value<String> fileType;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> createdByDeviceId;
  final Value<int> revision;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const SourceDocumentsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.filePath = const Value.absent(),
    this.fileHash = const Value.absent(),
    this.fileType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SourceDocumentsCompanion.insert({
    required String id,
    required String title,
    required String filePath,
    required String fileHash,
    required String fileType,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       filePath = Value(filePath),
       fileHash = Value(fileHash),
       fileType = Value(fileType);
  static Insertable<SourceDocument> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? filePath,
    Expression<String>? fileHash,
    Expression<String>? fileType,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? createdByDeviceId,
    Expression<int>? revision,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (filePath != null) 'file_path': filePath,
      if (fileHash != null) 'file_hash': fileHash,
      if (fileType != null) 'file_type': fileType,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdByDeviceId != null) 'created_by_device_id': createdByDeviceId,
      if (revision != null) 'revision': revision,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SourceDocumentsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? filePath,
    Value<String>? fileHash,
    Value<String>? fileType,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? createdByDeviceId,
    Value<int>? revision,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return SourceDocumentsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      filePath: filePath ?? this.filePath,
      fileHash: fileHash ?? this.fileHash,
      fileType: fileType ?? this.fileType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
      revision: revision ?? this.revision,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (fileHash.present) {
      map['file_hash'] = Variable<String>(fileHash.value);
    }
    if (fileType.present) {
      map['file_type'] = Variable<String>(fileType.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (createdByDeviceId.present) {
      map['created_by_device_id'] = Variable<String>(createdByDeviceId.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SourceDocumentsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('filePath: $filePath, ')
          ..write('fileHash: $fileHash, ')
          ..write('fileType: $fileType, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DocumentVersionsTable extends DocumentVersions
    with TableInfo<$DocumentVersionsTable, DocumentVersion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentVersionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _documentIdMeta = const VerificationMeta(
    'documentId',
  );
  @override
  late final GeneratedColumn<String> documentId = GeneratedColumn<String>(
    'document_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES source_documents (id)',
    ),
  );
  static const VerificationMeta _versionNumberMeta = const VerificationMeta(
    'versionNumber',
  );
  @override
  late final GeneratedColumn<int> versionNumber = GeneratedColumn<int>(
    'version_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _extractedAtMeta = const VerificationMeta(
    'extractedAt',
  );
  @override
  late final GeneratedColumn<DateTime> extractedAt = GeneratedColumn<DateTime>(
    'extracted_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _createdByDeviceIdMeta = const VerificationMeta(
    'createdByDeviceId',
  );
  @override
  late final GeneratedColumn<String> createdByDeviceId =
      GeneratedColumn<String>(
        'created_by_device_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('local'),
      );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    documentId,
    versionNumber,
    extractedAt,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'document_versions';
  @override
  VerificationContext validateIntegrity(
    Insertable<DocumentVersion> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('document_id')) {
      context.handle(
        _documentIdMeta,
        documentId.isAcceptableOrUnknown(data['document_id']!, _documentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_documentIdMeta);
    }
    if (data.containsKey('version_number')) {
      context.handle(
        _versionNumberMeta,
        versionNumber.isAcceptableOrUnknown(
          data['version_number']!,
          _versionNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_versionNumberMeta);
    }
    if (data.containsKey('extracted_at')) {
      context.handle(
        _extractedAtMeta,
        extractedAt.isAcceptableOrUnknown(
          data['extracted_at']!,
          _extractedAtMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('created_by_device_id')) {
      context.handle(
        _createdByDeviceIdMeta,
        createdByDeviceId.isAcceptableOrUnknown(
          data['created_by_device_id']!,
          _createdByDeviceIdMeta,
        ),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DocumentVersion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DocumentVersion(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      documentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}document_id'],
      )!,
      versionNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version_number'],
      )!,
      extractedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}extracted_at'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      createdByDeviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_device_id'],
      )!,
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $DocumentVersionsTable createAlias(String alias) {
    return $DocumentVersionsTable(attachedDatabase, alias);
  }
}

class DocumentVersion extends DataClass implements Insertable<DocumentVersion> {
  final String id;
  final String documentId;
  final int versionNumber;
  final DateTime extractedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdByDeviceId;
  final int revision;
  final DateTime? deletedAt;
  const DocumentVersion({
    required this.id,
    required this.documentId,
    required this.versionNumber,
    required this.extractedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.createdByDeviceId,
    required this.revision,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['document_id'] = Variable<String>(documentId);
    map['version_number'] = Variable<int>(versionNumber);
    map['extracted_at'] = Variable<DateTime>(extractedAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['created_by_device_id'] = Variable<String>(createdByDeviceId);
    map['revision'] = Variable<int>(revision);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  DocumentVersionsCompanion toCompanion(bool nullToAbsent) {
    return DocumentVersionsCompanion(
      id: Value(id),
      documentId: Value(documentId),
      versionNumber: Value(versionNumber),
      extractedAt: Value(extractedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      createdByDeviceId: Value(createdByDeviceId),
      revision: Value(revision),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory DocumentVersion.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DocumentVersion(
      id: serializer.fromJson<String>(json['id']),
      documentId: serializer.fromJson<String>(json['documentId']),
      versionNumber: serializer.fromJson<int>(json['versionNumber']),
      extractedAt: serializer.fromJson<DateTime>(json['extractedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      createdByDeviceId: serializer.fromJson<String>(json['createdByDeviceId']),
      revision: serializer.fromJson<int>(json['revision']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'documentId': serializer.toJson<String>(documentId),
      'versionNumber': serializer.toJson<int>(versionNumber),
      'extractedAt': serializer.toJson<DateTime>(extractedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'createdByDeviceId': serializer.toJson<String>(createdByDeviceId),
      'revision': serializer.toJson<int>(revision),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  DocumentVersion copyWith({
    String? id,
    String? documentId,
    int? versionNumber,
    DateTime? extractedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdByDeviceId,
    int? revision,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => DocumentVersion(
    id: id ?? this.id,
    documentId: documentId ?? this.documentId,
    versionNumber: versionNumber ?? this.versionNumber,
    extractedAt: extractedAt ?? this.extractedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
    revision: revision ?? this.revision,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  DocumentVersion copyWithCompanion(DocumentVersionsCompanion data) {
    return DocumentVersion(
      id: data.id.present ? data.id.value : this.id,
      documentId: data.documentId.present
          ? data.documentId.value
          : this.documentId,
      versionNumber: data.versionNumber.present
          ? data.versionNumber.value
          : this.versionNumber,
      extractedAt: data.extractedAt.present
          ? data.extractedAt.value
          : this.extractedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      createdByDeviceId: data.createdByDeviceId.present
          ? data.createdByDeviceId.value
          : this.createdByDeviceId,
      revision: data.revision.present ? data.revision.value : this.revision,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DocumentVersion(')
          ..write('id: $id, ')
          ..write('documentId: $documentId, ')
          ..write('versionNumber: $versionNumber, ')
          ..write('extractedAt: $extractedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    documentId,
    versionNumber,
    extractedAt,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DocumentVersion &&
          other.id == this.id &&
          other.documentId == this.documentId &&
          other.versionNumber == this.versionNumber &&
          other.extractedAt == this.extractedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.createdByDeviceId == this.createdByDeviceId &&
          other.revision == this.revision &&
          other.deletedAt == this.deletedAt);
}

class DocumentVersionsCompanion extends UpdateCompanion<DocumentVersion> {
  final Value<String> id;
  final Value<String> documentId;
  final Value<int> versionNumber;
  final Value<DateTime> extractedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> createdByDeviceId;
  final Value<int> revision;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const DocumentVersionsCompanion({
    this.id = const Value.absent(),
    this.documentId = const Value.absent(),
    this.versionNumber = const Value.absent(),
    this.extractedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DocumentVersionsCompanion.insert({
    required String id,
    required String documentId,
    required int versionNumber,
    this.extractedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       documentId = Value(documentId),
       versionNumber = Value(versionNumber);
  static Insertable<DocumentVersion> custom({
    Expression<String>? id,
    Expression<String>? documentId,
    Expression<int>? versionNumber,
    Expression<DateTime>? extractedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? createdByDeviceId,
    Expression<int>? revision,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (documentId != null) 'document_id': documentId,
      if (versionNumber != null) 'version_number': versionNumber,
      if (extractedAt != null) 'extracted_at': extractedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdByDeviceId != null) 'created_by_device_id': createdByDeviceId,
      if (revision != null) 'revision': revision,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DocumentVersionsCompanion copyWith({
    Value<String>? id,
    Value<String>? documentId,
    Value<int>? versionNumber,
    Value<DateTime>? extractedAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? createdByDeviceId,
    Value<int>? revision,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return DocumentVersionsCompanion(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      versionNumber: versionNumber ?? this.versionNumber,
      extractedAt: extractedAt ?? this.extractedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
      revision: revision ?? this.revision,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (documentId.present) {
      map['document_id'] = Variable<String>(documentId.value);
    }
    if (versionNumber.present) {
      map['version_number'] = Variable<int>(versionNumber.value);
    }
    if (extractedAt.present) {
      map['extracted_at'] = Variable<DateTime>(extractedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (createdByDeviceId.present) {
      map['created_by_device_id'] = Variable<String>(createdByDeviceId.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentVersionsCompanion(')
          ..write('id: $id, ')
          ..write('documentId: $documentId, ')
          ..write('versionNumber: $versionNumber, ')
          ..write('extractedAt: $extractedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DocumentChunksTable extends DocumentChunks
    with TableInfo<$DocumentChunksTable, DocumentChunk> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentChunksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _versionIdMeta = const VerificationMeta(
    'versionId',
  );
  @override
  late final GeneratedColumn<String> versionId = GeneratedColumn<String>(
    'version_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES document_versions (id)',
    ),
  );
  static const VerificationMeta _pageNumberMeta = const VerificationMeta(
    'pageNumber',
  );
  @override
  late final GeneratedColumn<int> pageNumber = GeneratedColumn<int>(
    'page_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sequenceMeta = const VerificationMeta(
    'sequence',
  );
  @override
  late final GeneratedColumn<int> sequence = GeneratedColumn<int>(
    'sequence',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _textContentMeta = const VerificationMeta(
    'textContent',
  );
  @override
  late final GeneratedColumn<String> textContent = GeneratedColumn<String>(
    'text_content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locatorMeta = const VerificationMeta(
    'locator',
  );
  @override
  late final GeneratedColumn<String> locator = GeneratedColumn<String>(
    'locator',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _createdByDeviceIdMeta = const VerificationMeta(
    'createdByDeviceId',
  );
  @override
  late final GeneratedColumn<String> createdByDeviceId =
      GeneratedColumn<String>(
        'created_by_device_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('local'),
      );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    versionId,
    pageNumber,
    sequence,
    textContent,
    locator,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'document_chunks';
  @override
  VerificationContext validateIntegrity(
    Insertable<DocumentChunk> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('version_id')) {
      context.handle(
        _versionIdMeta,
        versionId.isAcceptableOrUnknown(data['version_id']!, _versionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_versionIdMeta);
    }
    if (data.containsKey('page_number')) {
      context.handle(
        _pageNumberMeta,
        pageNumber.isAcceptableOrUnknown(data['page_number']!, _pageNumberMeta),
      );
    }
    if (data.containsKey('sequence')) {
      context.handle(
        _sequenceMeta,
        sequence.isAcceptableOrUnknown(data['sequence']!, _sequenceMeta),
      );
    } else if (isInserting) {
      context.missing(_sequenceMeta);
    }
    if (data.containsKey('text_content')) {
      context.handle(
        _textContentMeta,
        textContent.isAcceptableOrUnknown(
          data['text_content']!,
          _textContentMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_textContentMeta);
    }
    if (data.containsKey('locator')) {
      context.handle(
        _locatorMeta,
        locator.isAcceptableOrUnknown(data['locator']!, _locatorMeta),
      );
    } else if (isInserting) {
      context.missing(_locatorMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('created_by_device_id')) {
      context.handle(
        _createdByDeviceIdMeta,
        createdByDeviceId.isAcceptableOrUnknown(
          data['created_by_device_id']!,
          _createdByDeviceIdMeta,
        ),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DocumentChunk map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DocumentChunk(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      versionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}version_id'],
      )!,
      pageNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_number'],
      ),
      sequence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sequence'],
      )!,
      textContent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text_content'],
      )!,
      locator: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}locator'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      createdByDeviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_device_id'],
      )!,
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $DocumentChunksTable createAlias(String alias) {
    return $DocumentChunksTable(attachedDatabase, alias);
  }
}

class DocumentChunk extends DataClass implements Insertable<DocumentChunk> {
  final String id;
  final String versionId;
  final int? pageNumber;
  final int sequence;
  final String textContent;
  final String locator;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdByDeviceId;
  final int revision;
  final DateTime? deletedAt;
  const DocumentChunk({
    required this.id,
    required this.versionId,
    this.pageNumber,
    required this.sequence,
    required this.textContent,
    required this.locator,
    required this.createdAt,
    required this.updatedAt,
    required this.createdByDeviceId,
    required this.revision,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['version_id'] = Variable<String>(versionId);
    if (!nullToAbsent || pageNumber != null) {
      map['page_number'] = Variable<int>(pageNumber);
    }
    map['sequence'] = Variable<int>(sequence);
    map['text_content'] = Variable<String>(textContent);
    map['locator'] = Variable<String>(locator);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['created_by_device_id'] = Variable<String>(createdByDeviceId);
    map['revision'] = Variable<int>(revision);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  DocumentChunksCompanion toCompanion(bool nullToAbsent) {
    return DocumentChunksCompanion(
      id: Value(id),
      versionId: Value(versionId),
      pageNumber: pageNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(pageNumber),
      sequence: Value(sequence),
      textContent: Value(textContent),
      locator: Value(locator),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      createdByDeviceId: Value(createdByDeviceId),
      revision: Value(revision),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory DocumentChunk.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DocumentChunk(
      id: serializer.fromJson<String>(json['id']),
      versionId: serializer.fromJson<String>(json['versionId']),
      pageNumber: serializer.fromJson<int?>(json['pageNumber']),
      sequence: serializer.fromJson<int>(json['sequence']),
      textContent: serializer.fromJson<String>(json['textContent']),
      locator: serializer.fromJson<String>(json['locator']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      createdByDeviceId: serializer.fromJson<String>(json['createdByDeviceId']),
      revision: serializer.fromJson<int>(json['revision']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'versionId': serializer.toJson<String>(versionId),
      'pageNumber': serializer.toJson<int?>(pageNumber),
      'sequence': serializer.toJson<int>(sequence),
      'textContent': serializer.toJson<String>(textContent),
      'locator': serializer.toJson<String>(locator),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'createdByDeviceId': serializer.toJson<String>(createdByDeviceId),
      'revision': serializer.toJson<int>(revision),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  DocumentChunk copyWith({
    String? id,
    String? versionId,
    Value<int?> pageNumber = const Value.absent(),
    int? sequence,
    String? textContent,
    String? locator,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdByDeviceId,
    int? revision,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => DocumentChunk(
    id: id ?? this.id,
    versionId: versionId ?? this.versionId,
    pageNumber: pageNumber.present ? pageNumber.value : this.pageNumber,
    sequence: sequence ?? this.sequence,
    textContent: textContent ?? this.textContent,
    locator: locator ?? this.locator,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
    revision: revision ?? this.revision,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  DocumentChunk copyWithCompanion(DocumentChunksCompanion data) {
    return DocumentChunk(
      id: data.id.present ? data.id.value : this.id,
      versionId: data.versionId.present ? data.versionId.value : this.versionId,
      pageNumber: data.pageNumber.present
          ? data.pageNumber.value
          : this.pageNumber,
      sequence: data.sequence.present ? data.sequence.value : this.sequence,
      textContent: data.textContent.present
          ? data.textContent.value
          : this.textContent,
      locator: data.locator.present ? data.locator.value : this.locator,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      createdByDeviceId: data.createdByDeviceId.present
          ? data.createdByDeviceId.value
          : this.createdByDeviceId,
      revision: data.revision.present ? data.revision.value : this.revision,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DocumentChunk(')
          ..write('id: $id, ')
          ..write('versionId: $versionId, ')
          ..write('pageNumber: $pageNumber, ')
          ..write('sequence: $sequence, ')
          ..write('textContent: $textContent, ')
          ..write('locator: $locator, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    versionId,
    pageNumber,
    sequence,
    textContent,
    locator,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DocumentChunk &&
          other.id == this.id &&
          other.versionId == this.versionId &&
          other.pageNumber == this.pageNumber &&
          other.sequence == this.sequence &&
          other.textContent == this.textContent &&
          other.locator == this.locator &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.createdByDeviceId == this.createdByDeviceId &&
          other.revision == this.revision &&
          other.deletedAt == this.deletedAt);
}

class DocumentChunksCompanion extends UpdateCompanion<DocumentChunk> {
  final Value<String> id;
  final Value<String> versionId;
  final Value<int?> pageNumber;
  final Value<int> sequence;
  final Value<String> textContent;
  final Value<String> locator;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> createdByDeviceId;
  final Value<int> revision;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const DocumentChunksCompanion({
    this.id = const Value.absent(),
    this.versionId = const Value.absent(),
    this.pageNumber = const Value.absent(),
    this.sequence = const Value.absent(),
    this.textContent = const Value.absent(),
    this.locator = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DocumentChunksCompanion.insert({
    required String id,
    required String versionId,
    this.pageNumber = const Value.absent(),
    required int sequence,
    required String textContent,
    required String locator,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       versionId = Value(versionId),
       sequence = Value(sequence),
       textContent = Value(textContent),
       locator = Value(locator);
  static Insertable<DocumentChunk> custom({
    Expression<String>? id,
    Expression<String>? versionId,
    Expression<int>? pageNumber,
    Expression<int>? sequence,
    Expression<String>? textContent,
    Expression<String>? locator,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? createdByDeviceId,
    Expression<int>? revision,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (versionId != null) 'version_id': versionId,
      if (pageNumber != null) 'page_number': pageNumber,
      if (sequence != null) 'sequence': sequence,
      if (textContent != null) 'text_content': textContent,
      if (locator != null) 'locator': locator,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdByDeviceId != null) 'created_by_device_id': createdByDeviceId,
      if (revision != null) 'revision': revision,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DocumentChunksCompanion copyWith({
    Value<String>? id,
    Value<String>? versionId,
    Value<int?>? pageNumber,
    Value<int>? sequence,
    Value<String>? textContent,
    Value<String>? locator,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? createdByDeviceId,
    Value<int>? revision,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return DocumentChunksCompanion(
      id: id ?? this.id,
      versionId: versionId ?? this.versionId,
      pageNumber: pageNumber ?? this.pageNumber,
      sequence: sequence ?? this.sequence,
      textContent: textContent ?? this.textContent,
      locator: locator ?? this.locator,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
      revision: revision ?? this.revision,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (versionId.present) {
      map['version_id'] = Variable<String>(versionId.value);
    }
    if (pageNumber.present) {
      map['page_number'] = Variable<int>(pageNumber.value);
    }
    if (sequence.present) {
      map['sequence'] = Variable<int>(sequence.value);
    }
    if (textContent.present) {
      map['text_content'] = Variable<String>(textContent.value);
    }
    if (locator.present) {
      map['locator'] = Variable<String>(locator.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (createdByDeviceId.present) {
      map['created_by_device_id'] = Variable<String>(createdByDeviceId.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentChunksCompanion(')
          ..write('id: $id, ')
          ..write('versionId: $versionId, ')
          ..write('pageNumber: $pageNumber, ')
          ..write('sequence: $sequence, ')
          ..write('textContent: $textContent, ')
          ..write('locator: $locator, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $KnowledgeItemsTable extends KnowledgeItems
    with TableInfo<$KnowledgeItemsTable, KnowledgeItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KnowledgeItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _topicIdMeta = const VerificationMeta(
    'topicId',
  );
  @override
  late final GeneratedColumn<String> topicId = GeneratedColumn<String>(
    'topic_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES topics (id)',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('extracted'),
  );
  static const VerificationMeta _sourceChunkIdMeta = const VerificationMeta(
    'sourceChunkId',
  );
  @override
  late final GeneratedColumn<String> sourceChunkId = GeneratedColumn<String>(
    'source_chunk_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES document_chunks (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _createdByDeviceIdMeta = const VerificationMeta(
    'createdByDeviceId',
  );
  @override
  late final GeneratedColumn<String> createdByDeviceId =
      GeneratedColumn<String>(
        'created_by_device_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('local'),
      );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    topicId,
    type,
    content,
    status,
    sourceChunkId,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'knowledge_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<KnowledgeItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('topic_id')) {
      context.handle(
        _topicIdMeta,
        topicId.isAcceptableOrUnknown(data['topic_id']!, _topicIdMeta),
      );
    } else if (isInserting) {
      context.missing(_topicIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('source_chunk_id')) {
      context.handle(
        _sourceChunkIdMeta,
        sourceChunkId.isAcceptableOrUnknown(
          data['source_chunk_id']!,
          _sourceChunkIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('created_by_device_id')) {
      context.handle(
        _createdByDeviceIdMeta,
        createdByDeviceId.isAcceptableOrUnknown(
          data['created_by_device_id']!,
          _createdByDeviceIdMeta,
        ),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KnowledgeItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KnowledgeItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      topicId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}topic_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      sourceChunkId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_chunk_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      createdByDeviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_device_id'],
      )!,
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $KnowledgeItemsTable createAlias(String alias) {
    return $KnowledgeItemsTable(attachedDatabase, alias);
  }
}

class KnowledgeItem extends DataClass implements Insertable<KnowledgeItem> {
  final String id;
  final String topicId;
  final String type;
  final String content;
  final String status;
  final String? sourceChunkId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdByDeviceId;
  final int revision;
  final DateTime? deletedAt;
  const KnowledgeItem({
    required this.id,
    required this.topicId,
    required this.type,
    required this.content,
    required this.status,
    this.sourceChunkId,
    required this.createdAt,
    required this.updatedAt,
    required this.createdByDeviceId,
    required this.revision,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['topic_id'] = Variable<String>(topicId);
    map['type'] = Variable<String>(type);
    map['content'] = Variable<String>(content);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || sourceChunkId != null) {
      map['source_chunk_id'] = Variable<String>(sourceChunkId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['created_by_device_id'] = Variable<String>(createdByDeviceId);
    map['revision'] = Variable<int>(revision);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  KnowledgeItemsCompanion toCompanion(bool nullToAbsent) {
    return KnowledgeItemsCompanion(
      id: Value(id),
      topicId: Value(topicId),
      type: Value(type),
      content: Value(content),
      status: Value(status),
      sourceChunkId: sourceChunkId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceChunkId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      createdByDeviceId: Value(createdByDeviceId),
      revision: Value(revision),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory KnowledgeItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KnowledgeItem(
      id: serializer.fromJson<String>(json['id']),
      topicId: serializer.fromJson<String>(json['topicId']),
      type: serializer.fromJson<String>(json['type']),
      content: serializer.fromJson<String>(json['content']),
      status: serializer.fromJson<String>(json['status']),
      sourceChunkId: serializer.fromJson<String?>(json['sourceChunkId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      createdByDeviceId: serializer.fromJson<String>(json['createdByDeviceId']),
      revision: serializer.fromJson<int>(json['revision']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'topicId': serializer.toJson<String>(topicId),
      'type': serializer.toJson<String>(type),
      'content': serializer.toJson<String>(content),
      'status': serializer.toJson<String>(status),
      'sourceChunkId': serializer.toJson<String?>(sourceChunkId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'createdByDeviceId': serializer.toJson<String>(createdByDeviceId),
      'revision': serializer.toJson<int>(revision),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  KnowledgeItem copyWith({
    String? id,
    String? topicId,
    String? type,
    String? content,
    String? status,
    Value<String?> sourceChunkId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdByDeviceId,
    int? revision,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => KnowledgeItem(
    id: id ?? this.id,
    topicId: topicId ?? this.topicId,
    type: type ?? this.type,
    content: content ?? this.content,
    status: status ?? this.status,
    sourceChunkId: sourceChunkId.present
        ? sourceChunkId.value
        : this.sourceChunkId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
    revision: revision ?? this.revision,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  KnowledgeItem copyWithCompanion(KnowledgeItemsCompanion data) {
    return KnowledgeItem(
      id: data.id.present ? data.id.value : this.id,
      topicId: data.topicId.present ? data.topicId.value : this.topicId,
      type: data.type.present ? data.type.value : this.type,
      content: data.content.present ? data.content.value : this.content,
      status: data.status.present ? data.status.value : this.status,
      sourceChunkId: data.sourceChunkId.present
          ? data.sourceChunkId.value
          : this.sourceChunkId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      createdByDeviceId: data.createdByDeviceId.present
          ? data.createdByDeviceId.value
          : this.createdByDeviceId,
      revision: data.revision.present ? data.revision.value : this.revision,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KnowledgeItem(')
          ..write('id: $id, ')
          ..write('topicId: $topicId, ')
          ..write('type: $type, ')
          ..write('content: $content, ')
          ..write('status: $status, ')
          ..write('sourceChunkId: $sourceChunkId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    topicId,
    type,
    content,
    status,
    sourceChunkId,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KnowledgeItem &&
          other.id == this.id &&
          other.topicId == this.topicId &&
          other.type == this.type &&
          other.content == this.content &&
          other.status == this.status &&
          other.sourceChunkId == this.sourceChunkId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.createdByDeviceId == this.createdByDeviceId &&
          other.revision == this.revision &&
          other.deletedAt == this.deletedAt);
}

class KnowledgeItemsCompanion extends UpdateCompanion<KnowledgeItem> {
  final Value<String> id;
  final Value<String> topicId;
  final Value<String> type;
  final Value<String> content;
  final Value<String> status;
  final Value<String?> sourceChunkId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> createdByDeviceId;
  final Value<int> revision;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const KnowledgeItemsCompanion({
    this.id = const Value.absent(),
    this.topicId = const Value.absent(),
    this.type = const Value.absent(),
    this.content = const Value.absent(),
    this.status = const Value.absent(),
    this.sourceChunkId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  KnowledgeItemsCompanion.insert({
    required String id,
    required String topicId,
    required String type,
    required String content,
    this.status = const Value.absent(),
    this.sourceChunkId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       topicId = Value(topicId),
       type = Value(type),
       content = Value(content);
  static Insertable<KnowledgeItem> custom({
    Expression<String>? id,
    Expression<String>? topicId,
    Expression<String>? type,
    Expression<String>? content,
    Expression<String>? status,
    Expression<String>? sourceChunkId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? createdByDeviceId,
    Expression<int>? revision,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (topicId != null) 'topic_id': topicId,
      if (type != null) 'type': type,
      if (content != null) 'content': content,
      if (status != null) 'status': status,
      if (sourceChunkId != null) 'source_chunk_id': sourceChunkId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdByDeviceId != null) 'created_by_device_id': createdByDeviceId,
      if (revision != null) 'revision': revision,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  KnowledgeItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? topicId,
    Value<String>? type,
    Value<String>? content,
    Value<String>? status,
    Value<String?>? sourceChunkId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? createdByDeviceId,
    Value<int>? revision,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return KnowledgeItemsCompanion(
      id: id ?? this.id,
      topicId: topicId ?? this.topicId,
      type: type ?? this.type,
      content: content ?? this.content,
      status: status ?? this.status,
      sourceChunkId: sourceChunkId ?? this.sourceChunkId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
      revision: revision ?? this.revision,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (topicId.present) {
      map['topic_id'] = Variable<String>(topicId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (sourceChunkId.present) {
      map['source_chunk_id'] = Variable<String>(sourceChunkId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (createdByDeviceId.present) {
      map['created_by_device_id'] = Variable<String>(createdByDeviceId.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KnowledgeItemsCompanion(')
          ..write('id: $id, ')
          ..write('topicId: $topicId, ')
          ..write('type: $type, ')
          ..write('content: $content, ')
          ..write('status: $status, ')
          ..write('sourceChunkId: $sourceChunkId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $KnowledgeSourcesTable extends KnowledgeSources
    with TableInfo<$KnowledgeSourcesTable, KnowledgeSource> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KnowledgeSourcesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _knowledgeIdMeta = const VerificationMeta(
    'knowledgeId',
  );
  @override
  late final GeneratedColumn<String> knowledgeId = GeneratedColumn<String>(
    'knowledge_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES knowledge_items (id)',
    ),
  );
  static const VerificationMeta _chunkIdMeta = const VerificationMeta(
    'chunkId',
  );
  @override
  late final GeneratedColumn<String> chunkId = GeneratedColumn<String>(
    'chunk_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES document_chunks (id)',
    ),
  );
  static const VerificationMeta _quoteMeta = const VerificationMeta('quote');
  @override
  late final GeneratedColumn<String> quote = GeneratedColumn<String>(
    'quote',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _createdByDeviceIdMeta = const VerificationMeta(
    'createdByDeviceId',
  );
  @override
  late final GeneratedColumn<String> createdByDeviceId =
      GeneratedColumn<String>(
        'created_by_device_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('local'),
      );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    knowledgeId,
    chunkId,
    quote,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'knowledge_sources';
  @override
  VerificationContext validateIntegrity(
    Insertable<KnowledgeSource> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('knowledge_id')) {
      context.handle(
        _knowledgeIdMeta,
        knowledgeId.isAcceptableOrUnknown(
          data['knowledge_id']!,
          _knowledgeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_knowledgeIdMeta);
    }
    if (data.containsKey('chunk_id')) {
      context.handle(
        _chunkIdMeta,
        chunkId.isAcceptableOrUnknown(data['chunk_id']!, _chunkIdMeta),
      );
    } else if (isInserting) {
      context.missing(_chunkIdMeta);
    }
    if (data.containsKey('quote')) {
      context.handle(
        _quoteMeta,
        quote.isAcceptableOrUnknown(data['quote']!, _quoteMeta),
      );
    } else if (isInserting) {
      context.missing(_quoteMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('created_by_device_id')) {
      context.handle(
        _createdByDeviceIdMeta,
        createdByDeviceId.isAcceptableOrUnknown(
          data['created_by_device_id']!,
          _createdByDeviceIdMeta,
        ),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KnowledgeSource map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KnowledgeSource(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      knowledgeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}knowledge_id'],
      )!,
      chunkId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chunk_id'],
      )!,
      quote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quote'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      createdByDeviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_device_id'],
      )!,
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $KnowledgeSourcesTable createAlias(String alias) {
    return $KnowledgeSourcesTable(attachedDatabase, alias);
  }
}

class KnowledgeSource extends DataClass implements Insertable<KnowledgeSource> {
  final String id;
  final String knowledgeId;
  final String chunkId;
  final String quote;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdByDeviceId;
  final int revision;
  final DateTime? deletedAt;
  const KnowledgeSource({
    required this.id,
    required this.knowledgeId,
    required this.chunkId,
    required this.quote,
    required this.createdAt,
    required this.updatedAt,
    required this.createdByDeviceId,
    required this.revision,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['knowledge_id'] = Variable<String>(knowledgeId);
    map['chunk_id'] = Variable<String>(chunkId);
    map['quote'] = Variable<String>(quote);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['created_by_device_id'] = Variable<String>(createdByDeviceId);
    map['revision'] = Variable<int>(revision);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  KnowledgeSourcesCompanion toCompanion(bool nullToAbsent) {
    return KnowledgeSourcesCompanion(
      id: Value(id),
      knowledgeId: Value(knowledgeId),
      chunkId: Value(chunkId),
      quote: Value(quote),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      createdByDeviceId: Value(createdByDeviceId),
      revision: Value(revision),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory KnowledgeSource.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KnowledgeSource(
      id: serializer.fromJson<String>(json['id']),
      knowledgeId: serializer.fromJson<String>(json['knowledgeId']),
      chunkId: serializer.fromJson<String>(json['chunkId']),
      quote: serializer.fromJson<String>(json['quote']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      createdByDeviceId: serializer.fromJson<String>(json['createdByDeviceId']),
      revision: serializer.fromJson<int>(json['revision']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'knowledgeId': serializer.toJson<String>(knowledgeId),
      'chunkId': serializer.toJson<String>(chunkId),
      'quote': serializer.toJson<String>(quote),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'createdByDeviceId': serializer.toJson<String>(createdByDeviceId),
      'revision': serializer.toJson<int>(revision),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  KnowledgeSource copyWith({
    String? id,
    String? knowledgeId,
    String? chunkId,
    String? quote,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdByDeviceId,
    int? revision,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => KnowledgeSource(
    id: id ?? this.id,
    knowledgeId: knowledgeId ?? this.knowledgeId,
    chunkId: chunkId ?? this.chunkId,
    quote: quote ?? this.quote,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
    revision: revision ?? this.revision,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  KnowledgeSource copyWithCompanion(KnowledgeSourcesCompanion data) {
    return KnowledgeSource(
      id: data.id.present ? data.id.value : this.id,
      knowledgeId: data.knowledgeId.present
          ? data.knowledgeId.value
          : this.knowledgeId,
      chunkId: data.chunkId.present ? data.chunkId.value : this.chunkId,
      quote: data.quote.present ? data.quote.value : this.quote,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      createdByDeviceId: data.createdByDeviceId.present
          ? data.createdByDeviceId.value
          : this.createdByDeviceId,
      revision: data.revision.present ? data.revision.value : this.revision,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KnowledgeSource(')
          ..write('id: $id, ')
          ..write('knowledgeId: $knowledgeId, ')
          ..write('chunkId: $chunkId, ')
          ..write('quote: $quote, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    knowledgeId,
    chunkId,
    quote,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KnowledgeSource &&
          other.id == this.id &&
          other.knowledgeId == this.knowledgeId &&
          other.chunkId == this.chunkId &&
          other.quote == this.quote &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.createdByDeviceId == this.createdByDeviceId &&
          other.revision == this.revision &&
          other.deletedAt == this.deletedAt);
}

class KnowledgeSourcesCompanion extends UpdateCompanion<KnowledgeSource> {
  final Value<String> id;
  final Value<String> knowledgeId;
  final Value<String> chunkId;
  final Value<String> quote;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> createdByDeviceId;
  final Value<int> revision;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const KnowledgeSourcesCompanion({
    this.id = const Value.absent(),
    this.knowledgeId = const Value.absent(),
    this.chunkId = const Value.absent(),
    this.quote = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  KnowledgeSourcesCompanion.insert({
    required String id,
    required String knowledgeId,
    required String chunkId,
    required String quote,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       knowledgeId = Value(knowledgeId),
       chunkId = Value(chunkId),
       quote = Value(quote);
  static Insertable<KnowledgeSource> custom({
    Expression<String>? id,
    Expression<String>? knowledgeId,
    Expression<String>? chunkId,
    Expression<String>? quote,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? createdByDeviceId,
    Expression<int>? revision,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (knowledgeId != null) 'knowledge_id': knowledgeId,
      if (chunkId != null) 'chunk_id': chunkId,
      if (quote != null) 'quote': quote,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdByDeviceId != null) 'created_by_device_id': createdByDeviceId,
      if (revision != null) 'revision': revision,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  KnowledgeSourcesCompanion copyWith({
    Value<String>? id,
    Value<String>? knowledgeId,
    Value<String>? chunkId,
    Value<String>? quote,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? createdByDeviceId,
    Value<int>? revision,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return KnowledgeSourcesCompanion(
      id: id ?? this.id,
      knowledgeId: knowledgeId ?? this.knowledgeId,
      chunkId: chunkId ?? this.chunkId,
      quote: quote ?? this.quote,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
      revision: revision ?? this.revision,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (knowledgeId.present) {
      map['knowledge_id'] = Variable<String>(knowledgeId.value);
    }
    if (chunkId.present) {
      map['chunk_id'] = Variable<String>(chunkId.value);
    }
    if (quote.present) {
      map['quote'] = Variable<String>(quote.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (createdByDeviceId.present) {
      map['created_by_device_id'] = Variable<String>(createdByDeviceId.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KnowledgeSourcesCompanion(')
          ..write('id: $id, ')
          ..write('knowledgeId: $knowledgeId, ')
          ..write('chunkId: $chunkId, ')
          ..write('quote: $quote, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuestionsTable extends Questions
    with TableInfo<$QuestionsTable, Question> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _topicIdMeta = const VerificationMeta(
    'topicId',
  );
  @override
  late final GeneratedColumn<String> topicId = GeneratedColumn<String>(
    'topic_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES topics (id)',
    ),
  );
  static const VerificationMeta _generatorIdMeta = const VerificationMeta(
    'generatorId',
  );
  @override
  late final GeneratedColumn<String> generatorId = GeneratedColumn<String>(
    'generator_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('draft'),
  );
  static const VerificationMeta _contentJsonMeta = const VerificationMeta(
    'contentJson',
  );
  @override
  late final GeneratedColumn<String> contentJson = GeneratedColumn<String>(
    'content_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _answerJsonMeta = const VerificationMeta(
    'answerJson',
  );
  @override
  late final GeneratedColumn<String> answerJson = GeneratedColumn<String>(
    'answer_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _difficultyEstimateMeta =
      const VerificationMeta('difficultyEstimate');
  @override
  late final GeneratedColumn<double> difficultyEstimate =
      GeneratedColumn<double>(
        'difficulty_estimate',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _createdByDeviceIdMeta = const VerificationMeta(
    'createdByDeviceId',
  );
  @override
  late final GeneratedColumn<String> createdByDeviceId =
      GeneratedColumn<String>(
        'created_by_device_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('local'),
      );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    topicId,
    generatorId,
    status,
    contentJson,
    answerJson,
    difficultyEstimate,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'questions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Question> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('topic_id')) {
      context.handle(
        _topicIdMeta,
        topicId.isAcceptableOrUnknown(data['topic_id']!, _topicIdMeta),
      );
    } else if (isInserting) {
      context.missing(_topicIdMeta);
    }
    if (data.containsKey('generator_id')) {
      context.handle(
        _generatorIdMeta,
        generatorId.isAcceptableOrUnknown(
          data['generator_id']!,
          _generatorIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_generatorIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('content_json')) {
      context.handle(
        _contentJsonMeta,
        contentJson.isAcceptableOrUnknown(
          data['content_json']!,
          _contentJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_contentJsonMeta);
    }
    if (data.containsKey('answer_json')) {
      context.handle(
        _answerJsonMeta,
        answerJson.isAcceptableOrUnknown(data['answer_json']!, _answerJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_answerJsonMeta);
    }
    if (data.containsKey('difficulty_estimate')) {
      context.handle(
        _difficultyEstimateMeta,
        difficultyEstimate.isAcceptableOrUnknown(
          data['difficulty_estimate']!,
          _difficultyEstimateMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('created_by_device_id')) {
      context.handle(
        _createdByDeviceIdMeta,
        createdByDeviceId.isAcceptableOrUnknown(
          data['created_by_device_id']!,
          _createdByDeviceIdMeta,
        ),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Question map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Question(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      topicId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}topic_id'],
      )!,
      generatorId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}generator_id'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      contentJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_json'],
      )!,
      answerJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}answer_json'],
      )!,
      difficultyEstimate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}difficulty_estimate'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      createdByDeviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_device_id'],
      )!,
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $QuestionsTable createAlias(String alias) {
    return $QuestionsTable(attachedDatabase, alias);
  }
}

class Question extends DataClass implements Insertable<Question> {
  final String id;
  final String topicId;
  final String generatorId;
  final String status;
  final String contentJson;
  final String answerJson;
  final double? difficultyEstimate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdByDeviceId;
  final int revision;
  final DateTime? deletedAt;
  const Question({
    required this.id,
    required this.topicId,
    required this.generatorId,
    required this.status,
    required this.contentJson,
    required this.answerJson,
    this.difficultyEstimate,
    required this.createdAt,
    required this.updatedAt,
    required this.createdByDeviceId,
    required this.revision,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['topic_id'] = Variable<String>(topicId);
    map['generator_id'] = Variable<String>(generatorId);
    map['status'] = Variable<String>(status);
    map['content_json'] = Variable<String>(contentJson);
    map['answer_json'] = Variable<String>(answerJson);
    if (!nullToAbsent || difficultyEstimate != null) {
      map['difficulty_estimate'] = Variable<double>(difficultyEstimate);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['created_by_device_id'] = Variable<String>(createdByDeviceId);
    map['revision'] = Variable<int>(revision);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  QuestionsCompanion toCompanion(bool nullToAbsent) {
    return QuestionsCompanion(
      id: Value(id),
      topicId: Value(topicId),
      generatorId: Value(generatorId),
      status: Value(status),
      contentJson: Value(contentJson),
      answerJson: Value(answerJson),
      difficultyEstimate: difficultyEstimate == null && nullToAbsent
          ? const Value.absent()
          : Value(difficultyEstimate),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      createdByDeviceId: Value(createdByDeviceId),
      revision: Value(revision),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Question.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Question(
      id: serializer.fromJson<String>(json['id']),
      topicId: serializer.fromJson<String>(json['topicId']),
      generatorId: serializer.fromJson<String>(json['generatorId']),
      status: serializer.fromJson<String>(json['status']),
      contentJson: serializer.fromJson<String>(json['contentJson']),
      answerJson: serializer.fromJson<String>(json['answerJson']),
      difficultyEstimate: serializer.fromJson<double?>(
        json['difficultyEstimate'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      createdByDeviceId: serializer.fromJson<String>(json['createdByDeviceId']),
      revision: serializer.fromJson<int>(json['revision']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'topicId': serializer.toJson<String>(topicId),
      'generatorId': serializer.toJson<String>(generatorId),
      'status': serializer.toJson<String>(status),
      'contentJson': serializer.toJson<String>(contentJson),
      'answerJson': serializer.toJson<String>(answerJson),
      'difficultyEstimate': serializer.toJson<double?>(difficultyEstimate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'createdByDeviceId': serializer.toJson<String>(createdByDeviceId),
      'revision': serializer.toJson<int>(revision),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Question copyWith({
    String? id,
    String? topicId,
    String? generatorId,
    String? status,
    String? contentJson,
    String? answerJson,
    Value<double?> difficultyEstimate = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdByDeviceId,
    int? revision,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => Question(
    id: id ?? this.id,
    topicId: topicId ?? this.topicId,
    generatorId: generatorId ?? this.generatorId,
    status: status ?? this.status,
    contentJson: contentJson ?? this.contentJson,
    answerJson: answerJson ?? this.answerJson,
    difficultyEstimate: difficultyEstimate.present
        ? difficultyEstimate.value
        : this.difficultyEstimate,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
    revision: revision ?? this.revision,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  Question copyWithCompanion(QuestionsCompanion data) {
    return Question(
      id: data.id.present ? data.id.value : this.id,
      topicId: data.topicId.present ? data.topicId.value : this.topicId,
      generatorId: data.generatorId.present
          ? data.generatorId.value
          : this.generatorId,
      status: data.status.present ? data.status.value : this.status,
      contentJson: data.contentJson.present
          ? data.contentJson.value
          : this.contentJson,
      answerJson: data.answerJson.present
          ? data.answerJson.value
          : this.answerJson,
      difficultyEstimate: data.difficultyEstimate.present
          ? data.difficultyEstimate.value
          : this.difficultyEstimate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      createdByDeviceId: data.createdByDeviceId.present
          ? data.createdByDeviceId.value
          : this.createdByDeviceId,
      revision: data.revision.present ? data.revision.value : this.revision,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Question(')
          ..write('id: $id, ')
          ..write('topicId: $topicId, ')
          ..write('generatorId: $generatorId, ')
          ..write('status: $status, ')
          ..write('contentJson: $contentJson, ')
          ..write('answerJson: $answerJson, ')
          ..write('difficultyEstimate: $difficultyEstimate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    topicId,
    generatorId,
    status,
    contentJson,
    answerJson,
    difficultyEstimate,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Question &&
          other.id == this.id &&
          other.topicId == this.topicId &&
          other.generatorId == this.generatorId &&
          other.status == this.status &&
          other.contentJson == this.contentJson &&
          other.answerJson == this.answerJson &&
          other.difficultyEstimate == this.difficultyEstimate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.createdByDeviceId == this.createdByDeviceId &&
          other.revision == this.revision &&
          other.deletedAt == this.deletedAt);
}

class QuestionsCompanion extends UpdateCompanion<Question> {
  final Value<String> id;
  final Value<String> topicId;
  final Value<String> generatorId;
  final Value<String> status;
  final Value<String> contentJson;
  final Value<String> answerJson;
  final Value<double?> difficultyEstimate;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> createdByDeviceId;
  final Value<int> revision;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const QuestionsCompanion({
    this.id = const Value.absent(),
    this.topicId = const Value.absent(),
    this.generatorId = const Value.absent(),
    this.status = const Value.absent(),
    this.contentJson = const Value.absent(),
    this.answerJson = const Value.absent(),
    this.difficultyEstimate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuestionsCompanion.insert({
    required String id,
    required String topicId,
    required String generatorId,
    this.status = const Value.absent(),
    required String contentJson,
    required String answerJson,
    this.difficultyEstimate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       topicId = Value(topicId),
       generatorId = Value(generatorId),
       contentJson = Value(contentJson),
       answerJson = Value(answerJson);
  static Insertable<Question> custom({
    Expression<String>? id,
    Expression<String>? topicId,
    Expression<String>? generatorId,
    Expression<String>? status,
    Expression<String>? contentJson,
    Expression<String>? answerJson,
    Expression<double>? difficultyEstimate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? createdByDeviceId,
    Expression<int>? revision,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (topicId != null) 'topic_id': topicId,
      if (generatorId != null) 'generator_id': generatorId,
      if (status != null) 'status': status,
      if (contentJson != null) 'content_json': contentJson,
      if (answerJson != null) 'answer_json': answerJson,
      if (difficultyEstimate != null) 'difficulty_estimate': difficultyEstimate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdByDeviceId != null) 'created_by_device_id': createdByDeviceId,
      if (revision != null) 'revision': revision,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuestionsCompanion copyWith({
    Value<String>? id,
    Value<String>? topicId,
    Value<String>? generatorId,
    Value<String>? status,
    Value<String>? contentJson,
    Value<String>? answerJson,
    Value<double?>? difficultyEstimate,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? createdByDeviceId,
    Value<int>? revision,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return QuestionsCompanion(
      id: id ?? this.id,
      topicId: topicId ?? this.topicId,
      generatorId: generatorId ?? this.generatorId,
      status: status ?? this.status,
      contentJson: contentJson ?? this.contentJson,
      answerJson: answerJson ?? this.answerJson,
      difficultyEstimate: difficultyEstimate ?? this.difficultyEstimate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
      revision: revision ?? this.revision,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (topicId.present) {
      map['topic_id'] = Variable<String>(topicId.value);
    }
    if (generatorId.present) {
      map['generator_id'] = Variable<String>(generatorId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (contentJson.present) {
      map['content_json'] = Variable<String>(contentJson.value);
    }
    if (answerJson.present) {
      map['answer_json'] = Variable<String>(answerJson.value);
    }
    if (difficultyEstimate.present) {
      map['difficulty_estimate'] = Variable<double>(difficultyEstimate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (createdByDeviceId.present) {
      map['created_by_device_id'] = Variable<String>(createdByDeviceId.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionsCompanion(')
          ..write('id: $id, ')
          ..write('topicId: $topicId, ')
          ..write('generatorId: $generatorId, ')
          ..write('status: $status, ')
          ..write('contentJson: $contentJson, ')
          ..write('answerJson: $answerJson, ')
          ..write('difficultyEstimate: $difficultyEstimate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuestionSnapshotsTable extends QuestionSnapshots
    with TableInfo<$QuestionSnapshotsTable, QuestionSnapshot> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionSnapshotsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _questionIdMeta = const VerificationMeta(
    'questionId',
  );
  @override
  late final GeneratedColumn<String> questionId = GeneratedColumn<String>(
    'question_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES questions (id)',
    ),
  );
  static const VerificationMeta _contentJsonMeta = const VerificationMeta(
    'contentJson',
  );
  @override
  late final GeneratedColumn<String> contentJson = GeneratedColumn<String>(
    'content_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _answerJsonMeta = const VerificationMeta(
    'answerJson',
  );
  @override
  late final GeneratedColumn<String> answerJson = GeneratedColumn<String>(
    'answer_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _provenanceJsonMeta = const VerificationMeta(
    'provenanceJson',
  );
  @override
  late final GeneratedColumn<String> provenanceJson = GeneratedColumn<String>(
    'provenance_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    questionId,
    contentJson,
    answerJson,
    provenanceJson,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'question_snapshots';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuestionSnapshot> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('question_id')) {
      context.handle(
        _questionIdMeta,
        questionId.isAcceptableOrUnknown(data['question_id']!, _questionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('content_json')) {
      context.handle(
        _contentJsonMeta,
        contentJson.isAcceptableOrUnknown(
          data['content_json']!,
          _contentJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_contentJsonMeta);
    }
    if (data.containsKey('answer_json')) {
      context.handle(
        _answerJsonMeta,
        answerJson.isAcceptableOrUnknown(data['answer_json']!, _answerJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_answerJsonMeta);
    }
    if (data.containsKey('provenance_json')) {
      context.handle(
        _provenanceJsonMeta,
        provenanceJson.isAcceptableOrUnknown(
          data['provenance_json']!,
          _provenanceJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_provenanceJsonMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuestionSnapshot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestionSnapshot(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      questionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question_id'],
      )!,
      contentJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_json'],
      )!,
      answerJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}answer_json'],
      )!,
      provenanceJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provenance_json'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $QuestionSnapshotsTable createAlias(String alias) {
    return $QuestionSnapshotsTable(attachedDatabase, alias);
  }
}

class QuestionSnapshot extends DataClass
    implements Insertable<QuestionSnapshot> {
  final String id;
  final String questionId;
  final String contentJson;
  final String answerJson;
  final String provenanceJson;
  final DateTime createdAt;
  const QuestionSnapshot({
    required this.id,
    required this.questionId,
    required this.contentJson,
    required this.answerJson,
    required this.provenanceJson,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['question_id'] = Variable<String>(questionId);
    map['content_json'] = Variable<String>(contentJson);
    map['answer_json'] = Variable<String>(answerJson);
    map['provenance_json'] = Variable<String>(provenanceJson);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  QuestionSnapshotsCompanion toCompanion(bool nullToAbsent) {
    return QuestionSnapshotsCompanion(
      id: Value(id),
      questionId: Value(questionId),
      contentJson: Value(contentJson),
      answerJson: Value(answerJson),
      provenanceJson: Value(provenanceJson),
      createdAt: Value(createdAt),
    );
  }

  factory QuestionSnapshot.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestionSnapshot(
      id: serializer.fromJson<String>(json['id']),
      questionId: serializer.fromJson<String>(json['questionId']),
      contentJson: serializer.fromJson<String>(json['contentJson']),
      answerJson: serializer.fromJson<String>(json['answerJson']),
      provenanceJson: serializer.fromJson<String>(json['provenanceJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'questionId': serializer.toJson<String>(questionId),
      'contentJson': serializer.toJson<String>(contentJson),
      'answerJson': serializer.toJson<String>(answerJson),
      'provenanceJson': serializer.toJson<String>(provenanceJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  QuestionSnapshot copyWith({
    String? id,
    String? questionId,
    String? contentJson,
    String? answerJson,
    String? provenanceJson,
    DateTime? createdAt,
  }) => QuestionSnapshot(
    id: id ?? this.id,
    questionId: questionId ?? this.questionId,
    contentJson: contentJson ?? this.contentJson,
    answerJson: answerJson ?? this.answerJson,
    provenanceJson: provenanceJson ?? this.provenanceJson,
    createdAt: createdAt ?? this.createdAt,
  );
  QuestionSnapshot copyWithCompanion(QuestionSnapshotsCompanion data) {
    return QuestionSnapshot(
      id: data.id.present ? data.id.value : this.id,
      questionId: data.questionId.present
          ? data.questionId.value
          : this.questionId,
      contentJson: data.contentJson.present
          ? data.contentJson.value
          : this.contentJson,
      answerJson: data.answerJson.present
          ? data.answerJson.value
          : this.answerJson,
      provenanceJson: data.provenanceJson.present
          ? data.provenanceJson.value
          : this.provenanceJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuestionSnapshot(')
          ..write('id: $id, ')
          ..write('questionId: $questionId, ')
          ..write('contentJson: $contentJson, ')
          ..write('answerJson: $answerJson, ')
          ..write('provenanceJson: $provenanceJson, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    questionId,
    contentJson,
    answerJson,
    provenanceJson,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestionSnapshot &&
          other.id == this.id &&
          other.questionId == this.questionId &&
          other.contentJson == this.contentJson &&
          other.answerJson == this.answerJson &&
          other.provenanceJson == this.provenanceJson &&
          other.createdAt == this.createdAt);
}

class QuestionSnapshotsCompanion extends UpdateCompanion<QuestionSnapshot> {
  final Value<String> id;
  final Value<String> questionId;
  final Value<String> contentJson;
  final Value<String> answerJson;
  final Value<String> provenanceJson;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const QuestionSnapshotsCompanion({
    this.id = const Value.absent(),
    this.questionId = const Value.absent(),
    this.contentJson = const Value.absent(),
    this.answerJson = const Value.absent(),
    this.provenanceJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuestionSnapshotsCompanion.insert({
    required String id,
    required String questionId,
    required String contentJson,
    required String answerJson,
    required String provenanceJson,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       questionId = Value(questionId),
       contentJson = Value(contentJson),
       answerJson = Value(answerJson),
       provenanceJson = Value(provenanceJson);
  static Insertable<QuestionSnapshot> custom({
    Expression<String>? id,
    Expression<String>? questionId,
    Expression<String>? contentJson,
    Expression<String>? answerJson,
    Expression<String>? provenanceJson,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (questionId != null) 'question_id': questionId,
      if (contentJson != null) 'content_json': contentJson,
      if (answerJson != null) 'answer_json': answerJson,
      if (provenanceJson != null) 'provenance_json': provenanceJson,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuestionSnapshotsCompanion copyWith({
    Value<String>? id,
    Value<String>? questionId,
    Value<String>? contentJson,
    Value<String>? answerJson,
    Value<String>? provenanceJson,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return QuestionSnapshotsCompanion(
      id: id ?? this.id,
      questionId: questionId ?? this.questionId,
      contentJson: contentJson ?? this.contentJson,
      answerJson: answerJson ?? this.answerJson,
      provenanceJson: provenanceJson ?? this.provenanceJson,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<String>(questionId.value);
    }
    if (contentJson.present) {
      map['content_json'] = Variable<String>(contentJson.value);
    }
    if (answerJson.present) {
      map['answer_json'] = Variable<String>(answerJson.value);
    }
    if (provenanceJson.present) {
      map['provenance_json'] = Variable<String>(provenanceJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionSnapshotsCompanion(')
          ..write('id: $id, ')
          ..write('questionId: $questionId, ')
          ..write('contentJson: $contentJson, ')
          ..write('answerJson: $answerJson, ')
          ..write('provenanceJson: $provenanceJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AssessmentsTable extends Assessments
    with TableInfo<$AssessmentsTable, Assessment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssessmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('draft'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _createdByDeviceIdMeta = const VerificationMeta(
    'createdByDeviceId',
  );
  @override
  late final GeneratedColumn<String> createdByDeviceId =
      GeneratedColumn<String>(
        'created_by_device_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('local'),
      );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    status,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assessments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Assessment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('created_by_device_id')) {
      context.handle(
        _createdByDeviceIdMeta,
        createdByDeviceId.isAcceptableOrUnknown(
          data['created_by_device_id']!,
          _createdByDeviceIdMeta,
        ),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Assessment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Assessment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      createdByDeviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_device_id'],
      )!,
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $AssessmentsTable createAlias(String alias) {
    return $AssessmentsTable(attachedDatabase, alias);
  }
}

class Assessment extends DataClass implements Insertable<Assessment> {
  final String id;
  final String title;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdByDeviceId;
  final int revision;
  final DateTime? deletedAt;
  const Assessment({
    required this.id,
    required this.title,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.createdByDeviceId,
    required this.revision,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['created_by_device_id'] = Variable<String>(createdByDeviceId);
    map['revision'] = Variable<int>(revision);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  AssessmentsCompanion toCompanion(bool nullToAbsent) {
    return AssessmentsCompanion(
      id: Value(id),
      title: Value(title),
      status: Value(status),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      createdByDeviceId: Value(createdByDeviceId),
      revision: Value(revision),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Assessment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Assessment(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      createdByDeviceId: serializer.fromJson<String>(json['createdByDeviceId']),
      revision: serializer.fromJson<int>(json['revision']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'createdByDeviceId': serializer.toJson<String>(createdByDeviceId),
      'revision': serializer.toJson<int>(revision),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Assessment copyWith({
    String? id,
    String? title,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdByDeviceId,
    int? revision,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => Assessment(
    id: id ?? this.id,
    title: title ?? this.title,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
    revision: revision ?? this.revision,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  Assessment copyWithCompanion(AssessmentsCompanion data) {
    return Assessment(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      createdByDeviceId: data.createdByDeviceId.present
          ? data.createdByDeviceId.value
          : this.createdByDeviceId,
      revision: data.revision.present ? data.revision.value : this.revision,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Assessment(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    status,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Assessment &&
          other.id == this.id &&
          other.title == this.title &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.createdByDeviceId == this.createdByDeviceId &&
          other.revision == this.revision &&
          other.deletedAt == this.deletedAt);
}

class AssessmentsCompanion extends UpdateCompanion<Assessment> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> createdByDeviceId;
  final Value<int> revision;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const AssessmentsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AssessmentsCompanion.insert({
    required String id,
    required String title,
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title);
  static Insertable<Assessment> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? createdByDeviceId,
    Expression<int>? revision,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdByDeviceId != null) 'created_by_device_id': createdByDeviceId,
      if (revision != null) 'revision': revision,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AssessmentsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? status,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? createdByDeviceId,
    Value<int>? revision,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return AssessmentsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
      revision: revision ?? this.revision,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (createdByDeviceId.present) {
      map['created_by_device_id'] = Variable<String>(createdByDeviceId.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AssessmentSnapshotsTable extends AssessmentSnapshots
    with TableInfo<$AssessmentSnapshotsTable, AssessmentSnapshot> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssessmentSnapshotsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _assessmentIdMeta = const VerificationMeta(
    'assessmentId',
  );
  @override
  late final GeneratedColumn<String> assessmentId = GeneratedColumn<String>(
    'assessment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES assessments (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, assessmentId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assessment_snapshots';
  @override
  VerificationContext validateIntegrity(
    Insertable<AssessmentSnapshot> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('assessment_id')) {
      context.handle(
        _assessmentIdMeta,
        assessmentId.isAcceptableOrUnknown(
          data['assessment_id']!,
          _assessmentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_assessmentIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AssessmentSnapshot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssessmentSnapshot(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      assessmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assessment_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AssessmentSnapshotsTable createAlias(String alias) {
    return $AssessmentSnapshotsTable(attachedDatabase, alias);
  }
}

class AssessmentSnapshot extends DataClass
    implements Insertable<AssessmentSnapshot> {
  final String id;
  final String assessmentId;
  final DateTime createdAt;
  const AssessmentSnapshot({
    required this.id,
    required this.assessmentId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['assessment_id'] = Variable<String>(assessmentId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AssessmentSnapshotsCompanion toCompanion(bool nullToAbsent) {
    return AssessmentSnapshotsCompanion(
      id: Value(id),
      assessmentId: Value(assessmentId),
      createdAt: Value(createdAt),
    );
  }

  factory AssessmentSnapshot.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssessmentSnapshot(
      id: serializer.fromJson<String>(json['id']),
      assessmentId: serializer.fromJson<String>(json['assessmentId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'assessmentId': serializer.toJson<String>(assessmentId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AssessmentSnapshot copyWith({
    String? id,
    String? assessmentId,
    DateTime? createdAt,
  }) => AssessmentSnapshot(
    id: id ?? this.id,
    assessmentId: assessmentId ?? this.assessmentId,
    createdAt: createdAt ?? this.createdAt,
  );
  AssessmentSnapshot copyWithCompanion(AssessmentSnapshotsCompanion data) {
    return AssessmentSnapshot(
      id: data.id.present ? data.id.value : this.id,
      assessmentId: data.assessmentId.present
          ? data.assessmentId.value
          : this.assessmentId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentSnapshot(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, assessmentId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssessmentSnapshot &&
          other.id == this.id &&
          other.assessmentId == this.assessmentId &&
          other.createdAt == this.createdAt);
}

class AssessmentSnapshotsCompanion extends UpdateCompanion<AssessmentSnapshot> {
  final Value<String> id;
  final Value<String> assessmentId;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AssessmentSnapshotsCompanion({
    this.id = const Value.absent(),
    this.assessmentId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AssessmentSnapshotsCompanion.insert({
    required String id,
    required String assessmentId,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       assessmentId = Value(assessmentId);
  static Insertable<AssessmentSnapshot> custom({
    Expression<String>? id,
    Expression<String>? assessmentId,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (assessmentId != null) 'assessment_id': assessmentId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AssessmentSnapshotsCompanion copyWith({
    Value<String>? id,
    Value<String>? assessmentId,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return AssessmentSnapshotsCompanion(
      id: id ?? this.id,
      assessmentId: assessmentId ?? this.assessmentId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (assessmentId.present) {
      map['assessment_id'] = Variable<String>(assessmentId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentSnapshotsCompanion(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AssessmentItemsTable extends AssessmentItems
    with TableInfo<$AssessmentItemsTable, AssessmentItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssessmentItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _assessmentSnapshotIdMeta =
      const VerificationMeta('assessmentSnapshotId');
  @override
  late final GeneratedColumn<String> assessmentSnapshotId =
      GeneratedColumn<String>(
        'assessment_snapshot_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES assessment_snapshots (id)',
        ),
      );
  static const VerificationMeta _questionSnapshotIdMeta =
      const VerificationMeta('questionSnapshotId');
  @override
  late final GeneratedColumn<String> questionSnapshotId =
      GeneratedColumn<String>(
        'question_snapshot_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES question_snapshots (id)',
        ),
      );
  static const VerificationMeta _sequenceMeta = const VerificationMeta(
    'sequence',
  );
  @override
  late final GeneratedColumn<int> sequence = GeneratedColumn<int>(
    'sequence',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    assessmentSnapshotId,
    questionSnapshotId,
    sequence,
    weight,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assessment_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<AssessmentItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('assessment_snapshot_id')) {
      context.handle(
        _assessmentSnapshotIdMeta,
        assessmentSnapshotId.isAcceptableOrUnknown(
          data['assessment_snapshot_id']!,
          _assessmentSnapshotIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_assessmentSnapshotIdMeta);
    }
    if (data.containsKey('question_snapshot_id')) {
      context.handle(
        _questionSnapshotIdMeta,
        questionSnapshotId.isAcceptableOrUnknown(
          data['question_snapshot_id']!,
          _questionSnapshotIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_questionSnapshotIdMeta);
    }
    if (data.containsKey('sequence')) {
      context.handle(
        _sequenceMeta,
        sequence.isAcceptableOrUnknown(data['sequence']!, _sequenceMeta),
      );
    } else if (isInserting) {
      context.missing(_sequenceMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AssessmentItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssessmentItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      assessmentSnapshotId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assessment_snapshot_id'],
      )!,
      questionSnapshotId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question_snapshot_id'],
      )!,
      sequence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sequence'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AssessmentItemsTable createAlias(String alias) {
    return $AssessmentItemsTable(attachedDatabase, alias);
  }
}

class AssessmentItem extends DataClass implements Insertable<AssessmentItem> {
  final String id;
  final String assessmentSnapshotId;
  final String questionSnapshotId;
  final int sequence;
  final double weight;
  final DateTime createdAt;
  const AssessmentItem({
    required this.id,
    required this.assessmentSnapshotId,
    required this.questionSnapshotId,
    required this.sequence,
    required this.weight,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['assessment_snapshot_id'] = Variable<String>(assessmentSnapshotId);
    map['question_snapshot_id'] = Variable<String>(questionSnapshotId);
    map['sequence'] = Variable<int>(sequence);
    map['weight'] = Variable<double>(weight);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AssessmentItemsCompanion toCompanion(bool nullToAbsent) {
    return AssessmentItemsCompanion(
      id: Value(id),
      assessmentSnapshotId: Value(assessmentSnapshotId),
      questionSnapshotId: Value(questionSnapshotId),
      sequence: Value(sequence),
      weight: Value(weight),
      createdAt: Value(createdAt),
    );
  }

  factory AssessmentItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssessmentItem(
      id: serializer.fromJson<String>(json['id']),
      assessmentSnapshotId: serializer.fromJson<String>(
        json['assessmentSnapshotId'],
      ),
      questionSnapshotId: serializer.fromJson<String>(
        json['questionSnapshotId'],
      ),
      sequence: serializer.fromJson<int>(json['sequence']),
      weight: serializer.fromJson<double>(json['weight']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'assessmentSnapshotId': serializer.toJson<String>(assessmentSnapshotId),
      'questionSnapshotId': serializer.toJson<String>(questionSnapshotId),
      'sequence': serializer.toJson<int>(sequence),
      'weight': serializer.toJson<double>(weight),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AssessmentItem copyWith({
    String? id,
    String? assessmentSnapshotId,
    String? questionSnapshotId,
    int? sequence,
    double? weight,
    DateTime? createdAt,
  }) => AssessmentItem(
    id: id ?? this.id,
    assessmentSnapshotId: assessmentSnapshotId ?? this.assessmentSnapshotId,
    questionSnapshotId: questionSnapshotId ?? this.questionSnapshotId,
    sequence: sequence ?? this.sequence,
    weight: weight ?? this.weight,
    createdAt: createdAt ?? this.createdAt,
  );
  AssessmentItem copyWithCompanion(AssessmentItemsCompanion data) {
    return AssessmentItem(
      id: data.id.present ? data.id.value : this.id,
      assessmentSnapshotId: data.assessmentSnapshotId.present
          ? data.assessmentSnapshotId.value
          : this.assessmentSnapshotId,
      questionSnapshotId: data.questionSnapshotId.present
          ? data.questionSnapshotId.value
          : this.questionSnapshotId,
      sequence: data.sequence.present ? data.sequence.value : this.sequence,
      weight: data.weight.present ? data.weight.value : this.weight,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentItem(')
          ..write('id: $id, ')
          ..write('assessmentSnapshotId: $assessmentSnapshotId, ')
          ..write('questionSnapshotId: $questionSnapshotId, ')
          ..write('sequence: $sequence, ')
          ..write('weight: $weight, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    assessmentSnapshotId,
    questionSnapshotId,
    sequence,
    weight,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssessmentItem &&
          other.id == this.id &&
          other.assessmentSnapshotId == this.assessmentSnapshotId &&
          other.questionSnapshotId == this.questionSnapshotId &&
          other.sequence == this.sequence &&
          other.weight == this.weight &&
          other.createdAt == this.createdAt);
}

class AssessmentItemsCompanion extends UpdateCompanion<AssessmentItem> {
  final Value<String> id;
  final Value<String> assessmentSnapshotId;
  final Value<String> questionSnapshotId;
  final Value<int> sequence;
  final Value<double> weight;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AssessmentItemsCompanion({
    this.id = const Value.absent(),
    this.assessmentSnapshotId = const Value.absent(),
    this.questionSnapshotId = const Value.absent(),
    this.sequence = const Value.absent(),
    this.weight = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AssessmentItemsCompanion.insert({
    required String id,
    required String assessmentSnapshotId,
    required String questionSnapshotId,
    required int sequence,
    this.weight = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       assessmentSnapshotId = Value(assessmentSnapshotId),
       questionSnapshotId = Value(questionSnapshotId),
       sequence = Value(sequence);
  static Insertable<AssessmentItem> custom({
    Expression<String>? id,
    Expression<String>? assessmentSnapshotId,
    Expression<String>? questionSnapshotId,
    Expression<int>? sequence,
    Expression<double>? weight,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (assessmentSnapshotId != null)
        'assessment_snapshot_id': assessmentSnapshotId,
      if (questionSnapshotId != null)
        'question_snapshot_id': questionSnapshotId,
      if (sequence != null) 'sequence': sequence,
      if (weight != null) 'weight': weight,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AssessmentItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? assessmentSnapshotId,
    Value<String>? questionSnapshotId,
    Value<int>? sequence,
    Value<double>? weight,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return AssessmentItemsCompanion(
      id: id ?? this.id,
      assessmentSnapshotId: assessmentSnapshotId ?? this.assessmentSnapshotId,
      questionSnapshotId: questionSnapshotId ?? this.questionSnapshotId,
      sequence: sequence ?? this.sequence,
      weight: weight ?? this.weight,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (assessmentSnapshotId.present) {
      map['assessment_snapshot_id'] = Variable<String>(
        assessmentSnapshotId.value,
      );
    }
    if (questionSnapshotId.present) {
      map['question_snapshot_id'] = Variable<String>(questionSnapshotId.value);
    }
    if (sequence.present) {
      map['sequence'] = Variable<int>(sequence.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentItemsCompanion(')
          ..write('id: $id, ')
          ..write('assessmentSnapshotId: $assessmentSnapshotId, ')
          ..write('questionSnapshotId: $questionSnapshotId, ')
          ..write('sequence: $sequence, ')
          ..write('weight: $weight, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StudentAttemptsTable extends StudentAttempts
    with TableInfo<$StudentAttemptsTable, StudentAttempt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentAttemptsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _studentIdMeta = const VerificationMeta(
    'studentId',
  );
  @override
  late final GeneratedColumn<String> studentId = GeneratedColumn<String>(
    'student_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES students (id)',
    ),
  );
  static const VerificationMeta _assessmentSnapshotIdMeta =
      const VerificationMeta('assessmentSnapshotId');
  @override
  late final GeneratedColumn<String> assessmentSnapshotId =
      GeneratedColumn<String>(
        'assessment_snapshot_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES assessment_snapshots (id)',
        ),
      );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _actorTypeMeta = const VerificationMeta(
    'actorType',
  );
  @override
  late final GeneratedColumn<String> actorType = GeneratedColumn<String>(
    'actor_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('teacher-recorded'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _createdByDeviceIdMeta = const VerificationMeta(
    'createdByDeviceId',
  );
  @override
  late final GeneratedColumn<String> createdByDeviceId =
      GeneratedColumn<String>(
        'created_by_device_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('local'),
      );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    studentId,
    assessmentSnapshotId,
    startedAt,
    completedAt,
    actorType,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'student_attempts';
  @override
  VerificationContext validateIntegrity(
    Insertable<StudentAttempt> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('student_id')) {
      context.handle(
        _studentIdMeta,
        studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('assessment_snapshot_id')) {
      context.handle(
        _assessmentSnapshotIdMeta,
        assessmentSnapshotId.isAcceptableOrUnknown(
          data['assessment_snapshot_id']!,
          _assessmentSnapshotIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_assessmentSnapshotIdMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('actor_type')) {
      context.handle(
        _actorTypeMeta,
        actorType.isAcceptableOrUnknown(data['actor_type']!, _actorTypeMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('created_by_device_id')) {
      context.handle(
        _createdByDeviceIdMeta,
        createdByDeviceId.isAcceptableOrUnknown(
          data['created_by_device_id']!,
          _createdByDeviceIdMeta,
        ),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudentAttempt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudentAttempt(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      studentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}student_id'],
      )!,
      assessmentSnapshotId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assessment_snapshot_id'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      actorType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}actor_type'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      createdByDeviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_device_id'],
      )!,
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $StudentAttemptsTable createAlias(String alias) {
    return $StudentAttemptsTable(attachedDatabase, alias);
  }
}

class StudentAttempt extends DataClass implements Insertable<StudentAttempt> {
  final String id;
  final String studentId;
  final String assessmentSnapshotId;
  final DateTime startedAt;
  final DateTime? completedAt;
  final String actorType;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdByDeviceId;
  final int revision;
  final DateTime? deletedAt;
  const StudentAttempt({
    required this.id,
    required this.studentId,
    required this.assessmentSnapshotId,
    required this.startedAt,
    this.completedAt,
    required this.actorType,
    required this.createdAt,
    required this.updatedAt,
    required this.createdByDeviceId,
    required this.revision,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['student_id'] = Variable<String>(studentId);
    map['assessment_snapshot_id'] = Variable<String>(assessmentSnapshotId);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['actor_type'] = Variable<String>(actorType);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['created_by_device_id'] = Variable<String>(createdByDeviceId);
    map['revision'] = Variable<int>(revision);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  StudentAttemptsCompanion toCompanion(bool nullToAbsent) {
    return StudentAttemptsCompanion(
      id: Value(id),
      studentId: Value(studentId),
      assessmentSnapshotId: Value(assessmentSnapshotId),
      startedAt: Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      actorType: Value(actorType),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      createdByDeviceId: Value(createdByDeviceId),
      revision: Value(revision),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory StudentAttempt.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudentAttempt(
      id: serializer.fromJson<String>(json['id']),
      studentId: serializer.fromJson<String>(json['studentId']),
      assessmentSnapshotId: serializer.fromJson<String>(
        json['assessmentSnapshotId'],
      ),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      actorType: serializer.fromJson<String>(json['actorType']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      createdByDeviceId: serializer.fromJson<String>(json['createdByDeviceId']),
      revision: serializer.fromJson<int>(json['revision']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'studentId': serializer.toJson<String>(studentId),
      'assessmentSnapshotId': serializer.toJson<String>(assessmentSnapshotId),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'actorType': serializer.toJson<String>(actorType),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'createdByDeviceId': serializer.toJson<String>(createdByDeviceId),
      'revision': serializer.toJson<int>(revision),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  StudentAttempt copyWith({
    String? id,
    String? studentId,
    String? assessmentSnapshotId,
    DateTime? startedAt,
    Value<DateTime?> completedAt = const Value.absent(),
    String? actorType,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdByDeviceId,
    int? revision,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => StudentAttempt(
    id: id ?? this.id,
    studentId: studentId ?? this.studentId,
    assessmentSnapshotId: assessmentSnapshotId ?? this.assessmentSnapshotId,
    startedAt: startedAt ?? this.startedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    actorType: actorType ?? this.actorType,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
    revision: revision ?? this.revision,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  StudentAttempt copyWithCompanion(StudentAttemptsCompanion data) {
    return StudentAttempt(
      id: data.id.present ? data.id.value : this.id,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      assessmentSnapshotId: data.assessmentSnapshotId.present
          ? data.assessmentSnapshotId.value
          : this.assessmentSnapshotId,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      actorType: data.actorType.present ? data.actorType.value : this.actorType,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      createdByDeviceId: data.createdByDeviceId.present
          ? data.createdByDeviceId.value
          : this.createdByDeviceId,
      revision: data.revision.present ? data.revision.value : this.revision,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudentAttempt(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('assessmentSnapshotId: $assessmentSnapshotId, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('actorType: $actorType, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    studentId,
    assessmentSnapshotId,
    startedAt,
    completedAt,
    actorType,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudentAttempt &&
          other.id == this.id &&
          other.studentId == this.studentId &&
          other.assessmentSnapshotId == this.assessmentSnapshotId &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.actorType == this.actorType &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.createdByDeviceId == this.createdByDeviceId &&
          other.revision == this.revision &&
          other.deletedAt == this.deletedAt);
}

class StudentAttemptsCompanion extends UpdateCompanion<StudentAttempt> {
  final Value<String> id;
  final Value<String> studentId;
  final Value<String> assessmentSnapshotId;
  final Value<DateTime> startedAt;
  final Value<DateTime?> completedAt;
  final Value<String> actorType;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> createdByDeviceId;
  final Value<int> revision;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const StudentAttemptsCompanion({
    this.id = const Value.absent(),
    this.studentId = const Value.absent(),
    this.assessmentSnapshotId = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.actorType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudentAttemptsCompanion.insert({
    required String id,
    required String studentId,
    required String assessmentSnapshotId,
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.actorType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       studentId = Value(studentId),
       assessmentSnapshotId = Value(assessmentSnapshotId);
  static Insertable<StudentAttempt> custom({
    Expression<String>? id,
    Expression<String>? studentId,
    Expression<String>? assessmentSnapshotId,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<String>? actorType,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? createdByDeviceId,
    Expression<int>? revision,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (studentId != null) 'student_id': studentId,
      if (assessmentSnapshotId != null)
        'assessment_snapshot_id': assessmentSnapshotId,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (actorType != null) 'actor_type': actorType,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdByDeviceId != null) 'created_by_device_id': createdByDeviceId,
      if (revision != null) 'revision': revision,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudentAttemptsCompanion copyWith({
    Value<String>? id,
    Value<String>? studentId,
    Value<String>? assessmentSnapshotId,
    Value<DateTime>? startedAt,
    Value<DateTime?>? completedAt,
    Value<String>? actorType,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? createdByDeviceId,
    Value<int>? revision,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return StudentAttemptsCompanion(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      assessmentSnapshotId: assessmentSnapshotId ?? this.assessmentSnapshotId,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      actorType: actorType ?? this.actorType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
      revision: revision ?? this.revision,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<String>(studentId.value);
    }
    if (assessmentSnapshotId.present) {
      map['assessment_snapshot_id'] = Variable<String>(
        assessmentSnapshotId.value,
      );
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (actorType.present) {
      map['actor_type'] = Variable<String>(actorType.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (createdByDeviceId.present) {
      map['created_by_device_id'] = Variable<String>(createdByDeviceId.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentAttemptsCompanion(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('assessmentSnapshotId: $assessmentSnapshotId, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('actorType: $actorType, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StudentAnswersTable extends StudentAnswers
    with TableInfo<$StudentAnswersTable, StudentAnswer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentAnswersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _attemptIdMeta = const VerificationMeta(
    'attemptId',
  );
  @override
  late final GeneratedColumn<String> attemptId = GeneratedColumn<String>(
    'attempt_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES student_attempts (id)',
    ),
  );
  static const VerificationMeta _questionSnapshotIdMeta =
      const VerificationMeta('questionSnapshotId');
  @override
  late final GeneratedColumn<String> questionSnapshotId =
      GeneratedColumn<String>(
        'question_snapshot_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES question_snapshots (id)',
        ),
      );
  static const VerificationMeta _answerJsonMeta = const VerificationMeta(
    'answerJson',
  );
  @override
  late final GeneratedColumn<String> answerJson = GeneratedColumn<String>(
    'answer_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCorrectMeta = const VerificationMeta(
    'isCorrect',
  );
  @override
  late final GeneratedColumn<bool> isCorrect = GeneratedColumn<bool>(
    'is_correct',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_correct" IN (0, 1))',
    ),
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<double> score = GeneratedColumn<double>(
    'score',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _createdByDeviceIdMeta = const VerificationMeta(
    'createdByDeviceId',
  );
  @override
  late final GeneratedColumn<String> createdByDeviceId =
      GeneratedColumn<String>(
        'created_by_device_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('local'),
      );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    attemptId,
    questionSnapshotId,
    answerJson,
    isCorrect,
    score,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'student_answers';
  @override
  VerificationContext validateIntegrity(
    Insertable<StudentAnswer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('attempt_id')) {
      context.handle(
        _attemptIdMeta,
        attemptId.isAcceptableOrUnknown(data['attempt_id']!, _attemptIdMeta),
      );
    } else if (isInserting) {
      context.missing(_attemptIdMeta);
    }
    if (data.containsKey('question_snapshot_id')) {
      context.handle(
        _questionSnapshotIdMeta,
        questionSnapshotId.isAcceptableOrUnknown(
          data['question_snapshot_id']!,
          _questionSnapshotIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_questionSnapshotIdMeta);
    }
    if (data.containsKey('answer_json')) {
      context.handle(
        _answerJsonMeta,
        answerJson.isAcceptableOrUnknown(data['answer_json']!, _answerJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_answerJsonMeta);
    }
    if (data.containsKey('is_correct')) {
      context.handle(
        _isCorrectMeta,
        isCorrect.isAcceptableOrUnknown(data['is_correct']!, _isCorrectMeta),
      );
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('created_by_device_id')) {
      context.handle(
        _createdByDeviceIdMeta,
        createdByDeviceId.isAcceptableOrUnknown(
          data['created_by_device_id']!,
          _createdByDeviceIdMeta,
        ),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudentAnswer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudentAnswer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      attemptId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}attempt_id'],
      )!,
      questionSnapshotId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question_snapshot_id'],
      )!,
      answerJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}answer_json'],
      )!,
      isCorrect: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_correct'],
      ),
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}score'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      createdByDeviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_device_id'],
      )!,
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $StudentAnswersTable createAlias(String alias) {
    return $StudentAnswersTable(attachedDatabase, alias);
  }
}

class StudentAnswer extends DataClass implements Insertable<StudentAnswer> {
  final String id;
  final String attemptId;
  final String questionSnapshotId;
  final String answerJson;
  final bool? isCorrect;
  final double? score;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdByDeviceId;
  final int revision;
  final DateTime? deletedAt;
  const StudentAnswer({
    required this.id,
    required this.attemptId,
    required this.questionSnapshotId,
    required this.answerJson,
    this.isCorrect,
    this.score,
    required this.createdAt,
    required this.updatedAt,
    required this.createdByDeviceId,
    required this.revision,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['attempt_id'] = Variable<String>(attemptId);
    map['question_snapshot_id'] = Variable<String>(questionSnapshotId);
    map['answer_json'] = Variable<String>(answerJson);
    if (!nullToAbsent || isCorrect != null) {
      map['is_correct'] = Variable<bool>(isCorrect);
    }
    if (!nullToAbsent || score != null) {
      map['score'] = Variable<double>(score);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['created_by_device_id'] = Variable<String>(createdByDeviceId);
    map['revision'] = Variable<int>(revision);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  StudentAnswersCompanion toCompanion(bool nullToAbsent) {
    return StudentAnswersCompanion(
      id: Value(id),
      attemptId: Value(attemptId),
      questionSnapshotId: Value(questionSnapshotId),
      answerJson: Value(answerJson),
      isCorrect: isCorrect == null && nullToAbsent
          ? const Value.absent()
          : Value(isCorrect),
      score: score == null && nullToAbsent
          ? const Value.absent()
          : Value(score),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      createdByDeviceId: Value(createdByDeviceId),
      revision: Value(revision),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory StudentAnswer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudentAnswer(
      id: serializer.fromJson<String>(json['id']),
      attemptId: serializer.fromJson<String>(json['attemptId']),
      questionSnapshotId: serializer.fromJson<String>(
        json['questionSnapshotId'],
      ),
      answerJson: serializer.fromJson<String>(json['answerJson']),
      isCorrect: serializer.fromJson<bool?>(json['isCorrect']),
      score: serializer.fromJson<double?>(json['score']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      createdByDeviceId: serializer.fromJson<String>(json['createdByDeviceId']),
      revision: serializer.fromJson<int>(json['revision']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'attemptId': serializer.toJson<String>(attemptId),
      'questionSnapshotId': serializer.toJson<String>(questionSnapshotId),
      'answerJson': serializer.toJson<String>(answerJson),
      'isCorrect': serializer.toJson<bool?>(isCorrect),
      'score': serializer.toJson<double?>(score),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'createdByDeviceId': serializer.toJson<String>(createdByDeviceId),
      'revision': serializer.toJson<int>(revision),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  StudentAnswer copyWith({
    String? id,
    String? attemptId,
    String? questionSnapshotId,
    String? answerJson,
    Value<bool?> isCorrect = const Value.absent(),
    Value<double?> score = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdByDeviceId,
    int? revision,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => StudentAnswer(
    id: id ?? this.id,
    attemptId: attemptId ?? this.attemptId,
    questionSnapshotId: questionSnapshotId ?? this.questionSnapshotId,
    answerJson: answerJson ?? this.answerJson,
    isCorrect: isCorrect.present ? isCorrect.value : this.isCorrect,
    score: score.present ? score.value : this.score,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
    revision: revision ?? this.revision,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  StudentAnswer copyWithCompanion(StudentAnswersCompanion data) {
    return StudentAnswer(
      id: data.id.present ? data.id.value : this.id,
      attemptId: data.attemptId.present ? data.attemptId.value : this.attemptId,
      questionSnapshotId: data.questionSnapshotId.present
          ? data.questionSnapshotId.value
          : this.questionSnapshotId,
      answerJson: data.answerJson.present
          ? data.answerJson.value
          : this.answerJson,
      isCorrect: data.isCorrect.present ? data.isCorrect.value : this.isCorrect,
      score: data.score.present ? data.score.value : this.score,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      createdByDeviceId: data.createdByDeviceId.present
          ? data.createdByDeviceId.value
          : this.createdByDeviceId,
      revision: data.revision.present ? data.revision.value : this.revision,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudentAnswer(')
          ..write('id: $id, ')
          ..write('attemptId: $attemptId, ')
          ..write('questionSnapshotId: $questionSnapshotId, ')
          ..write('answerJson: $answerJson, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('score: $score, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    attemptId,
    questionSnapshotId,
    answerJson,
    isCorrect,
    score,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudentAnswer &&
          other.id == this.id &&
          other.attemptId == this.attemptId &&
          other.questionSnapshotId == this.questionSnapshotId &&
          other.answerJson == this.answerJson &&
          other.isCorrect == this.isCorrect &&
          other.score == this.score &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.createdByDeviceId == this.createdByDeviceId &&
          other.revision == this.revision &&
          other.deletedAt == this.deletedAt);
}

class StudentAnswersCompanion extends UpdateCompanion<StudentAnswer> {
  final Value<String> id;
  final Value<String> attemptId;
  final Value<String> questionSnapshotId;
  final Value<String> answerJson;
  final Value<bool?> isCorrect;
  final Value<double?> score;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> createdByDeviceId;
  final Value<int> revision;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const StudentAnswersCompanion({
    this.id = const Value.absent(),
    this.attemptId = const Value.absent(),
    this.questionSnapshotId = const Value.absent(),
    this.answerJson = const Value.absent(),
    this.isCorrect = const Value.absent(),
    this.score = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudentAnswersCompanion.insert({
    required String id,
    required String attemptId,
    required String questionSnapshotId,
    required String answerJson,
    this.isCorrect = const Value.absent(),
    this.score = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       attemptId = Value(attemptId),
       questionSnapshotId = Value(questionSnapshotId),
       answerJson = Value(answerJson);
  static Insertable<StudentAnswer> custom({
    Expression<String>? id,
    Expression<String>? attemptId,
    Expression<String>? questionSnapshotId,
    Expression<String>? answerJson,
    Expression<bool>? isCorrect,
    Expression<double>? score,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? createdByDeviceId,
    Expression<int>? revision,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (attemptId != null) 'attempt_id': attemptId,
      if (questionSnapshotId != null)
        'question_snapshot_id': questionSnapshotId,
      if (answerJson != null) 'answer_json': answerJson,
      if (isCorrect != null) 'is_correct': isCorrect,
      if (score != null) 'score': score,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdByDeviceId != null) 'created_by_device_id': createdByDeviceId,
      if (revision != null) 'revision': revision,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudentAnswersCompanion copyWith({
    Value<String>? id,
    Value<String>? attemptId,
    Value<String>? questionSnapshotId,
    Value<String>? answerJson,
    Value<bool?>? isCorrect,
    Value<double?>? score,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? createdByDeviceId,
    Value<int>? revision,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return StudentAnswersCompanion(
      id: id ?? this.id,
      attemptId: attemptId ?? this.attemptId,
      questionSnapshotId: questionSnapshotId ?? this.questionSnapshotId,
      answerJson: answerJson ?? this.answerJson,
      isCorrect: isCorrect ?? this.isCorrect,
      score: score ?? this.score,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
      revision: revision ?? this.revision,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (attemptId.present) {
      map['attempt_id'] = Variable<String>(attemptId.value);
    }
    if (questionSnapshotId.present) {
      map['question_snapshot_id'] = Variable<String>(questionSnapshotId.value);
    }
    if (answerJson.present) {
      map['answer_json'] = Variable<String>(answerJson.value);
    }
    if (isCorrect.present) {
      map['is_correct'] = Variable<bool>(isCorrect.value);
    }
    if (score.present) {
      map['score'] = Variable<double>(score.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (createdByDeviceId.present) {
      map['created_by_device_id'] = Variable<String>(createdByDeviceId.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentAnswersCompanion(')
          ..write('id: $id, ')
          ..write('attemptId: $attemptId, ')
          ..write('questionSnapshotId: $questionSnapshotId, ')
          ..write('answerJson: $answerJson, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('score: $score, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MasteryRecordsTable extends MasteryRecords
    with TableInfo<$MasteryRecordsTable, MasteryRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MasteryRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _studentIdMeta = const VerificationMeta(
    'studentId',
  );
  @override
  late final GeneratedColumn<String> studentId = GeneratedColumn<String>(
    'student_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES students (id)',
    ),
  );
  static const VerificationMeta _competencyIdMeta = const VerificationMeta(
    'competencyId',
  );
  @override
  late final GeneratedColumn<String> competencyId = GeneratedColumn<String>(
    'competency_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES competencies (id)',
    ),
  );
  static const VerificationMeta _masteryLevelMeta = const VerificationMeta(
    'masteryLevel',
  );
  @override
  late final GeneratedColumn<String> masteryLevel = GeneratedColumn<String>(
    'mastery_level',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastUpdatedMeta = const VerificationMeta(
    'lastUpdated',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
    'last_updated',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _createdByDeviceIdMeta = const VerificationMeta(
    'createdByDeviceId',
  );
  @override
  late final GeneratedColumn<String> createdByDeviceId =
      GeneratedColumn<String>(
        'created_by_device_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('local'),
      );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    studentId,
    competencyId,
    masteryLevel,
    lastUpdated,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mastery_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<MasteryRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('student_id')) {
      context.handle(
        _studentIdMeta,
        studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('competency_id')) {
      context.handle(
        _competencyIdMeta,
        competencyId.isAcceptableOrUnknown(
          data['competency_id']!,
          _competencyIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_competencyIdMeta);
    }
    if (data.containsKey('mastery_level')) {
      context.handle(
        _masteryLevelMeta,
        masteryLevel.isAcceptableOrUnknown(
          data['mastery_level']!,
          _masteryLevelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_masteryLevelMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
        _lastUpdatedMeta,
        lastUpdated.isAcceptableOrUnknown(
          data['last_updated']!,
          _lastUpdatedMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('created_by_device_id')) {
      context.handle(
        _createdByDeviceIdMeta,
        createdByDeviceId.isAcceptableOrUnknown(
          data['created_by_device_id']!,
          _createdByDeviceIdMeta,
        ),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MasteryRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MasteryRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      studentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}student_id'],
      )!,
      competencyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}competency_id'],
      )!,
      masteryLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mastery_level'],
      )!,
      lastUpdated: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      createdByDeviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_device_id'],
      )!,
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $MasteryRecordsTable createAlias(String alias) {
    return $MasteryRecordsTable(attachedDatabase, alias);
  }
}

class MasteryRecord extends DataClass implements Insertable<MasteryRecord> {
  final String id;
  final String studentId;
  final String competencyId;
  final String masteryLevel;
  final DateTime lastUpdated;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdByDeviceId;
  final int revision;
  final DateTime? deletedAt;
  const MasteryRecord({
    required this.id,
    required this.studentId,
    required this.competencyId,
    required this.masteryLevel,
    required this.lastUpdated,
    required this.createdAt,
    required this.updatedAt,
    required this.createdByDeviceId,
    required this.revision,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['student_id'] = Variable<String>(studentId);
    map['competency_id'] = Variable<String>(competencyId);
    map['mastery_level'] = Variable<String>(masteryLevel);
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['created_by_device_id'] = Variable<String>(createdByDeviceId);
    map['revision'] = Variable<int>(revision);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  MasteryRecordsCompanion toCompanion(bool nullToAbsent) {
    return MasteryRecordsCompanion(
      id: Value(id),
      studentId: Value(studentId),
      competencyId: Value(competencyId),
      masteryLevel: Value(masteryLevel),
      lastUpdated: Value(lastUpdated),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      createdByDeviceId: Value(createdByDeviceId),
      revision: Value(revision),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory MasteryRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MasteryRecord(
      id: serializer.fromJson<String>(json['id']),
      studentId: serializer.fromJson<String>(json['studentId']),
      competencyId: serializer.fromJson<String>(json['competencyId']),
      masteryLevel: serializer.fromJson<String>(json['masteryLevel']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      createdByDeviceId: serializer.fromJson<String>(json['createdByDeviceId']),
      revision: serializer.fromJson<int>(json['revision']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'studentId': serializer.toJson<String>(studentId),
      'competencyId': serializer.toJson<String>(competencyId),
      'masteryLevel': serializer.toJson<String>(masteryLevel),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'createdByDeviceId': serializer.toJson<String>(createdByDeviceId),
      'revision': serializer.toJson<int>(revision),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  MasteryRecord copyWith({
    String? id,
    String? studentId,
    String? competencyId,
    String? masteryLevel,
    DateTime? lastUpdated,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdByDeviceId,
    int? revision,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => MasteryRecord(
    id: id ?? this.id,
    studentId: studentId ?? this.studentId,
    competencyId: competencyId ?? this.competencyId,
    masteryLevel: masteryLevel ?? this.masteryLevel,
    lastUpdated: lastUpdated ?? this.lastUpdated,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
    revision: revision ?? this.revision,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  MasteryRecord copyWithCompanion(MasteryRecordsCompanion data) {
    return MasteryRecord(
      id: data.id.present ? data.id.value : this.id,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      competencyId: data.competencyId.present
          ? data.competencyId.value
          : this.competencyId,
      masteryLevel: data.masteryLevel.present
          ? data.masteryLevel.value
          : this.masteryLevel,
      lastUpdated: data.lastUpdated.present
          ? data.lastUpdated.value
          : this.lastUpdated,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      createdByDeviceId: data.createdByDeviceId.present
          ? data.createdByDeviceId.value
          : this.createdByDeviceId,
      revision: data.revision.present ? data.revision.value : this.revision,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MasteryRecord(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('competencyId: $competencyId, ')
          ..write('masteryLevel: $masteryLevel, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    studentId,
    competencyId,
    masteryLevel,
    lastUpdated,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MasteryRecord &&
          other.id == this.id &&
          other.studentId == this.studentId &&
          other.competencyId == this.competencyId &&
          other.masteryLevel == this.masteryLevel &&
          other.lastUpdated == this.lastUpdated &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.createdByDeviceId == this.createdByDeviceId &&
          other.revision == this.revision &&
          other.deletedAt == this.deletedAt);
}

class MasteryRecordsCompanion extends UpdateCompanion<MasteryRecord> {
  final Value<String> id;
  final Value<String> studentId;
  final Value<String> competencyId;
  final Value<String> masteryLevel;
  final Value<DateTime> lastUpdated;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> createdByDeviceId;
  final Value<int> revision;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const MasteryRecordsCompanion({
    this.id = const Value.absent(),
    this.studentId = const Value.absent(),
    this.competencyId = const Value.absent(),
    this.masteryLevel = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MasteryRecordsCompanion.insert({
    required String id,
    required String studentId,
    required String competencyId,
    required String masteryLevel,
    this.lastUpdated = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       studentId = Value(studentId),
       competencyId = Value(competencyId),
       masteryLevel = Value(masteryLevel);
  static Insertable<MasteryRecord> custom({
    Expression<String>? id,
    Expression<String>? studentId,
    Expression<String>? competencyId,
    Expression<String>? masteryLevel,
    Expression<DateTime>? lastUpdated,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? createdByDeviceId,
    Expression<int>? revision,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (studentId != null) 'student_id': studentId,
      if (competencyId != null) 'competency_id': competencyId,
      if (masteryLevel != null) 'mastery_level': masteryLevel,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdByDeviceId != null) 'created_by_device_id': createdByDeviceId,
      if (revision != null) 'revision': revision,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MasteryRecordsCompanion copyWith({
    Value<String>? id,
    Value<String>? studentId,
    Value<String>? competencyId,
    Value<String>? masteryLevel,
    Value<DateTime>? lastUpdated,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? createdByDeviceId,
    Value<int>? revision,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return MasteryRecordsCompanion(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      competencyId: competencyId ?? this.competencyId,
      masteryLevel: masteryLevel ?? this.masteryLevel,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
      revision: revision ?? this.revision,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<String>(studentId.value);
    }
    if (competencyId.present) {
      map['competency_id'] = Variable<String>(competencyId.value);
    }
    if (masteryLevel.present) {
      map['mastery_level'] = Variable<String>(masteryLevel.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (createdByDeviceId.present) {
      map['created_by_device_id'] = Variable<String>(createdByDeviceId.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MasteryRecordsCompanion(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('competencyId: $competencyId, ')
          ..write('masteryLevel: $masteryLevel, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncEventsTable extends SyncEvents
    with TableInfo<$SyncEventsTable, SyncEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _operationMeta = const VerificationMeta(
    'operation',
  );
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
    'operation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _baseRevisionMeta = const VerificationMeta(
    'baseRevision',
  );
  @override
  late final GeneratedColumn<int> baseRevision = GeneratedColumn<int>(
    'base_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _newRevisionMeta = const VerificationMeta(
    'newRevision',
  );
  @override
  late final GeneratedColumn<int> newRevision = GeneratedColumn<int>(
    'new_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadJsonMeta = const VerificationMeta(
    'payloadJson',
  );
  @override
  late final GeneratedColumn<String> payloadJson = GeneratedColumn<String>(
    'payload_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idempotencyKeyMeta = const VerificationMeta(
    'idempotencyKey',
  );
  @override
  late final GeneratedColumn<String> idempotencyKey = GeneratedColumn<String>(
    'idempotency_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entityType,
    entityId,
    operation,
    baseRevision,
    newRevision,
    payloadJson,
    deviceId,
    createdAt,
    idempotencyKey,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(
        _operationMeta,
        operation.isAcceptableOrUnknown(data['operation']!, _operationMeta),
      );
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('base_revision')) {
      context.handle(
        _baseRevisionMeta,
        baseRevision.isAcceptableOrUnknown(
          data['base_revision']!,
          _baseRevisionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_baseRevisionMeta);
    }
    if (data.containsKey('new_revision')) {
      context.handle(
        _newRevisionMeta,
        newRevision.isAcceptableOrUnknown(
          data['new_revision']!,
          _newRevisionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_newRevisionMeta);
    }
    if (data.containsKey('payload_json')) {
      context.handle(
        _payloadJsonMeta,
        payloadJson.isAcceptableOrUnknown(
          data['payload_json']!,
          _payloadJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_payloadJsonMeta);
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('idempotency_key')) {
      context.handle(
        _idempotencyKeyMeta,
        idempotencyKey.isAcceptableOrUnknown(
          data['idempotency_key']!,
          _idempotencyKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idempotencyKeyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      operation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation'],
      )!,
      baseRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}base_revision'],
      )!,
      newRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}new_revision'],
      )!,
      payloadJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload_json'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      idempotencyKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}idempotency_key'],
      )!,
    );
  }

  @override
  $SyncEventsTable createAlias(String alias) {
    return $SyncEventsTable(attachedDatabase, alias);
  }
}

class SyncEvent extends DataClass implements Insertable<SyncEvent> {
  final String id;
  final String entityType;
  final String entityId;
  final String operation;
  final int baseRevision;
  final int newRevision;
  final String payloadJson;
  final String deviceId;
  final DateTime createdAt;
  final String idempotencyKey;
  const SyncEvent({
    required this.id,
    required this.entityType,
    required this.entityId,
    required this.operation,
    required this.baseRevision,
    required this.newRevision,
    required this.payloadJson,
    required this.deviceId,
    required this.createdAt,
    required this.idempotencyKey,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['operation'] = Variable<String>(operation);
    map['base_revision'] = Variable<int>(baseRevision);
    map['new_revision'] = Variable<int>(newRevision);
    map['payload_json'] = Variable<String>(payloadJson);
    map['device_id'] = Variable<String>(deviceId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['idempotency_key'] = Variable<String>(idempotencyKey);
    return map;
  }

  SyncEventsCompanion toCompanion(bool nullToAbsent) {
    return SyncEventsCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityId: Value(entityId),
      operation: Value(operation),
      baseRevision: Value(baseRevision),
      newRevision: Value(newRevision),
      payloadJson: Value(payloadJson),
      deviceId: Value(deviceId),
      createdAt: Value(createdAt),
      idempotencyKey: Value(idempotencyKey),
    );
  }

  factory SyncEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncEvent(
      id: serializer.fromJson<String>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      operation: serializer.fromJson<String>(json['operation']),
      baseRevision: serializer.fromJson<int>(json['baseRevision']),
      newRevision: serializer.fromJson<int>(json['newRevision']),
      payloadJson: serializer.fromJson<String>(json['payloadJson']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      idempotencyKey: serializer.fromJson<String>(json['idempotencyKey']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'operation': serializer.toJson<String>(operation),
      'baseRevision': serializer.toJson<int>(baseRevision),
      'newRevision': serializer.toJson<int>(newRevision),
      'payloadJson': serializer.toJson<String>(payloadJson),
      'deviceId': serializer.toJson<String>(deviceId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'idempotencyKey': serializer.toJson<String>(idempotencyKey),
    };
  }

  SyncEvent copyWith({
    String? id,
    String? entityType,
    String? entityId,
    String? operation,
    int? baseRevision,
    int? newRevision,
    String? payloadJson,
    String? deviceId,
    DateTime? createdAt,
    String? idempotencyKey,
  }) => SyncEvent(
    id: id ?? this.id,
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    operation: operation ?? this.operation,
    baseRevision: baseRevision ?? this.baseRevision,
    newRevision: newRevision ?? this.newRevision,
    payloadJson: payloadJson ?? this.payloadJson,
    deviceId: deviceId ?? this.deviceId,
    createdAt: createdAt ?? this.createdAt,
    idempotencyKey: idempotencyKey ?? this.idempotencyKey,
  );
  SyncEvent copyWithCompanion(SyncEventsCompanion data) {
    return SyncEvent(
      id: data.id.present ? data.id.value : this.id,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      operation: data.operation.present ? data.operation.value : this.operation,
      baseRevision: data.baseRevision.present
          ? data.baseRevision.value
          : this.baseRevision,
      newRevision: data.newRevision.present
          ? data.newRevision.value
          : this.newRevision,
      payloadJson: data.payloadJson.present
          ? data.payloadJson.value
          : this.payloadJson,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      idempotencyKey: data.idempotencyKey.present
          ? data.idempotencyKey.value
          : this.idempotencyKey,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncEvent(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('operation: $operation, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('newRevision: $newRevision, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('deviceId: $deviceId, ')
          ..write('createdAt: $createdAt, ')
          ..write('idempotencyKey: $idempotencyKey')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    entityType,
    entityId,
    operation,
    baseRevision,
    newRevision,
    payloadJson,
    deviceId,
    createdAt,
    idempotencyKey,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncEvent &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.operation == this.operation &&
          other.baseRevision == this.baseRevision &&
          other.newRevision == this.newRevision &&
          other.payloadJson == this.payloadJson &&
          other.deviceId == this.deviceId &&
          other.createdAt == this.createdAt &&
          other.idempotencyKey == this.idempotencyKey);
}

class SyncEventsCompanion extends UpdateCompanion<SyncEvent> {
  final Value<String> id;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> operation;
  final Value<int> baseRevision;
  final Value<int> newRevision;
  final Value<String> payloadJson;
  final Value<String> deviceId;
  final Value<DateTime> createdAt;
  final Value<String> idempotencyKey;
  final Value<int> rowid;
  const SyncEventsCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.operation = const Value.absent(),
    this.baseRevision = const Value.absent(),
    this.newRevision = const Value.absent(),
    this.payloadJson = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.idempotencyKey = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncEventsCompanion.insert({
    required String id,
    required String entityType,
    required String entityId,
    required String operation,
    required int baseRevision,
    required int newRevision,
    required String payloadJson,
    required String deviceId,
    this.createdAt = const Value.absent(),
    required String idempotencyKey,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       entityType = Value(entityType),
       entityId = Value(entityId),
       operation = Value(operation),
       baseRevision = Value(baseRevision),
       newRevision = Value(newRevision),
       payloadJson = Value(payloadJson),
       deviceId = Value(deviceId),
       idempotencyKey = Value(idempotencyKey);
  static Insertable<SyncEvent> custom({
    Expression<String>? id,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? operation,
    Expression<int>? baseRevision,
    Expression<int>? newRevision,
    Expression<String>? payloadJson,
    Expression<String>? deviceId,
    Expression<DateTime>? createdAt,
    Expression<String>? idempotencyKey,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (operation != null) 'operation': operation,
      if (baseRevision != null) 'base_revision': baseRevision,
      if (newRevision != null) 'new_revision': newRevision,
      if (payloadJson != null) 'payload_json': payloadJson,
      if (deviceId != null) 'device_id': deviceId,
      if (createdAt != null) 'created_at': createdAt,
      if (idempotencyKey != null) 'idempotency_key': idempotencyKey,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncEventsCompanion copyWith({
    Value<String>? id,
    Value<String>? entityType,
    Value<String>? entityId,
    Value<String>? operation,
    Value<int>? baseRevision,
    Value<int>? newRevision,
    Value<String>? payloadJson,
    Value<String>? deviceId,
    Value<DateTime>? createdAt,
    Value<String>? idempotencyKey,
    Value<int>? rowid,
  }) {
    return SyncEventsCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      operation: operation ?? this.operation,
      baseRevision: baseRevision ?? this.baseRevision,
      newRevision: newRevision ?? this.newRevision,
      payloadJson: payloadJson ?? this.payloadJson,
      deviceId: deviceId ?? this.deviceId,
      createdAt: createdAt ?? this.createdAt,
      idempotencyKey: idempotencyKey ?? this.idempotencyKey,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (baseRevision.present) {
      map['base_revision'] = Variable<int>(baseRevision.value);
    }
    if (newRevision.present) {
      map['new_revision'] = Variable<int>(newRevision.value);
    }
    if (payloadJson.present) {
      map['payload_json'] = Variable<String>(payloadJson.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (idempotencyKey.present) {
      map['idempotency_key'] = Variable<String>(idempotencyKey.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncEventsCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('operation: $operation, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('newRevision: $newRevision, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('deviceId: $deviceId, ')
          ..write('createdAt: $createdAt, ')
          ..write('idempotencyKey: $idempotencyKey, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ConflictRecordsTable extends ConflictRecords
    with TableInfo<$ConflictRecordsTable, ConflictRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConflictRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localRevisionMeta = const VerificationMeta(
    'localRevision',
  );
  @override
  late final GeneratedColumn<int> localRevision = GeneratedColumn<int>(
    'local_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remoteRevisionMeta = const VerificationMeta(
    'remoteRevision',
  );
  @override
  late final GeneratedColumn<int> remoteRevision = GeneratedColumn<int>(
    'remote_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _resolutionMeta = const VerificationMeta(
    'resolution',
  );
  @override
  late final GeneratedColumn<String> resolution = GeneratedColumn<String>(
    'resolution',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _createdByDeviceIdMeta = const VerificationMeta(
    'createdByDeviceId',
  );
  @override
  late final GeneratedColumn<String> createdByDeviceId =
      GeneratedColumn<String>(
        'created_by_device_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('local'),
      );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entityType,
    entityId,
    localRevision,
    remoteRevision,
    resolution,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'conflict_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<ConflictRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('local_revision')) {
      context.handle(
        _localRevisionMeta,
        localRevision.isAcceptableOrUnknown(
          data['local_revision']!,
          _localRevisionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_localRevisionMeta);
    }
    if (data.containsKey('remote_revision')) {
      context.handle(
        _remoteRevisionMeta,
        remoteRevision.isAcceptableOrUnknown(
          data['remote_revision']!,
          _remoteRevisionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_remoteRevisionMeta);
    }
    if (data.containsKey('resolution')) {
      context.handle(
        _resolutionMeta,
        resolution.isAcceptableOrUnknown(data['resolution']!, _resolutionMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('created_by_device_id')) {
      context.handle(
        _createdByDeviceIdMeta,
        createdByDeviceId.isAcceptableOrUnknown(
          data['created_by_device_id']!,
          _createdByDeviceIdMeta,
        ),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConflictRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConflictRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      localRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}local_revision'],
      )!,
      remoteRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remote_revision'],
      )!,
      resolution: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resolution'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      createdByDeviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_device_id'],
      )!,
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $ConflictRecordsTable createAlias(String alias) {
    return $ConflictRecordsTable(attachedDatabase, alias);
  }
}

class ConflictRecord extends DataClass implements Insertable<ConflictRecord> {
  final String id;
  final String entityType;
  final String entityId;
  final int localRevision;
  final int remoteRevision;
  final String? resolution;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdByDeviceId;
  final int revision;
  final DateTime? deletedAt;
  const ConflictRecord({
    required this.id,
    required this.entityType,
    required this.entityId,
    required this.localRevision,
    required this.remoteRevision,
    this.resolution,
    required this.createdAt,
    required this.updatedAt,
    required this.createdByDeviceId,
    required this.revision,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['local_revision'] = Variable<int>(localRevision);
    map['remote_revision'] = Variable<int>(remoteRevision);
    if (!nullToAbsent || resolution != null) {
      map['resolution'] = Variable<String>(resolution);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['created_by_device_id'] = Variable<String>(createdByDeviceId);
    map['revision'] = Variable<int>(revision);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  ConflictRecordsCompanion toCompanion(bool nullToAbsent) {
    return ConflictRecordsCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityId: Value(entityId),
      localRevision: Value(localRevision),
      remoteRevision: Value(remoteRevision),
      resolution: resolution == null && nullToAbsent
          ? const Value.absent()
          : Value(resolution),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      createdByDeviceId: Value(createdByDeviceId),
      revision: Value(revision),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory ConflictRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConflictRecord(
      id: serializer.fromJson<String>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      localRevision: serializer.fromJson<int>(json['localRevision']),
      remoteRevision: serializer.fromJson<int>(json['remoteRevision']),
      resolution: serializer.fromJson<String?>(json['resolution']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      createdByDeviceId: serializer.fromJson<String>(json['createdByDeviceId']),
      revision: serializer.fromJson<int>(json['revision']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'localRevision': serializer.toJson<int>(localRevision),
      'remoteRevision': serializer.toJson<int>(remoteRevision),
      'resolution': serializer.toJson<String?>(resolution),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'createdByDeviceId': serializer.toJson<String>(createdByDeviceId),
      'revision': serializer.toJson<int>(revision),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  ConflictRecord copyWith({
    String? id,
    String? entityType,
    String? entityId,
    int? localRevision,
    int? remoteRevision,
    Value<String?> resolution = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdByDeviceId,
    int? revision,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => ConflictRecord(
    id: id ?? this.id,
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    localRevision: localRevision ?? this.localRevision,
    remoteRevision: remoteRevision ?? this.remoteRevision,
    resolution: resolution.present ? resolution.value : this.resolution,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
    revision: revision ?? this.revision,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  ConflictRecord copyWithCompanion(ConflictRecordsCompanion data) {
    return ConflictRecord(
      id: data.id.present ? data.id.value : this.id,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      localRevision: data.localRevision.present
          ? data.localRevision.value
          : this.localRevision,
      remoteRevision: data.remoteRevision.present
          ? data.remoteRevision.value
          : this.remoteRevision,
      resolution: data.resolution.present
          ? data.resolution.value
          : this.resolution,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      createdByDeviceId: data.createdByDeviceId.present
          ? data.createdByDeviceId.value
          : this.createdByDeviceId,
      revision: data.revision.present ? data.revision.value : this.revision,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConflictRecord(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('localRevision: $localRevision, ')
          ..write('remoteRevision: $remoteRevision, ')
          ..write('resolution: $resolution, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    entityType,
    entityId,
    localRevision,
    remoteRevision,
    resolution,
    createdAt,
    updatedAt,
    createdByDeviceId,
    revision,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConflictRecord &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.localRevision == this.localRevision &&
          other.remoteRevision == this.remoteRevision &&
          other.resolution == this.resolution &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.createdByDeviceId == this.createdByDeviceId &&
          other.revision == this.revision &&
          other.deletedAt == this.deletedAt);
}

class ConflictRecordsCompanion extends UpdateCompanion<ConflictRecord> {
  final Value<String> id;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<int> localRevision;
  final Value<int> remoteRevision;
  final Value<String?> resolution;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> createdByDeviceId;
  final Value<int> revision;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const ConflictRecordsCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.localRevision = const Value.absent(),
    this.remoteRevision = const Value.absent(),
    this.resolution = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ConflictRecordsCompanion.insert({
    required String id,
    required String entityType,
    required String entityId,
    required int localRevision,
    required int remoteRevision,
    this.resolution = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdByDeviceId = const Value.absent(),
    this.revision = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       entityType = Value(entityType),
       entityId = Value(entityId),
       localRevision = Value(localRevision),
       remoteRevision = Value(remoteRevision);
  static Insertable<ConflictRecord> custom({
    Expression<String>? id,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<int>? localRevision,
    Expression<int>? remoteRevision,
    Expression<String>? resolution,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? createdByDeviceId,
    Expression<int>? revision,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (localRevision != null) 'local_revision': localRevision,
      if (remoteRevision != null) 'remote_revision': remoteRevision,
      if (resolution != null) 'resolution': resolution,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdByDeviceId != null) 'created_by_device_id': createdByDeviceId,
      if (revision != null) 'revision': revision,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ConflictRecordsCompanion copyWith({
    Value<String>? id,
    Value<String>? entityType,
    Value<String>? entityId,
    Value<int>? localRevision,
    Value<int>? remoteRevision,
    Value<String?>? resolution,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? createdByDeviceId,
    Value<int>? revision,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return ConflictRecordsCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      localRevision: localRevision ?? this.localRevision,
      remoteRevision: remoteRevision ?? this.remoteRevision,
      resolution: resolution ?? this.resolution,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdByDeviceId: createdByDeviceId ?? this.createdByDeviceId,
      revision: revision ?? this.revision,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (localRevision.present) {
      map['local_revision'] = Variable<int>(localRevision.value);
    }
    if (remoteRevision.present) {
      map['remote_revision'] = Variable<int>(remoteRevision.value);
    }
    if (resolution.present) {
      map['resolution'] = Variable<String>(resolution.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (createdByDeviceId.present) {
      map['created_by_device_id'] = Variable<String>(createdByDeviceId.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConflictRecordsCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('localRevision: $localRevision, ')
          ..write('remoteRevision: $remoteRevision, ')
          ..write('resolution: $resolution, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdByDeviceId: $createdByDeviceId, ')
          ..write('revision: $revision, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AuditLogsTable extends AuditLogs
    with TableInfo<$AuditLogsTable, AuditLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actorMeta = const VerificationMeta('actor');
  @override
  late final GeneratedColumn<String> actor = GeneratedColumn<String>(
    'actor',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _detailsJsonMeta = const VerificationMeta(
    'detailsJson',
  );
  @override
  late final GeneratedColumn<String> detailsJson = GeneratedColumn<String>(
    'details_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    action,
    actor,
    timestamp,
    detailsJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuditLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('actor')) {
      context.handle(
        _actorMeta,
        actor.isAcceptableOrUnknown(data['actor']!, _actorMeta),
      );
    } else if (isInserting) {
      context.missing(_actorMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    }
    if (data.containsKey('details_json')) {
      context.handle(
        _detailsJsonMeta,
        detailsJson.isAcceptableOrUnknown(
          data['details_json']!,
          _detailsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_detailsJsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      actor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}actor'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
      detailsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}details_json'],
      )!,
    );
  }

  @override
  $AuditLogsTable createAlias(String alias) {
    return $AuditLogsTable(attachedDatabase, alias);
  }
}

class AuditLog extends DataClass implements Insertable<AuditLog> {
  final String id;
  final String action;
  final String actor;
  final DateTime timestamp;
  final String detailsJson;
  const AuditLog({
    required this.id,
    required this.action,
    required this.actor,
    required this.timestamp,
    required this.detailsJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['action'] = Variable<String>(action);
    map['actor'] = Variable<String>(actor);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['details_json'] = Variable<String>(detailsJson);
    return map;
  }

  AuditLogsCompanion toCompanion(bool nullToAbsent) {
    return AuditLogsCompanion(
      id: Value(id),
      action: Value(action),
      actor: Value(actor),
      timestamp: Value(timestamp),
      detailsJson: Value(detailsJson),
    );
  }

  factory AuditLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditLog(
      id: serializer.fromJson<String>(json['id']),
      action: serializer.fromJson<String>(json['action']),
      actor: serializer.fromJson<String>(json['actor']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      detailsJson: serializer.fromJson<String>(json['detailsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'action': serializer.toJson<String>(action),
      'actor': serializer.toJson<String>(actor),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'detailsJson': serializer.toJson<String>(detailsJson),
    };
  }

  AuditLog copyWith({
    String? id,
    String? action,
    String? actor,
    DateTime? timestamp,
    String? detailsJson,
  }) => AuditLog(
    id: id ?? this.id,
    action: action ?? this.action,
    actor: actor ?? this.actor,
    timestamp: timestamp ?? this.timestamp,
    detailsJson: detailsJson ?? this.detailsJson,
  );
  AuditLog copyWithCompanion(AuditLogsCompanion data) {
    return AuditLog(
      id: data.id.present ? data.id.value : this.id,
      action: data.action.present ? data.action.value : this.action,
      actor: data.actor.present ? data.actor.value : this.actor,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      detailsJson: data.detailsJson.present
          ? data.detailsJson.value
          : this.detailsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditLog(')
          ..write('id: $id, ')
          ..write('action: $action, ')
          ..write('actor: $actor, ')
          ..write('timestamp: $timestamp, ')
          ..write('detailsJson: $detailsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, action, actor, timestamp, detailsJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditLog &&
          other.id == this.id &&
          other.action == this.action &&
          other.actor == this.actor &&
          other.timestamp == this.timestamp &&
          other.detailsJson == this.detailsJson);
}

class AuditLogsCompanion extends UpdateCompanion<AuditLog> {
  final Value<String> id;
  final Value<String> action;
  final Value<String> actor;
  final Value<DateTime> timestamp;
  final Value<String> detailsJson;
  final Value<int> rowid;
  const AuditLogsCompanion({
    this.id = const Value.absent(),
    this.action = const Value.absent(),
    this.actor = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.detailsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AuditLogsCompanion.insert({
    required String id,
    required String action,
    required String actor,
    this.timestamp = const Value.absent(),
    required String detailsJson,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       action = Value(action),
       actor = Value(actor),
       detailsJson = Value(detailsJson);
  static Insertable<AuditLog> custom({
    Expression<String>? id,
    Expression<String>? action,
    Expression<String>? actor,
    Expression<DateTime>? timestamp,
    Expression<String>? detailsJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (action != null) 'action': action,
      if (actor != null) 'actor': actor,
      if (timestamp != null) 'timestamp': timestamp,
      if (detailsJson != null) 'details_json': detailsJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AuditLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? action,
    Value<String>? actor,
    Value<DateTime>? timestamp,
    Value<String>? detailsJson,
    Value<int>? rowid,
  }) {
    return AuditLogsCompanion(
      id: id ?? this.id,
      action: action ?? this.action,
      actor: actor ?? this.actor,
      timestamp: timestamp ?? this.timestamp,
      detailsJson: detailsJson ?? this.detailsJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (actor.present) {
      map['actor'] = Variable<String>(actor.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (detailsJson.present) {
      map['details_json'] = Variable<String>(detailsJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogsCompanion(')
          ..write('id: $id, ')
          ..write('action: $action, ')
          ..write('actor: $actor, ')
          ..write('timestamp: $timestamp, ')
          ..write('detailsJson: $detailsJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DevicesTable extends Devices with TableInfo<$DevicesTable, Device> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DevicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastSeenAtMeta = const VerificationMeta(
    'lastSeenAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSeenAt = GeneratedColumn<DateTime>(
    'last_seen_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isTrustedMeta = const VerificationMeta(
    'isTrusted',
  );
  @override
  late final GeneratedColumn<bool> isTrusted = GeneratedColumn<bool>(
    'is_trusted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_trusted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _lastSyncAtMeta = const VerificationMeta(
    'lastSyncAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSyncAt = GeneratedColumn<DateTime>(
    'last_sync_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    displayName,
    lastSeenAt,
    isTrusted,
    lastSyncAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'devices';
  @override
  VerificationContext validateIntegrity(
    Insertable<Device> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('last_seen_at')) {
      context.handle(
        _lastSeenAtMeta,
        lastSeenAt.isAcceptableOrUnknown(
          data['last_seen_at']!,
          _lastSeenAtMeta,
        ),
      );
    }
    if (data.containsKey('is_trusted')) {
      context.handle(
        _isTrustedMeta,
        isTrusted.isAcceptableOrUnknown(data['is_trusted']!, _isTrustedMeta),
      );
    }
    if (data.containsKey('last_sync_at')) {
      context.handle(
        _lastSyncAtMeta,
        lastSyncAt.isAcceptableOrUnknown(
          data['last_sync_at']!,
          _lastSyncAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Device map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Device(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      lastSeenAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_seen_at'],
      )!,
      isTrusted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_trusted'],
      )!,
      lastSyncAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_sync_at'],
      ),
    );
  }

  @override
  $DevicesTable createAlias(String alias) {
    return $DevicesTable(attachedDatabase, alias);
  }
}

class Device extends DataClass implements Insertable<Device> {
  final String id;
  final String displayName;
  final DateTime lastSeenAt;
  final bool isTrusted;
  final DateTime? lastSyncAt;
  const Device({
    required this.id,
    required this.displayName,
    required this.lastSeenAt,
    required this.isTrusted,
    this.lastSyncAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['display_name'] = Variable<String>(displayName);
    map['last_seen_at'] = Variable<DateTime>(lastSeenAt);
    map['is_trusted'] = Variable<bool>(isTrusted);
    if (!nullToAbsent || lastSyncAt != null) {
      map['last_sync_at'] = Variable<DateTime>(lastSyncAt);
    }
    return map;
  }

  DevicesCompanion toCompanion(bool nullToAbsent) {
    return DevicesCompanion(
      id: Value(id),
      displayName: Value(displayName),
      lastSeenAt: Value(lastSeenAt),
      isTrusted: Value(isTrusted),
      lastSyncAt: lastSyncAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncAt),
    );
  }

  factory Device.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Device(
      id: serializer.fromJson<String>(json['id']),
      displayName: serializer.fromJson<String>(json['displayName']),
      lastSeenAt: serializer.fromJson<DateTime>(json['lastSeenAt']),
      isTrusted: serializer.fromJson<bool>(json['isTrusted']),
      lastSyncAt: serializer.fromJson<DateTime?>(json['lastSyncAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'displayName': serializer.toJson<String>(displayName),
      'lastSeenAt': serializer.toJson<DateTime>(lastSeenAt),
      'isTrusted': serializer.toJson<bool>(isTrusted),
      'lastSyncAt': serializer.toJson<DateTime?>(lastSyncAt),
    };
  }

  Device copyWith({
    String? id,
    String? displayName,
    DateTime? lastSeenAt,
    bool? isTrusted,
    Value<DateTime?> lastSyncAt = const Value.absent(),
  }) => Device(
    id: id ?? this.id,
    displayName: displayName ?? this.displayName,
    lastSeenAt: lastSeenAt ?? this.lastSeenAt,
    isTrusted: isTrusted ?? this.isTrusted,
    lastSyncAt: lastSyncAt.present ? lastSyncAt.value : this.lastSyncAt,
  );
  Device copyWithCompanion(DevicesCompanion data) {
    return Device(
      id: data.id.present ? data.id.value : this.id,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      lastSeenAt: data.lastSeenAt.present
          ? data.lastSeenAt.value
          : this.lastSeenAt,
      isTrusted: data.isTrusted.present ? data.isTrusted.value : this.isTrusted,
      lastSyncAt: data.lastSyncAt.present
          ? data.lastSyncAt.value
          : this.lastSyncAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Device(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('lastSeenAt: $lastSeenAt, ')
          ..write('isTrusted: $isTrusted, ')
          ..write('lastSyncAt: $lastSyncAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, displayName, lastSeenAt, isTrusted, lastSyncAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Device &&
          other.id == this.id &&
          other.displayName == this.displayName &&
          other.lastSeenAt == this.lastSeenAt &&
          other.isTrusted == this.isTrusted &&
          other.lastSyncAt == this.lastSyncAt);
}

class DevicesCompanion extends UpdateCompanion<Device> {
  final Value<String> id;
  final Value<String> displayName;
  final Value<DateTime> lastSeenAt;
  final Value<bool> isTrusted;
  final Value<DateTime?> lastSyncAt;
  final Value<int> rowid;
  const DevicesCompanion({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.lastSeenAt = const Value.absent(),
    this.isTrusted = const Value.absent(),
    this.lastSyncAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DevicesCompanion.insert({
    required String id,
    required String displayName,
    this.lastSeenAt = const Value.absent(),
    this.isTrusted = const Value.absent(),
    this.lastSyncAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       displayName = Value(displayName);
  static Insertable<Device> custom({
    Expression<String>? id,
    Expression<String>? displayName,
    Expression<DateTime>? lastSeenAt,
    Expression<bool>? isTrusted,
    Expression<DateTime>? lastSyncAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (displayName != null) 'display_name': displayName,
      if (lastSeenAt != null) 'last_seen_at': lastSeenAt,
      if (isTrusted != null) 'is_trusted': isTrusted,
      if (lastSyncAt != null) 'last_sync_at': lastSyncAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DevicesCompanion copyWith({
    Value<String>? id,
    Value<String>? displayName,
    Value<DateTime>? lastSeenAt,
    Value<bool>? isTrusted,
    Value<DateTime?>? lastSyncAt,
    Value<int>? rowid,
  }) {
    return DevicesCompanion(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      lastSeenAt: lastSeenAt ?? this.lastSeenAt,
      isTrusted: isTrusted ?? this.isTrusted,
      lastSyncAt: lastSyncAt ?? this.lastSyncAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (lastSeenAt.present) {
      map['last_seen_at'] = Variable<DateTime>(lastSeenAt.value);
    }
    if (isTrusted.present) {
      map['is_trusted'] = Variable<bool>(isTrusted.value);
    }
    if (lastSyncAt.present) {
      map['last_sync_at'] = Variable<DateTime>(lastSyncAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DevicesCompanion(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('lastSeenAt: $lastSeenAt, ')
          ..write('isTrusted: $isTrusted, ')
          ..write('lastSyncAt: $lastSyncAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncPeersTable extends SyncPeers
    with TableInfo<$SyncPeersTable, SyncPeer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncPeersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _peerDeviceIdMeta = const VerificationMeta(
    'peerDeviceId',
  );
  @override
  late final GeneratedColumn<String> peerDeviceId = GeneratedColumn<String>(
    'peer_device_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES devices (id)',
    ),
  );
  static const VerificationMeta _pairedAtMeta = const VerificationMeta(
    'pairedAt',
  );
  @override
  late final GeneratedColumn<DateTime> pairedAt = GeneratedColumn<DateTime>(
    'paired_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _lastSyncAtMeta = const VerificationMeta(
    'lastSyncAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSyncAt = GeneratedColumn<DateTime>(
    'last_sync_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastSyncedEventIdMeta = const VerificationMeta(
    'lastSyncedEventId',
  );
  @override
  late final GeneratedColumn<String> lastSyncedEventId =
      GeneratedColumn<String>(
        'last_synced_event_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _ipAddressMeta = const VerificationMeta(
    'ipAddress',
  );
  @override
  late final GeneratedColumn<String> ipAddress = GeneratedColumn<String>(
    'ip_address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _portMeta = const VerificationMeta('port');
  @override
  late final GeneratedColumn<int> port = GeneratedColumn<int>(
    'port',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    peerDeviceId,
    pairedAt,
    lastSyncAt,
    lastSyncedEventId,
    ipAddress,
    port,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_peers';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncPeer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('peer_device_id')) {
      context.handle(
        _peerDeviceIdMeta,
        peerDeviceId.isAcceptableOrUnknown(
          data['peer_device_id']!,
          _peerDeviceIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_peerDeviceIdMeta);
    }
    if (data.containsKey('paired_at')) {
      context.handle(
        _pairedAtMeta,
        pairedAt.isAcceptableOrUnknown(data['paired_at']!, _pairedAtMeta),
      );
    }
    if (data.containsKey('last_sync_at')) {
      context.handle(
        _lastSyncAtMeta,
        lastSyncAt.isAcceptableOrUnknown(
          data['last_sync_at']!,
          _lastSyncAtMeta,
        ),
      );
    }
    if (data.containsKey('last_synced_event_id')) {
      context.handle(
        _lastSyncedEventIdMeta,
        lastSyncedEventId.isAcceptableOrUnknown(
          data['last_synced_event_id']!,
          _lastSyncedEventIdMeta,
        ),
      );
    }
    if (data.containsKey('ip_address')) {
      context.handle(
        _ipAddressMeta,
        ipAddress.isAcceptableOrUnknown(data['ip_address']!, _ipAddressMeta),
      );
    }
    if (data.containsKey('port')) {
      context.handle(
        _portMeta,
        port.isAcceptableOrUnknown(data['port']!, _portMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncPeer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncPeer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      peerDeviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}peer_device_id'],
      )!,
      pairedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}paired_at'],
      )!,
      lastSyncAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_sync_at'],
      ),
      lastSyncedEventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_synced_event_id'],
      ),
      ipAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ip_address'],
      ),
      port: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}port'],
      ),
    );
  }

  @override
  $SyncPeersTable createAlias(String alias) {
    return $SyncPeersTable(attachedDatabase, alias);
  }
}

class SyncPeer extends DataClass implements Insertable<SyncPeer> {
  final String id;
  final String peerDeviceId;
  final DateTime pairedAt;
  final DateTime? lastSyncAt;
  final String? lastSyncedEventId;
  final String? ipAddress;
  final int? port;
  const SyncPeer({
    required this.id,
    required this.peerDeviceId,
    required this.pairedAt,
    this.lastSyncAt,
    this.lastSyncedEventId,
    this.ipAddress,
    this.port,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['peer_device_id'] = Variable<String>(peerDeviceId);
    map['paired_at'] = Variable<DateTime>(pairedAt);
    if (!nullToAbsent || lastSyncAt != null) {
      map['last_sync_at'] = Variable<DateTime>(lastSyncAt);
    }
    if (!nullToAbsent || lastSyncedEventId != null) {
      map['last_synced_event_id'] = Variable<String>(lastSyncedEventId);
    }
    if (!nullToAbsent || ipAddress != null) {
      map['ip_address'] = Variable<String>(ipAddress);
    }
    if (!nullToAbsent || port != null) {
      map['port'] = Variable<int>(port);
    }
    return map;
  }

  SyncPeersCompanion toCompanion(bool nullToAbsent) {
    return SyncPeersCompanion(
      id: Value(id),
      peerDeviceId: Value(peerDeviceId),
      pairedAt: Value(pairedAt),
      lastSyncAt: lastSyncAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncAt),
      lastSyncedEventId: lastSyncedEventId == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedEventId),
      ipAddress: ipAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(ipAddress),
      port: port == null && nullToAbsent ? const Value.absent() : Value(port),
    );
  }

  factory SyncPeer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncPeer(
      id: serializer.fromJson<String>(json['id']),
      peerDeviceId: serializer.fromJson<String>(json['peerDeviceId']),
      pairedAt: serializer.fromJson<DateTime>(json['pairedAt']),
      lastSyncAt: serializer.fromJson<DateTime?>(json['lastSyncAt']),
      lastSyncedEventId: serializer.fromJson<String?>(
        json['lastSyncedEventId'],
      ),
      ipAddress: serializer.fromJson<String?>(json['ipAddress']),
      port: serializer.fromJson<int?>(json['port']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'peerDeviceId': serializer.toJson<String>(peerDeviceId),
      'pairedAt': serializer.toJson<DateTime>(pairedAt),
      'lastSyncAt': serializer.toJson<DateTime?>(lastSyncAt),
      'lastSyncedEventId': serializer.toJson<String?>(lastSyncedEventId),
      'ipAddress': serializer.toJson<String?>(ipAddress),
      'port': serializer.toJson<int?>(port),
    };
  }

  SyncPeer copyWith({
    String? id,
    String? peerDeviceId,
    DateTime? pairedAt,
    Value<DateTime?> lastSyncAt = const Value.absent(),
    Value<String?> lastSyncedEventId = const Value.absent(),
    Value<String?> ipAddress = const Value.absent(),
    Value<int?> port = const Value.absent(),
  }) => SyncPeer(
    id: id ?? this.id,
    peerDeviceId: peerDeviceId ?? this.peerDeviceId,
    pairedAt: pairedAt ?? this.pairedAt,
    lastSyncAt: lastSyncAt.present ? lastSyncAt.value : this.lastSyncAt,
    lastSyncedEventId: lastSyncedEventId.present
        ? lastSyncedEventId.value
        : this.lastSyncedEventId,
    ipAddress: ipAddress.present ? ipAddress.value : this.ipAddress,
    port: port.present ? port.value : this.port,
  );
  SyncPeer copyWithCompanion(SyncPeersCompanion data) {
    return SyncPeer(
      id: data.id.present ? data.id.value : this.id,
      peerDeviceId: data.peerDeviceId.present
          ? data.peerDeviceId.value
          : this.peerDeviceId,
      pairedAt: data.pairedAt.present ? data.pairedAt.value : this.pairedAt,
      lastSyncAt: data.lastSyncAt.present
          ? data.lastSyncAt.value
          : this.lastSyncAt,
      lastSyncedEventId: data.lastSyncedEventId.present
          ? data.lastSyncedEventId.value
          : this.lastSyncedEventId,
      ipAddress: data.ipAddress.present ? data.ipAddress.value : this.ipAddress,
      port: data.port.present ? data.port.value : this.port,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncPeer(')
          ..write('id: $id, ')
          ..write('peerDeviceId: $peerDeviceId, ')
          ..write('pairedAt: $pairedAt, ')
          ..write('lastSyncAt: $lastSyncAt, ')
          ..write('lastSyncedEventId: $lastSyncedEventId, ')
          ..write('ipAddress: $ipAddress, ')
          ..write('port: $port')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    peerDeviceId,
    pairedAt,
    lastSyncAt,
    lastSyncedEventId,
    ipAddress,
    port,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncPeer &&
          other.id == this.id &&
          other.peerDeviceId == this.peerDeviceId &&
          other.pairedAt == this.pairedAt &&
          other.lastSyncAt == this.lastSyncAt &&
          other.lastSyncedEventId == this.lastSyncedEventId &&
          other.ipAddress == this.ipAddress &&
          other.port == this.port);
}

class SyncPeersCompanion extends UpdateCompanion<SyncPeer> {
  final Value<String> id;
  final Value<String> peerDeviceId;
  final Value<DateTime> pairedAt;
  final Value<DateTime?> lastSyncAt;
  final Value<String?> lastSyncedEventId;
  final Value<String?> ipAddress;
  final Value<int?> port;
  final Value<int> rowid;
  const SyncPeersCompanion({
    this.id = const Value.absent(),
    this.peerDeviceId = const Value.absent(),
    this.pairedAt = const Value.absent(),
    this.lastSyncAt = const Value.absent(),
    this.lastSyncedEventId = const Value.absent(),
    this.ipAddress = const Value.absent(),
    this.port = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncPeersCompanion.insert({
    required String id,
    required String peerDeviceId,
    this.pairedAt = const Value.absent(),
    this.lastSyncAt = const Value.absent(),
    this.lastSyncedEventId = const Value.absent(),
    this.ipAddress = const Value.absent(),
    this.port = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       peerDeviceId = Value(peerDeviceId);
  static Insertable<SyncPeer> custom({
    Expression<String>? id,
    Expression<String>? peerDeviceId,
    Expression<DateTime>? pairedAt,
    Expression<DateTime>? lastSyncAt,
    Expression<String>? lastSyncedEventId,
    Expression<String>? ipAddress,
    Expression<int>? port,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (peerDeviceId != null) 'peer_device_id': peerDeviceId,
      if (pairedAt != null) 'paired_at': pairedAt,
      if (lastSyncAt != null) 'last_sync_at': lastSyncAt,
      if (lastSyncedEventId != null) 'last_synced_event_id': lastSyncedEventId,
      if (ipAddress != null) 'ip_address': ipAddress,
      if (port != null) 'port': port,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncPeersCompanion copyWith({
    Value<String>? id,
    Value<String>? peerDeviceId,
    Value<DateTime>? pairedAt,
    Value<DateTime?>? lastSyncAt,
    Value<String?>? lastSyncedEventId,
    Value<String?>? ipAddress,
    Value<int?>? port,
    Value<int>? rowid,
  }) {
    return SyncPeersCompanion(
      id: id ?? this.id,
      peerDeviceId: peerDeviceId ?? this.peerDeviceId,
      pairedAt: pairedAt ?? this.pairedAt,
      lastSyncAt: lastSyncAt ?? this.lastSyncAt,
      lastSyncedEventId: lastSyncedEventId ?? this.lastSyncedEventId,
      ipAddress: ipAddress ?? this.ipAddress,
      port: port ?? this.port,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (peerDeviceId.present) {
      map['peer_device_id'] = Variable<String>(peerDeviceId.value);
    }
    if (pairedAt.present) {
      map['paired_at'] = Variable<DateTime>(pairedAt.value);
    }
    if (lastSyncAt.present) {
      map['last_sync_at'] = Variable<DateTime>(lastSyncAt.value);
    }
    if (lastSyncedEventId.present) {
      map['last_synced_event_id'] = Variable<String>(lastSyncedEventId.value);
    }
    if (ipAddress.present) {
      map['ip_address'] = Variable<String>(ipAddress.value);
    }
    if (port.present) {
      map['port'] = Variable<int>(port.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncPeersCompanion(')
          ..write('id: $id, ')
          ..write('peerDeviceId: $peerDeviceId, ')
          ..write('pairedAt: $pairedAt, ')
          ..write('lastSyncAt: $lastSyncAt, ')
          ..write('lastSyncedEventId: $lastSyncedEventId, ')
          ..write('ipAddress: $ipAddress, ')
          ..write('port: $port, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncCursorsTable extends SyncCursors
    with TableInfo<$SyncCursorsTable, SyncCursor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncCursorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _peerDeviceIdMeta = const VerificationMeta(
    'peerDeviceId',
  );
  @override
  late final GeneratedColumn<String> peerDeviceId = GeneratedColumn<String>(
    'peer_device_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES devices (id)',
    ),
  );
  static const VerificationMeta _lastReceivedEventIdMeta =
      const VerificationMeta('lastReceivedEventId');
  @override
  late final GeneratedColumn<String> lastReceivedEventId =
      GeneratedColumn<String>(
        'last_received_event_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    peerDeviceId,
    lastReceivedEventId,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_cursors';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncCursor> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('peer_device_id')) {
      context.handle(
        _peerDeviceIdMeta,
        peerDeviceId.isAcceptableOrUnknown(
          data['peer_device_id']!,
          _peerDeviceIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_peerDeviceIdMeta);
    }
    if (data.containsKey('last_received_event_id')) {
      context.handle(
        _lastReceivedEventIdMeta,
        lastReceivedEventId.isAcceptableOrUnknown(
          data['last_received_event_id']!,
          _lastReceivedEventIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncCursor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncCursor(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      peerDeviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}peer_device_id'],
      )!,
      lastReceivedEventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_received_event_id'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SyncCursorsTable createAlias(String alias) {
    return $SyncCursorsTable(attachedDatabase, alias);
  }
}

class SyncCursor extends DataClass implements Insertable<SyncCursor> {
  final String id;
  final String peerDeviceId;
  final String? lastReceivedEventId;
  final DateTime updatedAt;
  const SyncCursor({
    required this.id,
    required this.peerDeviceId,
    this.lastReceivedEventId,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['peer_device_id'] = Variable<String>(peerDeviceId);
    if (!nullToAbsent || lastReceivedEventId != null) {
      map['last_received_event_id'] = Variable<String>(lastReceivedEventId);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SyncCursorsCompanion toCompanion(bool nullToAbsent) {
    return SyncCursorsCompanion(
      id: Value(id),
      peerDeviceId: Value(peerDeviceId),
      lastReceivedEventId: lastReceivedEventId == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReceivedEventId),
      updatedAt: Value(updatedAt),
    );
  }

  factory SyncCursor.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncCursor(
      id: serializer.fromJson<String>(json['id']),
      peerDeviceId: serializer.fromJson<String>(json['peerDeviceId']),
      lastReceivedEventId: serializer.fromJson<String?>(
        json['lastReceivedEventId'],
      ),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'peerDeviceId': serializer.toJson<String>(peerDeviceId),
      'lastReceivedEventId': serializer.toJson<String?>(lastReceivedEventId),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SyncCursor copyWith({
    String? id,
    String? peerDeviceId,
    Value<String?> lastReceivedEventId = const Value.absent(),
    DateTime? updatedAt,
  }) => SyncCursor(
    id: id ?? this.id,
    peerDeviceId: peerDeviceId ?? this.peerDeviceId,
    lastReceivedEventId: lastReceivedEventId.present
        ? lastReceivedEventId.value
        : this.lastReceivedEventId,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SyncCursor copyWithCompanion(SyncCursorsCompanion data) {
    return SyncCursor(
      id: data.id.present ? data.id.value : this.id,
      peerDeviceId: data.peerDeviceId.present
          ? data.peerDeviceId.value
          : this.peerDeviceId,
      lastReceivedEventId: data.lastReceivedEventId.present
          ? data.lastReceivedEventId.value
          : this.lastReceivedEventId,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncCursor(')
          ..write('id: $id, ')
          ..write('peerDeviceId: $peerDeviceId, ')
          ..write('lastReceivedEventId: $lastReceivedEventId, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, peerDeviceId, lastReceivedEventId, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncCursor &&
          other.id == this.id &&
          other.peerDeviceId == this.peerDeviceId &&
          other.lastReceivedEventId == this.lastReceivedEventId &&
          other.updatedAt == this.updatedAt);
}

class SyncCursorsCompanion extends UpdateCompanion<SyncCursor> {
  final Value<String> id;
  final Value<String> peerDeviceId;
  final Value<String?> lastReceivedEventId;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SyncCursorsCompanion({
    this.id = const Value.absent(),
    this.peerDeviceId = const Value.absent(),
    this.lastReceivedEventId = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncCursorsCompanion.insert({
    required String id,
    required String peerDeviceId,
    this.lastReceivedEventId = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       peerDeviceId = Value(peerDeviceId);
  static Insertable<SyncCursor> custom({
    Expression<String>? id,
    Expression<String>? peerDeviceId,
    Expression<String>? lastReceivedEventId,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (peerDeviceId != null) 'peer_device_id': peerDeviceId,
      if (lastReceivedEventId != null)
        'last_received_event_id': lastReceivedEventId,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncCursorsCompanion copyWith({
    Value<String>? id,
    Value<String>? peerDeviceId,
    Value<String?>? lastReceivedEventId,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SyncCursorsCompanion(
      id: id ?? this.id,
      peerDeviceId: peerDeviceId ?? this.peerDeviceId,
      lastReceivedEventId: lastReceivedEventId ?? this.lastReceivedEventId,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (peerDeviceId.present) {
      map['peer_device_id'] = Variable<String>(peerDeviceId.value);
    }
    if (lastReceivedEventId.present) {
      map['last_received_event_id'] = Variable<String>(
        lastReceivedEventId.value,
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncCursorsCompanion(')
          ..write('id: $id, ')
          ..write('peerDeviceId: $peerDeviceId, ')
          ..write('lastReceivedEventId: $lastReceivedEventId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final String key;
  final String value;
  const AppSetting({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(key: Value(key), value: Value(value));
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  AppSetting copyWith({String? key, String? value}) =>
      AppSetting(key: key ?? this.key, value: value ?? this.value);
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.key == this.key &&
          other.value == this.value);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<AppSetting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return AppSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $StudentsTable students = $StudentsTable(this);
  late final $SubjectsTable subjects = $SubjectsTable(this);
  late final $ChaptersTable chapters = $ChaptersTable(this);
  late final $TopicsTable topics = $TopicsTable(this);
  late final $CompetenciesTable competencies = $CompetenciesTable(this);
  late final $SourceDocumentsTable sourceDocuments = $SourceDocumentsTable(
    this,
  );
  late final $DocumentVersionsTable documentVersions = $DocumentVersionsTable(
    this,
  );
  late final $DocumentChunksTable documentChunks = $DocumentChunksTable(this);
  late final $KnowledgeItemsTable knowledgeItems = $KnowledgeItemsTable(this);
  late final $KnowledgeSourcesTable knowledgeSources = $KnowledgeSourcesTable(
    this,
  );
  late final $QuestionsTable questions = $QuestionsTable(this);
  late final $QuestionSnapshotsTable questionSnapshots =
      $QuestionSnapshotsTable(this);
  late final $AssessmentsTable assessments = $AssessmentsTable(this);
  late final $AssessmentSnapshotsTable assessmentSnapshots =
      $AssessmentSnapshotsTable(this);
  late final $AssessmentItemsTable assessmentItems = $AssessmentItemsTable(
    this,
  );
  late final $StudentAttemptsTable studentAttempts = $StudentAttemptsTable(
    this,
  );
  late final $StudentAnswersTable studentAnswers = $StudentAnswersTable(this);
  late final $MasteryRecordsTable masteryRecords = $MasteryRecordsTable(this);
  late final $SyncEventsTable syncEvents = $SyncEventsTable(this);
  late final $ConflictRecordsTable conflictRecords = $ConflictRecordsTable(
    this,
  );
  late final $AuditLogsTable auditLogs = $AuditLogsTable(this);
  late final $DevicesTable devices = $DevicesTable(this);
  late final $SyncPeersTable syncPeers = $SyncPeersTable(this);
  late final $SyncCursorsTable syncCursors = $SyncCursorsTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    students,
    subjects,
    chapters,
    topics,
    competencies,
    sourceDocuments,
    documentVersions,
    documentChunks,
    knowledgeItems,
    knowledgeSources,
    questions,
    questionSnapshots,
    assessments,
    assessmentSnapshots,
    assessmentItems,
    studentAttempts,
    studentAnswers,
    masteryRecords,
    syncEvents,
    conflictRecords,
    auditLogs,
    devices,
    syncPeers,
    syncCursors,
    appSettings,
  ];
}

typedef $$StudentsTableCreateCompanionBuilder = StudentsCompanion Function({
  required String id,
  required String displayName,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> createdByDeviceId,
  Value<int> revision,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$StudentsTableUpdateCompanionBuilder = StudentsCompanion Function({
  Value<String> id,
  Value<String> displayName,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> createdByDeviceId,
  Value<int> revision,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

final class $$StudentsTableReferences
    extends BaseReferences<_$AppDatabase, $StudentsTable, Student> {
  $$StudentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$StudentAttemptsTable, List<StudentAttempt>>
  _studentAttemptsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.studentAttempts,
    aliasName: 'students__id__student_attempts__student_id',
  );

  $$StudentAttemptsTableProcessedTableManager get studentAttemptsRefs {
    final manager = $$StudentAttemptsTableTableManager(
      $_db,
      $_db.studentAttempts,
    ).filter((f) => f.studentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _studentAttemptsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MasteryRecordsTable, List<MasteryRecord>>
  _masteryRecordsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.masteryRecords,
    aliasName: 'students__id__mastery_records__student_id',
  );

  $$MasteryRecordsTableProcessedTableManager get masteryRecordsRefs {
    final manager = $$MasteryRecordsTableTableManager(
      $_db,
      $_db.masteryRecords,
    ).filter((f) => f.studentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_masteryRecordsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StudentsTableFilterComposer
    extends Composer<_$AppDatabase, $StudentsTable> {
  $$StudentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> studentAttemptsRefs(
    Expression<bool> Function($$StudentAttemptsTableFilterComposer f) f,
  ) {
    final $$StudentAttemptsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studentAttempts,
      getReferencedColumn: (t) => t.studentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentAttemptsTableFilterComposer(
            $db: $db,
            $table: $db.studentAttempts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> masteryRecordsRefs(
    Expression<bool> Function($$MasteryRecordsTableFilterComposer f) f,
  ) {
    final $$MasteryRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.masteryRecords,
      getReferencedColumn: (t) => t.studentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MasteryRecordsTableFilterComposer(
            $db: $db,
            $table: $db.masteryRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StudentsTableOrderingComposer
    extends Composer<_$AppDatabase, $StudentsTable> {
  $$StudentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StudentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudentsTable> {
  $$StudentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  Expression<T> studentAttemptsRefs<T extends Object>(
    Expression<T> Function($$StudentAttemptsTableAnnotationComposer a) f,
  ) {
    final $$StudentAttemptsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studentAttempts,
      getReferencedColumn: (t) => t.studentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentAttemptsTableAnnotationComposer(
            $db: $db,
            $table: $db.studentAttempts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> masteryRecordsRefs<T extends Object>(
    Expression<T> Function($$MasteryRecordsTableAnnotationComposer a) f,
  ) {
    final $$MasteryRecordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.masteryRecords,
      getReferencedColumn: (t) => t.studentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MasteryRecordsTableAnnotationComposer(
            $db: $db,
            $table: $db.masteryRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StudentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudentsTable,
          Student,
          $$StudentsTableFilterComposer,
          $$StudentsTableOrderingComposer,
          $$StudentsTableAnnotationComposer,
          $$StudentsTableCreateCompanionBuilder,
          $$StudentsTableUpdateCompanionBuilder,
          (Student, $$StudentsTableReferences),
          Student,
          PrefetchHooks Function({
            bool studentAttemptsRefs,
            bool masteryRecordsRefs,
          })
        > {
  $$StudentsTableTableManager(_$AppDatabase db, $StudentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudentsCompanion(
                id: id,
                displayName: displayName,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String displayName,
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudentsCompanion.insert(
                id: id,
                displayName: displayName,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$StudentsTable, Student>(table),
                  $$StudentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({studentAttemptsRefs = false, masteryRecordsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (studentAttemptsRefs) db.studentAttempts,
                    if (masteryRecordsRefs) db.masteryRecords,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (studentAttemptsRefs)
                        await $_getPrefetchedDataByColumns<
                          Student,
                          $StudentsTable,
                          StudentAttempt,
                          $StudentAttemptsTable
                        >(
                          currentTable: table,
                          referencedTable: $$StudentsTableReferences
                              ._studentAttemptsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StudentsTableReferences(
                                db,
                                table,
                                p0,
                              ).studentAttemptsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'student_id',
                          typedResults: items,
                        ),
                      if (masteryRecordsRefs)
                        await $_getPrefetchedDataByColumns<
                          Student,
                          $StudentsTable,
                          MasteryRecord,
                          $MasteryRecordsTable
                        >(
                          currentTable: table,
                          referencedTable: $$StudentsTableReferences
                              ._masteryRecordsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StudentsTableReferences(
                                db,
                                table,
                                p0,
                              ).masteryRecordsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'student_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$StudentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudentsTable,
      Student,
      $$StudentsTableFilterComposer,
      $$StudentsTableOrderingComposer,
      $$StudentsTableAnnotationComposer,
      $$StudentsTableCreateCompanionBuilder,
      $$StudentsTableUpdateCompanionBuilder,
      (Student, $$StudentsTableReferences),
      Student,
      PrefetchHooks Function({
        bool studentAttemptsRefs,
        bool masteryRecordsRefs,
      })
    >;
typedef $$SubjectsTableCreateCompanionBuilder = SubjectsCompanion Function({
  required String id,
  required String name,
  Value<String> engineId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> createdByDeviceId,
  Value<int> revision,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$SubjectsTableUpdateCompanionBuilder = SubjectsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> engineId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> createdByDeviceId,
  Value<int> revision,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

final class $$SubjectsTableReferences
    extends BaseReferences<_$AppDatabase, $SubjectsTable, Subject> {
  $$SubjectsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ChaptersTable, List<Chapter>> _chaptersRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.chapters,
    aliasName: 'subjects__id__chapters__subject_id',
  );

  $$ChaptersTableProcessedTableManager get chaptersRefs {
    final manager = $$ChaptersTableTableManager(
      $_db,
      $_db.chapters,
    ).filter((f) => f.subjectId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_chaptersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SubjectsTableFilterComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get engineId => $composableBuilder(
    column: $table.engineId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> chaptersRefs(
    Expression<bool> Function($$ChaptersTableFilterComposer f) f,
  ) {
    final $$ChaptersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chapters,
      getReferencedColumn: (t) => t.subjectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableFilterComposer(
            $db: $db,
            $table: $db.chapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SubjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get engineId => $composableBuilder(
    column: $table.engineId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SubjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get engineId =>
      $composableBuilder(column: $table.engineId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  Expression<T> chaptersRefs<T extends Object>(
    Expression<T> Function($$ChaptersTableAnnotationComposer a) f,
  ) {
    final $$ChaptersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chapters,
      getReferencedColumn: (t) => t.subjectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableAnnotationComposer(
            $db: $db,
            $table: $db.chapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SubjectsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubjectsTable,
          Subject,
          $$SubjectsTableFilterComposer,
          $$SubjectsTableOrderingComposer,
          $$SubjectsTableAnnotationComposer,
          $$SubjectsTableCreateCompanionBuilder,
          $$SubjectsTableUpdateCompanionBuilder,
          (Subject, $$SubjectsTableReferences),
          Subject,
          PrefetchHooks Function({bool chaptersRefs})
        > {
  $$SubjectsTableTableManager(_$AppDatabase db, $SubjectsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> engineId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SubjectsCompanion(
                id: id,
                name: name,
                engineId: engineId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String> engineId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SubjectsCompanion.insert(
                id: id,
                name: name,
                engineId: engineId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SubjectsTable, Subject>(table),
                  $$SubjectsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({chaptersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (chaptersRefs) db.chapters],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (chaptersRefs)
                    await $_getPrefetchedDataByColumns<
                      Subject,
                      $SubjectsTable,
                      Chapter,
                      $ChaptersTable
                    >(
                      currentTable: table,
                      referencedTable: $$SubjectsTableReferences
                          ._chaptersRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SubjectsTableReferences(db, table, p0).chaptersRefs,
                      currentColumn: 'id',
                      referencedColumn: 'subject_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SubjectsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubjectsTable,
      Subject,
      $$SubjectsTableFilterComposer,
      $$SubjectsTableOrderingComposer,
      $$SubjectsTableAnnotationComposer,
      $$SubjectsTableCreateCompanionBuilder,
      $$SubjectsTableUpdateCompanionBuilder,
      (Subject, $$SubjectsTableReferences),
      Subject,
      PrefetchHooks Function({bool chaptersRefs})
    >;
typedef $$ChaptersTableCreateCompanionBuilder = ChaptersCompanion Function({
  required String id,
  required String subjectId,
  required String name,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> createdByDeviceId,
  Value<int> revision,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$ChaptersTableUpdateCompanionBuilder = ChaptersCompanion Function({
  Value<String> id,
  Value<String> subjectId,
  Value<String> name,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> createdByDeviceId,
  Value<int> revision,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

final class $$ChaptersTableReferences
    extends BaseReferences<_$AppDatabase, $ChaptersTable, Chapter> {
  $$ChaptersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SubjectsTable _subjectIdTable(_$AppDatabase db) =>
      db.subjects.createAlias('chapters__subject_id__subjects__id');

  $$SubjectsTableProcessedTableManager get subjectId {
    final $_column = $_itemColumn<String>('subject_id')!;

    final manager = $$SubjectsTableTableManager(
      $_db,
      $_db.subjects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_subjectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TopicsTable, List<Topic>> _topicsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.topics,
    aliasName: 'chapters__id__topics__chapter_id',
  );

  $$TopicsTableProcessedTableManager get topicsRefs {
    final manager = $$TopicsTableTableManager(
      $_db,
      $_db.topics,
    ).filter((f) => f.chapterId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_topicsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ChaptersTableFilterComposer
    extends Composer<_$AppDatabase, $ChaptersTable> {
  $$ChaptersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SubjectsTableFilterComposer get subjectId {
    final $$SubjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectId,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableFilterComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> topicsRefs(
    Expression<bool> Function($$TopicsTableFilterComposer f) f,
  ) {
    final $$TopicsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.chapterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableFilterComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChaptersTableOrderingComposer
    extends Composer<_$AppDatabase, $ChaptersTable> {
  $$ChaptersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SubjectsTableOrderingComposer get subjectId {
    final $$SubjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectId,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableOrderingComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChaptersTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChaptersTable> {
  $$ChaptersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$SubjectsTableAnnotationComposer get subjectId {
    final $$SubjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectId,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> topicsRefs<T extends Object>(
    Expression<T> Function($$TopicsTableAnnotationComposer a) f,
  ) {
    final $$TopicsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.chapterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableAnnotationComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChaptersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChaptersTable,
          Chapter,
          $$ChaptersTableFilterComposer,
          $$ChaptersTableOrderingComposer,
          $$ChaptersTableAnnotationComposer,
          $$ChaptersTableCreateCompanionBuilder,
          $$ChaptersTableUpdateCompanionBuilder,
          (Chapter, $$ChaptersTableReferences),
          Chapter,
          PrefetchHooks Function({bool subjectId, bool topicsRefs})
        > {
  $$ChaptersTableTableManager(_$AppDatabase db, $ChaptersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChaptersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChaptersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChaptersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> subjectId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChaptersCompanion(
                id: id,
                subjectId: subjectId,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String subjectId,
                required String name,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChaptersCompanion.insert(
                id: id,
                subjectId: subjectId,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ChaptersTable, Chapter>(table),
                  $$ChaptersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({subjectId = false, topicsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (topicsRefs) db.topics],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (subjectId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.subjectId,
                        referencedTable: $$ChaptersTableReferences
                            ._subjectIdTable(db),
                        referencedColumn: $$ChaptersTableReferences
                            ._subjectIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (topicsRefs)
                    await $_getPrefetchedDataByColumns<
                      Chapter,
                      $ChaptersTable,
                      Topic,
                      $TopicsTable
                    >(
                      currentTable: table,
                      referencedTable: $$ChaptersTableReferences
                          ._topicsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ChaptersTableReferences(db, table, p0).topicsRefs,
                      currentColumn: 'id',
                      referencedColumn: 'chapter_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ChaptersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChaptersTable,
      Chapter,
      $$ChaptersTableFilterComposer,
      $$ChaptersTableOrderingComposer,
      $$ChaptersTableAnnotationComposer,
      $$ChaptersTableCreateCompanionBuilder,
      $$ChaptersTableUpdateCompanionBuilder,
      (Chapter, $$ChaptersTableReferences),
      Chapter,
      PrefetchHooks Function({bool subjectId, bool topicsRefs})
    >;
typedef $$TopicsTableCreateCompanionBuilder = TopicsCompanion Function({
  required String id,
  required String chapterId,
  required String name,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> createdByDeviceId,
  Value<int> revision,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$TopicsTableUpdateCompanionBuilder = TopicsCompanion Function({
  Value<String> id,
  Value<String> chapterId,
  Value<String> name,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> createdByDeviceId,
  Value<int> revision,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

final class $$TopicsTableReferences
    extends BaseReferences<_$AppDatabase, $TopicsTable, Topic> {
  $$TopicsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ChaptersTable _chapterIdTable(_$AppDatabase db) =>
      db.chapters.createAlias('topics__chapter_id__chapters__id');

  $$ChaptersTableProcessedTableManager get chapterId {
    final $_column = $_itemColumn<String>('chapter_id')!;

    final manager = $$ChaptersTableTableManager(
      $_db,
      $_db.chapters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_chapterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CompetenciesTable, List<Competency>>
  _competenciesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.competencies,
    aliasName: 'topics__id__competencies__topic_id',
  );

  $$CompetenciesTableProcessedTableManager get competenciesRefs {
    final manager = $$CompetenciesTableTableManager(
      $_db,
      $_db.competencies,
    ).filter((f) => f.topicId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_competenciesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$KnowledgeItemsTable, List<KnowledgeItem>>
  _knowledgeItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.knowledgeItems,
    aliasName: 'topics__id__knowledge_items__topic_id',
  );

  $$KnowledgeItemsTableProcessedTableManager get knowledgeItemsRefs {
    final manager = $$KnowledgeItemsTableTableManager(
      $_db,
      $_db.knowledgeItems,
    ).filter((f) => f.topicId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_knowledgeItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$QuestionsTable, List<Question>>
  _questionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.questions,
    aliasName: 'topics__id__questions__topic_id',
  );

  $$QuestionsTableProcessedTableManager get questionsRefs {
    final manager = $$QuestionsTableTableManager(
      $_db,
      $_db.questions,
    ).filter((f) => f.topicId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_questionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TopicsTableFilterComposer
    extends Composer<_$AppDatabase, $TopicsTable> {
  $$TopicsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ChaptersTableFilterComposer get chapterId {
    final $$ChaptersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chapterId,
      referencedTable: $db.chapters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableFilterComposer(
            $db: $db,
            $table: $db.chapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> competenciesRefs(
    Expression<bool> Function($$CompetenciesTableFilterComposer f) f,
  ) {
    final $$CompetenciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.competencies,
      getReferencedColumn: (t) => t.topicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompetenciesTableFilterComposer(
            $db: $db,
            $table: $db.competencies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> knowledgeItemsRefs(
    Expression<bool> Function($$KnowledgeItemsTableFilterComposer f) f,
  ) {
    final $$KnowledgeItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.knowledgeItems,
      getReferencedColumn: (t) => t.topicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeItemsTableFilterComposer(
            $db: $db,
            $table: $db.knowledgeItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> questionsRefs(
    Expression<bool> Function($$QuestionsTableFilterComposer f) f,
  ) {
    final $$QuestionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.questions,
      getReferencedColumn: (t) => t.topicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionsTableFilterComposer(
            $db: $db,
            $table: $db.questions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TopicsTableOrderingComposer
    extends Composer<_$AppDatabase, $TopicsTable> {
  $$TopicsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ChaptersTableOrderingComposer get chapterId {
    final $$ChaptersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chapterId,
      referencedTable: $db.chapters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableOrderingComposer(
            $db: $db,
            $table: $db.chapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TopicsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TopicsTable> {
  $$TopicsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$ChaptersTableAnnotationComposer get chapterId {
    final $$ChaptersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chapterId,
      referencedTable: $db.chapters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableAnnotationComposer(
            $db: $db,
            $table: $db.chapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> competenciesRefs<T extends Object>(
    Expression<T> Function($$CompetenciesTableAnnotationComposer a) f,
  ) {
    final $$CompetenciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.competencies,
      getReferencedColumn: (t) => t.topicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompetenciesTableAnnotationComposer(
            $db: $db,
            $table: $db.competencies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> knowledgeItemsRefs<T extends Object>(
    Expression<T> Function($$KnowledgeItemsTableAnnotationComposer a) f,
  ) {
    final $$KnowledgeItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.knowledgeItems,
      getReferencedColumn: (t) => t.topicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.knowledgeItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> questionsRefs<T extends Object>(
    Expression<T> Function($$QuestionsTableAnnotationComposer a) f,
  ) {
    final $$QuestionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.questions,
      getReferencedColumn: (t) => t.topicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionsTableAnnotationComposer(
            $db: $db,
            $table: $db.questions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TopicsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TopicsTable,
          Topic,
          $$TopicsTableFilterComposer,
          $$TopicsTableOrderingComposer,
          $$TopicsTableAnnotationComposer,
          $$TopicsTableCreateCompanionBuilder,
          $$TopicsTableUpdateCompanionBuilder,
          (Topic, $$TopicsTableReferences),
          Topic,
          PrefetchHooks Function({
            bool chapterId,
            bool competenciesRefs,
            bool knowledgeItemsRefs,
            bool questionsRefs,
          })
        > {
  $$TopicsTableTableManager(_$AppDatabase db, $TopicsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TopicsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TopicsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TopicsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> chapterId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TopicsCompanion(
                id: id,
                chapterId: chapterId,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String chapterId,
                required String name,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TopicsCompanion.insert(
                id: id,
                chapterId: chapterId,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TopicsTable, Topic>(table),
                  $$TopicsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                chapterId = false,
                competenciesRefs = false,
                knowledgeItemsRefs = false,
                questionsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (competenciesRefs) db.competencies,
                    if (knowledgeItemsRefs) db.knowledgeItems,
                    if (questionsRefs) db.questions,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (chapterId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.chapterId,
                            referencedTable: $$TopicsTableReferences
                                ._chapterIdTable(db),
                            referencedColumn: $$TopicsTableReferences
                                ._chapterIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (competenciesRefs)
                        await $_getPrefetchedDataByColumns<
                          Topic,
                          $TopicsTable,
                          Competency,
                          $CompetenciesTable
                        >(
                          currentTable: table,
                          referencedTable: $$TopicsTableReferences
                              ._competenciesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TopicsTableReferences(
                                db,
                                table,
                                p0,
                              ).competenciesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'topic_id',
                          typedResults: items,
                        ),
                      if (knowledgeItemsRefs)
                        await $_getPrefetchedDataByColumns<
                          Topic,
                          $TopicsTable,
                          KnowledgeItem,
                          $KnowledgeItemsTable
                        >(
                          currentTable: table,
                          referencedTable: $$TopicsTableReferences
                              ._knowledgeItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TopicsTableReferences(
                                db,
                                table,
                                p0,
                              ).knowledgeItemsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'topic_id',
                          typedResults: items,
                        ),
                      if (questionsRefs)
                        await $_getPrefetchedDataByColumns<
                          Topic,
                          $TopicsTable,
                          Question,
                          $QuestionsTable
                        >(
                          currentTable: table,
                          referencedTable: $$TopicsTableReferences
                              ._questionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TopicsTableReferences(
                                db,
                                table,
                                p0,
                              ).questionsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'topic_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TopicsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TopicsTable,
      Topic,
      $$TopicsTableFilterComposer,
      $$TopicsTableOrderingComposer,
      $$TopicsTableAnnotationComposer,
      $$TopicsTableCreateCompanionBuilder,
      $$TopicsTableUpdateCompanionBuilder,
      (Topic, $$TopicsTableReferences),
      Topic,
      PrefetchHooks Function({
        bool chapterId,
        bool competenciesRefs,
        bool knowledgeItemsRefs,
        bool questionsRefs,
      })
    >;
typedef $$CompetenciesTableCreateCompanionBuilder =
    CompetenciesCompanion Function({
      required String id,
      required String topicId,
      required String description,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$CompetenciesTableUpdateCompanionBuilder =
    CompetenciesCompanion Function({
      Value<String> id,
      Value<String> topicId,
      Value<String> description,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

final class $$CompetenciesTableReferences
    extends BaseReferences<_$AppDatabase, $CompetenciesTable, Competency> {
  $$CompetenciesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TopicsTable _topicIdTable(_$AppDatabase db) =>
      db.topics.createAlias('competencies__topic_id__topics__id');

  $$TopicsTableProcessedTableManager get topicId {
    final $_column = $_itemColumn<String>('topic_id')!;

    final manager = $$TopicsTableTableManager(
      $_db,
      $_db.topics,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_topicIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$MasteryRecordsTable, List<MasteryRecord>>
  _masteryRecordsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.masteryRecords,
    aliasName: 'competencies__id__mastery_records__competency_id',
  );

  $$MasteryRecordsTableProcessedTableManager get masteryRecordsRefs {
    final manager = $$MasteryRecordsTableTableManager(
      $_db,
      $_db.masteryRecords,
    ).filter((f) => f.competencyId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_masteryRecordsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CompetenciesTableFilterComposer
    extends Composer<_$AppDatabase, $CompetenciesTable> {
  $$CompetenciesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TopicsTableFilterComposer get topicId {
    final $$TopicsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableFilterComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> masteryRecordsRefs(
    Expression<bool> Function($$MasteryRecordsTableFilterComposer f) f,
  ) {
    final $$MasteryRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.masteryRecords,
      getReferencedColumn: (t) => t.competencyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MasteryRecordsTableFilterComposer(
            $db: $db,
            $table: $db.masteryRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CompetenciesTableOrderingComposer
    extends Composer<_$AppDatabase, $CompetenciesTable> {
  $$CompetenciesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TopicsTableOrderingComposer get topicId {
    final $$TopicsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableOrderingComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CompetenciesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CompetenciesTable> {
  $$CompetenciesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$TopicsTableAnnotationComposer get topicId {
    final $$TopicsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableAnnotationComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> masteryRecordsRefs<T extends Object>(
    Expression<T> Function($$MasteryRecordsTableAnnotationComposer a) f,
  ) {
    final $$MasteryRecordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.masteryRecords,
      getReferencedColumn: (t) => t.competencyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MasteryRecordsTableAnnotationComposer(
            $db: $db,
            $table: $db.masteryRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CompetenciesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CompetenciesTable,
          Competency,
          $$CompetenciesTableFilterComposer,
          $$CompetenciesTableOrderingComposer,
          $$CompetenciesTableAnnotationComposer,
          $$CompetenciesTableCreateCompanionBuilder,
          $$CompetenciesTableUpdateCompanionBuilder,
          (Competency, $$CompetenciesTableReferences),
          Competency,
          PrefetchHooks Function({bool topicId, bool masteryRecordsRefs})
        > {
  $$CompetenciesTableTableManager(_$AppDatabase db, $CompetenciesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CompetenciesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CompetenciesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CompetenciesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> topicId = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CompetenciesCompanion(
                id: id,
                topicId: topicId,
                description: description,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String topicId,
                required String description,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CompetenciesCompanion.insert(
                id: id,
                topicId: topicId,
                description: description,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CompetenciesTable, Competency>(table),
                  $$CompetenciesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({topicId = false, masteryRecordsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (masteryRecordsRefs) db.masteryRecords,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (topicId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.topicId,
                            referencedTable: $$CompetenciesTableReferences
                                ._topicIdTable(db),
                            referencedColumn: $$CompetenciesTableReferences
                                ._topicIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (masteryRecordsRefs)
                        await $_getPrefetchedDataByColumns<
                          Competency,
                          $CompetenciesTable,
                          MasteryRecord,
                          $MasteryRecordsTable
                        >(
                          currentTable: table,
                          referencedTable: $$CompetenciesTableReferences
                              ._masteryRecordsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CompetenciesTableReferences(
                                db,
                                table,
                                p0,
                              ).masteryRecordsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'competency_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CompetenciesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CompetenciesTable,
      Competency,
      $$CompetenciesTableFilterComposer,
      $$CompetenciesTableOrderingComposer,
      $$CompetenciesTableAnnotationComposer,
      $$CompetenciesTableCreateCompanionBuilder,
      $$CompetenciesTableUpdateCompanionBuilder,
      (Competency, $$CompetenciesTableReferences),
      Competency,
      PrefetchHooks Function({bool topicId, bool masteryRecordsRefs})
    >;
typedef $$SourceDocumentsTableCreateCompanionBuilder =
    SourceDocumentsCompanion Function({
      required String id,
      required String title,
      required String filePath,
      required String fileHash,
      required String fileType,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$SourceDocumentsTableUpdateCompanionBuilder =
    SourceDocumentsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> filePath,
      Value<String> fileHash,
      Value<String> fileType,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

final class $$SourceDocumentsTableReferences
    extends
        BaseReferences<_$AppDatabase, $SourceDocumentsTable, SourceDocument> {
  $$SourceDocumentsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$DocumentVersionsTable, List<DocumentVersion>>
  _documentVersionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.documentVersions,
    aliasName: 'source_documents__id__document_versions__document_id',
  );

  $$DocumentVersionsTableProcessedTableManager get documentVersionsRefs {
    final manager = $$DocumentVersionsTableTableManager(
      $_db,
      $_db.documentVersions,
    ).filter((f) => f.documentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _documentVersionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SourceDocumentsTableFilterComposer
    extends Composer<_$AppDatabase, $SourceDocumentsTable> {
  $$SourceDocumentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileHash => $composableBuilder(
    column: $table.fileHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileType => $composableBuilder(
    column: $table.fileType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> documentVersionsRefs(
    Expression<bool> Function($$DocumentVersionsTableFilterComposer f) f,
  ) {
    final $$DocumentVersionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.documentVersions,
      getReferencedColumn: (t) => t.documentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentVersionsTableFilterComposer(
            $db: $db,
            $table: $db.documentVersions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SourceDocumentsTableOrderingComposer
    extends Composer<_$AppDatabase, $SourceDocumentsTable> {
  $$SourceDocumentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileHash => $composableBuilder(
    column: $table.fileHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileType => $composableBuilder(
    column: $table.fileType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SourceDocumentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SourceDocumentsTable> {
  $$SourceDocumentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get fileHash =>
      $composableBuilder(column: $table.fileHash, builder: (column) => column);

  GeneratedColumn<String> get fileType =>
      $composableBuilder(column: $table.fileType, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  Expression<T> documentVersionsRefs<T extends Object>(
    Expression<T> Function($$DocumentVersionsTableAnnotationComposer a) f,
  ) {
    final $$DocumentVersionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.documentVersions,
      getReferencedColumn: (t) => t.documentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentVersionsTableAnnotationComposer(
            $db: $db,
            $table: $db.documentVersions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SourceDocumentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SourceDocumentsTable,
          SourceDocument,
          $$SourceDocumentsTableFilterComposer,
          $$SourceDocumentsTableOrderingComposer,
          $$SourceDocumentsTableAnnotationComposer,
          $$SourceDocumentsTableCreateCompanionBuilder,
          $$SourceDocumentsTableUpdateCompanionBuilder,
          (SourceDocument, $$SourceDocumentsTableReferences),
          SourceDocument,
          PrefetchHooks Function({bool documentVersionsRefs})
        > {
  $$SourceDocumentsTableTableManager(
    _$AppDatabase db,
    $SourceDocumentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SourceDocumentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SourceDocumentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SourceDocumentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> filePath = const Value.absent(),
                Value<String> fileHash = const Value.absent(),
                Value<String> fileType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SourceDocumentsCompanion(
                id: id,
                title: title,
                filePath: filePath,
                fileHash: fileHash,
                fileType: fileType,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String filePath,
                required String fileHash,
                required String fileType,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SourceDocumentsCompanion.insert(
                id: id,
                title: title,
                filePath: filePath,
                fileHash: fileHash,
                fileType: fileType,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SourceDocumentsTable, SourceDocument>(table),
                  $$SourceDocumentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({documentVersionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (documentVersionsRefs) db.documentVersions,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (documentVersionsRefs)
                    await $_getPrefetchedDataByColumns<
                      SourceDocument,
                      $SourceDocumentsTable,
                      DocumentVersion,
                      $DocumentVersionsTable
                    >(
                      currentTable: table,
                      referencedTable: $$SourceDocumentsTableReferences
                          ._documentVersionsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SourceDocumentsTableReferences(
                            db,
                            table,
                            p0,
                          ).documentVersionsRefs,
                      currentColumn: 'id',
                      referencedColumn: 'document_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SourceDocumentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SourceDocumentsTable,
      SourceDocument,
      $$SourceDocumentsTableFilterComposer,
      $$SourceDocumentsTableOrderingComposer,
      $$SourceDocumentsTableAnnotationComposer,
      $$SourceDocumentsTableCreateCompanionBuilder,
      $$SourceDocumentsTableUpdateCompanionBuilder,
      (SourceDocument, $$SourceDocumentsTableReferences),
      SourceDocument,
      PrefetchHooks Function({bool documentVersionsRefs})
    >;
typedef $$DocumentVersionsTableCreateCompanionBuilder =
    DocumentVersionsCompanion Function({
      required String id,
      required String documentId,
      required int versionNumber,
      Value<DateTime> extractedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$DocumentVersionsTableUpdateCompanionBuilder =
    DocumentVersionsCompanion Function({
      Value<String> id,
      Value<String> documentId,
      Value<int> versionNumber,
      Value<DateTime> extractedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

final class $$DocumentVersionsTableReferences
    extends
        BaseReferences<_$AppDatabase, $DocumentVersionsTable, DocumentVersion> {
  $$DocumentVersionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SourceDocumentsTable _documentIdTable(_$AppDatabase db) => db
      .sourceDocuments
      .createAlias('document_versions__document_id__source_documents__id');

  $$SourceDocumentsTableProcessedTableManager get documentId {
    final $_column = $_itemColumn<String>('document_id')!;

    final manager = $$SourceDocumentsTableTableManager(
      $_db,
      $_db.sourceDocuments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_documentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DocumentChunksTable, List<DocumentChunk>>
  _documentChunksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.documentChunks,
    aliasName: 'document_versions__id__document_chunks__version_id',
  );

  $$DocumentChunksTableProcessedTableManager get documentChunksRefs {
    final manager = $$DocumentChunksTableTableManager(
      $_db,
      $_db.documentChunks,
    ).filter((f) => f.versionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_documentChunksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DocumentVersionsTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentVersionsTable> {
  $$DocumentVersionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get versionNumber => $composableBuilder(
    column: $table.versionNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get extractedAt => $composableBuilder(
    column: $table.extractedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SourceDocumentsTableFilterComposer get documentId {
    final $$SourceDocumentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.documentId,
      referencedTable: $db.sourceDocuments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourceDocumentsTableFilterComposer(
            $db: $db,
            $table: $db.sourceDocuments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> documentChunksRefs(
    Expression<bool> Function($$DocumentChunksTableFilterComposer f) f,
  ) {
    final $$DocumentChunksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.documentChunks,
      getReferencedColumn: (t) => t.versionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentChunksTableFilterComposer(
            $db: $db,
            $table: $db.documentChunks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DocumentVersionsTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentVersionsTable> {
  $$DocumentVersionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get versionNumber => $composableBuilder(
    column: $table.versionNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get extractedAt => $composableBuilder(
    column: $table.extractedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SourceDocumentsTableOrderingComposer get documentId {
    final $$SourceDocumentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.documentId,
      referencedTable: $db.sourceDocuments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourceDocumentsTableOrderingComposer(
            $db: $db,
            $table: $db.sourceDocuments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DocumentVersionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentVersionsTable> {
  $$DocumentVersionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get versionNumber => $composableBuilder(
    column: $table.versionNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get extractedAt => $composableBuilder(
    column: $table.extractedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$SourceDocumentsTableAnnotationComposer get documentId {
    final $$SourceDocumentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.documentId,
      referencedTable: $db.sourceDocuments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourceDocumentsTableAnnotationComposer(
            $db: $db,
            $table: $db.sourceDocuments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> documentChunksRefs<T extends Object>(
    Expression<T> Function($$DocumentChunksTableAnnotationComposer a) f,
  ) {
    final $$DocumentChunksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.documentChunks,
      getReferencedColumn: (t) => t.versionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentChunksTableAnnotationComposer(
            $db: $db,
            $table: $db.documentChunks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DocumentVersionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DocumentVersionsTable,
          DocumentVersion,
          $$DocumentVersionsTableFilterComposer,
          $$DocumentVersionsTableOrderingComposer,
          $$DocumentVersionsTableAnnotationComposer,
          $$DocumentVersionsTableCreateCompanionBuilder,
          $$DocumentVersionsTableUpdateCompanionBuilder,
          (DocumentVersion, $$DocumentVersionsTableReferences),
          DocumentVersion,
          PrefetchHooks Function({bool documentId, bool documentChunksRefs})
        > {
  $$DocumentVersionsTableTableManager(
    _$AppDatabase db,
    $DocumentVersionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentVersionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentVersionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentVersionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> documentId = const Value.absent(),
                Value<int> versionNumber = const Value.absent(),
                Value<DateTime> extractedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DocumentVersionsCompanion(
                id: id,
                documentId: documentId,
                versionNumber: versionNumber,
                extractedAt: extractedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String documentId,
                required int versionNumber,
                Value<DateTime> extractedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DocumentVersionsCompanion.insert(
                id: id,
                documentId: documentId,
                versionNumber: versionNumber,
                extractedAt: extractedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DocumentVersionsTable, DocumentVersion>(table),
                  $$DocumentVersionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({documentId = false, documentChunksRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (documentChunksRefs) db.documentChunks,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (documentId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.documentId,
                            referencedTable: $$DocumentVersionsTableReferences
                                ._documentIdTable(db),
                            referencedColumn: $$DocumentVersionsTableReferences
                                ._documentIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (documentChunksRefs)
                        await $_getPrefetchedDataByColumns<
                          DocumentVersion,
                          $DocumentVersionsTable,
                          DocumentChunk,
                          $DocumentChunksTable
                        >(
                          currentTable: table,
                          referencedTable: $$DocumentVersionsTableReferences
                              ._documentChunksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DocumentVersionsTableReferences(
                                db,
                                table,
                                p0,
                              ).documentChunksRefs,
                          currentColumn: 'id',
                          referencedColumn: 'version_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DocumentVersionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DocumentVersionsTable,
      DocumentVersion,
      $$DocumentVersionsTableFilterComposer,
      $$DocumentVersionsTableOrderingComposer,
      $$DocumentVersionsTableAnnotationComposer,
      $$DocumentVersionsTableCreateCompanionBuilder,
      $$DocumentVersionsTableUpdateCompanionBuilder,
      (DocumentVersion, $$DocumentVersionsTableReferences),
      DocumentVersion,
      PrefetchHooks Function({bool documentId, bool documentChunksRefs})
    >;
typedef $$DocumentChunksTableCreateCompanionBuilder =
    DocumentChunksCompanion Function({
      required String id,
      required String versionId,
      Value<int?> pageNumber,
      required int sequence,
      required String textContent,
      required String locator,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$DocumentChunksTableUpdateCompanionBuilder =
    DocumentChunksCompanion Function({
      Value<String> id,
      Value<String> versionId,
      Value<int?> pageNumber,
      Value<int> sequence,
      Value<String> textContent,
      Value<String> locator,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

final class $$DocumentChunksTableReferences
    extends BaseReferences<_$AppDatabase, $DocumentChunksTable, DocumentChunk> {
  $$DocumentChunksTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DocumentVersionsTable _versionIdTable(_$AppDatabase db) => db
      .documentVersions
      .createAlias('document_chunks__version_id__document_versions__id');

  $$DocumentVersionsTableProcessedTableManager get versionId {
    final $_column = $_itemColumn<String>('version_id')!;

    final manager = $$DocumentVersionsTableTableManager(
      $_db,
      $_db.documentVersions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_versionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$KnowledgeItemsTable, List<KnowledgeItem>>
  _knowledgeItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.knowledgeItems,
    aliasName: 'document_chunks__id__knowledge_items__source_chunk_id',
  );

  $$KnowledgeItemsTableProcessedTableManager get knowledgeItemsRefs {
    final manager = $$KnowledgeItemsTableTableManager(
      $_db,
      $_db.knowledgeItems,
    ).filter((f) => f.sourceChunkId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_knowledgeItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$KnowledgeSourcesTable, List<KnowledgeSource>>
  _knowledgeSourcesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.knowledgeSources,
    aliasName: 'document_chunks__id__knowledge_sources__chunk_id',
  );

  $$KnowledgeSourcesTableProcessedTableManager get knowledgeSourcesRefs {
    final manager = $$KnowledgeSourcesTableTableManager(
      $_db,
      $_db.knowledgeSources,
    ).filter((f) => f.chunkId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _knowledgeSourcesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DocumentChunksTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentChunksTable> {
  $$DocumentChunksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pageNumber => $composableBuilder(
    column: $table.pageNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sequence => $composableBuilder(
    column: $table.sequence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locator => $composableBuilder(
    column: $table.locator,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DocumentVersionsTableFilterComposer get versionId {
    final $$DocumentVersionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.versionId,
      referencedTable: $db.documentVersions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentVersionsTableFilterComposer(
            $db: $db,
            $table: $db.documentVersions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> knowledgeItemsRefs(
    Expression<bool> Function($$KnowledgeItemsTableFilterComposer f) f,
  ) {
    final $$KnowledgeItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.knowledgeItems,
      getReferencedColumn: (t) => t.sourceChunkId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeItemsTableFilterComposer(
            $db: $db,
            $table: $db.knowledgeItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> knowledgeSourcesRefs(
    Expression<bool> Function($$KnowledgeSourcesTableFilterComposer f) f,
  ) {
    final $$KnowledgeSourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.knowledgeSources,
      getReferencedColumn: (t) => t.chunkId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeSourcesTableFilterComposer(
            $db: $db,
            $table: $db.knowledgeSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DocumentChunksTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentChunksTable> {
  $$DocumentChunksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pageNumber => $composableBuilder(
    column: $table.pageNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sequence => $composableBuilder(
    column: $table.sequence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locator => $composableBuilder(
    column: $table.locator,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DocumentVersionsTableOrderingComposer get versionId {
    final $$DocumentVersionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.versionId,
      referencedTable: $db.documentVersions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentVersionsTableOrderingComposer(
            $db: $db,
            $table: $db.documentVersions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DocumentChunksTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentChunksTable> {
  $$DocumentChunksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get pageNumber => $composableBuilder(
    column: $table.pageNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sequence =>
      $composableBuilder(column: $table.sequence, builder: (column) => column);

  GeneratedColumn<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => column,
  );

  GeneratedColumn<String> get locator =>
      $composableBuilder(column: $table.locator, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$DocumentVersionsTableAnnotationComposer get versionId {
    final $$DocumentVersionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.versionId,
      referencedTable: $db.documentVersions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentVersionsTableAnnotationComposer(
            $db: $db,
            $table: $db.documentVersions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> knowledgeItemsRefs<T extends Object>(
    Expression<T> Function($$KnowledgeItemsTableAnnotationComposer a) f,
  ) {
    final $$KnowledgeItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.knowledgeItems,
      getReferencedColumn: (t) => t.sourceChunkId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.knowledgeItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> knowledgeSourcesRefs<T extends Object>(
    Expression<T> Function($$KnowledgeSourcesTableAnnotationComposer a) f,
  ) {
    final $$KnowledgeSourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.knowledgeSources,
      getReferencedColumn: (t) => t.chunkId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeSourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.knowledgeSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DocumentChunksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DocumentChunksTable,
          DocumentChunk,
          $$DocumentChunksTableFilterComposer,
          $$DocumentChunksTableOrderingComposer,
          $$DocumentChunksTableAnnotationComposer,
          $$DocumentChunksTableCreateCompanionBuilder,
          $$DocumentChunksTableUpdateCompanionBuilder,
          (DocumentChunk, $$DocumentChunksTableReferences),
          DocumentChunk,
          PrefetchHooks Function({
            bool versionId,
            bool knowledgeItemsRefs,
            bool knowledgeSourcesRefs,
          })
        > {
  $$DocumentChunksTableTableManager(
    _$AppDatabase db,
    $DocumentChunksTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentChunksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentChunksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentChunksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> versionId = const Value.absent(),
                Value<int?> pageNumber = const Value.absent(),
                Value<int> sequence = const Value.absent(),
                Value<String> textContent = const Value.absent(),
                Value<String> locator = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DocumentChunksCompanion(
                id: id,
                versionId: versionId,
                pageNumber: pageNumber,
                sequence: sequence,
                textContent: textContent,
                locator: locator,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String versionId,
                Value<int?> pageNumber = const Value.absent(),
                required int sequence,
                required String textContent,
                required String locator,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DocumentChunksCompanion.insert(
                id: id,
                versionId: versionId,
                pageNumber: pageNumber,
                sequence: sequence,
                textContent: textContent,
                locator: locator,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DocumentChunksTable, DocumentChunk>(table),
                  $$DocumentChunksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                versionId = false,
                knowledgeItemsRefs = false,
                knowledgeSourcesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (knowledgeItemsRefs) db.knowledgeItems,
                    if (knowledgeSourcesRefs) db.knowledgeSources,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (versionId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.versionId,
                            referencedTable: $$DocumentChunksTableReferences
                                ._versionIdTable(db),
                            referencedColumn: $$DocumentChunksTableReferences
                                ._versionIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (knowledgeItemsRefs)
                        await $_getPrefetchedDataByColumns<
                          DocumentChunk,
                          $DocumentChunksTable,
                          KnowledgeItem,
                          $KnowledgeItemsTable
                        >(
                          currentTable: table,
                          referencedTable: $$DocumentChunksTableReferences
                              ._knowledgeItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DocumentChunksTableReferences(
                                db,
                                table,
                                p0,
                              ).knowledgeItemsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'source_chunk_id',
                          typedResults: items,
                        ),
                      if (knowledgeSourcesRefs)
                        await $_getPrefetchedDataByColumns<
                          DocumentChunk,
                          $DocumentChunksTable,
                          KnowledgeSource,
                          $KnowledgeSourcesTable
                        >(
                          currentTable: table,
                          referencedTable: $$DocumentChunksTableReferences
                              ._knowledgeSourcesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DocumentChunksTableReferences(
                                db,
                                table,
                                p0,
                              ).knowledgeSourcesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'chunk_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DocumentChunksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DocumentChunksTable,
      DocumentChunk,
      $$DocumentChunksTableFilterComposer,
      $$DocumentChunksTableOrderingComposer,
      $$DocumentChunksTableAnnotationComposer,
      $$DocumentChunksTableCreateCompanionBuilder,
      $$DocumentChunksTableUpdateCompanionBuilder,
      (DocumentChunk, $$DocumentChunksTableReferences),
      DocumentChunk,
      PrefetchHooks Function({
        bool versionId,
        bool knowledgeItemsRefs,
        bool knowledgeSourcesRefs,
      })
    >;
typedef $$KnowledgeItemsTableCreateCompanionBuilder =
    KnowledgeItemsCompanion Function({
      required String id,
      required String topicId,
      required String type,
      required String content,
      Value<String> status,
      Value<String?> sourceChunkId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$KnowledgeItemsTableUpdateCompanionBuilder =
    KnowledgeItemsCompanion Function({
      Value<String> id,
      Value<String> topicId,
      Value<String> type,
      Value<String> content,
      Value<String> status,
      Value<String?> sourceChunkId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

final class $$KnowledgeItemsTableReferences
    extends BaseReferences<_$AppDatabase, $KnowledgeItemsTable, KnowledgeItem> {
  $$KnowledgeItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TopicsTable _topicIdTable(_$AppDatabase db) =>
      db.topics.createAlias('knowledge_items__topic_id__topics__id');

  $$TopicsTableProcessedTableManager get topicId {
    final $_column = $_itemColumn<String>('topic_id')!;

    final manager = $$TopicsTableTableManager(
      $_db,
      $_db.topics,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_topicIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DocumentChunksTable _sourceChunkIdTable(_$AppDatabase db) => db
      .documentChunks
      .createAlias('knowledge_items__source_chunk_id__document_chunks__id');

  $$DocumentChunksTableProcessedTableManager? get sourceChunkId {
    final $_column = $_itemColumn<String>('source_chunk_id');
    if ($_column == null) return null;
    final manager = $$DocumentChunksTableTableManager(
      $_db,
      $_db.documentChunks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceChunkIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$KnowledgeSourcesTable, List<KnowledgeSource>>
  _knowledgeSourcesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.knowledgeSources,
    aliasName: 'knowledge_items__id__knowledge_sources__knowledge_id',
  );

  $$KnowledgeSourcesTableProcessedTableManager get knowledgeSourcesRefs {
    final manager = $$KnowledgeSourcesTableTableManager(
      $_db,
      $_db.knowledgeSources,
    ).filter((f) => f.knowledgeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _knowledgeSourcesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$KnowledgeItemsTableFilterComposer
    extends Composer<_$AppDatabase, $KnowledgeItemsTable> {
  $$KnowledgeItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TopicsTableFilterComposer get topicId {
    final $$TopicsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableFilterComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DocumentChunksTableFilterComposer get sourceChunkId {
    final $$DocumentChunksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceChunkId,
      referencedTable: $db.documentChunks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentChunksTableFilterComposer(
            $db: $db,
            $table: $db.documentChunks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> knowledgeSourcesRefs(
    Expression<bool> Function($$KnowledgeSourcesTableFilterComposer f) f,
  ) {
    final $$KnowledgeSourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.knowledgeSources,
      getReferencedColumn: (t) => t.knowledgeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeSourcesTableFilterComposer(
            $db: $db,
            $table: $db.knowledgeSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$KnowledgeItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $KnowledgeItemsTable> {
  $$KnowledgeItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TopicsTableOrderingComposer get topicId {
    final $$TopicsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableOrderingComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DocumentChunksTableOrderingComposer get sourceChunkId {
    final $$DocumentChunksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceChunkId,
      referencedTable: $db.documentChunks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentChunksTableOrderingComposer(
            $db: $db,
            $table: $db.documentChunks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$KnowledgeItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $KnowledgeItemsTable> {
  $$KnowledgeItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$TopicsTableAnnotationComposer get topicId {
    final $$TopicsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableAnnotationComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DocumentChunksTableAnnotationComposer get sourceChunkId {
    final $$DocumentChunksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceChunkId,
      referencedTable: $db.documentChunks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentChunksTableAnnotationComposer(
            $db: $db,
            $table: $db.documentChunks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> knowledgeSourcesRefs<T extends Object>(
    Expression<T> Function($$KnowledgeSourcesTableAnnotationComposer a) f,
  ) {
    final $$KnowledgeSourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.knowledgeSources,
      getReferencedColumn: (t) => t.knowledgeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeSourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.knowledgeSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$KnowledgeItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $KnowledgeItemsTable,
          KnowledgeItem,
          $$KnowledgeItemsTableFilterComposer,
          $$KnowledgeItemsTableOrderingComposer,
          $$KnowledgeItemsTableAnnotationComposer,
          $$KnowledgeItemsTableCreateCompanionBuilder,
          $$KnowledgeItemsTableUpdateCompanionBuilder,
          (KnowledgeItem, $$KnowledgeItemsTableReferences),
          KnowledgeItem,
          PrefetchHooks Function({
            bool topicId,
            bool sourceChunkId,
            bool knowledgeSourcesRefs,
          })
        > {
  $$KnowledgeItemsTableTableManager(
    _$AppDatabase db,
    $KnowledgeItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KnowledgeItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KnowledgeItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KnowledgeItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> topicId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> sourceChunkId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => KnowledgeItemsCompanion(
                id: id,
                topicId: topicId,
                type: type,
                content: content,
                status: status,
                sourceChunkId: sourceChunkId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String topicId,
                required String type,
                required String content,
                Value<String> status = const Value.absent(),
                Value<String?> sourceChunkId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => KnowledgeItemsCompanion.insert(
                id: id,
                topicId: topicId,
                type: type,
                content: content,
                status: status,
                sourceChunkId: sourceChunkId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$KnowledgeItemsTable, KnowledgeItem>(table),
                  $$KnowledgeItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                topicId = false,
                sourceChunkId = false,
                knowledgeSourcesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (knowledgeSourcesRefs) db.knowledgeSources,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (topicId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.topicId,
                            referencedTable: $$KnowledgeItemsTableReferences
                                ._topicIdTable(db),
                            referencedColumn: $$KnowledgeItemsTableReferences
                                ._topicIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (sourceChunkId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.sourceChunkId,
                            referencedTable: $$KnowledgeItemsTableReferences
                                ._sourceChunkIdTable(db),
                            referencedColumn: $$KnowledgeItemsTableReferences
                                ._sourceChunkIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (knowledgeSourcesRefs)
                        await $_getPrefetchedDataByColumns<
                          KnowledgeItem,
                          $KnowledgeItemsTable,
                          KnowledgeSource,
                          $KnowledgeSourcesTable
                        >(
                          currentTable: table,
                          referencedTable: $$KnowledgeItemsTableReferences
                              ._knowledgeSourcesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$KnowledgeItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).knowledgeSourcesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'knowledge_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$KnowledgeItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $KnowledgeItemsTable,
      KnowledgeItem,
      $$KnowledgeItemsTableFilterComposer,
      $$KnowledgeItemsTableOrderingComposer,
      $$KnowledgeItemsTableAnnotationComposer,
      $$KnowledgeItemsTableCreateCompanionBuilder,
      $$KnowledgeItemsTableUpdateCompanionBuilder,
      (KnowledgeItem, $$KnowledgeItemsTableReferences),
      KnowledgeItem,
      PrefetchHooks Function({
        bool topicId,
        bool sourceChunkId,
        bool knowledgeSourcesRefs,
      })
    >;
typedef $$KnowledgeSourcesTableCreateCompanionBuilder =
    KnowledgeSourcesCompanion Function({
      required String id,
      required String knowledgeId,
      required String chunkId,
      required String quote,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$KnowledgeSourcesTableUpdateCompanionBuilder =
    KnowledgeSourcesCompanion Function({
      Value<String> id,
      Value<String> knowledgeId,
      Value<String> chunkId,
      Value<String> quote,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

final class $$KnowledgeSourcesTableReferences
    extends
        BaseReferences<_$AppDatabase, $KnowledgeSourcesTable, KnowledgeSource> {
  $$KnowledgeSourcesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $KnowledgeItemsTable _knowledgeIdTable(_$AppDatabase db) => db
      .knowledgeItems
      .createAlias('knowledge_sources__knowledge_id__knowledge_items__id');

  $$KnowledgeItemsTableProcessedTableManager get knowledgeId {
    final $_column = $_itemColumn<String>('knowledge_id')!;

    final manager = $$KnowledgeItemsTableTableManager(
      $_db,
      $_db.knowledgeItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_knowledgeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DocumentChunksTable _chunkIdTable(_$AppDatabase db) => db
      .documentChunks
      .createAlias('knowledge_sources__chunk_id__document_chunks__id');

  $$DocumentChunksTableProcessedTableManager get chunkId {
    final $_column = $_itemColumn<String>('chunk_id')!;

    final manager = $$DocumentChunksTableTableManager(
      $_db,
      $_db.documentChunks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_chunkIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$KnowledgeSourcesTableFilterComposer
    extends Composer<_$AppDatabase, $KnowledgeSourcesTable> {
  $$KnowledgeSourcesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quote => $composableBuilder(
    column: $table.quote,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$KnowledgeItemsTableFilterComposer get knowledgeId {
    final $$KnowledgeItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.knowledgeId,
      referencedTable: $db.knowledgeItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeItemsTableFilterComposer(
            $db: $db,
            $table: $db.knowledgeItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DocumentChunksTableFilterComposer get chunkId {
    final $$DocumentChunksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chunkId,
      referencedTable: $db.documentChunks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentChunksTableFilterComposer(
            $db: $db,
            $table: $db.documentChunks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$KnowledgeSourcesTableOrderingComposer
    extends Composer<_$AppDatabase, $KnowledgeSourcesTable> {
  $$KnowledgeSourcesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quote => $composableBuilder(
    column: $table.quote,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$KnowledgeItemsTableOrderingComposer get knowledgeId {
    final $$KnowledgeItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.knowledgeId,
      referencedTable: $db.knowledgeItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeItemsTableOrderingComposer(
            $db: $db,
            $table: $db.knowledgeItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DocumentChunksTableOrderingComposer get chunkId {
    final $$DocumentChunksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chunkId,
      referencedTable: $db.documentChunks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentChunksTableOrderingComposer(
            $db: $db,
            $table: $db.documentChunks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$KnowledgeSourcesTableAnnotationComposer
    extends Composer<_$AppDatabase, $KnowledgeSourcesTable> {
  $$KnowledgeSourcesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get quote =>
      $composableBuilder(column: $table.quote, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$KnowledgeItemsTableAnnotationComposer get knowledgeId {
    final $$KnowledgeItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.knowledgeId,
      referencedTable: $db.knowledgeItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.knowledgeItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DocumentChunksTableAnnotationComposer get chunkId {
    final $$DocumentChunksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chunkId,
      referencedTable: $db.documentChunks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentChunksTableAnnotationComposer(
            $db: $db,
            $table: $db.documentChunks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$KnowledgeSourcesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $KnowledgeSourcesTable,
          KnowledgeSource,
          $$KnowledgeSourcesTableFilterComposer,
          $$KnowledgeSourcesTableOrderingComposer,
          $$KnowledgeSourcesTableAnnotationComposer,
          $$KnowledgeSourcesTableCreateCompanionBuilder,
          $$KnowledgeSourcesTableUpdateCompanionBuilder,
          (KnowledgeSource, $$KnowledgeSourcesTableReferences),
          KnowledgeSource,
          PrefetchHooks Function({bool knowledgeId, bool chunkId})
        > {
  $$KnowledgeSourcesTableTableManager(
    _$AppDatabase db,
    $KnowledgeSourcesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KnowledgeSourcesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KnowledgeSourcesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KnowledgeSourcesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> knowledgeId = const Value.absent(),
                Value<String> chunkId = const Value.absent(),
                Value<String> quote = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => KnowledgeSourcesCompanion(
                id: id,
                knowledgeId: knowledgeId,
                chunkId: chunkId,
                quote: quote,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String knowledgeId,
                required String chunkId,
                required String quote,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => KnowledgeSourcesCompanion.insert(
                id: id,
                knowledgeId: knowledgeId,
                chunkId: chunkId,
                quote: quote,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$KnowledgeSourcesTable, KnowledgeSource>(table),
                  $$KnowledgeSourcesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({knowledgeId = false, chunkId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (knowledgeId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.knowledgeId,
                        referencedTable: $$KnowledgeSourcesTableReferences
                            ._knowledgeIdTable(db),
                        referencedColumn: $$KnowledgeSourcesTableReferences
                            ._knowledgeIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (chunkId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.chunkId,
                        referencedTable: $$KnowledgeSourcesTableReferences
                            ._chunkIdTable(db),
                        referencedColumn: $$KnowledgeSourcesTableReferences
                            ._chunkIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$KnowledgeSourcesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $KnowledgeSourcesTable,
      KnowledgeSource,
      $$KnowledgeSourcesTableFilterComposer,
      $$KnowledgeSourcesTableOrderingComposer,
      $$KnowledgeSourcesTableAnnotationComposer,
      $$KnowledgeSourcesTableCreateCompanionBuilder,
      $$KnowledgeSourcesTableUpdateCompanionBuilder,
      (KnowledgeSource, $$KnowledgeSourcesTableReferences),
      KnowledgeSource,
      PrefetchHooks Function({bool knowledgeId, bool chunkId})
    >;
typedef $$QuestionsTableCreateCompanionBuilder = QuestionsCompanion Function({
  required String id,
  required String topicId,
  required String generatorId,
  Value<String> status,
  required String contentJson,
  required String answerJson,
  Value<double?> difficultyEstimate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> createdByDeviceId,
  Value<int> revision,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$QuestionsTableUpdateCompanionBuilder = QuestionsCompanion Function({
  Value<String> id,
  Value<String> topicId,
  Value<String> generatorId,
  Value<String> status,
  Value<String> contentJson,
  Value<String> answerJson,
  Value<double?> difficultyEstimate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> createdByDeviceId,
  Value<int> revision,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

final class $$QuestionsTableReferences
    extends BaseReferences<_$AppDatabase, $QuestionsTable, Question> {
  $$QuestionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TopicsTable _topicIdTable(_$AppDatabase db) =>
      db.topics.createAlias('questions__topic_id__topics__id');

  $$TopicsTableProcessedTableManager get topicId {
    final $_column = $_itemColumn<String>('topic_id')!;

    final manager = $$TopicsTableTableManager(
      $_db,
      $_db.topics,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_topicIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$QuestionSnapshotsTable, List<QuestionSnapshot>>
  _questionSnapshotsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.questionSnapshots,
        aliasName: 'questions__id__question_snapshots__question_id',
      );

  $$QuestionSnapshotsTableProcessedTableManager get questionSnapshotsRefs {
    final manager = $$QuestionSnapshotsTableTableManager(
      $_db,
      $_db.questionSnapshots,
    ).filter((f) => f.questionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _questionSnapshotsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$QuestionsTableFilterComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get generatorId => $composableBuilder(
    column: $table.generatorId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentJson => $composableBuilder(
    column: $table.contentJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get answerJson => $composableBuilder(
    column: $table.answerJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get difficultyEstimate => $composableBuilder(
    column: $table.difficultyEstimate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TopicsTableFilterComposer get topicId {
    final $$TopicsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableFilterComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> questionSnapshotsRefs(
    Expression<bool> Function($$QuestionSnapshotsTableFilterComposer f) f,
  ) {
    final $$QuestionSnapshotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.questionSnapshots,
      getReferencedColumn: (t) => t.questionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionSnapshotsTableFilterComposer(
            $db: $db,
            $table: $db.questionSnapshots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$QuestionsTableOrderingComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get generatorId => $composableBuilder(
    column: $table.generatorId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentJson => $composableBuilder(
    column: $table.contentJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get answerJson => $composableBuilder(
    column: $table.answerJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get difficultyEstimate => $composableBuilder(
    column: $table.difficultyEstimate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TopicsTableOrderingComposer get topicId {
    final $$TopicsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableOrderingComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$QuestionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get generatorId => $composableBuilder(
    column: $table.generatorId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get contentJson => $composableBuilder(
    column: $table.contentJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get answerJson => $composableBuilder(
    column: $table.answerJson,
    builder: (column) => column,
  );

  GeneratedColumn<double> get difficultyEstimate => $composableBuilder(
    column: $table.difficultyEstimate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$TopicsTableAnnotationComposer get topicId {
    final $$TopicsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableAnnotationComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> questionSnapshotsRefs<T extends Object>(
    Expression<T> Function($$QuestionSnapshotsTableAnnotationComposer a) f,
  ) {
    final $$QuestionSnapshotsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.questionSnapshots,
          getReferencedColumn: (t) => t.questionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$QuestionSnapshotsTableAnnotationComposer(
                $db: $db,
                $table: $db.questionSnapshots,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$QuestionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuestionsTable,
          Question,
          $$QuestionsTableFilterComposer,
          $$QuestionsTableOrderingComposer,
          $$QuestionsTableAnnotationComposer,
          $$QuestionsTableCreateCompanionBuilder,
          $$QuestionsTableUpdateCompanionBuilder,
          (Question, $$QuestionsTableReferences),
          Question,
          PrefetchHooks Function({bool topicId, bool questionSnapshotsRefs})
        > {
  $$QuestionsTableTableManager(_$AppDatabase db, $QuestionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> topicId = const Value.absent(),
                Value<String> generatorId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> contentJson = const Value.absent(),
                Value<String> answerJson = const Value.absent(),
                Value<double?> difficultyEstimate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuestionsCompanion(
                id: id,
                topicId: topicId,
                generatorId: generatorId,
                status: status,
                contentJson: contentJson,
                answerJson: answerJson,
                difficultyEstimate: difficultyEstimate,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String topicId,
                required String generatorId,
                Value<String> status = const Value.absent(),
                required String contentJson,
                required String answerJson,
                Value<double?> difficultyEstimate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuestionsCompanion.insert(
                id: id,
                topicId: topicId,
                generatorId: generatorId,
                status: status,
                contentJson: contentJson,
                answerJson: answerJson,
                difficultyEstimate: difficultyEstimate,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$QuestionsTable, Question>(table),
                  $$QuestionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({topicId = false, questionSnapshotsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (questionSnapshotsRefs) db.questionSnapshots,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (topicId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.topicId,
                            referencedTable: $$QuestionsTableReferences
                                ._topicIdTable(db),
                            referencedColumn: $$QuestionsTableReferences
                                ._topicIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (questionSnapshotsRefs)
                        await $_getPrefetchedDataByColumns<
                          Question,
                          $QuestionsTable,
                          QuestionSnapshot,
                          $QuestionSnapshotsTable
                        >(
                          currentTable: table,
                          referencedTable: $$QuestionsTableReferences
                              ._questionSnapshotsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$QuestionsTableReferences(
                                db,
                                table,
                                p0,
                              ).questionSnapshotsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'question_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$QuestionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuestionsTable,
      Question,
      $$QuestionsTableFilterComposer,
      $$QuestionsTableOrderingComposer,
      $$QuestionsTableAnnotationComposer,
      $$QuestionsTableCreateCompanionBuilder,
      $$QuestionsTableUpdateCompanionBuilder,
      (Question, $$QuestionsTableReferences),
      Question,
      PrefetchHooks Function({bool topicId, bool questionSnapshotsRefs})
    >;
typedef $$QuestionSnapshotsTableCreateCompanionBuilder =
    QuestionSnapshotsCompanion Function({
      required String id,
      required String questionId,
      required String contentJson,
      required String answerJson,
      required String provenanceJson,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$QuestionSnapshotsTableUpdateCompanionBuilder =
    QuestionSnapshotsCompanion Function({
      Value<String> id,
      Value<String> questionId,
      Value<String> contentJson,
      Value<String> answerJson,
      Value<String> provenanceJson,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$QuestionSnapshotsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $QuestionSnapshotsTable,
          QuestionSnapshot
        > {
  $$QuestionSnapshotsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $QuestionsTable _questionIdTable(_$AppDatabase db) => db.questions
      .createAlias('question_snapshots__question_id__questions__id');

  $$QuestionsTableProcessedTableManager get questionId {
    final $_column = $_itemColumn<String>('question_id')!;

    final manager = $$QuestionsTableTableManager(
      $_db,
      $_db.questions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_questionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AssessmentItemsTable, List<AssessmentItem>>
  _assessmentItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.assessmentItems,
    aliasName: 'question_snapshots__id__assessment_items__question_snapshot_id',
  );

  $$AssessmentItemsTableProcessedTableManager get assessmentItemsRefs {
    final manager =
        $$AssessmentItemsTableTableManager($_db, $_db.assessmentItems).filter(
          (f) => f.questionSnapshotId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _assessmentItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$StudentAnswersTable, List<StudentAnswer>>
  _studentAnswersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.studentAnswers,
    aliasName: 'question_snapshots__id__student_answers__question_snapshot_id',
  );

  $$StudentAnswersTableProcessedTableManager get studentAnswersRefs {
    final manager = $$StudentAnswersTableTableManager($_db, $_db.studentAnswers)
        .filter(
          (f) => f.questionSnapshotId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_studentAnswersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$QuestionSnapshotsTableFilterComposer
    extends Composer<_$AppDatabase, $QuestionSnapshotsTable> {
  $$QuestionSnapshotsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentJson => $composableBuilder(
    column: $table.contentJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get answerJson => $composableBuilder(
    column: $table.answerJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get provenanceJson => $composableBuilder(
    column: $table.provenanceJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$QuestionsTableFilterComposer get questionId {
    final $$QuestionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.questionId,
      referencedTable: $db.questions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionsTableFilterComposer(
            $db: $db,
            $table: $db.questions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> assessmentItemsRefs(
    Expression<bool> Function($$AssessmentItemsTableFilterComposer f) f,
  ) {
    final $$AssessmentItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.assessmentItems,
      getReferencedColumn: (t) => t.questionSnapshotId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssessmentItemsTableFilterComposer(
            $db: $db,
            $table: $db.assessmentItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> studentAnswersRefs(
    Expression<bool> Function($$StudentAnswersTableFilterComposer f) f,
  ) {
    final $$StudentAnswersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studentAnswers,
      getReferencedColumn: (t) => t.questionSnapshotId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentAnswersTableFilterComposer(
            $db: $db,
            $table: $db.studentAnswers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$QuestionSnapshotsTableOrderingComposer
    extends Composer<_$AppDatabase, $QuestionSnapshotsTable> {
  $$QuestionSnapshotsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentJson => $composableBuilder(
    column: $table.contentJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get answerJson => $composableBuilder(
    column: $table.answerJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get provenanceJson => $composableBuilder(
    column: $table.provenanceJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$QuestionsTableOrderingComposer get questionId {
    final $$QuestionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.questionId,
      referencedTable: $db.questions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionsTableOrderingComposer(
            $db: $db,
            $table: $db.questions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$QuestionSnapshotsTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuestionSnapshotsTable> {
  $$QuestionSnapshotsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get contentJson => $composableBuilder(
    column: $table.contentJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get answerJson => $composableBuilder(
    column: $table.answerJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get provenanceJson => $composableBuilder(
    column: $table.provenanceJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$QuestionsTableAnnotationComposer get questionId {
    final $$QuestionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.questionId,
      referencedTable: $db.questions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionsTableAnnotationComposer(
            $db: $db,
            $table: $db.questions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> assessmentItemsRefs<T extends Object>(
    Expression<T> Function($$AssessmentItemsTableAnnotationComposer a) f,
  ) {
    final $$AssessmentItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.assessmentItems,
      getReferencedColumn: (t) => t.questionSnapshotId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssessmentItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.assessmentItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> studentAnswersRefs<T extends Object>(
    Expression<T> Function($$StudentAnswersTableAnnotationComposer a) f,
  ) {
    final $$StudentAnswersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studentAnswers,
      getReferencedColumn: (t) => t.questionSnapshotId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentAnswersTableAnnotationComposer(
            $db: $db,
            $table: $db.studentAnswers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$QuestionSnapshotsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuestionSnapshotsTable,
          QuestionSnapshot,
          $$QuestionSnapshotsTableFilterComposer,
          $$QuestionSnapshotsTableOrderingComposer,
          $$QuestionSnapshotsTableAnnotationComposer,
          $$QuestionSnapshotsTableCreateCompanionBuilder,
          $$QuestionSnapshotsTableUpdateCompanionBuilder,
          (QuestionSnapshot, $$QuestionSnapshotsTableReferences),
          QuestionSnapshot,
          PrefetchHooks Function({
            bool questionId,
            bool assessmentItemsRefs,
            bool studentAnswersRefs,
          })
        > {
  $$QuestionSnapshotsTableTableManager(
    _$AppDatabase db,
    $QuestionSnapshotsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestionSnapshotsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestionSnapshotsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestionSnapshotsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> questionId = const Value.absent(),
                Value<String> contentJson = const Value.absent(),
                Value<String> answerJson = const Value.absent(),
                Value<String> provenanceJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuestionSnapshotsCompanion(
                id: id,
                questionId: questionId,
                contentJson: contentJson,
                answerJson: answerJson,
                provenanceJson: provenanceJson,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String questionId,
                required String contentJson,
                required String answerJson,
                required String provenanceJson,
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuestionSnapshotsCompanion.insert(
                id: id,
                questionId: questionId,
                contentJson: contentJson,
                answerJson: answerJson,
                provenanceJson: provenanceJson,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$QuestionSnapshotsTable, QuestionSnapshot>(table),
                  $$QuestionSnapshotsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                questionId = false,
                assessmentItemsRefs = false,
                studentAnswersRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (assessmentItemsRefs) db.assessmentItems,
                    if (studentAnswersRefs) db.studentAnswers,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (questionId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.questionId,
                            referencedTable: $$QuestionSnapshotsTableReferences
                                ._questionIdTable(db),
                            referencedColumn: $$QuestionSnapshotsTableReferences
                                ._questionIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (assessmentItemsRefs)
                        await $_getPrefetchedDataByColumns<
                          QuestionSnapshot,
                          $QuestionSnapshotsTable,
                          AssessmentItem,
                          $AssessmentItemsTable
                        >(
                          currentTable: table,
                          referencedTable: $$QuestionSnapshotsTableReferences
                              ._assessmentItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$QuestionSnapshotsTableReferences(
                                db,
                                table,
                                p0,
                              ).assessmentItemsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'question_snapshot_id',
                          typedResults: items,
                        ),
                      if (studentAnswersRefs)
                        await $_getPrefetchedDataByColumns<
                          QuestionSnapshot,
                          $QuestionSnapshotsTable,
                          StudentAnswer,
                          $StudentAnswersTable
                        >(
                          currentTable: table,
                          referencedTable: $$QuestionSnapshotsTableReferences
                              ._studentAnswersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$QuestionSnapshotsTableReferences(
                                db,
                                table,
                                p0,
                              ).studentAnswersRefs,
                          currentColumn: 'id',
                          referencedColumn: 'question_snapshot_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$QuestionSnapshotsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuestionSnapshotsTable,
      QuestionSnapshot,
      $$QuestionSnapshotsTableFilterComposer,
      $$QuestionSnapshotsTableOrderingComposer,
      $$QuestionSnapshotsTableAnnotationComposer,
      $$QuestionSnapshotsTableCreateCompanionBuilder,
      $$QuestionSnapshotsTableUpdateCompanionBuilder,
      (QuestionSnapshot, $$QuestionSnapshotsTableReferences),
      QuestionSnapshot,
      PrefetchHooks Function({
        bool questionId,
        bool assessmentItemsRefs,
        bool studentAnswersRefs,
      })
    >;
typedef $$AssessmentsTableCreateCompanionBuilder =
    AssessmentsCompanion Function({
      required String id,
      required String title,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$AssessmentsTableUpdateCompanionBuilder =
    AssessmentsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

final class $$AssessmentsTableReferences
    extends BaseReferences<_$AppDatabase, $AssessmentsTable, Assessment> {
  $$AssessmentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $AssessmentSnapshotsTable,
    List<AssessmentSnapshot>
  >
  _assessmentSnapshotsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.assessmentSnapshots,
        aliasName: 'assessments__id__assessment_snapshots__assessment_id',
      );

  $$AssessmentSnapshotsTableProcessedTableManager get assessmentSnapshotsRefs {
    final manager = $$AssessmentSnapshotsTableTableManager(
      $_db,
      $_db.assessmentSnapshots,
    ).filter((f) => f.assessmentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _assessmentSnapshotsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AssessmentsTableFilterComposer
    extends Composer<_$AppDatabase, $AssessmentsTable> {
  $$AssessmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> assessmentSnapshotsRefs(
    Expression<bool> Function($$AssessmentSnapshotsTableFilterComposer f) f,
  ) {
    final $$AssessmentSnapshotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.assessmentSnapshots,
      getReferencedColumn: (t) => t.assessmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssessmentSnapshotsTableFilterComposer(
            $db: $db,
            $table: $db.assessmentSnapshots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AssessmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $AssessmentsTable> {
  $$AssessmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AssessmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AssessmentsTable> {
  $$AssessmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  Expression<T> assessmentSnapshotsRefs<T extends Object>(
    Expression<T> Function($$AssessmentSnapshotsTableAnnotationComposer a) f,
  ) {
    final $$AssessmentSnapshotsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.assessmentSnapshots,
          getReferencedColumn: (t) => t.assessmentId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AssessmentSnapshotsTableAnnotationComposer(
                $db: $db,
                $table: $db.assessmentSnapshots,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AssessmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AssessmentsTable,
          Assessment,
          $$AssessmentsTableFilterComposer,
          $$AssessmentsTableOrderingComposer,
          $$AssessmentsTableAnnotationComposer,
          $$AssessmentsTableCreateCompanionBuilder,
          $$AssessmentsTableUpdateCompanionBuilder,
          (Assessment, $$AssessmentsTableReferences),
          Assessment,
          PrefetchHooks Function({bool assessmentSnapshotsRefs})
        > {
  $$AssessmentsTableTableManager(_$AppDatabase db, $AssessmentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssessmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssessmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssessmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AssessmentsCompanion(
                id: id,
                title: title,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AssessmentsCompanion.insert(
                id: id,
                title: title,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AssessmentsTable, Assessment>(table),
                  $$AssessmentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({assessmentSnapshotsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (assessmentSnapshotsRefs) db.assessmentSnapshots,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (assessmentSnapshotsRefs)
                    await $_getPrefetchedDataByColumns<
                      Assessment,
                      $AssessmentsTable,
                      AssessmentSnapshot,
                      $AssessmentSnapshotsTable
                    >(
                      currentTable: table,
                      referencedTable: $$AssessmentsTableReferences
                          ._assessmentSnapshotsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$AssessmentsTableReferences(
                            db,
                            table,
                            p0,
                          ).assessmentSnapshotsRefs,
                      currentColumn: 'id',
                      referencedColumn: 'assessment_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AssessmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AssessmentsTable,
      Assessment,
      $$AssessmentsTableFilterComposer,
      $$AssessmentsTableOrderingComposer,
      $$AssessmentsTableAnnotationComposer,
      $$AssessmentsTableCreateCompanionBuilder,
      $$AssessmentsTableUpdateCompanionBuilder,
      (Assessment, $$AssessmentsTableReferences),
      Assessment,
      PrefetchHooks Function({bool assessmentSnapshotsRefs})
    >;
typedef $$AssessmentSnapshotsTableCreateCompanionBuilder =
    AssessmentSnapshotsCompanion Function({
      required String id,
      required String assessmentId,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$AssessmentSnapshotsTableUpdateCompanionBuilder =
    AssessmentSnapshotsCompanion Function({
      Value<String> id,
      Value<String> assessmentId,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$AssessmentSnapshotsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AssessmentSnapshotsTable,
          AssessmentSnapshot
        > {
  $$AssessmentSnapshotsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AssessmentsTable _assessmentIdTable(_$AppDatabase db) => db
      .assessments
      .createAlias('assessment_snapshots__assessment_id__assessments__id');

  $$AssessmentsTableProcessedTableManager get assessmentId {
    final $_column = $_itemColumn<String>('assessment_id')!;

    final manager = $$AssessmentsTableTableManager(
      $_db,
      $_db.assessments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_assessmentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AssessmentItemsTable, List<AssessmentItem>>
  _assessmentItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.assessmentItems,
    aliasName:
        'assessment_snapshots__id__assessment_items__assessment_snapshot_id',
  );

  $$AssessmentItemsTableProcessedTableManager get assessmentItemsRefs {
    final manager =
        $$AssessmentItemsTableTableManager($_db, $_db.assessmentItems).filter(
          (f) =>
              f.assessmentSnapshotId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _assessmentItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$StudentAttemptsTable, List<StudentAttempt>>
  _studentAttemptsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.studentAttempts,
    aliasName:
        'assessment_snapshots__id__student_attempts__assessment_snapshot_id',
  );

  $$StudentAttemptsTableProcessedTableManager get studentAttemptsRefs {
    final manager =
        $$StudentAttemptsTableTableManager($_db, $_db.studentAttempts).filter(
          (f) =>
              f.assessmentSnapshotId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _studentAttemptsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AssessmentSnapshotsTableFilterComposer
    extends Composer<_$AppDatabase, $AssessmentSnapshotsTable> {
  $$AssessmentSnapshotsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AssessmentsTableFilterComposer get assessmentId {
    final $$AssessmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.assessmentId,
      referencedTable: $db.assessments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssessmentsTableFilterComposer(
            $db: $db,
            $table: $db.assessments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> assessmentItemsRefs(
    Expression<bool> Function($$AssessmentItemsTableFilterComposer f) f,
  ) {
    final $$AssessmentItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.assessmentItems,
      getReferencedColumn: (t) => t.assessmentSnapshotId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssessmentItemsTableFilterComposer(
            $db: $db,
            $table: $db.assessmentItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> studentAttemptsRefs(
    Expression<bool> Function($$StudentAttemptsTableFilterComposer f) f,
  ) {
    final $$StudentAttemptsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studentAttempts,
      getReferencedColumn: (t) => t.assessmentSnapshotId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentAttemptsTableFilterComposer(
            $db: $db,
            $table: $db.studentAttempts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AssessmentSnapshotsTableOrderingComposer
    extends Composer<_$AppDatabase, $AssessmentSnapshotsTable> {
  $$AssessmentSnapshotsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AssessmentsTableOrderingComposer get assessmentId {
    final $$AssessmentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.assessmentId,
      referencedTable: $db.assessments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssessmentsTableOrderingComposer(
            $db: $db,
            $table: $db.assessments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AssessmentSnapshotsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AssessmentSnapshotsTable> {
  $$AssessmentSnapshotsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$AssessmentsTableAnnotationComposer get assessmentId {
    final $$AssessmentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.assessmentId,
      referencedTable: $db.assessments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssessmentsTableAnnotationComposer(
            $db: $db,
            $table: $db.assessments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> assessmentItemsRefs<T extends Object>(
    Expression<T> Function($$AssessmentItemsTableAnnotationComposer a) f,
  ) {
    final $$AssessmentItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.assessmentItems,
      getReferencedColumn: (t) => t.assessmentSnapshotId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssessmentItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.assessmentItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> studentAttemptsRefs<T extends Object>(
    Expression<T> Function($$StudentAttemptsTableAnnotationComposer a) f,
  ) {
    final $$StudentAttemptsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studentAttempts,
      getReferencedColumn: (t) => t.assessmentSnapshotId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentAttemptsTableAnnotationComposer(
            $db: $db,
            $table: $db.studentAttempts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AssessmentSnapshotsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AssessmentSnapshotsTable,
          AssessmentSnapshot,
          $$AssessmentSnapshotsTableFilterComposer,
          $$AssessmentSnapshotsTableOrderingComposer,
          $$AssessmentSnapshotsTableAnnotationComposer,
          $$AssessmentSnapshotsTableCreateCompanionBuilder,
          $$AssessmentSnapshotsTableUpdateCompanionBuilder,
          (AssessmentSnapshot, $$AssessmentSnapshotsTableReferences),
          AssessmentSnapshot,
          PrefetchHooks Function({
            bool assessmentId,
            bool assessmentItemsRefs,
            bool studentAttemptsRefs,
          })
        > {
  $$AssessmentSnapshotsTableTableManager(
    _$AppDatabase db,
    $AssessmentSnapshotsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssessmentSnapshotsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssessmentSnapshotsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$AssessmentSnapshotsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> assessmentId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AssessmentSnapshotsCompanion(
                id: id,
                assessmentId: assessmentId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String assessmentId,
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AssessmentSnapshotsCompanion.insert(
                id: id,
                assessmentId: assessmentId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AssessmentSnapshotsTable, AssessmentSnapshot>(
                    table,
                  ),
                  $$AssessmentSnapshotsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                assessmentId = false,
                assessmentItemsRefs = false,
                studentAttemptsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (assessmentItemsRefs) db.assessmentItems,
                    if (studentAttemptsRefs) db.studentAttempts,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (assessmentId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.assessmentId,
                            referencedTable:
                                $$AssessmentSnapshotsTableReferences
                                    ._assessmentIdTable(db),
                            referencedColumn:
                                $$AssessmentSnapshotsTableReferences
                                    ._assessmentIdTable(db)
                                    .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (assessmentItemsRefs)
                        await $_getPrefetchedDataByColumns<
                          AssessmentSnapshot,
                          $AssessmentSnapshotsTable,
                          AssessmentItem,
                          $AssessmentItemsTable
                        >(
                          currentTable: table,
                          referencedTable: $$AssessmentSnapshotsTableReferences
                              ._assessmentItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AssessmentSnapshotsTableReferences(
                                db,
                                table,
                                p0,
                              ).assessmentItemsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'assessment_snapshot_id',
                          typedResults: items,
                        ),
                      if (studentAttemptsRefs)
                        await $_getPrefetchedDataByColumns<
                          AssessmentSnapshot,
                          $AssessmentSnapshotsTable,
                          StudentAttempt,
                          $StudentAttemptsTable
                        >(
                          currentTable: table,
                          referencedTable: $$AssessmentSnapshotsTableReferences
                              ._studentAttemptsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AssessmentSnapshotsTableReferences(
                                db,
                                table,
                                p0,
                              ).studentAttemptsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'assessment_snapshot_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AssessmentSnapshotsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AssessmentSnapshotsTable,
      AssessmentSnapshot,
      $$AssessmentSnapshotsTableFilterComposer,
      $$AssessmentSnapshotsTableOrderingComposer,
      $$AssessmentSnapshotsTableAnnotationComposer,
      $$AssessmentSnapshotsTableCreateCompanionBuilder,
      $$AssessmentSnapshotsTableUpdateCompanionBuilder,
      (AssessmentSnapshot, $$AssessmentSnapshotsTableReferences),
      AssessmentSnapshot,
      PrefetchHooks Function({
        bool assessmentId,
        bool assessmentItemsRefs,
        bool studentAttemptsRefs,
      })
    >;
typedef $$AssessmentItemsTableCreateCompanionBuilder =
    AssessmentItemsCompanion Function({
      required String id,
      required String assessmentSnapshotId,
      required String questionSnapshotId,
      required int sequence,
      Value<double> weight,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$AssessmentItemsTableUpdateCompanionBuilder =
    AssessmentItemsCompanion Function({
      Value<String> id,
      Value<String> assessmentSnapshotId,
      Value<String> questionSnapshotId,
      Value<int> sequence,
      Value<double> weight,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$AssessmentItemsTableReferences
    extends
        BaseReferences<_$AppDatabase, $AssessmentItemsTable, AssessmentItem> {
  $$AssessmentItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AssessmentSnapshotsTable _assessmentSnapshotIdTable(
    _$AppDatabase db,
  ) => db.assessmentSnapshots.createAlias(
    'assessment_items__assessment_snapshot_id__assessment_snapshots__id',
  );

  $$AssessmentSnapshotsTableProcessedTableManager get assessmentSnapshotId {
    final $_column = $_itemColumn<String>('assessment_snapshot_id')!;

    final manager = $$AssessmentSnapshotsTableTableManager(
      $_db,
      $_db.assessmentSnapshots,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _assessmentSnapshotIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $QuestionSnapshotsTable _questionSnapshotIdTable(_$AppDatabase db) =>
      db.questionSnapshots.createAlias(
        'assessment_items__question_snapshot_id__question_snapshots__id',
      );

  $$QuestionSnapshotsTableProcessedTableManager get questionSnapshotId {
    final $_column = $_itemColumn<String>('question_snapshot_id')!;

    final manager = $$QuestionSnapshotsTableTableManager(
      $_db,
      $_db.questionSnapshots,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_questionSnapshotIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AssessmentItemsTableFilterComposer
    extends Composer<_$AppDatabase, $AssessmentItemsTable> {
  $$AssessmentItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sequence => $composableBuilder(
    column: $table.sequence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AssessmentSnapshotsTableFilterComposer get assessmentSnapshotId {
    final $$AssessmentSnapshotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.assessmentSnapshotId,
      referencedTable: $db.assessmentSnapshots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssessmentSnapshotsTableFilterComposer(
            $db: $db,
            $table: $db.assessmentSnapshots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$QuestionSnapshotsTableFilterComposer get questionSnapshotId {
    final $$QuestionSnapshotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.questionSnapshotId,
      referencedTable: $db.questionSnapshots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionSnapshotsTableFilterComposer(
            $db: $db,
            $table: $db.questionSnapshots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AssessmentItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $AssessmentItemsTable> {
  $$AssessmentItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sequence => $composableBuilder(
    column: $table.sequence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AssessmentSnapshotsTableOrderingComposer get assessmentSnapshotId {
    final $$AssessmentSnapshotsTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.assessmentSnapshotId,
          referencedTable: $db.assessmentSnapshots,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AssessmentSnapshotsTableOrderingComposer(
                $db: $db,
                $table: $db.assessmentSnapshots,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$QuestionSnapshotsTableOrderingComposer get questionSnapshotId {
    final $$QuestionSnapshotsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.questionSnapshotId,
      referencedTable: $db.questionSnapshots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionSnapshotsTableOrderingComposer(
            $db: $db,
            $table: $db.questionSnapshots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AssessmentItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AssessmentItemsTable> {
  $$AssessmentItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get sequence =>
      $composableBuilder(column: $table.sequence, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$AssessmentSnapshotsTableAnnotationComposer get assessmentSnapshotId {
    final $$AssessmentSnapshotsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.assessmentSnapshotId,
          referencedTable: $db.assessmentSnapshots,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AssessmentSnapshotsTableAnnotationComposer(
                $db: $db,
                $table: $db.assessmentSnapshots,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$QuestionSnapshotsTableAnnotationComposer get questionSnapshotId {
    final $$QuestionSnapshotsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.questionSnapshotId,
          referencedTable: $db.questionSnapshots,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$QuestionSnapshotsTableAnnotationComposer(
                $db: $db,
                $table: $db.questionSnapshots,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$AssessmentItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AssessmentItemsTable,
          AssessmentItem,
          $$AssessmentItemsTableFilterComposer,
          $$AssessmentItemsTableOrderingComposer,
          $$AssessmentItemsTableAnnotationComposer,
          $$AssessmentItemsTableCreateCompanionBuilder,
          $$AssessmentItemsTableUpdateCompanionBuilder,
          (AssessmentItem, $$AssessmentItemsTableReferences),
          AssessmentItem,
          PrefetchHooks Function({
            bool assessmentSnapshotId,
            bool questionSnapshotId,
          })
        > {
  $$AssessmentItemsTableTableManager(
    _$AppDatabase db,
    $AssessmentItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssessmentItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssessmentItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssessmentItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> assessmentSnapshotId = const Value.absent(),
                Value<String> questionSnapshotId = const Value.absent(),
                Value<int> sequence = const Value.absent(),
                Value<double> weight = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AssessmentItemsCompanion(
                id: id,
                assessmentSnapshotId: assessmentSnapshotId,
                questionSnapshotId: questionSnapshotId,
                sequence: sequence,
                weight: weight,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String assessmentSnapshotId,
                required String questionSnapshotId,
                required int sequence,
                Value<double> weight = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AssessmentItemsCompanion.insert(
                id: id,
                assessmentSnapshotId: assessmentSnapshotId,
                questionSnapshotId: questionSnapshotId,
                sequence: sequence,
                weight: weight,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AssessmentItemsTable, AssessmentItem>(table),
                  $$AssessmentItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({assessmentSnapshotId = false, questionSnapshotId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (assessmentSnapshotId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.assessmentSnapshotId,
                            referencedTable: $$AssessmentItemsTableReferences
                                ._assessmentSnapshotIdTable(db),
                            referencedColumn: $$AssessmentItemsTableReferences
                                ._assessmentSnapshotIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (questionSnapshotId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.questionSnapshotId,
                            referencedTable: $$AssessmentItemsTableReferences
                                ._questionSnapshotIdTable(db),
                            referencedColumn: $$AssessmentItemsTableReferences
                                ._questionSnapshotIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$AssessmentItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AssessmentItemsTable,
      AssessmentItem,
      $$AssessmentItemsTableFilterComposer,
      $$AssessmentItemsTableOrderingComposer,
      $$AssessmentItemsTableAnnotationComposer,
      $$AssessmentItemsTableCreateCompanionBuilder,
      $$AssessmentItemsTableUpdateCompanionBuilder,
      (AssessmentItem, $$AssessmentItemsTableReferences),
      AssessmentItem,
      PrefetchHooks Function({
        bool assessmentSnapshotId,
        bool questionSnapshotId,
      })
    >;
typedef $$StudentAttemptsTableCreateCompanionBuilder =
    StudentAttemptsCompanion Function({
      required String id,
      required String studentId,
      required String assessmentSnapshotId,
      Value<DateTime> startedAt,
      Value<DateTime?> completedAt,
      Value<String> actorType,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$StudentAttemptsTableUpdateCompanionBuilder =
    StudentAttemptsCompanion Function({
      Value<String> id,
      Value<String> studentId,
      Value<String> assessmentSnapshotId,
      Value<DateTime> startedAt,
      Value<DateTime?> completedAt,
      Value<String> actorType,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

final class $$StudentAttemptsTableReferences
    extends
        BaseReferences<_$AppDatabase, $StudentAttemptsTable, StudentAttempt> {
  $$StudentAttemptsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $StudentsTable _studentIdTable(_$AppDatabase db) =>
      db.students.createAlias('student_attempts__student_id__students__id');

  $$StudentsTableProcessedTableManager get studentId {
    final $_column = $_itemColumn<String>('student_id')!;

    final manager = $$StudentsTableTableManager(
      $_db,
      $_db.students,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_studentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AssessmentSnapshotsTable _assessmentSnapshotIdTable(
    _$AppDatabase db,
  ) => db.assessmentSnapshots.createAlias(
    'student_attempts__assessment_snapshot_id__assessment_snapshots__id',
  );

  $$AssessmentSnapshotsTableProcessedTableManager get assessmentSnapshotId {
    final $_column = $_itemColumn<String>('assessment_snapshot_id')!;

    final manager = $$AssessmentSnapshotsTableTableManager(
      $_db,
      $_db.assessmentSnapshots,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _assessmentSnapshotIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$StudentAnswersTable, List<StudentAnswer>>
  _studentAnswersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.studentAnswers,
    aliasName: 'student_attempts__id__student_answers__attempt_id',
  );

  $$StudentAnswersTableProcessedTableManager get studentAnswersRefs {
    final manager = $$StudentAnswersTableTableManager(
      $_db,
      $_db.studentAnswers,
    ).filter((f) => f.attemptId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_studentAnswersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StudentAttemptsTableFilterComposer
    extends Composer<_$AppDatabase, $StudentAttemptsTable> {
  $$StudentAttemptsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get actorType => $composableBuilder(
    column: $table.actorType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$StudentsTableFilterComposer get studentId {
    final $$StudentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableFilterComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AssessmentSnapshotsTableFilterComposer get assessmentSnapshotId {
    final $$AssessmentSnapshotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.assessmentSnapshotId,
      referencedTable: $db.assessmentSnapshots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssessmentSnapshotsTableFilterComposer(
            $db: $db,
            $table: $db.assessmentSnapshots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> studentAnswersRefs(
    Expression<bool> Function($$StudentAnswersTableFilterComposer f) f,
  ) {
    final $$StudentAnswersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studentAnswers,
      getReferencedColumn: (t) => t.attemptId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentAnswersTableFilterComposer(
            $db: $db,
            $table: $db.studentAnswers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StudentAttemptsTableOrderingComposer
    extends Composer<_$AppDatabase, $StudentAttemptsTable> {
  $$StudentAttemptsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get actorType => $composableBuilder(
    column: $table.actorType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$StudentsTableOrderingComposer get studentId {
    final $$StudentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableOrderingComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AssessmentSnapshotsTableOrderingComposer get assessmentSnapshotId {
    final $$AssessmentSnapshotsTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.assessmentSnapshotId,
          referencedTable: $db.assessmentSnapshots,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AssessmentSnapshotsTableOrderingComposer(
                $db: $db,
                $table: $db.assessmentSnapshots,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$StudentAttemptsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudentAttemptsTable> {
  $$StudentAttemptsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get actorType =>
      $composableBuilder(column: $table.actorType, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$StudentsTableAnnotationComposer get studentId {
    final $$StudentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableAnnotationComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AssessmentSnapshotsTableAnnotationComposer get assessmentSnapshotId {
    final $$AssessmentSnapshotsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.assessmentSnapshotId,
          referencedTable: $db.assessmentSnapshots,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AssessmentSnapshotsTableAnnotationComposer(
                $db: $db,
                $table: $db.assessmentSnapshots,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> studentAnswersRefs<T extends Object>(
    Expression<T> Function($$StudentAnswersTableAnnotationComposer a) f,
  ) {
    final $$StudentAnswersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studentAnswers,
      getReferencedColumn: (t) => t.attemptId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentAnswersTableAnnotationComposer(
            $db: $db,
            $table: $db.studentAnswers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StudentAttemptsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudentAttemptsTable,
          StudentAttempt,
          $$StudentAttemptsTableFilterComposer,
          $$StudentAttemptsTableOrderingComposer,
          $$StudentAttemptsTableAnnotationComposer,
          $$StudentAttemptsTableCreateCompanionBuilder,
          $$StudentAttemptsTableUpdateCompanionBuilder,
          (StudentAttempt, $$StudentAttemptsTableReferences),
          StudentAttempt,
          PrefetchHooks Function({
            bool studentId,
            bool assessmentSnapshotId,
            bool studentAnswersRefs,
          })
        > {
  $$StudentAttemptsTableTableManager(
    _$AppDatabase db,
    $StudentAttemptsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudentAttemptsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudentAttemptsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudentAttemptsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> studentId = const Value.absent(),
                Value<String> assessmentSnapshotId = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<String> actorType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudentAttemptsCompanion(
                id: id,
                studentId: studentId,
                assessmentSnapshotId: assessmentSnapshotId,
                startedAt: startedAt,
                completedAt: completedAt,
                actorType: actorType,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String studentId,
                required String assessmentSnapshotId,
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<String> actorType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudentAttemptsCompanion.insert(
                id: id,
                studentId: studentId,
                assessmentSnapshotId: assessmentSnapshotId,
                startedAt: startedAt,
                completedAt: completedAt,
                actorType: actorType,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$StudentAttemptsTable, StudentAttempt>(table),
                  $$StudentAttemptsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                studentId = false,
                assessmentSnapshotId = false,
                studentAnswersRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (studentAnswersRefs) db.studentAnswers,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (studentId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.studentId,
                            referencedTable: $$StudentAttemptsTableReferences
                                ._studentIdTable(db),
                            referencedColumn: $$StudentAttemptsTableReferences
                                ._studentIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (assessmentSnapshotId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.assessmentSnapshotId,
                            referencedTable: $$StudentAttemptsTableReferences
                                ._assessmentSnapshotIdTable(db),
                            referencedColumn: $$StudentAttemptsTableReferences
                                ._assessmentSnapshotIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (studentAnswersRefs)
                        await $_getPrefetchedDataByColumns<
                          StudentAttempt,
                          $StudentAttemptsTable,
                          StudentAnswer,
                          $StudentAnswersTable
                        >(
                          currentTable: table,
                          referencedTable: $$StudentAttemptsTableReferences
                              ._studentAnswersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StudentAttemptsTableReferences(
                                db,
                                table,
                                p0,
                              ).studentAnswersRefs,
                          currentColumn: 'id',
                          referencedColumn: 'attempt_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$StudentAttemptsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudentAttemptsTable,
      StudentAttempt,
      $$StudentAttemptsTableFilterComposer,
      $$StudentAttemptsTableOrderingComposer,
      $$StudentAttemptsTableAnnotationComposer,
      $$StudentAttemptsTableCreateCompanionBuilder,
      $$StudentAttemptsTableUpdateCompanionBuilder,
      (StudentAttempt, $$StudentAttemptsTableReferences),
      StudentAttempt,
      PrefetchHooks Function({
        bool studentId,
        bool assessmentSnapshotId,
        bool studentAnswersRefs,
      })
    >;
typedef $$StudentAnswersTableCreateCompanionBuilder =
    StudentAnswersCompanion Function({
      required String id,
      required String attemptId,
      required String questionSnapshotId,
      required String answerJson,
      Value<bool?> isCorrect,
      Value<double?> score,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$StudentAnswersTableUpdateCompanionBuilder =
    StudentAnswersCompanion Function({
      Value<String> id,
      Value<String> attemptId,
      Value<String> questionSnapshotId,
      Value<String> answerJson,
      Value<bool?> isCorrect,
      Value<double?> score,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

final class $$StudentAnswersTableReferences
    extends BaseReferences<_$AppDatabase, $StudentAnswersTable, StudentAnswer> {
  $$StudentAnswersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $StudentAttemptsTable _attemptIdTable(_$AppDatabase db) => db
      .studentAttempts
      .createAlias('student_answers__attempt_id__student_attempts__id');

  $$StudentAttemptsTableProcessedTableManager get attemptId {
    final $_column = $_itemColumn<String>('attempt_id')!;

    final manager = $$StudentAttemptsTableTableManager(
      $_db,
      $_db.studentAttempts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_attemptIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $QuestionSnapshotsTable _questionSnapshotIdTable(_$AppDatabase db) =>
      db.questionSnapshots.createAlias(
        'student_answers__question_snapshot_id__question_snapshots__id',
      );

  $$QuestionSnapshotsTableProcessedTableManager get questionSnapshotId {
    final $_column = $_itemColumn<String>('question_snapshot_id')!;

    final manager = $$QuestionSnapshotsTableTableManager(
      $_db,
      $_db.questionSnapshots,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_questionSnapshotIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$StudentAnswersTableFilterComposer
    extends Composer<_$AppDatabase, $StudentAnswersTable> {
  $$StudentAnswersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get answerJson => $composableBuilder(
    column: $table.answerJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCorrect => $composableBuilder(
    column: $table.isCorrect,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$StudentAttemptsTableFilterComposer get attemptId {
    final $$StudentAttemptsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.attemptId,
      referencedTable: $db.studentAttempts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentAttemptsTableFilterComposer(
            $db: $db,
            $table: $db.studentAttempts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$QuestionSnapshotsTableFilterComposer get questionSnapshotId {
    final $$QuestionSnapshotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.questionSnapshotId,
      referencedTable: $db.questionSnapshots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionSnapshotsTableFilterComposer(
            $db: $db,
            $table: $db.questionSnapshots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StudentAnswersTableOrderingComposer
    extends Composer<_$AppDatabase, $StudentAnswersTable> {
  $$StudentAnswersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get answerJson => $composableBuilder(
    column: $table.answerJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCorrect => $composableBuilder(
    column: $table.isCorrect,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$StudentAttemptsTableOrderingComposer get attemptId {
    final $$StudentAttemptsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.attemptId,
      referencedTable: $db.studentAttempts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentAttemptsTableOrderingComposer(
            $db: $db,
            $table: $db.studentAttempts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$QuestionSnapshotsTableOrderingComposer get questionSnapshotId {
    final $$QuestionSnapshotsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.questionSnapshotId,
      referencedTable: $db.questionSnapshots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionSnapshotsTableOrderingComposer(
            $db: $db,
            $table: $db.questionSnapshots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StudentAnswersTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudentAnswersTable> {
  $$StudentAnswersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get answerJson => $composableBuilder(
    column: $table.answerJson,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCorrect =>
      $composableBuilder(column: $table.isCorrect, builder: (column) => column);

  GeneratedColumn<double> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$StudentAttemptsTableAnnotationComposer get attemptId {
    final $$StudentAttemptsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.attemptId,
      referencedTable: $db.studentAttempts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentAttemptsTableAnnotationComposer(
            $db: $db,
            $table: $db.studentAttempts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$QuestionSnapshotsTableAnnotationComposer get questionSnapshotId {
    final $$QuestionSnapshotsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.questionSnapshotId,
          referencedTable: $db.questionSnapshots,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$QuestionSnapshotsTableAnnotationComposer(
                $db: $db,
                $table: $db.questionSnapshots,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$StudentAnswersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudentAnswersTable,
          StudentAnswer,
          $$StudentAnswersTableFilterComposer,
          $$StudentAnswersTableOrderingComposer,
          $$StudentAnswersTableAnnotationComposer,
          $$StudentAnswersTableCreateCompanionBuilder,
          $$StudentAnswersTableUpdateCompanionBuilder,
          (StudentAnswer, $$StudentAnswersTableReferences),
          StudentAnswer,
          PrefetchHooks Function({bool attemptId, bool questionSnapshotId})
        > {
  $$StudentAnswersTableTableManager(
    _$AppDatabase db,
    $StudentAnswersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudentAnswersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudentAnswersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudentAnswersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> attemptId = const Value.absent(),
                Value<String> questionSnapshotId = const Value.absent(),
                Value<String> answerJson = const Value.absent(),
                Value<bool?> isCorrect = const Value.absent(),
                Value<double?> score = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudentAnswersCompanion(
                id: id,
                attemptId: attemptId,
                questionSnapshotId: questionSnapshotId,
                answerJson: answerJson,
                isCorrect: isCorrect,
                score: score,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String attemptId,
                required String questionSnapshotId,
                required String answerJson,
                Value<bool?> isCorrect = const Value.absent(),
                Value<double?> score = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudentAnswersCompanion.insert(
                id: id,
                attemptId: attemptId,
                questionSnapshotId: questionSnapshotId,
                answerJson: answerJson,
                isCorrect: isCorrect,
                score: score,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$StudentAnswersTable, StudentAnswer>(table),
                  $$StudentAnswersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({attemptId = false, questionSnapshotId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (attemptId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.attemptId,
                            referencedTable: $$StudentAnswersTableReferences
                                ._attemptIdTable(db),
                            referencedColumn: $$StudentAnswersTableReferences
                                ._attemptIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (questionSnapshotId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.questionSnapshotId,
                            referencedTable: $$StudentAnswersTableReferences
                                ._questionSnapshotIdTable(db),
                            referencedColumn: $$StudentAnswersTableReferences
                                ._questionSnapshotIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$StudentAnswersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudentAnswersTable,
      StudentAnswer,
      $$StudentAnswersTableFilterComposer,
      $$StudentAnswersTableOrderingComposer,
      $$StudentAnswersTableAnnotationComposer,
      $$StudentAnswersTableCreateCompanionBuilder,
      $$StudentAnswersTableUpdateCompanionBuilder,
      (StudentAnswer, $$StudentAnswersTableReferences),
      StudentAnswer,
      PrefetchHooks Function({bool attemptId, bool questionSnapshotId})
    >;
typedef $$MasteryRecordsTableCreateCompanionBuilder =
    MasteryRecordsCompanion Function({
      required String id,
      required String studentId,
      required String competencyId,
      required String masteryLevel,
      Value<DateTime> lastUpdated,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$MasteryRecordsTableUpdateCompanionBuilder =
    MasteryRecordsCompanion Function({
      Value<String> id,
      Value<String> studentId,
      Value<String> competencyId,
      Value<String> masteryLevel,
      Value<DateTime> lastUpdated,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

final class $$MasteryRecordsTableReferences
    extends BaseReferences<_$AppDatabase, $MasteryRecordsTable, MasteryRecord> {
  $$MasteryRecordsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $StudentsTable _studentIdTable(_$AppDatabase db) =>
      db.students.createAlias('mastery_records__student_id__students__id');

  $$StudentsTableProcessedTableManager get studentId {
    final $_column = $_itemColumn<String>('student_id')!;

    final manager = $$StudentsTableTableManager(
      $_db,
      $_db.students,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_studentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CompetenciesTable _competencyIdTable(_$AppDatabase db) => db
      .competencies
      .createAlias('mastery_records__competency_id__competencies__id');

  $$CompetenciesTableProcessedTableManager get competencyId {
    final $_column = $_itemColumn<String>('competency_id')!;

    final manager = $$CompetenciesTableTableManager(
      $_db,
      $_db.competencies,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_competencyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MasteryRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $MasteryRecordsTable> {
  $$MasteryRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get masteryLevel => $composableBuilder(
    column: $table.masteryLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$StudentsTableFilterComposer get studentId {
    final $$StudentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableFilterComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CompetenciesTableFilterComposer get competencyId {
    final $$CompetenciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.competencyId,
      referencedTable: $db.competencies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompetenciesTableFilterComposer(
            $db: $db,
            $table: $db.competencies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MasteryRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $MasteryRecordsTable> {
  $$MasteryRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get masteryLevel => $composableBuilder(
    column: $table.masteryLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$StudentsTableOrderingComposer get studentId {
    final $$StudentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableOrderingComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CompetenciesTableOrderingComposer get competencyId {
    final $$CompetenciesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.competencyId,
      referencedTable: $db.competencies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompetenciesTableOrderingComposer(
            $db: $db,
            $table: $db.competencies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MasteryRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MasteryRecordsTable> {
  $$MasteryRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get masteryLevel => $composableBuilder(
    column: $table.masteryLevel,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$StudentsTableAnnotationComposer get studentId {
    final $$StudentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableAnnotationComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CompetenciesTableAnnotationComposer get competencyId {
    final $$CompetenciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.competencyId,
      referencedTable: $db.competencies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompetenciesTableAnnotationComposer(
            $db: $db,
            $table: $db.competencies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MasteryRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MasteryRecordsTable,
          MasteryRecord,
          $$MasteryRecordsTableFilterComposer,
          $$MasteryRecordsTableOrderingComposer,
          $$MasteryRecordsTableAnnotationComposer,
          $$MasteryRecordsTableCreateCompanionBuilder,
          $$MasteryRecordsTableUpdateCompanionBuilder,
          (MasteryRecord, $$MasteryRecordsTableReferences),
          MasteryRecord,
          PrefetchHooks Function({bool studentId, bool competencyId})
        > {
  $$MasteryRecordsTableTableManager(
    _$AppDatabase db,
    $MasteryRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MasteryRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MasteryRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MasteryRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> studentId = const Value.absent(),
                Value<String> competencyId = const Value.absent(),
                Value<String> masteryLevel = const Value.absent(),
                Value<DateTime> lastUpdated = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MasteryRecordsCompanion(
                id: id,
                studentId: studentId,
                competencyId: competencyId,
                masteryLevel: masteryLevel,
                lastUpdated: lastUpdated,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String studentId,
                required String competencyId,
                required String masteryLevel,
                Value<DateTime> lastUpdated = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MasteryRecordsCompanion.insert(
                id: id,
                studentId: studentId,
                competencyId: competencyId,
                masteryLevel: masteryLevel,
                lastUpdated: lastUpdated,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MasteryRecordsTable, MasteryRecord>(table),
                  $$MasteryRecordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({studentId = false, competencyId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (studentId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.studentId,
                        referencedTable: $$MasteryRecordsTableReferences
                            ._studentIdTable(db),
                        referencedColumn: $$MasteryRecordsTableReferences
                            ._studentIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (competencyId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.competencyId,
                        referencedTable: $$MasteryRecordsTableReferences
                            ._competencyIdTable(db),
                        referencedColumn: $$MasteryRecordsTableReferences
                            ._competencyIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MasteryRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MasteryRecordsTable,
      MasteryRecord,
      $$MasteryRecordsTableFilterComposer,
      $$MasteryRecordsTableOrderingComposer,
      $$MasteryRecordsTableAnnotationComposer,
      $$MasteryRecordsTableCreateCompanionBuilder,
      $$MasteryRecordsTableUpdateCompanionBuilder,
      (MasteryRecord, $$MasteryRecordsTableReferences),
      MasteryRecord,
      PrefetchHooks Function({bool studentId, bool competencyId})
    >;
typedef $$SyncEventsTableCreateCompanionBuilder = SyncEventsCompanion Function({
  required String id,
  required String entityType,
  required String entityId,
  required String operation,
  required int baseRevision,
  required int newRevision,
  required String payloadJson,
  required String deviceId,
  Value<DateTime> createdAt,
  required String idempotencyKey,
  Value<int> rowid,
});
typedef $$SyncEventsTableUpdateCompanionBuilder = SyncEventsCompanion Function({
  Value<String> id,
  Value<String> entityType,
  Value<String> entityId,
  Value<String> operation,
  Value<int> baseRevision,
  Value<int> newRevision,
  Value<String> payloadJson,
  Value<String> deviceId,
  Value<DateTime> createdAt,
  Value<String> idempotencyKey,
  Value<int> rowid,
});

class $$SyncEventsTableFilterComposer
    extends Composer<_$AppDatabase, $SyncEventsTable> {
  $$SyncEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get newRevision => $composableBuilder(
    column: $table.newRevision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncEventsTable> {
  $$SyncEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get newRevision => $composableBuilder(
    column: $table.newRevision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncEventsTable> {
  $$SyncEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => column,
  );

  GeneratedColumn<int> get newRevision => $composableBuilder(
    column: $table.newRevision,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => column,
  );
}

class $$SyncEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncEventsTable,
          SyncEvent,
          $$SyncEventsTableFilterComposer,
          $$SyncEventsTableOrderingComposer,
          $$SyncEventsTableAnnotationComposer,
          $$SyncEventsTableCreateCompanionBuilder,
          $$SyncEventsTableUpdateCompanionBuilder,
          (
            SyncEvent,
            BaseReferences<_$AppDatabase, $SyncEventsTable, SyncEvent>,
          ),
          SyncEvent,
          PrefetchHooks Function()
        > {
  $$SyncEventsTableTableManager(_$AppDatabase db, $SyncEventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<String> operation = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                Value<int> newRevision = const Value.absent(),
                Value<String> payloadJson = const Value.absent(),
                Value<String> deviceId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> idempotencyKey = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncEventsCompanion(
                id: id,
                entityType: entityType,
                entityId: entityId,
                operation: operation,
                baseRevision: baseRevision,
                newRevision: newRevision,
                payloadJson: payloadJson,
                deviceId: deviceId,
                createdAt: createdAt,
                idempotencyKey: idempotencyKey,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String entityType,
                required String entityId,
                required String operation,
                required int baseRevision,
                required int newRevision,
                required String payloadJson,
                required String deviceId,
                Value<DateTime> createdAt = const Value.absent(),
                required String idempotencyKey,
                Value<int> rowid = const Value.absent(),
              }) => SyncEventsCompanion.insert(
                id: id,
                entityType: entityType,
                entityId: entityId,
                operation: operation,
                baseRevision: baseRevision,
                newRevision: newRevision,
                payloadJson: payloadJson,
                deviceId: deviceId,
                createdAt: createdAt,
                idempotencyKey: idempotencyKey,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SyncEventsTable, SyncEvent>(table),
                  BaseReferences<_$AppDatabase, $SyncEventsTable, SyncEvent>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncEventsTable,
      SyncEvent,
      $$SyncEventsTableFilterComposer,
      $$SyncEventsTableOrderingComposer,
      $$SyncEventsTableAnnotationComposer,
      $$SyncEventsTableCreateCompanionBuilder,
      $$SyncEventsTableUpdateCompanionBuilder,
      (SyncEvent, BaseReferences<_$AppDatabase, $SyncEventsTable, SyncEvent>),
      SyncEvent,
      PrefetchHooks Function()
    >;
typedef $$ConflictRecordsTableCreateCompanionBuilder =
    ConflictRecordsCompanion Function({
      required String id,
      required String entityType,
      required String entityId,
      required int localRevision,
      required int remoteRevision,
      Value<String?> resolution,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$ConflictRecordsTableUpdateCompanionBuilder =
    ConflictRecordsCompanion Function({
      Value<String> id,
      Value<String> entityType,
      Value<String> entityId,
      Value<int> localRevision,
      Value<int> remoteRevision,
      Value<String?> resolution,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> createdByDeviceId,
      Value<int> revision,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

class $$ConflictRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $ConflictRecordsTable> {
  $$ConflictRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get localRevision => $composableBuilder(
    column: $table.localRevision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remoteRevision => $composableBuilder(
    column: $table.remoteRevision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resolution => $composableBuilder(
    column: $table.resolution,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ConflictRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $ConflictRecordsTable> {
  $$ConflictRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get localRevision => $composableBuilder(
    column: $table.localRevision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remoteRevision => $composableBuilder(
    column: $table.remoteRevision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resolution => $composableBuilder(
    column: $table.resolution,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ConflictRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConflictRecordsTable> {
  $$ConflictRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<int> get localRevision => $composableBuilder(
    column: $table.localRevision,
    builder: (column) => column,
  );

  GeneratedColumn<int> get remoteRevision => $composableBuilder(
    column: $table.remoteRevision,
    builder: (column) => column,
  );

  GeneratedColumn<String> get resolution => $composableBuilder(
    column: $table.resolution,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get createdByDeviceId => $composableBuilder(
    column: $table.createdByDeviceId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$ConflictRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ConflictRecordsTable,
          ConflictRecord,
          $$ConflictRecordsTableFilterComposer,
          $$ConflictRecordsTableOrderingComposer,
          $$ConflictRecordsTableAnnotationComposer,
          $$ConflictRecordsTableCreateCompanionBuilder,
          $$ConflictRecordsTableUpdateCompanionBuilder,
          (
            ConflictRecord,
            BaseReferences<
              _$AppDatabase,
              $ConflictRecordsTable,
              ConflictRecord
            >,
          ),
          ConflictRecord,
          PrefetchHooks Function()
        > {
  $$ConflictRecordsTableTableManager(
    _$AppDatabase db,
    $ConflictRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConflictRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConflictRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConflictRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<int> localRevision = const Value.absent(),
                Value<int> remoteRevision = const Value.absent(),
                Value<String?> resolution = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ConflictRecordsCompanion(
                id: id,
                entityType: entityType,
                entityId: entityId,
                localRevision: localRevision,
                remoteRevision: remoteRevision,
                resolution: resolution,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String entityType,
                required String entityId,
                required int localRevision,
                required int remoteRevision,
                Value<String?> resolution = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> createdByDeviceId = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ConflictRecordsCompanion.insert(
                id: id,
                entityType: entityType,
                entityId: entityId,
                localRevision: localRevision,
                remoteRevision: remoteRevision,
                resolution: resolution,
                createdAt: createdAt,
                updatedAt: updatedAt,
                createdByDeviceId: createdByDeviceId,
                revision: revision,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ConflictRecordsTable, ConflictRecord>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $ConflictRecordsTable,
                    ConflictRecord
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ConflictRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ConflictRecordsTable,
      ConflictRecord,
      $$ConflictRecordsTableFilterComposer,
      $$ConflictRecordsTableOrderingComposer,
      $$ConflictRecordsTableAnnotationComposer,
      $$ConflictRecordsTableCreateCompanionBuilder,
      $$ConflictRecordsTableUpdateCompanionBuilder,
      (
        ConflictRecord,
        BaseReferences<_$AppDatabase, $ConflictRecordsTable, ConflictRecord>,
      ),
      ConflictRecord,
      PrefetchHooks Function()
    >;
typedef $$AuditLogsTableCreateCompanionBuilder = AuditLogsCompanion Function({
  required String id,
  required String action,
  required String actor,
  Value<DateTime> timestamp,
  required String detailsJson,
  Value<int> rowid,
});
typedef $$AuditLogsTableUpdateCompanionBuilder = AuditLogsCompanion Function({
  Value<String> id,
  Value<String> action,
  Value<String> actor,
  Value<DateTime> timestamp,
  Value<String> detailsJson,
  Value<int> rowid,
});

class $$AuditLogsTableFilterComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get actor => $composableBuilder(
    column: $table.actor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get detailsJson => $composableBuilder(
    column: $table.detailsJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AuditLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get actor => $composableBuilder(
    column: $table.actor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get detailsJson => $composableBuilder(
    column: $table.detailsJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AuditLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get actor =>
      $composableBuilder(column: $table.actor, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get detailsJson => $composableBuilder(
    column: $table.detailsJson,
    builder: (column) => column,
  );
}

class $$AuditLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuditLogsTable,
          AuditLog,
          $$AuditLogsTableFilterComposer,
          $$AuditLogsTableOrderingComposer,
          $$AuditLogsTableAnnotationComposer,
          $$AuditLogsTableCreateCompanionBuilder,
          $$AuditLogsTableUpdateCompanionBuilder,
          (AuditLog, BaseReferences<_$AppDatabase, $AuditLogsTable, AuditLog>),
          AuditLog,
          PrefetchHooks Function()
        > {
  $$AuditLogsTableTableManager(_$AppDatabase db, $AuditLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<String> actor = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<String> detailsJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AuditLogsCompanion(
                id: id,
                action: action,
                actor: actor,
                timestamp: timestamp,
                detailsJson: detailsJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String action,
                required String actor,
                Value<DateTime> timestamp = const Value.absent(),
                required String detailsJson,
                Value<int> rowid = const Value.absent(),
              }) => AuditLogsCompanion.insert(
                id: id,
                action: action,
                actor: actor,
                timestamp: timestamp,
                detailsJson: detailsJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AuditLogsTable, AuditLog>(table),
                  BaseReferences<_$AppDatabase, $AuditLogsTable, AuditLog>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AuditLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuditLogsTable,
      AuditLog,
      $$AuditLogsTableFilterComposer,
      $$AuditLogsTableOrderingComposer,
      $$AuditLogsTableAnnotationComposer,
      $$AuditLogsTableCreateCompanionBuilder,
      $$AuditLogsTableUpdateCompanionBuilder,
      (AuditLog, BaseReferences<_$AppDatabase, $AuditLogsTable, AuditLog>),
      AuditLog,
      PrefetchHooks Function()
    >;
typedef $$DevicesTableCreateCompanionBuilder = DevicesCompanion Function({
  required String id,
  required String displayName,
  Value<DateTime> lastSeenAt,
  Value<bool> isTrusted,
  Value<DateTime?> lastSyncAt,
  Value<int> rowid,
});
typedef $$DevicesTableUpdateCompanionBuilder = DevicesCompanion Function({
  Value<String> id,
  Value<String> displayName,
  Value<DateTime> lastSeenAt,
  Value<bool> isTrusted,
  Value<DateTime?> lastSyncAt,
  Value<int> rowid,
});

final class $$DevicesTableReferences
    extends BaseReferences<_$AppDatabase, $DevicesTable, Device> {
  $$DevicesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SyncPeersTable, List<SyncPeer>>
  _syncPeersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.syncPeers,
    aliasName: 'devices__id__sync_peers__peer_device_id',
  );

  $$SyncPeersTableProcessedTableManager get syncPeersRefs {
    final manager = $$SyncPeersTableTableManager(
      $_db,
      $_db.syncPeers,
    ).filter((f) => f.peerDeviceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_syncPeersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SyncCursorsTable, List<SyncCursor>>
  _syncCursorsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.syncCursors,
    aliasName: 'devices__id__sync_cursors__peer_device_id',
  );

  $$SyncCursorsTableProcessedTableManager get syncCursorsRefs {
    final manager = $$SyncCursorsTableTableManager(
      $_db,
      $_db.syncCursors,
    ).filter((f) => f.peerDeviceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_syncCursorsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DevicesTableFilterComposer
    extends Composer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSeenAt => $composableBuilder(
    column: $table.lastSeenAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isTrusted => $composableBuilder(
    column: $table.isTrusted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSyncAt => $composableBuilder(
    column: $table.lastSyncAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> syncPeersRefs(
    Expression<bool> Function($$SyncPeersTableFilterComposer f) f,
  ) {
    final $$SyncPeersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.syncPeers,
      getReferencedColumn: (t) => t.peerDeviceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SyncPeersTableFilterComposer(
            $db: $db,
            $table: $db.syncPeers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> syncCursorsRefs(
    Expression<bool> Function($$SyncCursorsTableFilterComposer f) f,
  ) {
    final $$SyncCursorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.syncCursors,
      getReferencedColumn: (t) => t.peerDeviceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SyncCursorsTableFilterComposer(
            $db: $db,
            $table: $db.syncCursors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DevicesTableOrderingComposer
    extends Composer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSeenAt => $composableBuilder(
    column: $table.lastSeenAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isTrusted => $composableBuilder(
    column: $table.isTrusted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSyncAt => $composableBuilder(
    column: $table.lastSyncAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DevicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastSeenAt => $composableBuilder(
    column: $table.lastSeenAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isTrusted =>
      $composableBuilder(column: $table.isTrusted, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncAt => $composableBuilder(
    column: $table.lastSyncAt,
    builder: (column) => column,
  );

  Expression<T> syncPeersRefs<T extends Object>(
    Expression<T> Function($$SyncPeersTableAnnotationComposer a) f,
  ) {
    final $$SyncPeersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.syncPeers,
      getReferencedColumn: (t) => t.peerDeviceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SyncPeersTableAnnotationComposer(
            $db: $db,
            $table: $db.syncPeers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> syncCursorsRefs<T extends Object>(
    Expression<T> Function($$SyncCursorsTableAnnotationComposer a) f,
  ) {
    final $$SyncCursorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.syncCursors,
      getReferencedColumn: (t) => t.peerDeviceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SyncCursorsTableAnnotationComposer(
            $db: $db,
            $table: $db.syncCursors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DevicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DevicesTable,
          Device,
          $$DevicesTableFilterComposer,
          $$DevicesTableOrderingComposer,
          $$DevicesTableAnnotationComposer,
          $$DevicesTableCreateCompanionBuilder,
          $$DevicesTableUpdateCompanionBuilder,
          (Device, $$DevicesTableReferences),
          Device,
          PrefetchHooks Function({bool syncPeersRefs, bool syncCursorsRefs})
        > {
  $$DevicesTableTableManager(_$AppDatabase db, $DevicesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DevicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DevicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DevicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<DateTime> lastSeenAt = const Value.absent(),
                Value<bool> isTrusted = const Value.absent(),
                Value<DateTime?> lastSyncAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DevicesCompanion(
                id: id,
                displayName: displayName,
                lastSeenAt: lastSeenAt,
                isTrusted: isTrusted,
                lastSyncAt: lastSyncAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String displayName,
                Value<DateTime> lastSeenAt = const Value.absent(),
                Value<bool> isTrusted = const Value.absent(),
                Value<DateTime?> lastSyncAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DevicesCompanion.insert(
                id: id,
                displayName: displayName,
                lastSeenAt: lastSeenAt,
                isTrusted: isTrusted,
                lastSyncAt: lastSyncAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DevicesTable, Device>(table),
                  $$DevicesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({syncPeersRefs = false, syncCursorsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (syncPeersRefs) db.syncPeers,
                    if (syncCursorsRefs) db.syncCursors,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (syncPeersRefs)
                        await $_getPrefetchedDataByColumns<
                          Device,
                          $DevicesTable,
                          SyncPeer,
                          $SyncPeersTable
                        >(
                          currentTable: table,
                          referencedTable: $$DevicesTableReferences
                              ._syncPeersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DevicesTableReferences(
                                db,
                                table,
                                p0,
                              ).syncPeersRefs,
                          currentColumn: 'id',
                          referencedColumn: 'peer_device_id',
                          typedResults: items,
                        ),
                      if (syncCursorsRefs)
                        await $_getPrefetchedDataByColumns<
                          Device,
                          $DevicesTable,
                          SyncCursor,
                          $SyncCursorsTable
                        >(
                          currentTable: table,
                          referencedTable: $$DevicesTableReferences
                              ._syncCursorsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DevicesTableReferences(
                                db,
                                table,
                                p0,
                              ).syncCursorsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'peer_device_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DevicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DevicesTable,
      Device,
      $$DevicesTableFilterComposer,
      $$DevicesTableOrderingComposer,
      $$DevicesTableAnnotationComposer,
      $$DevicesTableCreateCompanionBuilder,
      $$DevicesTableUpdateCompanionBuilder,
      (Device, $$DevicesTableReferences),
      Device,
      PrefetchHooks Function({bool syncPeersRefs, bool syncCursorsRefs})
    >;
typedef $$SyncPeersTableCreateCompanionBuilder = SyncPeersCompanion Function({
  required String id,
  required String peerDeviceId,
  Value<DateTime> pairedAt,
  Value<DateTime?> lastSyncAt,
  Value<String?> lastSyncedEventId,
  Value<String?> ipAddress,
  Value<int?> port,
  Value<int> rowid,
});
typedef $$SyncPeersTableUpdateCompanionBuilder = SyncPeersCompanion Function({
  Value<String> id,
  Value<String> peerDeviceId,
  Value<DateTime> pairedAt,
  Value<DateTime?> lastSyncAt,
  Value<String?> lastSyncedEventId,
  Value<String?> ipAddress,
  Value<int?> port,
  Value<int> rowid,
});

final class $$SyncPeersTableReferences
    extends BaseReferences<_$AppDatabase, $SyncPeersTable, SyncPeer> {
  $$SyncPeersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DevicesTable _peerDeviceIdTable(_$AppDatabase db) =>
      db.devices.createAlias('sync_peers__peer_device_id__devices__id');

  $$DevicesTableProcessedTableManager get peerDeviceId {
    final $_column = $_itemColumn<String>('peer_device_id')!;

    final manager = $$DevicesTableTableManager(
      $_db,
      $_db.devices,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_peerDeviceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SyncPeersTableFilterComposer
    extends Composer<_$AppDatabase, $SyncPeersTable> {
  $$SyncPeersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get pairedAt => $composableBuilder(
    column: $table.pairedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSyncAt => $composableBuilder(
    column: $table.lastSyncAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSyncedEventId => $composableBuilder(
    column: $table.lastSyncedEventId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ipAddress => $composableBuilder(
    column: $table.ipAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get port => $composableBuilder(
    column: $table.port,
    builder: (column) => ColumnFilters(column),
  );

  $$DevicesTableFilterComposer get peerDeviceId {
    final $$DevicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.peerDeviceId,
      referencedTable: $db.devices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DevicesTableFilterComposer(
            $db: $db,
            $table: $db.devices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SyncPeersTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncPeersTable> {
  $$SyncPeersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get pairedAt => $composableBuilder(
    column: $table.pairedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSyncAt => $composableBuilder(
    column: $table.lastSyncAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSyncedEventId => $composableBuilder(
    column: $table.lastSyncedEventId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ipAddress => $composableBuilder(
    column: $table.ipAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get port => $composableBuilder(
    column: $table.port,
    builder: (column) => ColumnOrderings(column),
  );

  $$DevicesTableOrderingComposer get peerDeviceId {
    final $$DevicesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.peerDeviceId,
      referencedTable: $db.devices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DevicesTableOrderingComposer(
            $db: $db,
            $table: $db.devices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SyncPeersTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncPeersTable> {
  $$SyncPeersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get pairedAt =>
      $composableBuilder(column: $table.pairedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncAt => $composableBuilder(
    column: $table.lastSyncAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastSyncedEventId => $composableBuilder(
    column: $table.lastSyncedEventId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ipAddress =>
      $composableBuilder(column: $table.ipAddress, builder: (column) => column);

  GeneratedColumn<int> get port =>
      $composableBuilder(column: $table.port, builder: (column) => column);

  $$DevicesTableAnnotationComposer get peerDeviceId {
    final $$DevicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.peerDeviceId,
      referencedTable: $db.devices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DevicesTableAnnotationComposer(
            $db: $db,
            $table: $db.devices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SyncPeersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncPeersTable,
          SyncPeer,
          $$SyncPeersTableFilterComposer,
          $$SyncPeersTableOrderingComposer,
          $$SyncPeersTableAnnotationComposer,
          $$SyncPeersTableCreateCompanionBuilder,
          $$SyncPeersTableUpdateCompanionBuilder,
          (SyncPeer, $$SyncPeersTableReferences),
          SyncPeer,
          PrefetchHooks Function({bool peerDeviceId})
        > {
  $$SyncPeersTableTableManager(_$AppDatabase db, $SyncPeersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncPeersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncPeersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncPeersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> peerDeviceId = const Value.absent(),
                Value<DateTime> pairedAt = const Value.absent(),
                Value<DateTime?> lastSyncAt = const Value.absent(),
                Value<String?> lastSyncedEventId = const Value.absent(),
                Value<String?> ipAddress = const Value.absent(),
                Value<int?> port = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncPeersCompanion(
                id: id,
                peerDeviceId: peerDeviceId,
                pairedAt: pairedAt,
                lastSyncAt: lastSyncAt,
                lastSyncedEventId: lastSyncedEventId,
                ipAddress: ipAddress,
                port: port,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String peerDeviceId,
                Value<DateTime> pairedAt = const Value.absent(),
                Value<DateTime?> lastSyncAt = const Value.absent(),
                Value<String?> lastSyncedEventId = const Value.absent(),
                Value<String?> ipAddress = const Value.absent(),
                Value<int?> port = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncPeersCompanion.insert(
                id: id,
                peerDeviceId: peerDeviceId,
                pairedAt: pairedAt,
                lastSyncAt: lastSyncAt,
                lastSyncedEventId: lastSyncedEventId,
                ipAddress: ipAddress,
                port: port,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SyncPeersTable, SyncPeer>(table),
                  $$SyncPeersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({peerDeviceId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (peerDeviceId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.peerDeviceId,
                        referencedTable: $$SyncPeersTableReferences
                            ._peerDeviceIdTable(db),
                        referencedColumn: $$SyncPeersTableReferences
                            ._peerDeviceIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SyncPeersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncPeersTable,
      SyncPeer,
      $$SyncPeersTableFilterComposer,
      $$SyncPeersTableOrderingComposer,
      $$SyncPeersTableAnnotationComposer,
      $$SyncPeersTableCreateCompanionBuilder,
      $$SyncPeersTableUpdateCompanionBuilder,
      (SyncPeer, $$SyncPeersTableReferences),
      SyncPeer,
      PrefetchHooks Function({bool peerDeviceId})
    >;
typedef $$SyncCursorsTableCreateCompanionBuilder =
    SyncCursorsCompanion Function({
      required String id,
      required String peerDeviceId,
      Value<String?> lastReceivedEventId,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$SyncCursorsTableUpdateCompanionBuilder =
    SyncCursorsCompanion Function({
      Value<String> id,
      Value<String> peerDeviceId,
      Value<String?> lastReceivedEventId,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$SyncCursorsTableReferences
    extends BaseReferences<_$AppDatabase, $SyncCursorsTable, SyncCursor> {
  $$SyncCursorsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DevicesTable _peerDeviceIdTable(_$AppDatabase db) =>
      db.devices.createAlias('sync_cursors__peer_device_id__devices__id');

  $$DevicesTableProcessedTableManager get peerDeviceId {
    final $_column = $_itemColumn<String>('peer_device_id')!;

    final manager = $$DevicesTableTableManager(
      $_db,
      $_db.devices,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_peerDeviceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SyncCursorsTableFilterComposer
    extends Composer<_$AppDatabase, $SyncCursorsTable> {
  $$SyncCursorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastReceivedEventId => $composableBuilder(
    column: $table.lastReceivedEventId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DevicesTableFilterComposer get peerDeviceId {
    final $$DevicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.peerDeviceId,
      referencedTable: $db.devices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DevicesTableFilterComposer(
            $db: $db,
            $table: $db.devices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SyncCursorsTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncCursorsTable> {
  $$SyncCursorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastReceivedEventId => $composableBuilder(
    column: $table.lastReceivedEventId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DevicesTableOrderingComposer get peerDeviceId {
    final $$DevicesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.peerDeviceId,
      referencedTable: $db.devices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DevicesTableOrderingComposer(
            $db: $db,
            $table: $db.devices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SyncCursorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncCursorsTable> {
  $$SyncCursorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get lastReceivedEventId => $composableBuilder(
    column: $table.lastReceivedEventId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$DevicesTableAnnotationComposer get peerDeviceId {
    final $$DevicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.peerDeviceId,
      referencedTable: $db.devices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DevicesTableAnnotationComposer(
            $db: $db,
            $table: $db.devices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SyncCursorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncCursorsTable,
          SyncCursor,
          $$SyncCursorsTableFilterComposer,
          $$SyncCursorsTableOrderingComposer,
          $$SyncCursorsTableAnnotationComposer,
          $$SyncCursorsTableCreateCompanionBuilder,
          $$SyncCursorsTableUpdateCompanionBuilder,
          (SyncCursor, $$SyncCursorsTableReferences),
          SyncCursor,
          PrefetchHooks Function({bool peerDeviceId})
        > {
  $$SyncCursorsTableTableManager(_$AppDatabase db, $SyncCursorsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncCursorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncCursorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncCursorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> peerDeviceId = const Value.absent(),
                Value<String?> lastReceivedEventId = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncCursorsCompanion(
                id: id,
                peerDeviceId: peerDeviceId,
                lastReceivedEventId: lastReceivedEventId,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String peerDeviceId,
                Value<String?> lastReceivedEventId = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncCursorsCompanion.insert(
                id: id,
                peerDeviceId: peerDeviceId,
                lastReceivedEventId: lastReceivedEventId,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SyncCursorsTable, SyncCursor>(table),
                  $$SyncCursorsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({peerDeviceId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (peerDeviceId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.peerDeviceId,
                        referencedTable: $$SyncCursorsTableReferences
                            ._peerDeviceIdTable(db),
                        referencedColumn: $$SyncCursorsTableReferences
                            ._peerDeviceIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SyncCursorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncCursorsTable,
      SyncCursor,
      $$SyncCursorsTableFilterComposer,
      $$SyncCursorsTableOrderingComposer,
      $$SyncCursorsTableAnnotationComposer,
      $$SyncCursorsTableCreateCompanionBuilder,
      $$SyncCursorsTableUpdateCompanionBuilder,
      (SyncCursor, $$SyncCursorsTableReferences),
      SyncCursor,
      PrefetchHooks Function({bool peerDeviceId})
    >;
typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSetting,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (
            AppSetting,
            BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
          ),
          AppSetting,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) => AppSettingsCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AppSettingsTable, AppSetting>(table),
                  BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSetting,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (
        AppSetting,
        BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
      ),
      AppSetting,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$StudentsTableTableManager get students =>
      $$StudentsTableTableManager(_db, _db.students);
  $$SubjectsTableTableManager get subjects =>
      $$SubjectsTableTableManager(_db, _db.subjects);
  $$ChaptersTableTableManager get chapters =>
      $$ChaptersTableTableManager(_db, _db.chapters);
  $$TopicsTableTableManager get topics =>
      $$TopicsTableTableManager(_db, _db.topics);
  $$CompetenciesTableTableManager get competencies =>
      $$CompetenciesTableTableManager(_db, _db.competencies);
  $$SourceDocumentsTableTableManager get sourceDocuments =>
      $$SourceDocumentsTableTableManager(_db, _db.sourceDocuments);
  $$DocumentVersionsTableTableManager get documentVersions =>
      $$DocumentVersionsTableTableManager(_db, _db.documentVersions);
  $$DocumentChunksTableTableManager get documentChunks =>
      $$DocumentChunksTableTableManager(_db, _db.documentChunks);
  $$KnowledgeItemsTableTableManager get knowledgeItems =>
      $$KnowledgeItemsTableTableManager(_db, _db.knowledgeItems);
  $$KnowledgeSourcesTableTableManager get knowledgeSources =>
      $$KnowledgeSourcesTableTableManager(_db, _db.knowledgeSources);
  $$QuestionsTableTableManager get questions =>
      $$QuestionsTableTableManager(_db, _db.questions);
  $$QuestionSnapshotsTableTableManager get questionSnapshots =>
      $$QuestionSnapshotsTableTableManager(_db, _db.questionSnapshots);
  $$AssessmentsTableTableManager get assessments =>
      $$AssessmentsTableTableManager(_db, _db.assessments);
  $$AssessmentSnapshotsTableTableManager get assessmentSnapshots =>
      $$AssessmentSnapshotsTableTableManager(_db, _db.assessmentSnapshots);
  $$AssessmentItemsTableTableManager get assessmentItems =>
      $$AssessmentItemsTableTableManager(_db, _db.assessmentItems);
  $$StudentAttemptsTableTableManager get studentAttempts =>
      $$StudentAttemptsTableTableManager(_db, _db.studentAttempts);
  $$StudentAnswersTableTableManager get studentAnswers =>
      $$StudentAnswersTableTableManager(_db, _db.studentAnswers);
  $$MasteryRecordsTableTableManager get masteryRecords =>
      $$MasteryRecordsTableTableManager(_db, _db.masteryRecords);
  $$SyncEventsTableTableManager get syncEvents =>
      $$SyncEventsTableTableManager(_db, _db.syncEvents);
  $$ConflictRecordsTableTableManager get conflictRecords =>
      $$ConflictRecordsTableTableManager(_db, _db.conflictRecords);
  $$AuditLogsTableTableManager get auditLogs =>
      $$AuditLogsTableTableManager(_db, _db.auditLogs);
  $$DevicesTableTableManager get devices =>
      $$DevicesTableTableManager(_db, _db.devices);
  $$SyncPeersTableTableManager get syncPeers =>
      $$SyncPeersTableTableManager(_db, _db.syncPeers);
  $$SyncCursorsTableTableManager get syncCursors =>
      $$SyncCursorsTableTableManager(_db, _db.syncCursors);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
}
