// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TraitsTable extends Traits with TableInfo<$TraitsTable, TraitData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TraitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => uuid.v4(),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'traits';
  @override
  VerificationContext validateIntegrity(
    Insertable<TraitData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TraitData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TraitData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $TraitsTable createAlias(String alias) {
    return $TraitsTable(attachedDatabase, alias);
  }
}

class TraitData extends DataClass implements Insertable<TraitData> {
  final String id;
  final String name;
  final String? description;
  const TraitData({required this.id, required this.name, this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  TraitsCompanion toCompanion(bool nullToAbsent) {
    return TraitsCompanion(
      id: Value(id),
      name: Value(name),
      description:
          description == null && nullToAbsent
              ? const Value.absent()
              : Value(description),
    );
  }

  factory TraitData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TraitData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
    };
  }

  TraitData copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
  }) => TraitData(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
  );
  TraitData copyWithCompanion(TraitsCompanion data) {
    return TraitData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TraitData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TraitData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description);
}

class TraitsCompanion extends UpdateCompanion<TraitData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<int> rowid;
  const TraitsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TraitsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<TraitData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TraitsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<int>? rowid,
  }) {
    return TraitsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TraitsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChildhoodChoicesTable extends ChildhoodChoices
    with TableInfo<$ChildhoodChoicesTable, ChildhoodChoiceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChildhoodChoicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => uuid.v4(),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _traitIdMeta = const VerificationMeta(
    'traitId',
  );
  @override
  late final GeneratedColumn<String> traitId = GeneratedColumn<String>(
    'trait_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES traits (id)',
    ),
  );
  static const VerificationMeta _strengthBonusMeta = const VerificationMeta(
    'strengthBonus',
  );
  @override
  late final GeneratedColumn<int> strengthBonus = GeneratedColumn<int>(
    'strength_bonus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _agilityBonusMeta = const VerificationMeta(
    'agilityBonus',
  );
  @override
  late final GeneratedColumn<int> agilityBonus = GeneratedColumn<int>(
    'agility_bonus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _intelligenceBonusMeta = const VerificationMeta(
    'intelligenceBonus',
  );
  @override
  late final GeneratedColumn<int> intelligenceBonus = GeneratedColumn<int>(
    'intelligence_bonus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _perceptionBonusMeta = const VerificationMeta(
    'perceptionBonus',
  );
  @override
  late final GeneratedColumn<int> perceptionBonus = GeneratedColumn<int>(
    'perception_bonus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _enduranceBonusMeta = const VerificationMeta(
    'enduranceBonus',
  );
  @override
  late final GeneratedColumn<int> enduranceBonus = GeneratedColumn<int>(
    'endurance_bonus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    description,
    traitId,
    strengthBonus,
    agilityBonus,
    intelligenceBonus,
    perceptionBonus,
    enduranceBonus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'childhood_choices';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChildhoodChoiceData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('trait_id')) {
      context.handle(
        _traitIdMeta,
        traitId.isAcceptableOrUnknown(data['trait_id']!, _traitIdMeta),
      );
    }
    if (data.containsKey('strength_bonus')) {
      context.handle(
        _strengthBonusMeta,
        strengthBonus.isAcceptableOrUnknown(
          data['strength_bonus']!,
          _strengthBonusMeta,
        ),
      );
    }
    if (data.containsKey('agility_bonus')) {
      context.handle(
        _agilityBonusMeta,
        agilityBonus.isAcceptableOrUnknown(
          data['agility_bonus']!,
          _agilityBonusMeta,
        ),
      );
    }
    if (data.containsKey('intelligence_bonus')) {
      context.handle(
        _intelligenceBonusMeta,
        intelligenceBonus.isAcceptableOrUnknown(
          data['intelligence_bonus']!,
          _intelligenceBonusMeta,
        ),
      );
    }
    if (data.containsKey('perception_bonus')) {
      context.handle(
        _perceptionBonusMeta,
        perceptionBonus.isAcceptableOrUnknown(
          data['perception_bonus']!,
          _perceptionBonusMeta,
        ),
      );
    }
    if (data.containsKey('endurance_bonus')) {
      context.handle(
        _enduranceBonusMeta,
        enduranceBonus.isAcceptableOrUnknown(
          data['endurance_bonus']!,
          _enduranceBonusMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChildhoodChoiceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChildhoodChoiceData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      description:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}description'],
          )!,
      traitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trait_id'],
      ),
      strengthBonus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}strength_bonus'],
          )!,
      agilityBonus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}agility_bonus'],
          )!,
      intelligenceBonus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}intelligence_bonus'],
          )!,
      perceptionBonus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}perception_bonus'],
          )!,
      enduranceBonus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}endurance_bonus'],
          )!,
    );
  }

  @override
  $ChildhoodChoicesTable createAlias(String alias) {
    return $ChildhoodChoicesTable(attachedDatabase, alias);
  }
}

class ChildhoodChoiceData extends DataClass
    implements Insertable<ChildhoodChoiceData> {
  final String id;
  final String description;
  final String? traitId;
  final int strengthBonus;
  final int agilityBonus;
  final int intelligenceBonus;
  final int perceptionBonus;
  final int enduranceBonus;
  const ChildhoodChoiceData({
    required this.id,
    required this.description,
    this.traitId,
    required this.strengthBonus,
    required this.agilityBonus,
    required this.intelligenceBonus,
    required this.perceptionBonus,
    required this.enduranceBonus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || traitId != null) {
      map['trait_id'] = Variable<String>(traitId);
    }
    map['strength_bonus'] = Variable<int>(strengthBonus);
    map['agility_bonus'] = Variable<int>(agilityBonus);
    map['intelligence_bonus'] = Variable<int>(intelligenceBonus);
    map['perception_bonus'] = Variable<int>(perceptionBonus);
    map['endurance_bonus'] = Variable<int>(enduranceBonus);
    return map;
  }

  ChildhoodChoicesCompanion toCompanion(bool nullToAbsent) {
    return ChildhoodChoicesCompanion(
      id: Value(id),
      description: Value(description),
      traitId:
          traitId == null && nullToAbsent
              ? const Value.absent()
              : Value(traitId),
      strengthBonus: Value(strengthBonus),
      agilityBonus: Value(agilityBonus),
      intelligenceBonus: Value(intelligenceBonus),
      perceptionBonus: Value(perceptionBonus),
      enduranceBonus: Value(enduranceBonus),
    );
  }

  factory ChildhoodChoiceData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChildhoodChoiceData(
      id: serializer.fromJson<String>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      traitId: serializer.fromJson<String?>(json['traitId']),
      strengthBonus: serializer.fromJson<int>(json['strengthBonus']),
      agilityBonus: serializer.fromJson<int>(json['agilityBonus']),
      intelligenceBonus: serializer.fromJson<int>(json['intelligenceBonus']),
      perceptionBonus: serializer.fromJson<int>(json['perceptionBonus']),
      enduranceBonus: serializer.fromJson<int>(json['enduranceBonus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'description': serializer.toJson<String>(description),
      'traitId': serializer.toJson<String?>(traitId),
      'strengthBonus': serializer.toJson<int>(strengthBonus),
      'agilityBonus': serializer.toJson<int>(agilityBonus),
      'intelligenceBonus': serializer.toJson<int>(intelligenceBonus),
      'perceptionBonus': serializer.toJson<int>(perceptionBonus),
      'enduranceBonus': serializer.toJson<int>(enduranceBonus),
    };
  }

  ChildhoodChoiceData copyWith({
    String? id,
    String? description,
    Value<String?> traitId = const Value.absent(),
    int? strengthBonus,
    int? agilityBonus,
    int? intelligenceBonus,
    int? perceptionBonus,
    int? enduranceBonus,
  }) => ChildhoodChoiceData(
    id: id ?? this.id,
    description: description ?? this.description,
    traitId: traitId.present ? traitId.value : this.traitId,
    strengthBonus: strengthBonus ?? this.strengthBonus,
    agilityBonus: agilityBonus ?? this.agilityBonus,
    intelligenceBonus: intelligenceBonus ?? this.intelligenceBonus,
    perceptionBonus: perceptionBonus ?? this.perceptionBonus,
    enduranceBonus: enduranceBonus ?? this.enduranceBonus,
  );
  ChildhoodChoiceData copyWithCompanion(ChildhoodChoicesCompanion data) {
    return ChildhoodChoiceData(
      id: data.id.present ? data.id.value : this.id,
      description:
          data.description.present ? data.description.value : this.description,
      traitId: data.traitId.present ? data.traitId.value : this.traitId,
      strengthBonus:
          data.strengthBonus.present
              ? data.strengthBonus.value
              : this.strengthBonus,
      agilityBonus:
          data.agilityBonus.present
              ? data.agilityBonus.value
              : this.agilityBonus,
      intelligenceBonus:
          data.intelligenceBonus.present
              ? data.intelligenceBonus.value
              : this.intelligenceBonus,
      perceptionBonus:
          data.perceptionBonus.present
              ? data.perceptionBonus.value
              : this.perceptionBonus,
      enduranceBonus:
          data.enduranceBonus.present
              ? data.enduranceBonus.value
              : this.enduranceBonus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChildhoodChoiceData(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('traitId: $traitId, ')
          ..write('strengthBonus: $strengthBonus, ')
          ..write('agilityBonus: $agilityBonus, ')
          ..write('intelligenceBonus: $intelligenceBonus, ')
          ..write('perceptionBonus: $perceptionBonus, ')
          ..write('enduranceBonus: $enduranceBonus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    description,
    traitId,
    strengthBonus,
    agilityBonus,
    intelligenceBonus,
    perceptionBonus,
    enduranceBonus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChildhoodChoiceData &&
          other.id == this.id &&
          other.description == this.description &&
          other.traitId == this.traitId &&
          other.strengthBonus == this.strengthBonus &&
          other.agilityBonus == this.agilityBonus &&
          other.intelligenceBonus == this.intelligenceBonus &&
          other.perceptionBonus == this.perceptionBonus &&
          other.enduranceBonus == this.enduranceBonus);
}

class ChildhoodChoicesCompanion extends UpdateCompanion<ChildhoodChoiceData> {
  final Value<String> id;
  final Value<String> description;
  final Value<String?> traitId;
  final Value<int> strengthBonus;
  final Value<int> agilityBonus;
  final Value<int> intelligenceBonus;
  final Value<int> perceptionBonus;
  final Value<int> enduranceBonus;
  final Value<int> rowid;
  const ChildhoodChoicesCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.traitId = const Value.absent(),
    this.strengthBonus = const Value.absent(),
    this.agilityBonus = const Value.absent(),
    this.intelligenceBonus = const Value.absent(),
    this.perceptionBonus = const Value.absent(),
    this.enduranceBonus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChildhoodChoicesCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    this.traitId = const Value.absent(),
    this.strengthBonus = const Value.absent(),
    this.agilityBonus = const Value.absent(),
    this.intelligenceBonus = const Value.absent(),
    this.perceptionBonus = const Value.absent(),
    this.enduranceBonus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : description = Value(description);
  static Insertable<ChildhoodChoiceData> custom({
    Expression<String>? id,
    Expression<String>? description,
    Expression<String>? traitId,
    Expression<int>? strengthBonus,
    Expression<int>? agilityBonus,
    Expression<int>? intelligenceBonus,
    Expression<int>? perceptionBonus,
    Expression<int>? enduranceBonus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (traitId != null) 'trait_id': traitId,
      if (strengthBonus != null) 'strength_bonus': strengthBonus,
      if (agilityBonus != null) 'agility_bonus': agilityBonus,
      if (intelligenceBonus != null) 'intelligence_bonus': intelligenceBonus,
      if (perceptionBonus != null) 'perception_bonus': perceptionBonus,
      if (enduranceBonus != null) 'endurance_bonus': enduranceBonus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChildhoodChoicesCompanion copyWith({
    Value<String>? id,
    Value<String>? description,
    Value<String?>? traitId,
    Value<int>? strengthBonus,
    Value<int>? agilityBonus,
    Value<int>? intelligenceBonus,
    Value<int>? perceptionBonus,
    Value<int>? enduranceBonus,
    Value<int>? rowid,
  }) {
    return ChildhoodChoicesCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      traitId: traitId ?? this.traitId,
      strengthBonus: strengthBonus ?? this.strengthBonus,
      agilityBonus: agilityBonus ?? this.agilityBonus,
      intelligenceBonus: intelligenceBonus ?? this.intelligenceBonus,
      perceptionBonus: perceptionBonus ?? this.perceptionBonus,
      enduranceBonus: enduranceBonus ?? this.enduranceBonus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (traitId.present) {
      map['trait_id'] = Variable<String>(traitId.value);
    }
    if (strengthBonus.present) {
      map['strength_bonus'] = Variable<int>(strengthBonus.value);
    }
    if (agilityBonus.present) {
      map['agility_bonus'] = Variable<int>(agilityBonus.value);
    }
    if (intelligenceBonus.present) {
      map['intelligence_bonus'] = Variable<int>(intelligenceBonus.value);
    }
    if (perceptionBonus.present) {
      map['perception_bonus'] = Variable<int>(perceptionBonus.value);
    }
    if (enduranceBonus.present) {
      map['endurance_bonus'] = Variable<int>(enduranceBonus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChildhoodChoicesCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('traitId: $traitId, ')
          ..write('strengthBonus: $strengthBonus, ')
          ..write('agilityBonus: $agilityBonus, ')
          ..write('intelligenceBonus: $intelligenceBonus, ')
          ..write('perceptionBonus: $perceptionBonus, ')
          ..write('enduranceBonus: $enduranceBonus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MajorEventChoicesTable extends MajorEventChoices
    with TableInfo<$MajorEventChoicesTable, MajorEventChoiceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MajorEventChoicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => uuid.v4(),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _traitIdMeta = const VerificationMeta(
    'traitId',
  );
  @override
  late final GeneratedColumn<String> traitId = GeneratedColumn<String>(
    'trait_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES traits (id)',
    ),
  );
  static const VerificationMeta _strengthBonusMeta = const VerificationMeta(
    'strengthBonus',
  );
  @override
  late final GeneratedColumn<int> strengthBonus = GeneratedColumn<int>(
    'strength_bonus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _agilityBonusMeta = const VerificationMeta(
    'agilityBonus',
  );
  @override
  late final GeneratedColumn<int> agilityBonus = GeneratedColumn<int>(
    'agility_bonus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _intelligenceBonusMeta = const VerificationMeta(
    'intelligenceBonus',
  );
  @override
  late final GeneratedColumn<int> intelligenceBonus = GeneratedColumn<int>(
    'intelligence_bonus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _perceptionBonusMeta = const VerificationMeta(
    'perceptionBonus',
  );
  @override
  late final GeneratedColumn<int> perceptionBonus = GeneratedColumn<int>(
    'perception_bonus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _enduranceBonusMeta = const VerificationMeta(
    'enduranceBonus',
  );
  @override
  late final GeneratedColumn<int> enduranceBonus = GeneratedColumn<int>(
    'endurance_bonus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    description,
    traitId,
    strengthBonus,
    agilityBonus,
    intelligenceBonus,
    perceptionBonus,
    enduranceBonus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'major_event_choices';
  @override
  VerificationContext validateIntegrity(
    Insertable<MajorEventChoiceData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('trait_id')) {
      context.handle(
        _traitIdMeta,
        traitId.isAcceptableOrUnknown(data['trait_id']!, _traitIdMeta),
      );
    }
    if (data.containsKey('strength_bonus')) {
      context.handle(
        _strengthBonusMeta,
        strengthBonus.isAcceptableOrUnknown(
          data['strength_bonus']!,
          _strengthBonusMeta,
        ),
      );
    }
    if (data.containsKey('agility_bonus')) {
      context.handle(
        _agilityBonusMeta,
        agilityBonus.isAcceptableOrUnknown(
          data['agility_bonus']!,
          _agilityBonusMeta,
        ),
      );
    }
    if (data.containsKey('intelligence_bonus')) {
      context.handle(
        _intelligenceBonusMeta,
        intelligenceBonus.isAcceptableOrUnknown(
          data['intelligence_bonus']!,
          _intelligenceBonusMeta,
        ),
      );
    }
    if (data.containsKey('perception_bonus')) {
      context.handle(
        _perceptionBonusMeta,
        perceptionBonus.isAcceptableOrUnknown(
          data['perception_bonus']!,
          _perceptionBonusMeta,
        ),
      );
    }
    if (data.containsKey('endurance_bonus')) {
      context.handle(
        _enduranceBonusMeta,
        enduranceBonus.isAcceptableOrUnknown(
          data['endurance_bonus']!,
          _enduranceBonusMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MajorEventChoiceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MajorEventChoiceData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      description:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}description'],
          )!,
      traitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trait_id'],
      ),
      strengthBonus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}strength_bonus'],
          )!,
      agilityBonus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}agility_bonus'],
          )!,
      intelligenceBonus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}intelligence_bonus'],
          )!,
      perceptionBonus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}perception_bonus'],
          )!,
      enduranceBonus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}endurance_bonus'],
          )!,
    );
  }

  @override
  $MajorEventChoicesTable createAlias(String alias) {
    return $MajorEventChoicesTable(attachedDatabase, alias);
  }
}

class MajorEventChoiceData extends DataClass
    implements Insertable<MajorEventChoiceData> {
  final String id;
  final String description;
  final String? traitId;
  final int strengthBonus;
  final int agilityBonus;
  final int intelligenceBonus;
  final int perceptionBonus;
  final int enduranceBonus;
  const MajorEventChoiceData({
    required this.id,
    required this.description,
    this.traitId,
    required this.strengthBonus,
    required this.agilityBonus,
    required this.intelligenceBonus,
    required this.perceptionBonus,
    required this.enduranceBonus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || traitId != null) {
      map['trait_id'] = Variable<String>(traitId);
    }
    map['strength_bonus'] = Variable<int>(strengthBonus);
    map['agility_bonus'] = Variable<int>(agilityBonus);
    map['intelligence_bonus'] = Variable<int>(intelligenceBonus);
    map['perception_bonus'] = Variable<int>(perceptionBonus);
    map['endurance_bonus'] = Variable<int>(enduranceBonus);
    return map;
  }

  MajorEventChoicesCompanion toCompanion(bool nullToAbsent) {
    return MajorEventChoicesCompanion(
      id: Value(id),
      description: Value(description),
      traitId:
          traitId == null && nullToAbsent
              ? const Value.absent()
              : Value(traitId),
      strengthBonus: Value(strengthBonus),
      agilityBonus: Value(agilityBonus),
      intelligenceBonus: Value(intelligenceBonus),
      perceptionBonus: Value(perceptionBonus),
      enduranceBonus: Value(enduranceBonus),
    );
  }

  factory MajorEventChoiceData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MajorEventChoiceData(
      id: serializer.fromJson<String>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      traitId: serializer.fromJson<String?>(json['traitId']),
      strengthBonus: serializer.fromJson<int>(json['strengthBonus']),
      agilityBonus: serializer.fromJson<int>(json['agilityBonus']),
      intelligenceBonus: serializer.fromJson<int>(json['intelligenceBonus']),
      perceptionBonus: serializer.fromJson<int>(json['perceptionBonus']),
      enduranceBonus: serializer.fromJson<int>(json['enduranceBonus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'description': serializer.toJson<String>(description),
      'traitId': serializer.toJson<String?>(traitId),
      'strengthBonus': serializer.toJson<int>(strengthBonus),
      'agilityBonus': serializer.toJson<int>(agilityBonus),
      'intelligenceBonus': serializer.toJson<int>(intelligenceBonus),
      'perceptionBonus': serializer.toJson<int>(perceptionBonus),
      'enduranceBonus': serializer.toJson<int>(enduranceBonus),
    };
  }

  MajorEventChoiceData copyWith({
    String? id,
    String? description,
    Value<String?> traitId = const Value.absent(),
    int? strengthBonus,
    int? agilityBonus,
    int? intelligenceBonus,
    int? perceptionBonus,
    int? enduranceBonus,
  }) => MajorEventChoiceData(
    id: id ?? this.id,
    description: description ?? this.description,
    traitId: traitId.present ? traitId.value : this.traitId,
    strengthBonus: strengthBonus ?? this.strengthBonus,
    agilityBonus: agilityBonus ?? this.agilityBonus,
    intelligenceBonus: intelligenceBonus ?? this.intelligenceBonus,
    perceptionBonus: perceptionBonus ?? this.perceptionBonus,
    enduranceBonus: enduranceBonus ?? this.enduranceBonus,
  );
  MajorEventChoiceData copyWithCompanion(MajorEventChoicesCompanion data) {
    return MajorEventChoiceData(
      id: data.id.present ? data.id.value : this.id,
      description:
          data.description.present ? data.description.value : this.description,
      traitId: data.traitId.present ? data.traitId.value : this.traitId,
      strengthBonus:
          data.strengthBonus.present
              ? data.strengthBonus.value
              : this.strengthBonus,
      agilityBonus:
          data.agilityBonus.present
              ? data.agilityBonus.value
              : this.agilityBonus,
      intelligenceBonus:
          data.intelligenceBonus.present
              ? data.intelligenceBonus.value
              : this.intelligenceBonus,
      perceptionBonus:
          data.perceptionBonus.present
              ? data.perceptionBonus.value
              : this.perceptionBonus,
      enduranceBonus:
          data.enduranceBonus.present
              ? data.enduranceBonus.value
              : this.enduranceBonus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MajorEventChoiceData(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('traitId: $traitId, ')
          ..write('strengthBonus: $strengthBonus, ')
          ..write('agilityBonus: $agilityBonus, ')
          ..write('intelligenceBonus: $intelligenceBonus, ')
          ..write('perceptionBonus: $perceptionBonus, ')
          ..write('enduranceBonus: $enduranceBonus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    description,
    traitId,
    strengthBonus,
    agilityBonus,
    intelligenceBonus,
    perceptionBonus,
    enduranceBonus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MajorEventChoiceData &&
          other.id == this.id &&
          other.description == this.description &&
          other.traitId == this.traitId &&
          other.strengthBonus == this.strengthBonus &&
          other.agilityBonus == this.agilityBonus &&
          other.intelligenceBonus == this.intelligenceBonus &&
          other.perceptionBonus == this.perceptionBonus &&
          other.enduranceBonus == this.enduranceBonus);
}

class MajorEventChoicesCompanion extends UpdateCompanion<MajorEventChoiceData> {
  final Value<String> id;
  final Value<String> description;
  final Value<String?> traitId;
  final Value<int> strengthBonus;
  final Value<int> agilityBonus;
  final Value<int> intelligenceBonus;
  final Value<int> perceptionBonus;
  final Value<int> enduranceBonus;
  final Value<int> rowid;
  const MajorEventChoicesCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.traitId = const Value.absent(),
    this.strengthBonus = const Value.absent(),
    this.agilityBonus = const Value.absent(),
    this.intelligenceBonus = const Value.absent(),
    this.perceptionBonus = const Value.absent(),
    this.enduranceBonus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MajorEventChoicesCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    this.traitId = const Value.absent(),
    this.strengthBonus = const Value.absent(),
    this.agilityBonus = const Value.absent(),
    this.intelligenceBonus = const Value.absent(),
    this.perceptionBonus = const Value.absent(),
    this.enduranceBonus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : description = Value(description);
  static Insertable<MajorEventChoiceData> custom({
    Expression<String>? id,
    Expression<String>? description,
    Expression<String>? traitId,
    Expression<int>? strengthBonus,
    Expression<int>? agilityBonus,
    Expression<int>? intelligenceBonus,
    Expression<int>? perceptionBonus,
    Expression<int>? enduranceBonus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (traitId != null) 'trait_id': traitId,
      if (strengthBonus != null) 'strength_bonus': strengthBonus,
      if (agilityBonus != null) 'agility_bonus': agilityBonus,
      if (intelligenceBonus != null) 'intelligence_bonus': intelligenceBonus,
      if (perceptionBonus != null) 'perception_bonus': perceptionBonus,
      if (enduranceBonus != null) 'endurance_bonus': enduranceBonus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MajorEventChoicesCompanion copyWith({
    Value<String>? id,
    Value<String>? description,
    Value<String?>? traitId,
    Value<int>? strengthBonus,
    Value<int>? agilityBonus,
    Value<int>? intelligenceBonus,
    Value<int>? perceptionBonus,
    Value<int>? enduranceBonus,
    Value<int>? rowid,
  }) {
    return MajorEventChoicesCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      traitId: traitId ?? this.traitId,
      strengthBonus: strengthBonus ?? this.strengthBonus,
      agilityBonus: agilityBonus ?? this.agilityBonus,
      intelligenceBonus: intelligenceBonus ?? this.intelligenceBonus,
      perceptionBonus: perceptionBonus ?? this.perceptionBonus,
      enduranceBonus: enduranceBonus ?? this.enduranceBonus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (traitId.present) {
      map['trait_id'] = Variable<String>(traitId.value);
    }
    if (strengthBonus.present) {
      map['strength_bonus'] = Variable<int>(strengthBonus.value);
    }
    if (agilityBonus.present) {
      map['agility_bonus'] = Variable<int>(agilityBonus.value);
    }
    if (intelligenceBonus.present) {
      map['intelligence_bonus'] = Variable<int>(intelligenceBonus.value);
    }
    if (perceptionBonus.present) {
      map['perception_bonus'] = Variable<int>(perceptionBonus.value);
    }
    if (enduranceBonus.present) {
      map['endurance_bonus'] = Variable<int>(enduranceBonus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MajorEventChoicesCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('traitId: $traitId, ')
          ..write('strengthBonus: $strengthBonus, ')
          ..write('agilityBonus: $agilityBonus, ')
          ..write('intelligenceBonus: $intelligenceBonus, ')
          ..write('perceptionBonus: $perceptionBonus, ')
          ..write('enduranceBonus: $enduranceBonus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DarkAwakeningChoicesTable extends DarkAwakeningChoices
    with TableInfo<$DarkAwakeningChoicesTable, DarkAwakeningChoiceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DarkAwakeningChoicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => uuid.v4(),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _traitIdMeta = const VerificationMeta(
    'traitId',
  );
  @override
  late final GeneratedColumn<String> traitId = GeneratedColumn<String>(
    'trait_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES traits (id)',
    ),
  );
  static const VerificationMeta _strengthBonusMeta = const VerificationMeta(
    'strengthBonus',
  );
  @override
  late final GeneratedColumn<int> strengthBonus = GeneratedColumn<int>(
    'strength_bonus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _agilityBonusMeta = const VerificationMeta(
    'agilityBonus',
  );
  @override
  late final GeneratedColumn<int> agilityBonus = GeneratedColumn<int>(
    'agility_bonus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _intelligenceBonusMeta = const VerificationMeta(
    'intelligenceBonus',
  );
  @override
  late final GeneratedColumn<int> intelligenceBonus = GeneratedColumn<int>(
    'intelligence_bonus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _perceptionBonusMeta = const VerificationMeta(
    'perceptionBonus',
  );
  @override
  late final GeneratedColumn<int> perceptionBonus = GeneratedColumn<int>(
    'perception_bonus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _enduranceBonusMeta = const VerificationMeta(
    'enduranceBonus',
  );
  @override
  late final GeneratedColumn<int> enduranceBonus = GeneratedColumn<int>(
    'endurance_bonus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  late final GeneratedColumnWithTypeConverter<AspectType?, String> aspectType =
      GeneratedColumn<String>(
        'aspect_type',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<AspectType?>(
        $DarkAwakeningChoicesTable.$converteraspectTypen,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    description,
    traitId,
    strengthBonus,
    agilityBonus,
    intelligenceBonus,
    perceptionBonus,
    enduranceBonus,
    aspectType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dark_awakening_choices';
  @override
  VerificationContext validateIntegrity(
    Insertable<DarkAwakeningChoiceData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('trait_id')) {
      context.handle(
        _traitIdMeta,
        traitId.isAcceptableOrUnknown(data['trait_id']!, _traitIdMeta),
      );
    }
    if (data.containsKey('strength_bonus')) {
      context.handle(
        _strengthBonusMeta,
        strengthBonus.isAcceptableOrUnknown(
          data['strength_bonus']!,
          _strengthBonusMeta,
        ),
      );
    }
    if (data.containsKey('agility_bonus')) {
      context.handle(
        _agilityBonusMeta,
        agilityBonus.isAcceptableOrUnknown(
          data['agility_bonus']!,
          _agilityBonusMeta,
        ),
      );
    }
    if (data.containsKey('intelligence_bonus')) {
      context.handle(
        _intelligenceBonusMeta,
        intelligenceBonus.isAcceptableOrUnknown(
          data['intelligence_bonus']!,
          _intelligenceBonusMeta,
        ),
      );
    }
    if (data.containsKey('perception_bonus')) {
      context.handle(
        _perceptionBonusMeta,
        perceptionBonus.isAcceptableOrUnknown(
          data['perception_bonus']!,
          _perceptionBonusMeta,
        ),
      );
    }
    if (data.containsKey('endurance_bonus')) {
      context.handle(
        _enduranceBonusMeta,
        enduranceBonus.isAcceptableOrUnknown(
          data['endurance_bonus']!,
          _enduranceBonusMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DarkAwakeningChoiceData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DarkAwakeningChoiceData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      description:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}description'],
          )!,
      traitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trait_id'],
      ),
      strengthBonus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}strength_bonus'],
          )!,
      agilityBonus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}agility_bonus'],
          )!,
      intelligenceBonus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}intelligence_bonus'],
          )!,
      perceptionBonus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}perception_bonus'],
          )!,
      enduranceBonus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}endurance_bonus'],
          )!,
      aspectType: $DarkAwakeningChoicesTable.$converteraspectTypen.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}aspect_type'],
        ),
      ),
    );
  }

  @override
  $DarkAwakeningChoicesTable createAlias(String alias) {
    return $DarkAwakeningChoicesTable(attachedDatabase, alias);
  }

  static TypeConverter<AspectType, String> $converteraspectType =
      const AspectTypeConverter();
  static TypeConverter<AspectType?, String?> $converteraspectTypen =
      NullAwareTypeConverter.wrap($converteraspectType);
}

class DarkAwakeningChoiceData extends DataClass
    implements Insertable<DarkAwakeningChoiceData> {
  final String id;
  final String description;
  final String? traitId;
  final int strengthBonus;
  final int agilityBonus;
  final int intelligenceBonus;
  final int perceptionBonus;
  final int enduranceBonus;
  final AspectType? aspectType;
  const DarkAwakeningChoiceData({
    required this.id,
    required this.description,
    this.traitId,
    required this.strengthBonus,
    required this.agilityBonus,
    required this.intelligenceBonus,
    required this.perceptionBonus,
    required this.enduranceBonus,
    this.aspectType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || traitId != null) {
      map['trait_id'] = Variable<String>(traitId);
    }
    map['strength_bonus'] = Variable<int>(strengthBonus);
    map['agility_bonus'] = Variable<int>(agilityBonus);
    map['intelligence_bonus'] = Variable<int>(intelligenceBonus);
    map['perception_bonus'] = Variable<int>(perceptionBonus);
    map['endurance_bonus'] = Variable<int>(enduranceBonus);
    if (!nullToAbsent || aspectType != null) {
      map['aspect_type'] = Variable<String>(
        $DarkAwakeningChoicesTable.$converteraspectTypen.toSql(aspectType),
      );
    }
    return map;
  }

  DarkAwakeningChoicesCompanion toCompanion(bool nullToAbsent) {
    return DarkAwakeningChoicesCompanion(
      id: Value(id),
      description: Value(description),
      traitId:
          traitId == null && nullToAbsent
              ? const Value.absent()
              : Value(traitId),
      strengthBonus: Value(strengthBonus),
      agilityBonus: Value(agilityBonus),
      intelligenceBonus: Value(intelligenceBonus),
      perceptionBonus: Value(perceptionBonus),
      enduranceBonus: Value(enduranceBonus),
      aspectType:
          aspectType == null && nullToAbsent
              ? const Value.absent()
              : Value(aspectType),
    );
  }

  factory DarkAwakeningChoiceData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DarkAwakeningChoiceData(
      id: serializer.fromJson<String>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      traitId: serializer.fromJson<String?>(json['traitId']),
      strengthBonus: serializer.fromJson<int>(json['strengthBonus']),
      agilityBonus: serializer.fromJson<int>(json['agilityBonus']),
      intelligenceBonus: serializer.fromJson<int>(json['intelligenceBonus']),
      perceptionBonus: serializer.fromJson<int>(json['perceptionBonus']),
      enduranceBonus: serializer.fromJson<int>(json['enduranceBonus']),
      aspectType: serializer.fromJson<AspectType?>(json['aspectType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'description': serializer.toJson<String>(description),
      'traitId': serializer.toJson<String?>(traitId),
      'strengthBonus': serializer.toJson<int>(strengthBonus),
      'agilityBonus': serializer.toJson<int>(agilityBonus),
      'intelligenceBonus': serializer.toJson<int>(intelligenceBonus),
      'perceptionBonus': serializer.toJson<int>(perceptionBonus),
      'enduranceBonus': serializer.toJson<int>(enduranceBonus),
      'aspectType': serializer.toJson<AspectType?>(aspectType),
    };
  }

  DarkAwakeningChoiceData copyWith({
    String? id,
    String? description,
    Value<String?> traitId = const Value.absent(),
    int? strengthBonus,
    int? agilityBonus,
    int? intelligenceBonus,
    int? perceptionBonus,
    int? enduranceBonus,
    Value<AspectType?> aspectType = const Value.absent(),
  }) => DarkAwakeningChoiceData(
    id: id ?? this.id,
    description: description ?? this.description,
    traitId: traitId.present ? traitId.value : this.traitId,
    strengthBonus: strengthBonus ?? this.strengthBonus,
    agilityBonus: agilityBonus ?? this.agilityBonus,
    intelligenceBonus: intelligenceBonus ?? this.intelligenceBonus,
    perceptionBonus: perceptionBonus ?? this.perceptionBonus,
    enduranceBonus: enduranceBonus ?? this.enduranceBonus,
    aspectType: aspectType.present ? aspectType.value : this.aspectType,
  );
  DarkAwakeningChoiceData copyWithCompanion(
    DarkAwakeningChoicesCompanion data,
  ) {
    return DarkAwakeningChoiceData(
      id: data.id.present ? data.id.value : this.id,
      description:
          data.description.present ? data.description.value : this.description,
      traitId: data.traitId.present ? data.traitId.value : this.traitId,
      strengthBonus:
          data.strengthBonus.present
              ? data.strengthBonus.value
              : this.strengthBonus,
      agilityBonus:
          data.agilityBonus.present
              ? data.agilityBonus.value
              : this.agilityBonus,
      intelligenceBonus:
          data.intelligenceBonus.present
              ? data.intelligenceBonus.value
              : this.intelligenceBonus,
      perceptionBonus:
          data.perceptionBonus.present
              ? data.perceptionBonus.value
              : this.perceptionBonus,
      enduranceBonus:
          data.enduranceBonus.present
              ? data.enduranceBonus.value
              : this.enduranceBonus,
      aspectType:
          data.aspectType.present ? data.aspectType.value : this.aspectType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DarkAwakeningChoiceData(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('traitId: $traitId, ')
          ..write('strengthBonus: $strengthBonus, ')
          ..write('agilityBonus: $agilityBonus, ')
          ..write('intelligenceBonus: $intelligenceBonus, ')
          ..write('perceptionBonus: $perceptionBonus, ')
          ..write('enduranceBonus: $enduranceBonus, ')
          ..write('aspectType: $aspectType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    description,
    traitId,
    strengthBonus,
    agilityBonus,
    intelligenceBonus,
    perceptionBonus,
    enduranceBonus,
    aspectType,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DarkAwakeningChoiceData &&
          other.id == this.id &&
          other.description == this.description &&
          other.traitId == this.traitId &&
          other.strengthBonus == this.strengthBonus &&
          other.agilityBonus == this.agilityBonus &&
          other.intelligenceBonus == this.intelligenceBonus &&
          other.perceptionBonus == this.perceptionBonus &&
          other.enduranceBonus == this.enduranceBonus &&
          other.aspectType == this.aspectType);
}

class DarkAwakeningChoicesCompanion
    extends UpdateCompanion<DarkAwakeningChoiceData> {
  final Value<String> id;
  final Value<String> description;
  final Value<String?> traitId;
  final Value<int> strengthBonus;
  final Value<int> agilityBonus;
  final Value<int> intelligenceBonus;
  final Value<int> perceptionBonus;
  final Value<int> enduranceBonus;
  final Value<AspectType?> aspectType;
  final Value<int> rowid;
  const DarkAwakeningChoicesCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.traitId = const Value.absent(),
    this.strengthBonus = const Value.absent(),
    this.agilityBonus = const Value.absent(),
    this.intelligenceBonus = const Value.absent(),
    this.perceptionBonus = const Value.absent(),
    this.enduranceBonus = const Value.absent(),
    this.aspectType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DarkAwakeningChoicesCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    this.traitId = const Value.absent(),
    this.strengthBonus = const Value.absent(),
    this.agilityBonus = const Value.absent(),
    this.intelligenceBonus = const Value.absent(),
    this.perceptionBonus = const Value.absent(),
    this.enduranceBonus = const Value.absent(),
    this.aspectType = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : description = Value(description);
  static Insertable<DarkAwakeningChoiceData> custom({
    Expression<String>? id,
    Expression<String>? description,
    Expression<String>? traitId,
    Expression<int>? strengthBonus,
    Expression<int>? agilityBonus,
    Expression<int>? intelligenceBonus,
    Expression<int>? perceptionBonus,
    Expression<int>? enduranceBonus,
    Expression<String>? aspectType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (traitId != null) 'trait_id': traitId,
      if (strengthBonus != null) 'strength_bonus': strengthBonus,
      if (agilityBonus != null) 'agility_bonus': agilityBonus,
      if (intelligenceBonus != null) 'intelligence_bonus': intelligenceBonus,
      if (perceptionBonus != null) 'perception_bonus': perceptionBonus,
      if (enduranceBonus != null) 'endurance_bonus': enduranceBonus,
      if (aspectType != null) 'aspect_type': aspectType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DarkAwakeningChoicesCompanion copyWith({
    Value<String>? id,
    Value<String>? description,
    Value<String?>? traitId,
    Value<int>? strengthBonus,
    Value<int>? agilityBonus,
    Value<int>? intelligenceBonus,
    Value<int>? perceptionBonus,
    Value<int>? enduranceBonus,
    Value<AspectType?>? aspectType,
    Value<int>? rowid,
  }) {
    return DarkAwakeningChoicesCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      traitId: traitId ?? this.traitId,
      strengthBonus: strengthBonus ?? this.strengthBonus,
      agilityBonus: agilityBonus ?? this.agilityBonus,
      intelligenceBonus: intelligenceBonus ?? this.intelligenceBonus,
      perceptionBonus: perceptionBonus ?? this.perceptionBonus,
      enduranceBonus: enduranceBonus ?? this.enduranceBonus,
      aspectType: aspectType ?? this.aspectType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (traitId.present) {
      map['trait_id'] = Variable<String>(traitId.value);
    }
    if (strengthBonus.present) {
      map['strength_bonus'] = Variable<int>(strengthBonus.value);
    }
    if (agilityBonus.present) {
      map['agility_bonus'] = Variable<int>(agilityBonus.value);
    }
    if (intelligenceBonus.present) {
      map['intelligence_bonus'] = Variable<int>(intelligenceBonus.value);
    }
    if (perceptionBonus.present) {
      map['perception_bonus'] = Variable<int>(perceptionBonus.value);
    }
    if (enduranceBonus.present) {
      map['endurance_bonus'] = Variable<int>(enduranceBonus.value);
    }
    if (aspectType.present) {
      map['aspect_type'] = Variable<String>(
        $DarkAwakeningChoicesTable.$converteraspectTypen.toSql(
          aspectType.value,
        ),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DarkAwakeningChoicesCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('traitId: $traitId, ')
          ..write('strengthBonus: $strengthBonus, ')
          ..write('agilityBonus: $agilityBonus, ')
          ..write('intelligenceBonus: $intelligenceBonus, ')
          ..write('perceptionBonus: $perceptionBonus, ')
          ..write('enduranceBonus: $enduranceBonus, ')
          ..write('aspectType: $aspectType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CharactersTable extends Characters
    with TableInfo<$CharactersTable, CharacterData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => uuid.v4(),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
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
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentHpMeta = const VerificationMeta(
    'currentHp',
  );
  @override
  late final GeneratedColumn<int> currentHp = GeneratedColumn<int>(
    'current_hp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(100),
  );
  static const VerificationMeta _maxHpMeta = const VerificationMeta('maxHp');
  @override
  late final GeneratedColumn<int> maxHp = GeneratedColumn<int>(
    'max_hp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(100),
  );
  static const VerificationMeta _manaMeta = const VerificationMeta('mana');
  @override
  late final GeneratedColumn<int> mana = GeneratedColumn<int>(
    'mana',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(50),
  );
  static const VerificationMeta _coreLevelMeta = const VerificationMeta(
    'coreLevel',
  );
  @override
  late final GeneratedColumn<int> coreLevel = GeneratedColumn<int>(
    'core_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _coreProgressMeta = const VerificationMeta(
    'coreProgress',
  );
  @override
  late final GeneratedColumn<int> coreProgress = GeneratedColumn<int>(
    'core_progress',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _strengthMeta = const VerificationMeta(
    'strength',
  );
  @override
  late final GeneratedColumn<int> strength = GeneratedColumn<int>(
    'strength',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(10),
  );
  static const VerificationMeta _agilityMeta = const VerificationMeta(
    'agility',
  );
  @override
  late final GeneratedColumn<int> agility = GeneratedColumn<int>(
    'agility',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(10),
  );
  static const VerificationMeta _intelligenceMeta = const VerificationMeta(
    'intelligence',
  );
  @override
  late final GeneratedColumn<int> intelligence = GeneratedColumn<int>(
    'intelligence',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(10),
  );
  static const VerificationMeta _perceptionMeta = const VerificationMeta(
    'perception',
  );
  @override
  late final GeneratedColumn<int> perception = GeneratedColumn<int>(
    'perception',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(10),
  );
  static const VerificationMeta _enduranceMeta = const VerificationMeta(
    'endurance',
  );
  @override
  late final GeneratedColumn<int> endurance = GeneratedColumn<int>(
    'endurance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(10),
  );
  @override
  late final GeneratedColumnWithTypeConverter<CharacterRank, String> rank =
      GeneratedColumn<String>(
        'rank',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<CharacterRank>($CharactersTable.$converterrank);
  static const VerificationMeta _aspectMeta = const VerificationMeta('aspect');
  @override
  late final GeneratedColumn<String> aspect = GeneratedColumn<String>(
    'aspect',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _abilitiesRevealedMeta = const VerificationMeta(
    'abilitiesRevealed',
  );
  @override
  late final GeneratedColumn<bool> abilitiesRevealed = GeneratedColumn<bool>(
    'abilities_revealed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("abilities_revealed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _childhoodChoiceIdMeta = const VerificationMeta(
    'childhoodChoiceId',
  );
  @override
  late final GeneratedColumn<String> childhoodChoiceId =
      GeneratedColumn<String>(
        'childhood_choice_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES childhood_choices (id)',
        ),
      );
  static const VerificationMeta _majorEventChoiceIdMeta =
      const VerificationMeta('majorEventChoiceId');
  @override
  late final GeneratedColumn<String> majorEventChoiceId =
      GeneratedColumn<String>(
        'major_event_choice_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES major_event_choices (id)',
        ),
      );
  static const VerificationMeta _darkAwakeningChoiceIdMeta =
      const VerificationMeta('darkAwakeningChoiceId');
  @override
  late final GeneratedColumn<String> darkAwakeningChoiceId =
      GeneratedColumn<String>(
        'dark_awakening_choice_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES dark_awakening_choices (id)',
        ),
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    name,
    currentHp,
    maxHp,
    mana,
    coreLevel,
    coreProgress,
    strength,
    agility,
    intelligence,
    perception,
    endurance,
    rank,
    aspect,
    abilitiesRevealed,
    childhoodChoiceId,
    majorEventChoiceId,
    darkAwakeningChoiceId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'characters';
  @override
  VerificationContext validateIntegrity(
    Insertable<CharacterData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('current_hp')) {
      context.handle(
        _currentHpMeta,
        currentHp.isAcceptableOrUnknown(data['current_hp']!, _currentHpMeta),
      );
    }
    if (data.containsKey('max_hp')) {
      context.handle(
        _maxHpMeta,
        maxHp.isAcceptableOrUnknown(data['max_hp']!, _maxHpMeta),
      );
    }
    if (data.containsKey('mana')) {
      context.handle(
        _manaMeta,
        mana.isAcceptableOrUnknown(data['mana']!, _manaMeta),
      );
    }
    if (data.containsKey('core_level')) {
      context.handle(
        _coreLevelMeta,
        coreLevel.isAcceptableOrUnknown(data['core_level']!, _coreLevelMeta),
      );
    }
    if (data.containsKey('core_progress')) {
      context.handle(
        _coreProgressMeta,
        coreProgress.isAcceptableOrUnknown(
          data['core_progress']!,
          _coreProgressMeta,
        ),
      );
    }
    if (data.containsKey('strength')) {
      context.handle(
        _strengthMeta,
        strength.isAcceptableOrUnknown(data['strength']!, _strengthMeta),
      );
    }
    if (data.containsKey('agility')) {
      context.handle(
        _agilityMeta,
        agility.isAcceptableOrUnknown(data['agility']!, _agilityMeta),
      );
    }
    if (data.containsKey('intelligence')) {
      context.handle(
        _intelligenceMeta,
        intelligence.isAcceptableOrUnknown(
          data['intelligence']!,
          _intelligenceMeta,
        ),
      );
    }
    if (data.containsKey('perception')) {
      context.handle(
        _perceptionMeta,
        perception.isAcceptableOrUnknown(data['perception']!, _perceptionMeta),
      );
    }
    if (data.containsKey('endurance')) {
      context.handle(
        _enduranceMeta,
        endurance.isAcceptableOrUnknown(data['endurance']!, _enduranceMeta),
      );
    }
    if (data.containsKey('aspect')) {
      context.handle(
        _aspectMeta,
        aspect.isAcceptableOrUnknown(data['aspect']!, _aspectMeta),
      );
    }
    if (data.containsKey('abilities_revealed')) {
      context.handle(
        _abilitiesRevealedMeta,
        abilitiesRevealed.isAcceptableOrUnknown(
          data['abilities_revealed']!,
          _abilitiesRevealedMeta,
        ),
      );
    }
    if (data.containsKey('childhood_choice_id')) {
      context.handle(
        _childhoodChoiceIdMeta,
        childhoodChoiceId.isAcceptableOrUnknown(
          data['childhood_choice_id']!,
          _childhoodChoiceIdMeta,
        ),
      );
    }
    if (data.containsKey('major_event_choice_id')) {
      context.handle(
        _majorEventChoiceIdMeta,
        majorEventChoiceId.isAcceptableOrUnknown(
          data['major_event_choice_id']!,
          _majorEventChoiceIdMeta,
        ),
      );
    }
    if (data.containsKey('dark_awakening_choice_id')) {
      context.handle(
        _darkAwakeningChoiceIdMeta,
        darkAwakeningChoiceId.isAcceptableOrUnknown(
          data['dark_awakening_choice_id']!,
          _darkAwakeningChoiceIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CharacterData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      userId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}user_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      currentHp:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}current_hp'],
          )!,
      maxHp:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}max_hp'],
          )!,
      mana:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}mana'],
          )!,
      coreLevel:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}core_level'],
          )!,
      coreProgress:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}core_progress'],
          )!,
      strength:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}strength'],
          )!,
      agility:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}agility'],
          )!,
      intelligence:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}intelligence'],
          )!,
      perception:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}perception'],
          )!,
      endurance:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}endurance'],
          )!,
      rank: $CharactersTable.$converterrank.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}rank'],
        )!,
      ),
      aspect: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}aspect'],
      ),
      abilitiesRevealed:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}abilities_revealed'],
          )!,
      childhoodChoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}childhood_choice_id'],
      ),
      majorEventChoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}major_event_choice_id'],
      ),
      darkAwakeningChoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dark_awakening_choice_id'],
      ),
    );
  }

  @override
  $CharactersTable createAlias(String alias) {
    return $CharactersTable(attachedDatabase, alias);
  }

  static TypeConverter<CharacterRank, String> $converterrank =
      const CharacterRankConverter();
}

class CharacterData extends DataClass implements Insertable<CharacterData> {
  final String id;
  final String userId;
  final String name;
  final int currentHp;
  final int maxHp;
  final int mana;
  final int coreLevel;
  final int coreProgress;
  final int strength;
  final int agility;
  final int intelligence;
  final int perception;
  final int endurance;
  final CharacterRank rank;
  final String? aspect;
  final bool abilitiesRevealed;
  final String? childhoodChoiceId;
  final String? majorEventChoiceId;
  final String? darkAwakeningChoiceId;
  const CharacterData({
    required this.id,
    required this.userId,
    required this.name,
    required this.currentHp,
    required this.maxHp,
    required this.mana,
    required this.coreLevel,
    required this.coreProgress,
    required this.strength,
    required this.agility,
    required this.intelligence,
    required this.perception,
    required this.endurance,
    required this.rank,
    this.aspect,
    required this.abilitiesRevealed,
    this.childhoodChoiceId,
    this.majorEventChoiceId,
    this.darkAwakeningChoiceId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['name'] = Variable<String>(name);
    map['current_hp'] = Variable<int>(currentHp);
    map['max_hp'] = Variable<int>(maxHp);
    map['mana'] = Variable<int>(mana);
    map['core_level'] = Variable<int>(coreLevel);
    map['core_progress'] = Variable<int>(coreProgress);
    map['strength'] = Variable<int>(strength);
    map['agility'] = Variable<int>(agility);
    map['intelligence'] = Variable<int>(intelligence);
    map['perception'] = Variable<int>(perception);
    map['endurance'] = Variable<int>(endurance);
    {
      map['rank'] = Variable<String>(
        $CharactersTable.$converterrank.toSql(rank),
      );
    }
    if (!nullToAbsent || aspect != null) {
      map['aspect'] = Variable<String>(aspect);
    }
    map['abilities_revealed'] = Variable<bool>(abilitiesRevealed);
    if (!nullToAbsent || childhoodChoiceId != null) {
      map['childhood_choice_id'] = Variable<String>(childhoodChoiceId);
    }
    if (!nullToAbsent || majorEventChoiceId != null) {
      map['major_event_choice_id'] = Variable<String>(majorEventChoiceId);
    }
    if (!nullToAbsent || darkAwakeningChoiceId != null) {
      map['dark_awakening_choice_id'] = Variable<String>(darkAwakeningChoiceId);
    }
    return map;
  }

  CharactersCompanion toCompanion(bool nullToAbsent) {
    return CharactersCompanion(
      id: Value(id),
      userId: Value(userId),
      name: Value(name),
      currentHp: Value(currentHp),
      maxHp: Value(maxHp),
      mana: Value(mana),
      coreLevel: Value(coreLevel),
      coreProgress: Value(coreProgress),
      strength: Value(strength),
      agility: Value(agility),
      intelligence: Value(intelligence),
      perception: Value(perception),
      endurance: Value(endurance),
      rank: Value(rank),
      aspect:
          aspect == null && nullToAbsent ? const Value.absent() : Value(aspect),
      abilitiesRevealed: Value(abilitiesRevealed),
      childhoodChoiceId:
          childhoodChoiceId == null && nullToAbsent
              ? const Value.absent()
              : Value(childhoodChoiceId),
      majorEventChoiceId:
          majorEventChoiceId == null && nullToAbsent
              ? const Value.absent()
              : Value(majorEventChoiceId),
      darkAwakeningChoiceId:
          darkAwakeningChoiceId == null && nullToAbsent
              ? const Value.absent()
              : Value(darkAwakeningChoiceId),
    );
  }

  factory CharacterData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterData(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      currentHp: serializer.fromJson<int>(json['currentHp']),
      maxHp: serializer.fromJson<int>(json['maxHp']),
      mana: serializer.fromJson<int>(json['mana']),
      coreLevel: serializer.fromJson<int>(json['coreLevel']),
      coreProgress: serializer.fromJson<int>(json['coreProgress']),
      strength: serializer.fromJson<int>(json['strength']),
      agility: serializer.fromJson<int>(json['agility']),
      intelligence: serializer.fromJson<int>(json['intelligence']),
      perception: serializer.fromJson<int>(json['perception']),
      endurance: serializer.fromJson<int>(json['endurance']),
      rank: serializer.fromJson<CharacterRank>(json['rank']),
      aspect: serializer.fromJson<String?>(json['aspect']),
      abilitiesRevealed: serializer.fromJson<bool>(json['abilitiesRevealed']),
      childhoodChoiceId: serializer.fromJson<String?>(
        json['childhoodChoiceId'],
      ),
      majorEventChoiceId: serializer.fromJson<String?>(
        json['majorEventChoiceId'],
      ),
      darkAwakeningChoiceId: serializer.fromJson<String?>(
        json['darkAwakeningChoiceId'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'name': serializer.toJson<String>(name),
      'currentHp': serializer.toJson<int>(currentHp),
      'maxHp': serializer.toJson<int>(maxHp),
      'mana': serializer.toJson<int>(mana),
      'coreLevel': serializer.toJson<int>(coreLevel),
      'coreProgress': serializer.toJson<int>(coreProgress),
      'strength': serializer.toJson<int>(strength),
      'agility': serializer.toJson<int>(agility),
      'intelligence': serializer.toJson<int>(intelligence),
      'perception': serializer.toJson<int>(perception),
      'endurance': serializer.toJson<int>(endurance),
      'rank': serializer.toJson<CharacterRank>(rank),
      'aspect': serializer.toJson<String?>(aspect),
      'abilitiesRevealed': serializer.toJson<bool>(abilitiesRevealed),
      'childhoodChoiceId': serializer.toJson<String?>(childhoodChoiceId),
      'majorEventChoiceId': serializer.toJson<String?>(majorEventChoiceId),
      'darkAwakeningChoiceId': serializer.toJson<String?>(
        darkAwakeningChoiceId,
      ),
    };
  }

  CharacterData copyWith({
    String? id,
    String? userId,
    String? name,
    int? currentHp,
    int? maxHp,
    int? mana,
    int? coreLevel,
    int? coreProgress,
    int? strength,
    int? agility,
    int? intelligence,
    int? perception,
    int? endurance,
    CharacterRank? rank,
    Value<String?> aspect = const Value.absent(),
    bool? abilitiesRevealed,
    Value<String?> childhoodChoiceId = const Value.absent(),
    Value<String?> majorEventChoiceId = const Value.absent(),
    Value<String?> darkAwakeningChoiceId = const Value.absent(),
  }) => CharacterData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    name: name ?? this.name,
    currentHp: currentHp ?? this.currentHp,
    maxHp: maxHp ?? this.maxHp,
    mana: mana ?? this.mana,
    coreLevel: coreLevel ?? this.coreLevel,
    coreProgress: coreProgress ?? this.coreProgress,
    strength: strength ?? this.strength,
    agility: agility ?? this.agility,
    intelligence: intelligence ?? this.intelligence,
    perception: perception ?? this.perception,
    endurance: endurance ?? this.endurance,
    rank: rank ?? this.rank,
    aspect: aspect.present ? aspect.value : this.aspect,
    abilitiesRevealed: abilitiesRevealed ?? this.abilitiesRevealed,
    childhoodChoiceId:
        childhoodChoiceId.present
            ? childhoodChoiceId.value
            : this.childhoodChoiceId,
    majorEventChoiceId:
        majorEventChoiceId.present
            ? majorEventChoiceId.value
            : this.majorEventChoiceId,
    darkAwakeningChoiceId:
        darkAwakeningChoiceId.present
            ? darkAwakeningChoiceId.value
            : this.darkAwakeningChoiceId,
  );
  CharacterData copyWithCompanion(CharactersCompanion data) {
    return CharacterData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      currentHp: data.currentHp.present ? data.currentHp.value : this.currentHp,
      maxHp: data.maxHp.present ? data.maxHp.value : this.maxHp,
      mana: data.mana.present ? data.mana.value : this.mana,
      coreLevel: data.coreLevel.present ? data.coreLevel.value : this.coreLevel,
      coreProgress:
          data.coreProgress.present
              ? data.coreProgress.value
              : this.coreProgress,
      strength: data.strength.present ? data.strength.value : this.strength,
      agility: data.agility.present ? data.agility.value : this.agility,
      intelligence:
          data.intelligence.present
              ? data.intelligence.value
              : this.intelligence,
      perception:
          data.perception.present ? data.perception.value : this.perception,
      endurance: data.endurance.present ? data.endurance.value : this.endurance,
      rank: data.rank.present ? data.rank.value : this.rank,
      aspect: data.aspect.present ? data.aspect.value : this.aspect,
      abilitiesRevealed:
          data.abilitiesRevealed.present
              ? data.abilitiesRevealed.value
              : this.abilitiesRevealed,
      childhoodChoiceId:
          data.childhoodChoiceId.present
              ? data.childhoodChoiceId.value
              : this.childhoodChoiceId,
      majorEventChoiceId:
          data.majorEventChoiceId.present
              ? data.majorEventChoiceId.value
              : this.majorEventChoiceId,
      darkAwakeningChoiceId:
          data.darkAwakeningChoiceId.present
              ? data.darkAwakeningChoiceId.value
              : this.darkAwakeningChoiceId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('currentHp: $currentHp, ')
          ..write('maxHp: $maxHp, ')
          ..write('mana: $mana, ')
          ..write('coreLevel: $coreLevel, ')
          ..write('coreProgress: $coreProgress, ')
          ..write('strength: $strength, ')
          ..write('agility: $agility, ')
          ..write('intelligence: $intelligence, ')
          ..write('perception: $perception, ')
          ..write('endurance: $endurance, ')
          ..write('rank: $rank, ')
          ..write('aspect: $aspect, ')
          ..write('abilitiesRevealed: $abilitiesRevealed, ')
          ..write('childhoodChoiceId: $childhoodChoiceId, ')
          ..write('majorEventChoiceId: $majorEventChoiceId, ')
          ..write('darkAwakeningChoiceId: $darkAwakeningChoiceId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    name,
    currentHp,
    maxHp,
    mana,
    coreLevel,
    coreProgress,
    strength,
    agility,
    intelligence,
    perception,
    endurance,
    rank,
    aspect,
    abilitiesRevealed,
    childhoodChoiceId,
    majorEventChoiceId,
    darkAwakeningChoiceId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.currentHp == this.currentHp &&
          other.maxHp == this.maxHp &&
          other.mana == this.mana &&
          other.coreLevel == this.coreLevel &&
          other.coreProgress == this.coreProgress &&
          other.strength == this.strength &&
          other.agility == this.agility &&
          other.intelligence == this.intelligence &&
          other.perception == this.perception &&
          other.endurance == this.endurance &&
          other.rank == this.rank &&
          other.aspect == this.aspect &&
          other.abilitiesRevealed == this.abilitiesRevealed &&
          other.childhoodChoiceId == this.childhoodChoiceId &&
          other.majorEventChoiceId == this.majorEventChoiceId &&
          other.darkAwakeningChoiceId == this.darkAwakeningChoiceId);
}

class CharactersCompanion extends UpdateCompanion<CharacterData> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> name;
  final Value<int> currentHp;
  final Value<int> maxHp;
  final Value<int> mana;
  final Value<int> coreLevel;
  final Value<int> coreProgress;
  final Value<int> strength;
  final Value<int> agility;
  final Value<int> intelligence;
  final Value<int> perception;
  final Value<int> endurance;
  final Value<CharacterRank> rank;
  final Value<String?> aspect;
  final Value<bool> abilitiesRevealed;
  final Value<String?> childhoodChoiceId;
  final Value<String?> majorEventChoiceId;
  final Value<String?> darkAwakeningChoiceId;
  final Value<int> rowid;
  const CharactersCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.currentHp = const Value.absent(),
    this.maxHp = const Value.absent(),
    this.mana = const Value.absent(),
    this.coreLevel = const Value.absent(),
    this.coreProgress = const Value.absent(),
    this.strength = const Value.absent(),
    this.agility = const Value.absent(),
    this.intelligence = const Value.absent(),
    this.perception = const Value.absent(),
    this.endurance = const Value.absent(),
    this.rank = const Value.absent(),
    this.aspect = const Value.absent(),
    this.abilitiesRevealed = const Value.absent(),
    this.childhoodChoiceId = const Value.absent(),
    this.majorEventChoiceId = const Value.absent(),
    this.darkAwakeningChoiceId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharactersCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String name,
    this.currentHp = const Value.absent(),
    this.maxHp = const Value.absent(),
    this.mana = const Value.absent(),
    this.coreLevel = const Value.absent(),
    this.coreProgress = const Value.absent(),
    this.strength = const Value.absent(),
    this.agility = const Value.absent(),
    this.intelligence = const Value.absent(),
    this.perception = const Value.absent(),
    this.endurance = const Value.absent(),
    required CharacterRank rank,
    this.aspect = const Value.absent(),
    this.abilitiesRevealed = const Value.absent(),
    this.childhoodChoiceId = const Value.absent(),
    this.majorEventChoiceId = const Value.absent(),
    this.darkAwakeningChoiceId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userId = Value(userId),
       name = Value(name),
       rank = Value(rank);
  static Insertable<CharacterData> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? name,
    Expression<int>? currentHp,
    Expression<int>? maxHp,
    Expression<int>? mana,
    Expression<int>? coreLevel,
    Expression<int>? coreProgress,
    Expression<int>? strength,
    Expression<int>? agility,
    Expression<int>? intelligence,
    Expression<int>? perception,
    Expression<int>? endurance,
    Expression<String>? rank,
    Expression<String>? aspect,
    Expression<bool>? abilitiesRevealed,
    Expression<String>? childhoodChoiceId,
    Expression<String>? majorEventChoiceId,
    Expression<String>? darkAwakeningChoiceId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (currentHp != null) 'current_hp': currentHp,
      if (maxHp != null) 'max_hp': maxHp,
      if (mana != null) 'mana': mana,
      if (coreLevel != null) 'core_level': coreLevel,
      if (coreProgress != null) 'core_progress': coreProgress,
      if (strength != null) 'strength': strength,
      if (agility != null) 'agility': agility,
      if (intelligence != null) 'intelligence': intelligence,
      if (perception != null) 'perception': perception,
      if (endurance != null) 'endurance': endurance,
      if (rank != null) 'rank': rank,
      if (aspect != null) 'aspect': aspect,
      if (abilitiesRevealed != null) 'abilities_revealed': abilitiesRevealed,
      if (childhoodChoiceId != null) 'childhood_choice_id': childhoodChoiceId,
      if (majorEventChoiceId != null)
        'major_event_choice_id': majorEventChoiceId,
      if (darkAwakeningChoiceId != null)
        'dark_awakening_choice_id': darkAwakeningChoiceId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharactersCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? name,
    Value<int>? currentHp,
    Value<int>? maxHp,
    Value<int>? mana,
    Value<int>? coreLevel,
    Value<int>? coreProgress,
    Value<int>? strength,
    Value<int>? agility,
    Value<int>? intelligence,
    Value<int>? perception,
    Value<int>? endurance,
    Value<CharacterRank>? rank,
    Value<String?>? aspect,
    Value<bool>? abilitiesRevealed,
    Value<String?>? childhoodChoiceId,
    Value<String?>? majorEventChoiceId,
    Value<String?>? darkAwakeningChoiceId,
    Value<int>? rowid,
  }) {
    return CharactersCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      currentHp: currentHp ?? this.currentHp,
      maxHp: maxHp ?? this.maxHp,
      mana: mana ?? this.mana,
      coreLevel: coreLevel ?? this.coreLevel,
      coreProgress: coreProgress ?? this.coreProgress,
      strength: strength ?? this.strength,
      agility: agility ?? this.agility,
      intelligence: intelligence ?? this.intelligence,
      perception: perception ?? this.perception,
      endurance: endurance ?? this.endurance,
      rank: rank ?? this.rank,
      aspect: aspect ?? this.aspect,
      abilitiesRevealed: abilitiesRevealed ?? this.abilitiesRevealed,
      childhoodChoiceId: childhoodChoiceId ?? this.childhoodChoiceId,
      majorEventChoiceId: majorEventChoiceId ?? this.majorEventChoiceId,
      darkAwakeningChoiceId:
          darkAwakeningChoiceId ?? this.darkAwakeningChoiceId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (currentHp.present) {
      map['current_hp'] = Variable<int>(currentHp.value);
    }
    if (maxHp.present) {
      map['max_hp'] = Variable<int>(maxHp.value);
    }
    if (mana.present) {
      map['mana'] = Variable<int>(mana.value);
    }
    if (coreLevel.present) {
      map['core_level'] = Variable<int>(coreLevel.value);
    }
    if (coreProgress.present) {
      map['core_progress'] = Variable<int>(coreProgress.value);
    }
    if (strength.present) {
      map['strength'] = Variable<int>(strength.value);
    }
    if (agility.present) {
      map['agility'] = Variable<int>(agility.value);
    }
    if (intelligence.present) {
      map['intelligence'] = Variable<int>(intelligence.value);
    }
    if (perception.present) {
      map['perception'] = Variable<int>(perception.value);
    }
    if (endurance.present) {
      map['endurance'] = Variable<int>(endurance.value);
    }
    if (rank.present) {
      map['rank'] = Variable<String>(
        $CharactersTable.$converterrank.toSql(rank.value),
      );
    }
    if (aspect.present) {
      map['aspect'] = Variable<String>(aspect.value);
    }
    if (abilitiesRevealed.present) {
      map['abilities_revealed'] = Variable<bool>(abilitiesRevealed.value);
    }
    if (childhoodChoiceId.present) {
      map['childhood_choice_id'] = Variable<String>(childhoodChoiceId.value);
    }
    if (majorEventChoiceId.present) {
      map['major_event_choice_id'] = Variable<String>(majorEventChoiceId.value);
    }
    if (darkAwakeningChoiceId.present) {
      map['dark_awakening_choice_id'] = Variable<String>(
        darkAwakeningChoiceId.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharactersCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('currentHp: $currentHp, ')
          ..write('maxHp: $maxHp, ')
          ..write('mana: $mana, ')
          ..write('coreLevel: $coreLevel, ')
          ..write('coreProgress: $coreProgress, ')
          ..write('strength: $strength, ')
          ..write('agility: $agility, ')
          ..write('intelligence: $intelligence, ')
          ..write('perception: $perception, ')
          ..write('endurance: $endurance, ')
          ..write('rank: $rank, ')
          ..write('aspect: $aspect, ')
          ..write('abilitiesRevealed: $abilitiesRevealed, ')
          ..write('childhoodChoiceId: $childhoodChoiceId, ')
          ..write('majorEventChoiceId: $majorEventChoiceId, ')
          ..write('darkAwakeningChoiceId: $darkAwakeningChoiceId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AbilitiesTable extends Abilities
    with TableInfo<$AbilitiesTable, AbilityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AbilitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => uuid.v4(),
  );
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id)',
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
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _manaCostMeta = const VerificationMeta(
    'manaCost',
  );
  @override
  late final GeneratedColumn<int> manaCost = GeneratedColumn<int>(
    'mana_cost',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _cooldownMeta = const VerificationMeta(
    'cooldown',
  );
  @override
  late final GeneratedColumn<int> cooldown = GeneratedColumn<int>(
    'cooldown',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  late final GeneratedColumnWithTypeConverter<CharacterRank, String>
  rankRequired = GeneratedColumn<String>(
    'rank_required',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<CharacterRank>($AbilitiesTable.$converterrankRequired);
  @override
  late final GeneratedColumnWithTypeConverter<AspectType, String> aspectType =
      GeneratedColumn<String>(
        'aspect_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<AspectType>($AbilitiesTable.$converteraspectType);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    characterId,
    name,
    description,
    manaCost,
    cooldown,
    rankRequired,
    aspectType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'abilities';
  @override
  VerificationContext validateIntegrity(
    Insertable<AbilityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('mana_cost')) {
      context.handle(
        _manaCostMeta,
        manaCost.isAcceptableOrUnknown(data['mana_cost']!, _manaCostMeta),
      );
    }
    if (data.containsKey('cooldown')) {
      context.handle(
        _cooldownMeta,
        cooldown.isAcceptableOrUnknown(data['cooldown']!, _cooldownMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AbilityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AbilityData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      characterId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}character_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      manaCost:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}mana_cost'],
          )!,
      cooldown:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}cooldown'],
          )!,
      rankRequired: $AbilitiesTable.$converterrankRequired.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}rank_required'],
        )!,
      ),
      aspectType: $AbilitiesTable.$converteraspectType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}aspect_type'],
        )!,
      ),
    );
  }

  @override
  $AbilitiesTable createAlias(String alias) {
    return $AbilitiesTable(attachedDatabase, alias);
  }

  static TypeConverter<CharacterRank, String> $converterrankRequired =
      const CharacterRankConverter();
  static TypeConverter<AspectType, String> $converteraspectType =
      const AspectTypeConverter();
}

class AbilityData extends DataClass implements Insertable<AbilityData> {
  final String id;
  final String characterId;
  final String name;
  final String? description;
  final int manaCost;
  final int cooldown;
  final CharacterRank rankRequired;
  final AspectType aspectType;
  const AbilityData({
    required this.id,
    required this.characterId,
    required this.name,
    this.description,
    required this.manaCost,
    required this.cooldown,
    required this.rankRequired,
    required this.aspectType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['character_id'] = Variable<String>(characterId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['mana_cost'] = Variable<int>(manaCost);
    map['cooldown'] = Variable<int>(cooldown);
    {
      map['rank_required'] = Variable<String>(
        $AbilitiesTable.$converterrankRequired.toSql(rankRequired),
      );
    }
    {
      map['aspect_type'] = Variable<String>(
        $AbilitiesTable.$converteraspectType.toSql(aspectType),
      );
    }
    return map;
  }

  AbilitiesCompanion toCompanion(bool nullToAbsent) {
    return AbilitiesCompanion(
      id: Value(id),
      characterId: Value(characterId),
      name: Value(name),
      description:
          description == null && nullToAbsent
              ? const Value.absent()
              : Value(description),
      manaCost: Value(manaCost),
      cooldown: Value(cooldown),
      rankRequired: Value(rankRequired),
      aspectType: Value(aspectType),
    );
  }

  factory AbilityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AbilityData(
      id: serializer.fromJson<String>(json['id']),
      characterId: serializer.fromJson<String>(json['characterId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      manaCost: serializer.fromJson<int>(json['manaCost']),
      cooldown: serializer.fromJson<int>(json['cooldown']),
      rankRequired: serializer.fromJson<CharacterRank>(json['rankRequired']),
      aspectType: serializer.fromJson<AspectType>(json['aspectType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'characterId': serializer.toJson<String>(characterId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'manaCost': serializer.toJson<int>(manaCost),
      'cooldown': serializer.toJson<int>(cooldown),
      'rankRequired': serializer.toJson<CharacterRank>(rankRequired),
      'aspectType': serializer.toJson<AspectType>(aspectType),
    };
  }

  AbilityData copyWith({
    String? id,
    String? characterId,
    String? name,
    Value<String?> description = const Value.absent(),
    int? manaCost,
    int? cooldown,
    CharacterRank? rankRequired,
    AspectType? aspectType,
  }) => AbilityData(
    id: id ?? this.id,
    characterId: characterId ?? this.characterId,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    manaCost: manaCost ?? this.manaCost,
    cooldown: cooldown ?? this.cooldown,
    rankRequired: rankRequired ?? this.rankRequired,
    aspectType: aspectType ?? this.aspectType,
  );
  AbilityData copyWithCompanion(AbilitiesCompanion data) {
    return AbilityData(
      id: data.id.present ? data.id.value : this.id,
      characterId:
          data.characterId.present ? data.characterId.value : this.characterId,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      manaCost: data.manaCost.present ? data.manaCost.value : this.manaCost,
      cooldown: data.cooldown.present ? data.cooldown.value : this.cooldown,
      rankRequired:
          data.rankRequired.present
              ? data.rankRequired.value
              : this.rankRequired,
      aspectType:
          data.aspectType.present ? data.aspectType.value : this.aspectType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AbilityData(')
          ..write('id: $id, ')
          ..write('characterId: $characterId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('manaCost: $manaCost, ')
          ..write('cooldown: $cooldown, ')
          ..write('rankRequired: $rankRequired, ')
          ..write('aspectType: $aspectType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    characterId,
    name,
    description,
    manaCost,
    cooldown,
    rankRequired,
    aspectType,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AbilityData &&
          other.id == this.id &&
          other.characterId == this.characterId &&
          other.name == this.name &&
          other.description == this.description &&
          other.manaCost == this.manaCost &&
          other.cooldown == this.cooldown &&
          other.rankRequired == this.rankRequired &&
          other.aspectType == this.aspectType);
}

class AbilitiesCompanion extends UpdateCompanion<AbilityData> {
  final Value<String> id;
  final Value<String> characterId;
  final Value<String> name;
  final Value<String?> description;
  final Value<int> manaCost;
  final Value<int> cooldown;
  final Value<CharacterRank> rankRequired;
  final Value<AspectType> aspectType;
  final Value<int> rowid;
  const AbilitiesCompanion({
    this.id = const Value.absent(),
    this.characterId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.manaCost = const Value.absent(),
    this.cooldown = const Value.absent(),
    this.rankRequired = const Value.absent(),
    this.aspectType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AbilitiesCompanion.insert({
    this.id = const Value.absent(),
    required String characterId,
    required String name,
    this.description = const Value.absent(),
    this.manaCost = const Value.absent(),
    this.cooldown = const Value.absent(),
    required CharacterRank rankRequired,
    required AspectType aspectType,
    this.rowid = const Value.absent(),
  }) : characterId = Value(characterId),
       name = Value(name),
       rankRequired = Value(rankRequired),
       aspectType = Value(aspectType);
  static Insertable<AbilityData> custom({
    Expression<String>? id,
    Expression<String>? characterId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? manaCost,
    Expression<int>? cooldown,
    Expression<String>? rankRequired,
    Expression<String>? aspectType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (characterId != null) 'character_id': characterId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (manaCost != null) 'mana_cost': manaCost,
      if (cooldown != null) 'cooldown': cooldown,
      if (rankRequired != null) 'rank_required': rankRequired,
      if (aspectType != null) 'aspect_type': aspectType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AbilitiesCompanion copyWith({
    Value<String>? id,
    Value<String>? characterId,
    Value<String>? name,
    Value<String?>? description,
    Value<int>? manaCost,
    Value<int>? cooldown,
    Value<CharacterRank>? rankRequired,
    Value<AspectType>? aspectType,
    Value<int>? rowid,
  }) {
    return AbilitiesCompanion(
      id: id ?? this.id,
      characterId: characterId ?? this.characterId,
      name: name ?? this.name,
      description: description ?? this.description,
      manaCost: manaCost ?? this.manaCost,
      cooldown: cooldown ?? this.cooldown,
      rankRequired: rankRequired ?? this.rankRequired,
      aspectType: aspectType ?? this.aspectType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (manaCost.present) {
      map['mana_cost'] = Variable<int>(manaCost.value);
    }
    if (cooldown.present) {
      map['cooldown'] = Variable<int>(cooldown.value);
    }
    if (rankRequired.present) {
      map['rank_required'] = Variable<String>(
        $AbilitiesTable.$converterrankRequired.toSql(rankRequired.value),
      );
    }
    if (aspectType.present) {
      map['aspect_type'] = Variable<String>(
        $AbilitiesTable.$converteraspectType.toSql(aspectType.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AbilitiesCompanion(')
          ..write('id: $id, ')
          ..write('characterId: $characterId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('manaCost: $manaCost, ')
          ..write('cooldown: $cooldown, ')
          ..write('rankRequired: $rankRequired, ')
          ..write('aspectType: $aspectType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MemoriesTable extends Memories
    with TableInfo<$MemoriesTable, MemoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => uuid.v4(),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<MemoryType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<MemoryType>($MemoriesTable.$convertertype);
  @override
  late final GeneratedColumnWithTypeConverter<CharacterRank, String> rank =
      GeneratedColumn<String>(
        'rank',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<CharacterRank>($MemoriesTable.$converterrank);
  static const VerificationMeta _bonusStatsMeta = const VerificationMeta(
    'bonusStats',
  );
  @override
  late final GeneratedColumn<String> bonusStats = GeneratedColumn<String>(
    'bonus_stats',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    type,
    rank,
    bonusStats,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'memories';
  @override
  VerificationContext validateIntegrity(
    Insertable<MemoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('bonus_stats')) {
      context.handle(
        _bonusStatsMeta,
        bonusStats.isAcceptableOrUnknown(data['bonus_stats']!, _bonusStatsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MemoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MemoryData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      type: $MemoriesTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      rank: $MemoriesTable.$converterrank.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}rank'],
        )!,
      ),
      bonusStats: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bonus_stats'],
      ),
    );
  }

  @override
  $MemoriesTable createAlias(String alias) {
    return $MemoriesTable(attachedDatabase, alias);
  }

  static TypeConverter<MemoryType, String> $convertertype =
      const MemoryTypeConverter();
  static TypeConverter<CharacterRank, String> $converterrank =
      const CharacterRankConverter();
}

class MemoryData extends DataClass implements Insertable<MemoryData> {
  final String id;
  final String name;
  final String? description;
  final MemoryType type;
  final CharacterRank rank;
  final String? bonusStats;
  const MemoryData({
    required this.id,
    required this.name,
    this.description,
    required this.type,
    required this.rank,
    this.bonusStats,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    {
      map['type'] = Variable<String>($MemoriesTable.$convertertype.toSql(type));
    }
    {
      map['rank'] = Variable<String>($MemoriesTable.$converterrank.toSql(rank));
    }
    if (!nullToAbsent || bonusStats != null) {
      map['bonus_stats'] = Variable<String>(bonusStats);
    }
    return map;
  }

  MemoriesCompanion toCompanion(bool nullToAbsent) {
    return MemoriesCompanion(
      id: Value(id),
      name: Value(name),
      description:
          description == null && nullToAbsent
              ? const Value.absent()
              : Value(description),
      type: Value(type),
      rank: Value(rank),
      bonusStats:
          bonusStats == null && nullToAbsent
              ? const Value.absent()
              : Value(bonusStats),
    );
  }

  factory MemoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MemoryData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      type: serializer.fromJson<MemoryType>(json['type']),
      rank: serializer.fromJson<CharacterRank>(json['rank']),
      bonusStats: serializer.fromJson<String?>(json['bonusStats']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'type': serializer.toJson<MemoryType>(type),
      'rank': serializer.toJson<CharacterRank>(rank),
      'bonusStats': serializer.toJson<String?>(bonusStats),
    };
  }

  MemoryData copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    MemoryType? type,
    CharacterRank? rank,
    Value<String?> bonusStats = const Value.absent(),
  }) => MemoryData(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    type: type ?? this.type,
    rank: rank ?? this.rank,
    bonusStats: bonusStats.present ? bonusStats.value : this.bonusStats,
  );
  MemoryData copyWithCompanion(MemoriesCompanion data) {
    return MemoryData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      type: data.type.present ? data.type.value : this.type,
      rank: data.rank.present ? data.rank.value : this.rank,
      bonusStats:
          data.bonusStats.present ? data.bonusStats.value : this.bonusStats,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MemoryData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('rank: $rank, ')
          ..write('bonusStats: $bonusStats')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, type, rank, bonusStats);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MemoryData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.type == this.type &&
          other.rank == this.rank &&
          other.bonusStats == this.bonusStats);
}

class MemoriesCompanion extends UpdateCompanion<MemoryData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<MemoryType> type;
  final Value<CharacterRank> rank;
  final Value<String?> bonusStats;
  final Value<int> rowid;
  const MemoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.type = const Value.absent(),
    this.rank = const Value.absent(),
    this.bonusStats = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MemoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    required MemoryType type,
    required CharacterRank rank,
    this.bonusStats = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       type = Value(type),
       rank = Value(rank);
  static Insertable<MemoryData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? type,
    Expression<String>? rank,
    Expression<String>? bonusStats,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (type != null) 'type': type,
      if (rank != null) 'rank': rank,
      if (bonusStats != null) 'bonus_stats': bonusStats,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MemoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<MemoryType>? type,
    Value<CharacterRank>? rank,
    Value<String?>? bonusStats,
    Value<int>? rowid,
  }) {
    return MemoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      rank: rank ?? this.rank,
      bonusStats: bonusStats ?? this.bonusStats,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $MemoriesTable.$convertertype.toSql(type.value),
      );
    }
    if (rank.present) {
      map['rank'] = Variable<String>(
        $MemoriesTable.$converterrank.toSql(rank.value),
      );
    }
    if (bonusStats.present) {
      map['bonus_stats'] = Variable<String>(bonusStats.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('rank: $rank, ')
          ..write('bonusStats: $bonusStats, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CharacterMemoriesTable extends CharacterMemories
    with TableInfo<$CharacterMemoriesTable, CharacterMemoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterMemoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id)',
    ),
  );
  static const VerificationMeta _memoryIdMeta = const VerificationMeta(
    'memoryId',
  );
  @override
  late final GeneratedColumn<String> memoryId = GeneratedColumn<String>(
    'memory_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES memories (id)',
    ),
  );
  static const VerificationMeta _isEquippedMeta = const VerificationMeta(
    'isEquipped',
  );
  @override
  late final GeneratedColumn<bool> isEquipped = GeneratedColumn<bool>(
    'is_equipped',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_equipped" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [characterId, memoryId, isEquipped];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_memories';
  @override
  VerificationContext validateIntegrity(
    Insertable<CharacterMemoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('memory_id')) {
      context.handle(
        _memoryIdMeta,
        memoryId.isAcceptableOrUnknown(data['memory_id']!, _memoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_memoryIdMeta);
    }
    if (data.containsKey('is_equipped')) {
      context.handle(
        _isEquippedMeta,
        isEquipped.isAcceptableOrUnknown(data['is_equipped']!, _isEquippedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {characterId, memoryId};
  @override
  CharacterMemoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterMemoryData(
      characterId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}character_id'],
          )!,
      memoryId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}memory_id'],
          )!,
      isEquipped:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_equipped'],
          )!,
    );
  }

  @override
  $CharacterMemoriesTable createAlias(String alias) {
    return $CharacterMemoriesTable(attachedDatabase, alias);
  }
}

class CharacterMemoryData extends DataClass
    implements Insertable<CharacterMemoryData> {
  final String characterId;
  final String memoryId;
  final bool isEquipped;
  const CharacterMemoryData({
    required this.characterId,
    required this.memoryId,
    required this.isEquipped,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['character_id'] = Variable<String>(characterId);
    map['memory_id'] = Variable<String>(memoryId);
    map['is_equipped'] = Variable<bool>(isEquipped);
    return map;
  }

  CharacterMemoriesCompanion toCompanion(bool nullToAbsent) {
    return CharacterMemoriesCompanion(
      characterId: Value(characterId),
      memoryId: Value(memoryId),
      isEquipped: Value(isEquipped),
    );
  }

  factory CharacterMemoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterMemoryData(
      characterId: serializer.fromJson<String>(json['characterId']),
      memoryId: serializer.fromJson<String>(json['memoryId']),
      isEquipped: serializer.fromJson<bool>(json['isEquipped']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'characterId': serializer.toJson<String>(characterId),
      'memoryId': serializer.toJson<String>(memoryId),
      'isEquipped': serializer.toJson<bool>(isEquipped),
    };
  }

  CharacterMemoryData copyWith({
    String? characterId,
    String? memoryId,
    bool? isEquipped,
  }) => CharacterMemoryData(
    characterId: characterId ?? this.characterId,
    memoryId: memoryId ?? this.memoryId,
    isEquipped: isEquipped ?? this.isEquipped,
  );
  CharacterMemoryData copyWithCompanion(CharacterMemoriesCompanion data) {
    return CharacterMemoryData(
      characterId:
          data.characterId.present ? data.characterId.value : this.characterId,
      memoryId: data.memoryId.present ? data.memoryId.value : this.memoryId,
      isEquipped:
          data.isEquipped.present ? data.isEquipped.value : this.isEquipped,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterMemoryData(')
          ..write('characterId: $characterId, ')
          ..write('memoryId: $memoryId, ')
          ..write('isEquipped: $isEquipped')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(characterId, memoryId, isEquipped);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterMemoryData &&
          other.characterId == this.characterId &&
          other.memoryId == this.memoryId &&
          other.isEquipped == this.isEquipped);
}

class CharacterMemoriesCompanion extends UpdateCompanion<CharacterMemoryData> {
  final Value<String> characterId;
  final Value<String> memoryId;
  final Value<bool> isEquipped;
  final Value<int> rowid;
  const CharacterMemoriesCompanion({
    this.characterId = const Value.absent(),
    this.memoryId = const Value.absent(),
    this.isEquipped = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharacterMemoriesCompanion.insert({
    required String characterId,
    required String memoryId,
    this.isEquipped = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : characterId = Value(characterId),
       memoryId = Value(memoryId);
  static Insertable<CharacterMemoryData> custom({
    Expression<String>? characterId,
    Expression<String>? memoryId,
    Expression<bool>? isEquipped,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (characterId != null) 'character_id': characterId,
      if (memoryId != null) 'memory_id': memoryId,
      if (isEquipped != null) 'is_equipped': isEquipped,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharacterMemoriesCompanion copyWith({
    Value<String>? characterId,
    Value<String>? memoryId,
    Value<bool>? isEquipped,
    Value<int>? rowid,
  }) {
    return CharacterMemoriesCompanion(
      characterId: characterId ?? this.characterId,
      memoryId: memoryId ?? this.memoryId,
      isEquipped: isEquipped ?? this.isEquipped,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (memoryId.present) {
      map['memory_id'] = Variable<String>(memoryId.value);
    }
    if (isEquipped.present) {
      map['is_equipped'] = Variable<bool>(isEquipped.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterMemoriesCompanion(')
          ..write('characterId: $characterId, ')
          ..write('memoryId: $memoryId, ')
          ..write('isEquipped: $isEquipped, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CharacterTraitsTable extends CharacterTraits
    with TableInfo<$CharacterTraitsTable, CharacterTraitData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterTraitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id)',
    ),
  );
  static const VerificationMeta _traitIdMeta = const VerificationMeta(
    'traitId',
  );
  @override
  late final GeneratedColumn<String> traitId = GeneratedColumn<String>(
    'trait_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES traits (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [characterId, traitId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_traits';
  @override
  VerificationContext validateIntegrity(
    Insertable<CharacterTraitData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('trait_id')) {
      context.handle(
        _traitIdMeta,
        traitId.isAcceptableOrUnknown(data['trait_id']!, _traitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_traitIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {characterId, traitId};
  @override
  CharacterTraitData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterTraitData(
      characterId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}character_id'],
          )!,
      traitId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}trait_id'],
          )!,
    );
  }

  @override
  $CharacterTraitsTable createAlias(String alias) {
    return $CharacterTraitsTable(attachedDatabase, alias);
  }
}

class CharacterTraitData extends DataClass
    implements Insertable<CharacterTraitData> {
  final String characterId;
  final String traitId;
  const CharacterTraitData({required this.characterId, required this.traitId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['character_id'] = Variable<String>(characterId);
    map['trait_id'] = Variable<String>(traitId);
    return map;
  }

  CharacterTraitsCompanion toCompanion(bool nullToAbsent) {
    return CharacterTraitsCompanion(
      characterId: Value(characterId),
      traitId: Value(traitId),
    );
  }

  factory CharacterTraitData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterTraitData(
      characterId: serializer.fromJson<String>(json['characterId']),
      traitId: serializer.fromJson<String>(json['traitId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'characterId': serializer.toJson<String>(characterId),
      'traitId': serializer.toJson<String>(traitId),
    };
  }

  CharacterTraitData copyWith({String? characterId, String? traitId}) =>
      CharacterTraitData(
        characterId: characterId ?? this.characterId,
        traitId: traitId ?? this.traitId,
      );
  CharacterTraitData copyWithCompanion(CharacterTraitsCompanion data) {
    return CharacterTraitData(
      characterId:
          data.characterId.present ? data.characterId.value : this.characterId,
      traitId: data.traitId.present ? data.traitId.value : this.traitId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterTraitData(')
          ..write('characterId: $characterId, ')
          ..write('traitId: $traitId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(characterId, traitId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterTraitData &&
          other.characterId == this.characterId &&
          other.traitId == this.traitId);
}

class CharacterTraitsCompanion extends UpdateCompanion<CharacterTraitData> {
  final Value<String> characterId;
  final Value<String> traitId;
  final Value<int> rowid;
  const CharacterTraitsCompanion({
    this.characterId = const Value.absent(),
    this.traitId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharacterTraitsCompanion.insert({
    required String characterId,
    required String traitId,
    this.rowid = const Value.absent(),
  }) : characterId = Value(characterId),
       traitId = Value(traitId);
  static Insertable<CharacterTraitData> custom({
    Expression<String>? characterId,
    Expression<String>? traitId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (characterId != null) 'character_id': characterId,
      if (traitId != null) 'trait_id': traitId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharacterTraitsCompanion copyWith({
    Value<String>? characterId,
    Value<String>? traitId,
    Value<int>? rowid,
  }) {
    return CharacterTraitsCompanion(
      characterId: characterId ?? this.characterId,
      traitId: traitId ?? this.traitId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (traitId.present) {
      map['trait_id'] = Variable<String>(traitId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterTraitsCompanion(')
          ..write('characterId: $characterId, ')
          ..write('traitId: $traitId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TraitsTable traits = $TraitsTable(this);
  late final $ChildhoodChoicesTable childhoodChoices = $ChildhoodChoicesTable(
    this,
  );
  late final $MajorEventChoicesTable majorEventChoices =
      $MajorEventChoicesTable(this);
  late final $DarkAwakeningChoicesTable darkAwakeningChoices =
      $DarkAwakeningChoicesTable(this);
  late final $CharactersTable characters = $CharactersTable(this);
  late final $AbilitiesTable abilities = $AbilitiesTable(this);
  late final $MemoriesTable memories = $MemoriesTable(this);
  late final $CharacterMemoriesTable characterMemories =
      $CharacterMemoriesTable(this);
  late final $CharacterTraitsTable characterTraits = $CharacterTraitsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    traits,
    childhoodChoices,
    majorEventChoices,
    darkAwakeningChoices,
    characters,
    abilities,
    memories,
    characterMemories,
    characterTraits,
  ];
}

typedef $$TraitsTableCreateCompanionBuilder =
    TraitsCompanion Function({
      Value<String> id,
      required String name,
      Value<String?> description,
      Value<int> rowid,
    });
typedef $$TraitsTableUpdateCompanionBuilder =
    TraitsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<int> rowid,
    });

final class $$TraitsTableReferences
    extends BaseReferences<_$AppDatabase, $TraitsTable, TraitData> {
  $$TraitsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ChildhoodChoicesTable, List<ChildhoodChoiceData>>
  _childhoodChoicesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.childhoodChoices,
    aliasName: $_aliasNameGenerator(db.traits.id, db.childhoodChoices.traitId),
  );

  $$ChildhoodChoicesTableProcessedTableManager get childhoodChoicesRefs {
    final manager = $$ChildhoodChoicesTableTableManager(
      $_db,
      $_db.childhoodChoices,
    ).filter((f) => f.traitId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _childhoodChoicesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $MajorEventChoicesTable,
    List<MajorEventChoiceData>
  >
  _majorEventChoicesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.majorEventChoices,
        aliasName: $_aliasNameGenerator(
          db.traits.id,
          db.majorEventChoices.traitId,
        ),
      );

  $$MajorEventChoicesTableProcessedTableManager get majorEventChoicesRefs {
    final manager = $$MajorEventChoicesTableTableManager(
      $_db,
      $_db.majorEventChoices,
    ).filter((f) => f.traitId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _majorEventChoicesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $DarkAwakeningChoicesTable,
    List<DarkAwakeningChoiceData>
  >
  _darkAwakeningChoicesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.darkAwakeningChoices,
        aliasName: $_aliasNameGenerator(
          db.traits.id,
          db.darkAwakeningChoices.traitId,
        ),
      );

  $$DarkAwakeningChoicesTableProcessedTableManager
  get darkAwakeningChoicesRefs {
    final manager = $$DarkAwakeningChoicesTableTableManager(
      $_db,
      $_db.darkAwakeningChoices,
    ).filter((f) => f.traitId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _darkAwakeningChoicesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CharacterTraitsTable, List<CharacterTraitData>>
  _characterTraitsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.characterTraits,
    aliasName: $_aliasNameGenerator(db.traits.id, db.characterTraits.traitId),
  );

  $$CharacterTraitsTableProcessedTableManager get characterTraitsRefs {
    final manager = $$CharacterTraitsTableTableManager(
      $_db,
      $_db.characterTraits,
    ).filter((f) => f.traitId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _characterTraitsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TraitsTableFilterComposer
    extends Composer<_$AppDatabase, $TraitsTable> {
  $$TraitsTableFilterComposer({
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

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> childhoodChoicesRefs(
    Expression<bool> Function($$ChildhoodChoicesTableFilterComposer f) f,
  ) {
    final $$ChildhoodChoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.childhoodChoices,
      getReferencedColumn: (t) => t.traitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChildhoodChoicesTableFilterComposer(
            $db: $db,
            $table: $db.childhoodChoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> majorEventChoicesRefs(
    Expression<bool> Function($$MajorEventChoicesTableFilterComposer f) f,
  ) {
    final $$MajorEventChoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.majorEventChoices,
      getReferencedColumn: (t) => t.traitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MajorEventChoicesTableFilterComposer(
            $db: $db,
            $table: $db.majorEventChoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> darkAwakeningChoicesRefs(
    Expression<bool> Function($$DarkAwakeningChoicesTableFilterComposer f) f,
  ) {
    final $$DarkAwakeningChoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.darkAwakeningChoices,
      getReferencedColumn: (t) => t.traitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DarkAwakeningChoicesTableFilterComposer(
            $db: $db,
            $table: $db.darkAwakeningChoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> characterTraitsRefs(
    Expression<bool> Function($$CharacterTraitsTableFilterComposer f) f,
  ) {
    final $$CharacterTraitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterTraits,
      getReferencedColumn: (t) => t.traitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterTraitsTableFilterComposer(
            $db: $db,
            $table: $db.characterTraits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TraitsTableOrderingComposer
    extends Composer<_$AppDatabase, $TraitsTable> {
  $$TraitsTableOrderingComposer({
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

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TraitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TraitsTable> {
  $$TraitsTableAnnotationComposer({
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

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  Expression<T> childhoodChoicesRefs<T extends Object>(
    Expression<T> Function($$ChildhoodChoicesTableAnnotationComposer a) f,
  ) {
    final $$ChildhoodChoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.childhoodChoices,
      getReferencedColumn: (t) => t.traitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChildhoodChoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.childhoodChoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> majorEventChoicesRefs<T extends Object>(
    Expression<T> Function($$MajorEventChoicesTableAnnotationComposer a) f,
  ) {
    final $$MajorEventChoicesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.majorEventChoices,
          getReferencedColumn: (t) => t.traitId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MajorEventChoicesTableAnnotationComposer(
                $db: $db,
                $table: $db.majorEventChoices,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> darkAwakeningChoicesRefs<T extends Object>(
    Expression<T> Function($$DarkAwakeningChoicesTableAnnotationComposer a) f,
  ) {
    final $$DarkAwakeningChoicesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.darkAwakeningChoices,
          getReferencedColumn: (t) => t.traitId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DarkAwakeningChoicesTableAnnotationComposer(
                $db: $db,
                $table: $db.darkAwakeningChoices,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> characterTraitsRefs<T extends Object>(
    Expression<T> Function($$CharacterTraitsTableAnnotationComposer a) f,
  ) {
    final $$CharacterTraitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterTraits,
      getReferencedColumn: (t) => t.traitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterTraitsTableAnnotationComposer(
            $db: $db,
            $table: $db.characterTraits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TraitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TraitsTable,
          TraitData,
          $$TraitsTableFilterComposer,
          $$TraitsTableOrderingComposer,
          $$TraitsTableAnnotationComposer,
          $$TraitsTableCreateCompanionBuilder,
          $$TraitsTableUpdateCompanionBuilder,
          (TraitData, $$TraitsTableReferences),
          TraitData,
          PrefetchHooks Function({
            bool childhoodChoicesRefs,
            bool majorEventChoicesRefs,
            bool darkAwakeningChoicesRefs,
            bool characterTraitsRefs,
          })
        > {
  $$TraitsTableTableManager(_$AppDatabase db, $TraitsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TraitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$TraitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$TraitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TraitsCompanion(
                id: id,
                name: name,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TraitsCompanion.insert(
                id: id,
                name: name,
                description: description,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$TraitsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            childhoodChoicesRefs = false,
            majorEventChoicesRefs = false,
            darkAwakeningChoicesRefs = false,
            characterTraitsRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (childhoodChoicesRefs) db.childhoodChoices,
                if (majorEventChoicesRefs) db.majorEventChoices,
                if (darkAwakeningChoicesRefs) db.darkAwakeningChoices,
                if (characterTraitsRefs) db.characterTraits,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (childhoodChoicesRefs)
                    await $_getPrefetchedData<
                      TraitData,
                      $TraitsTable,
                      ChildhoodChoiceData
                    >(
                      currentTable: table,
                      referencedTable: $$TraitsTableReferences
                          ._childhoodChoicesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$TraitsTableReferences(
                                db,
                                table,
                                p0,
                              ).childhoodChoicesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.traitId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (majorEventChoicesRefs)
                    await $_getPrefetchedData<
                      TraitData,
                      $TraitsTable,
                      MajorEventChoiceData
                    >(
                      currentTable: table,
                      referencedTable: $$TraitsTableReferences
                          ._majorEventChoicesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$TraitsTableReferences(
                                db,
                                table,
                                p0,
                              ).majorEventChoicesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.traitId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (darkAwakeningChoicesRefs)
                    await $_getPrefetchedData<
                      TraitData,
                      $TraitsTable,
                      DarkAwakeningChoiceData
                    >(
                      currentTable: table,
                      referencedTable: $$TraitsTableReferences
                          ._darkAwakeningChoicesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$TraitsTableReferences(
                                db,
                                table,
                                p0,
                              ).darkAwakeningChoicesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.traitId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (characterTraitsRefs)
                    await $_getPrefetchedData<
                      TraitData,
                      $TraitsTable,
                      CharacterTraitData
                    >(
                      currentTable: table,
                      referencedTable: $$TraitsTableReferences
                          ._characterTraitsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$TraitsTableReferences(
                                db,
                                table,
                                p0,
                              ).characterTraitsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.traitId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TraitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TraitsTable,
      TraitData,
      $$TraitsTableFilterComposer,
      $$TraitsTableOrderingComposer,
      $$TraitsTableAnnotationComposer,
      $$TraitsTableCreateCompanionBuilder,
      $$TraitsTableUpdateCompanionBuilder,
      (TraitData, $$TraitsTableReferences),
      TraitData,
      PrefetchHooks Function({
        bool childhoodChoicesRefs,
        bool majorEventChoicesRefs,
        bool darkAwakeningChoicesRefs,
        bool characterTraitsRefs,
      })
    >;
typedef $$ChildhoodChoicesTableCreateCompanionBuilder =
    ChildhoodChoicesCompanion Function({
      Value<String> id,
      required String description,
      Value<String?> traitId,
      Value<int> strengthBonus,
      Value<int> agilityBonus,
      Value<int> intelligenceBonus,
      Value<int> perceptionBonus,
      Value<int> enduranceBonus,
      Value<int> rowid,
    });
typedef $$ChildhoodChoicesTableUpdateCompanionBuilder =
    ChildhoodChoicesCompanion Function({
      Value<String> id,
      Value<String> description,
      Value<String?> traitId,
      Value<int> strengthBonus,
      Value<int> agilityBonus,
      Value<int> intelligenceBonus,
      Value<int> perceptionBonus,
      Value<int> enduranceBonus,
      Value<int> rowid,
    });

final class $$ChildhoodChoicesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ChildhoodChoicesTable,
          ChildhoodChoiceData
        > {
  $$ChildhoodChoicesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TraitsTable _traitIdTable(_$AppDatabase db) => db.traits.createAlias(
    $_aliasNameGenerator(db.childhoodChoices.traitId, db.traits.id),
  );

  $$TraitsTableProcessedTableManager? get traitId {
    final $_column = $_itemColumn<String>('trait_id');
    if ($_column == null) return null;
    final manager = $$TraitsTableTableManager(
      $_db,
      $_db.traits,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_traitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CharactersTable, List<CharacterData>>
  _charactersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.characters,
    aliasName: $_aliasNameGenerator(
      db.childhoodChoices.id,
      db.characters.childhoodChoiceId,
    ),
  );

  $$CharactersTableProcessedTableManager get charactersRefs {
    final manager = $$CharactersTableTableManager($_db, $_db.characters).filter(
      (f) => f.childhoodChoiceId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_charactersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ChildhoodChoicesTableFilterComposer
    extends Composer<_$AppDatabase, $ChildhoodChoicesTable> {
  $$ChildhoodChoicesTableFilterComposer({
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

  ColumnFilters<int> get strengthBonus => $composableBuilder(
    column: $table.strengthBonus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get agilityBonus => $composableBuilder(
    column: $table.agilityBonus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intelligenceBonus => $composableBuilder(
    column: $table.intelligenceBonus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get perceptionBonus => $composableBuilder(
    column: $table.perceptionBonus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get enduranceBonus => $composableBuilder(
    column: $table.enduranceBonus,
    builder: (column) => ColumnFilters(column),
  );

  $$TraitsTableFilterComposer get traitId {
    final $$TraitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.traitId,
      referencedTable: $db.traits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitsTableFilterComposer(
            $db: $db,
            $table: $db.traits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> charactersRefs(
    Expression<bool> Function($$CharactersTableFilterComposer f) f,
  ) {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.childhoodChoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChildhoodChoicesTableOrderingComposer
    extends Composer<_$AppDatabase, $ChildhoodChoicesTable> {
  $$ChildhoodChoicesTableOrderingComposer({
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

  ColumnOrderings<int> get strengthBonus => $composableBuilder(
    column: $table.strengthBonus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get agilityBonus => $composableBuilder(
    column: $table.agilityBonus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intelligenceBonus => $composableBuilder(
    column: $table.intelligenceBonus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get perceptionBonus => $composableBuilder(
    column: $table.perceptionBonus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get enduranceBonus => $composableBuilder(
    column: $table.enduranceBonus,
    builder: (column) => ColumnOrderings(column),
  );

  $$TraitsTableOrderingComposer get traitId {
    final $$TraitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.traitId,
      referencedTable: $db.traits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitsTableOrderingComposer(
            $db: $db,
            $table: $db.traits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChildhoodChoicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChildhoodChoicesTable> {
  $$ChildhoodChoicesTableAnnotationComposer({
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

  GeneratedColumn<int> get strengthBonus => $composableBuilder(
    column: $table.strengthBonus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get agilityBonus => $composableBuilder(
    column: $table.agilityBonus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get intelligenceBonus => $composableBuilder(
    column: $table.intelligenceBonus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get perceptionBonus => $composableBuilder(
    column: $table.perceptionBonus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get enduranceBonus => $composableBuilder(
    column: $table.enduranceBonus,
    builder: (column) => column,
  );

  $$TraitsTableAnnotationComposer get traitId {
    final $$TraitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.traitId,
      referencedTable: $db.traits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitsTableAnnotationComposer(
            $db: $db,
            $table: $db.traits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> charactersRefs<T extends Object>(
    Expression<T> Function($$CharactersTableAnnotationComposer a) f,
  ) {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.childhoodChoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChildhoodChoicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChildhoodChoicesTable,
          ChildhoodChoiceData,
          $$ChildhoodChoicesTableFilterComposer,
          $$ChildhoodChoicesTableOrderingComposer,
          $$ChildhoodChoicesTableAnnotationComposer,
          $$ChildhoodChoicesTableCreateCompanionBuilder,
          $$ChildhoodChoicesTableUpdateCompanionBuilder,
          (ChildhoodChoiceData, $$ChildhoodChoicesTableReferences),
          ChildhoodChoiceData,
          PrefetchHooks Function({bool traitId, bool charactersRefs})
        > {
  $$ChildhoodChoicesTableTableManager(
    _$AppDatabase db,
    $ChildhoodChoicesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$ChildhoodChoicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ChildhoodChoicesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$ChildhoodChoicesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String?> traitId = const Value.absent(),
                Value<int> strengthBonus = const Value.absent(),
                Value<int> agilityBonus = const Value.absent(),
                Value<int> intelligenceBonus = const Value.absent(),
                Value<int> perceptionBonus = const Value.absent(),
                Value<int> enduranceBonus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChildhoodChoicesCompanion(
                id: id,
                description: description,
                traitId: traitId,
                strengthBonus: strengthBonus,
                agilityBonus: agilityBonus,
                intelligenceBonus: intelligenceBonus,
                perceptionBonus: perceptionBonus,
                enduranceBonus: enduranceBonus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String description,
                Value<String?> traitId = const Value.absent(),
                Value<int> strengthBonus = const Value.absent(),
                Value<int> agilityBonus = const Value.absent(),
                Value<int> intelligenceBonus = const Value.absent(),
                Value<int> perceptionBonus = const Value.absent(),
                Value<int> enduranceBonus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChildhoodChoicesCompanion.insert(
                id: id,
                description: description,
                traitId: traitId,
                strengthBonus: strengthBonus,
                agilityBonus: agilityBonus,
                intelligenceBonus: intelligenceBonus,
                perceptionBonus: perceptionBonus,
                enduranceBonus: enduranceBonus,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ChildhoodChoicesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({traitId = false, charactersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (charactersRefs) db.characters],
              addJoins: <
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
                if (traitId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.traitId,
                            referencedTable: $$ChildhoodChoicesTableReferences
                                ._traitIdTable(db),
                            referencedColumn:
                                $$ChildhoodChoicesTableReferences
                                    ._traitIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (charactersRefs)
                    await $_getPrefetchedData<
                      ChildhoodChoiceData,
                      $ChildhoodChoicesTable,
                      CharacterData
                    >(
                      currentTable: table,
                      referencedTable: $$ChildhoodChoicesTableReferences
                          ._charactersRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$ChildhoodChoicesTableReferences(
                                db,
                                table,
                                p0,
                              ).charactersRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.childhoodChoiceId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ChildhoodChoicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChildhoodChoicesTable,
      ChildhoodChoiceData,
      $$ChildhoodChoicesTableFilterComposer,
      $$ChildhoodChoicesTableOrderingComposer,
      $$ChildhoodChoicesTableAnnotationComposer,
      $$ChildhoodChoicesTableCreateCompanionBuilder,
      $$ChildhoodChoicesTableUpdateCompanionBuilder,
      (ChildhoodChoiceData, $$ChildhoodChoicesTableReferences),
      ChildhoodChoiceData,
      PrefetchHooks Function({bool traitId, bool charactersRefs})
    >;
typedef $$MajorEventChoicesTableCreateCompanionBuilder =
    MajorEventChoicesCompanion Function({
      Value<String> id,
      required String description,
      Value<String?> traitId,
      Value<int> strengthBonus,
      Value<int> agilityBonus,
      Value<int> intelligenceBonus,
      Value<int> perceptionBonus,
      Value<int> enduranceBonus,
      Value<int> rowid,
    });
typedef $$MajorEventChoicesTableUpdateCompanionBuilder =
    MajorEventChoicesCompanion Function({
      Value<String> id,
      Value<String> description,
      Value<String?> traitId,
      Value<int> strengthBonus,
      Value<int> agilityBonus,
      Value<int> intelligenceBonus,
      Value<int> perceptionBonus,
      Value<int> enduranceBonus,
      Value<int> rowid,
    });

final class $$MajorEventChoicesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MajorEventChoicesTable,
          MajorEventChoiceData
        > {
  $$MajorEventChoicesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TraitsTable _traitIdTable(_$AppDatabase db) => db.traits.createAlias(
    $_aliasNameGenerator(db.majorEventChoices.traitId, db.traits.id),
  );

  $$TraitsTableProcessedTableManager? get traitId {
    final $_column = $_itemColumn<String>('trait_id');
    if ($_column == null) return null;
    final manager = $$TraitsTableTableManager(
      $_db,
      $_db.traits,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_traitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CharactersTable, List<CharacterData>>
  _charactersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.characters,
    aliasName: $_aliasNameGenerator(
      db.majorEventChoices.id,
      db.characters.majorEventChoiceId,
    ),
  );

  $$CharactersTableProcessedTableManager get charactersRefs {
    final manager = $$CharactersTableTableManager($_db, $_db.characters).filter(
      (f) => f.majorEventChoiceId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_charactersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MajorEventChoicesTableFilterComposer
    extends Composer<_$AppDatabase, $MajorEventChoicesTable> {
  $$MajorEventChoicesTableFilterComposer({
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

  ColumnFilters<int> get strengthBonus => $composableBuilder(
    column: $table.strengthBonus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get agilityBonus => $composableBuilder(
    column: $table.agilityBonus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intelligenceBonus => $composableBuilder(
    column: $table.intelligenceBonus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get perceptionBonus => $composableBuilder(
    column: $table.perceptionBonus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get enduranceBonus => $composableBuilder(
    column: $table.enduranceBonus,
    builder: (column) => ColumnFilters(column),
  );

  $$TraitsTableFilterComposer get traitId {
    final $$TraitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.traitId,
      referencedTable: $db.traits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitsTableFilterComposer(
            $db: $db,
            $table: $db.traits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> charactersRefs(
    Expression<bool> Function($$CharactersTableFilterComposer f) f,
  ) {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.majorEventChoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MajorEventChoicesTableOrderingComposer
    extends Composer<_$AppDatabase, $MajorEventChoicesTable> {
  $$MajorEventChoicesTableOrderingComposer({
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

  ColumnOrderings<int> get strengthBonus => $composableBuilder(
    column: $table.strengthBonus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get agilityBonus => $composableBuilder(
    column: $table.agilityBonus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intelligenceBonus => $composableBuilder(
    column: $table.intelligenceBonus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get perceptionBonus => $composableBuilder(
    column: $table.perceptionBonus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get enduranceBonus => $composableBuilder(
    column: $table.enduranceBonus,
    builder: (column) => ColumnOrderings(column),
  );

  $$TraitsTableOrderingComposer get traitId {
    final $$TraitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.traitId,
      referencedTable: $db.traits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitsTableOrderingComposer(
            $db: $db,
            $table: $db.traits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MajorEventChoicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MajorEventChoicesTable> {
  $$MajorEventChoicesTableAnnotationComposer({
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

  GeneratedColumn<int> get strengthBonus => $composableBuilder(
    column: $table.strengthBonus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get agilityBonus => $composableBuilder(
    column: $table.agilityBonus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get intelligenceBonus => $composableBuilder(
    column: $table.intelligenceBonus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get perceptionBonus => $composableBuilder(
    column: $table.perceptionBonus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get enduranceBonus => $composableBuilder(
    column: $table.enduranceBonus,
    builder: (column) => column,
  );

  $$TraitsTableAnnotationComposer get traitId {
    final $$TraitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.traitId,
      referencedTable: $db.traits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitsTableAnnotationComposer(
            $db: $db,
            $table: $db.traits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> charactersRefs<T extends Object>(
    Expression<T> Function($$CharactersTableAnnotationComposer a) f,
  ) {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.majorEventChoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MajorEventChoicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MajorEventChoicesTable,
          MajorEventChoiceData,
          $$MajorEventChoicesTableFilterComposer,
          $$MajorEventChoicesTableOrderingComposer,
          $$MajorEventChoicesTableAnnotationComposer,
          $$MajorEventChoicesTableCreateCompanionBuilder,
          $$MajorEventChoicesTableUpdateCompanionBuilder,
          (MajorEventChoiceData, $$MajorEventChoicesTableReferences),
          MajorEventChoiceData,
          PrefetchHooks Function({bool traitId, bool charactersRefs})
        > {
  $$MajorEventChoicesTableTableManager(
    _$AppDatabase db,
    $MajorEventChoicesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$MajorEventChoicesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$MajorEventChoicesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$MajorEventChoicesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String?> traitId = const Value.absent(),
                Value<int> strengthBonus = const Value.absent(),
                Value<int> agilityBonus = const Value.absent(),
                Value<int> intelligenceBonus = const Value.absent(),
                Value<int> perceptionBonus = const Value.absent(),
                Value<int> enduranceBonus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MajorEventChoicesCompanion(
                id: id,
                description: description,
                traitId: traitId,
                strengthBonus: strengthBonus,
                agilityBonus: agilityBonus,
                intelligenceBonus: intelligenceBonus,
                perceptionBonus: perceptionBonus,
                enduranceBonus: enduranceBonus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String description,
                Value<String?> traitId = const Value.absent(),
                Value<int> strengthBonus = const Value.absent(),
                Value<int> agilityBonus = const Value.absent(),
                Value<int> intelligenceBonus = const Value.absent(),
                Value<int> perceptionBonus = const Value.absent(),
                Value<int> enduranceBonus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MajorEventChoicesCompanion.insert(
                id: id,
                description: description,
                traitId: traitId,
                strengthBonus: strengthBonus,
                agilityBonus: agilityBonus,
                intelligenceBonus: intelligenceBonus,
                perceptionBonus: perceptionBonus,
                enduranceBonus: enduranceBonus,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$MajorEventChoicesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({traitId = false, charactersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (charactersRefs) db.characters],
              addJoins: <
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
                if (traitId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.traitId,
                            referencedTable: $$MajorEventChoicesTableReferences
                                ._traitIdTable(db),
                            referencedColumn:
                                $$MajorEventChoicesTableReferences
                                    ._traitIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (charactersRefs)
                    await $_getPrefetchedData<
                      MajorEventChoiceData,
                      $MajorEventChoicesTable,
                      CharacterData
                    >(
                      currentTable: table,
                      referencedTable: $$MajorEventChoicesTableReferences
                          ._charactersRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$MajorEventChoicesTableReferences(
                                db,
                                table,
                                p0,
                              ).charactersRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.majorEventChoiceId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MajorEventChoicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MajorEventChoicesTable,
      MajorEventChoiceData,
      $$MajorEventChoicesTableFilterComposer,
      $$MajorEventChoicesTableOrderingComposer,
      $$MajorEventChoicesTableAnnotationComposer,
      $$MajorEventChoicesTableCreateCompanionBuilder,
      $$MajorEventChoicesTableUpdateCompanionBuilder,
      (MajorEventChoiceData, $$MajorEventChoicesTableReferences),
      MajorEventChoiceData,
      PrefetchHooks Function({bool traitId, bool charactersRefs})
    >;
typedef $$DarkAwakeningChoicesTableCreateCompanionBuilder =
    DarkAwakeningChoicesCompanion Function({
      Value<String> id,
      required String description,
      Value<String?> traitId,
      Value<int> strengthBonus,
      Value<int> agilityBonus,
      Value<int> intelligenceBonus,
      Value<int> perceptionBonus,
      Value<int> enduranceBonus,
      Value<AspectType?> aspectType,
      Value<int> rowid,
    });
typedef $$DarkAwakeningChoicesTableUpdateCompanionBuilder =
    DarkAwakeningChoicesCompanion Function({
      Value<String> id,
      Value<String> description,
      Value<String?> traitId,
      Value<int> strengthBonus,
      Value<int> agilityBonus,
      Value<int> intelligenceBonus,
      Value<int> perceptionBonus,
      Value<int> enduranceBonus,
      Value<AspectType?> aspectType,
      Value<int> rowid,
    });

final class $$DarkAwakeningChoicesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $DarkAwakeningChoicesTable,
          DarkAwakeningChoiceData
        > {
  $$DarkAwakeningChoicesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TraitsTable _traitIdTable(_$AppDatabase db) => db.traits.createAlias(
    $_aliasNameGenerator(db.darkAwakeningChoices.traitId, db.traits.id),
  );

  $$TraitsTableProcessedTableManager? get traitId {
    final $_column = $_itemColumn<String>('trait_id');
    if ($_column == null) return null;
    final manager = $$TraitsTableTableManager(
      $_db,
      $_db.traits,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_traitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CharactersTable, List<CharacterData>>
  _charactersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.characters,
    aliasName: $_aliasNameGenerator(
      db.darkAwakeningChoices.id,
      db.characters.darkAwakeningChoiceId,
    ),
  );

  $$CharactersTableProcessedTableManager get charactersRefs {
    final manager = $$CharactersTableTableManager($_db, $_db.characters).filter(
      (f) => f.darkAwakeningChoiceId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_charactersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DarkAwakeningChoicesTableFilterComposer
    extends Composer<_$AppDatabase, $DarkAwakeningChoicesTable> {
  $$DarkAwakeningChoicesTableFilterComposer({
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

  ColumnFilters<int> get strengthBonus => $composableBuilder(
    column: $table.strengthBonus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get agilityBonus => $composableBuilder(
    column: $table.agilityBonus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intelligenceBonus => $composableBuilder(
    column: $table.intelligenceBonus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get perceptionBonus => $composableBuilder(
    column: $table.perceptionBonus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get enduranceBonus => $composableBuilder(
    column: $table.enduranceBonus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<AspectType?, AspectType, String>
  get aspectType => $composableBuilder(
    column: $table.aspectType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  $$TraitsTableFilterComposer get traitId {
    final $$TraitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.traitId,
      referencedTable: $db.traits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitsTableFilterComposer(
            $db: $db,
            $table: $db.traits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> charactersRefs(
    Expression<bool> Function($$CharactersTableFilterComposer f) f,
  ) {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.darkAwakeningChoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DarkAwakeningChoicesTableOrderingComposer
    extends Composer<_$AppDatabase, $DarkAwakeningChoicesTable> {
  $$DarkAwakeningChoicesTableOrderingComposer({
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

  ColumnOrderings<int> get strengthBonus => $composableBuilder(
    column: $table.strengthBonus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get agilityBonus => $composableBuilder(
    column: $table.agilityBonus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intelligenceBonus => $composableBuilder(
    column: $table.intelligenceBonus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get perceptionBonus => $composableBuilder(
    column: $table.perceptionBonus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get enduranceBonus => $composableBuilder(
    column: $table.enduranceBonus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aspectType => $composableBuilder(
    column: $table.aspectType,
    builder: (column) => ColumnOrderings(column),
  );

  $$TraitsTableOrderingComposer get traitId {
    final $$TraitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.traitId,
      referencedTable: $db.traits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitsTableOrderingComposer(
            $db: $db,
            $table: $db.traits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DarkAwakeningChoicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DarkAwakeningChoicesTable> {
  $$DarkAwakeningChoicesTableAnnotationComposer({
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

  GeneratedColumn<int> get strengthBonus => $composableBuilder(
    column: $table.strengthBonus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get agilityBonus => $composableBuilder(
    column: $table.agilityBonus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get intelligenceBonus => $composableBuilder(
    column: $table.intelligenceBonus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get perceptionBonus => $composableBuilder(
    column: $table.perceptionBonus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get enduranceBonus => $composableBuilder(
    column: $table.enduranceBonus,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<AspectType?, String> get aspectType =>
      $composableBuilder(
        column: $table.aspectType,
        builder: (column) => column,
      );

  $$TraitsTableAnnotationComposer get traitId {
    final $$TraitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.traitId,
      referencedTable: $db.traits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitsTableAnnotationComposer(
            $db: $db,
            $table: $db.traits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> charactersRefs<T extends Object>(
    Expression<T> Function($$CharactersTableAnnotationComposer a) f,
  ) {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.darkAwakeningChoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DarkAwakeningChoicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DarkAwakeningChoicesTable,
          DarkAwakeningChoiceData,
          $$DarkAwakeningChoicesTableFilterComposer,
          $$DarkAwakeningChoicesTableOrderingComposer,
          $$DarkAwakeningChoicesTableAnnotationComposer,
          $$DarkAwakeningChoicesTableCreateCompanionBuilder,
          $$DarkAwakeningChoicesTableUpdateCompanionBuilder,
          (DarkAwakeningChoiceData, $$DarkAwakeningChoicesTableReferences),
          DarkAwakeningChoiceData,
          PrefetchHooks Function({bool traitId, bool charactersRefs})
        > {
  $$DarkAwakeningChoicesTableTableManager(
    _$AppDatabase db,
    $DarkAwakeningChoicesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$DarkAwakeningChoicesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$DarkAwakeningChoicesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$DarkAwakeningChoicesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String?> traitId = const Value.absent(),
                Value<int> strengthBonus = const Value.absent(),
                Value<int> agilityBonus = const Value.absent(),
                Value<int> intelligenceBonus = const Value.absent(),
                Value<int> perceptionBonus = const Value.absent(),
                Value<int> enduranceBonus = const Value.absent(),
                Value<AspectType?> aspectType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DarkAwakeningChoicesCompanion(
                id: id,
                description: description,
                traitId: traitId,
                strengthBonus: strengthBonus,
                agilityBonus: agilityBonus,
                intelligenceBonus: intelligenceBonus,
                perceptionBonus: perceptionBonus,
                enduranceBonus: enduranceBonus,
                aspectType: aspectType,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String description,
                Value<String?> traitId = const Value.absent(),
                Value<int> strengthBonus = const Value.absent(),
                Value<int> agilityBonus = const Value.absent(),
                Value<int> intelligenceBonus = const Value.absent(),
                Value<int> perceptionBonus = const Value.absent(),
                Value<int> enduranceBonus = const Value.absent(),
                Value<AspectType?> aspectType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DarkAwakeningChoicesCompanion.insert(
                id: id,
                description: description,
                traitId: traitId,
                strengthBonus: strengthBonus,
                agilityBonus: agilityBonus,
                intelligenceBonus: intelligenceBonus,
                perceptionBonus: perceptionBonus,
                enduranceBonus: enduranceBonus,
                aspectType: aspectType,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$DarkAwakeningChoicesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({traitId = false, charactersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (charactersRefs) db.characters],
              addJoins: <
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
                if (traitId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.traitId,
                            referencedTable:
                                $$DarkAwakeningChoicesTableReferences
                                    ._traitIdTable(db),
                            referencedColumn:
                                $$DarkAwakeningChoicesTableReferences
                                    ._traitIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (charactersRefs)
                    await $_getPrefetchedData<
                      DarkAwakeningChoiceData,
                      $DarkAwakeningChoicesTable,
                      CharacterData
                    >(
                      currentTable: table,
                      referencedTable: $$DarkAwakeningChoicesTableReferences
                          ._charactersRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$DarkAwakeningChoicesTableReferences(
                                db,
                                table,
                                p0,
                              ).charactersRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.darkAwakeningChoiceId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DarkAwakeningChoicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DarkAwakeningChoicesTable,
      DarkAwakeningChoiceData,
      $$DarkAwakeningChoicesTableFilterComposer,
      $$DarkAwakeningChoicesTableOrderingComposer,
      $$DarkAwakeningChoicesTableAnnotationComposer,
      $$DarkAwakeningChoicesTableCreateCompanionBuilder,
      $$DarkAwakeningChoicesTableUpdateCompanionBuilder,
      (DarkAwakeningChoiceData, $$DarkAwakeningChoicesTableReferences),
      DarkAwakeningChoiceData,
      PrefetchHooks Function({bool traitId, bool charactersRefs})
    >;
typedef $$CharactersTableCreateCompanionBuilder =
    CharactersCompanion Function({
      Value<String> id,
      required String userId,
      required String name,
      Value<int> currentHp,
      Value<int> maxHp,
      Value<int> mana,
      Value<int> coreLevel,
      Value<int> coreProgress,
      Value<int> strength,
      Value<int> agility,
      Value<int> intelligence,
      Value<int> perception,
      Value<int> endurance,
      required CharacterRank rank,
      Value<String?> aspect,
      Value<bool> abilitiesRevealed,
      Value<String?> childhoodChoiceId,
      Value<String?> majorEventChoiceId,
      Value<String?> darkAwakeningChoiceId,
      Value<int> rowid,
    });
typedef $$CharactersTableUpdateCompanionBuilder =
    CharactersCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> name,
      Value<int> currentHp,
      Value<int> maxHp,
      Value<int> mana,
      Value<int> coreLevel,
      Value<int> coreProgress,
      Value<int> strength,
      Value<int> agility,
      Value<int> intelligence,
      Value<int> perception,
      Value<int> endurance,
      Value<CharacterRank> rank,
      Value<String?> aspect,
      Value<bool> abilitiesRevealed,
      Value<String?> childhoodChoiceId,
      Value<String?> majorEventChoiceId,
      Value<String?> darkAwakeningChoiceId,
      Value<int> rowid,
    });

final class $$CharactersTableReferences
    extends BaseReferences<_$AppDatabase, $CharactersTable, CharacterData> {
  $$CharactersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ChildhoodChoicesTable _childhoodChoiceIdTable(_$AppDatabase db) =>
      db.childhoodChoices.createAlias(
        $_aliasNameGenerator(
          db.characters.childhoodChoiceId,
          db.childhoodChoices.id,
        ),
      );

  $$ChildhoodChoicesTableProcessedTableManager? get childhoodChoiceId {
    final $_column = $_itemColumn<String>('childhood_choice_id');
    if ($_column == null) return null;
    final manager = $$ChildhoodChoicesTableTableManager(
      $_db,
      $_db.childhoodChoices,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_childhoodChoiceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MajorEventChoicesTable _majorEventChoiceIdTable(_$AppDatabase db) =>
      db.majorEventChoices.createAlias(
        $_aliasNameGenerator(
          db.characters.majorEventChoiceId,
          db.majorEventChoices.id,
        ),
      );

  $$MajorEventChoicesTableProcessedTableManager? get majorEventChoiceId {
    final $_column = $_itemColumn<String>('major_event_choice_id');
    if ($_column == null) return null;
    final manager = $$MajorEventChoicesTableTableManager(
      $_db,
      $_db.majorEventChoices,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_majorEventChoiceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DarkAwakeningChoicesTable _darkAwakeningChoiceIdTable(
    _$AppDatabase db,
  ) => db.darkAwakeningChoices.createAlias(
    $_aliasNameGenerator(
      db.characters.darkAwakeningChoiceId,
      db.darkAwakeningChoices.id,
    ),
  );

  $$DarkAwakeningChoicesTableProcessedTableManager? get darkAwakeningChoiceId {
    final $_column = $_itemColumn<String>('dark_awakening_choice_id');
    if ($_column == null) return null;
    final manager = $$DarkAwakeningChoicesTableTableManager(
      $_db,
      $_db.darkAwakeningChoices,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _darkAwakeningChoiceIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AbilitiesTable, List<AbilityData>>
  _abilitiesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.abilities,
    aliasName: $_aliasNameGenerator(db.characters.id, db.abilities.characterId),
  );

  $$AbilitiesTableProcessedTableManager get abilitiesRefs {
    final manager = $$AbilitiesTableTableManager(
      $_db,
      $_db.abilities,
    ).filter((f) => f.characterId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_abilitiesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CharacterMemoriesTable, List<CharacterMemoryData>>
  _characterMemoriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.characterMemories,
        aliasName: $_aliasNameGenerator(
          db.characters.id,
          db.characterMemories.characterId,
        ),
      );

  $$CharacterMemoriesTableProcessedTableManager get characterMemoriesRefs {
    final manager = $$CharacterMemoriesTableTableManager(
      $_db,
      $_db.characterMemories,
    ).filter((f) => f.characterId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _characterMemoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CharacterTraitsTable, List<CharacterTraitData>>
  _characterTraitsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.characterTraits,
    aliasName: $_aliasNameGenerator(
      db.characters.id,
      db.characterTraits.characterId,
    ),
  );

  $$CharacterTraitsTableProcessedTableManager get characterTraitsRefs {
    final manager = $$CharacterTraitsTableTableManager(
      $_db,
      $_db.characterTraits,
    ).filter((f) => f.characterId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _characterTraitsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CharactersTableFilterComposer
    extends Composer<_$AppDatabase, $CharactersTable> {
  $$CharactersTableFilterComposer({
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

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentHp => $composableBuilder(
    column: $table.currentHp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxHp => $composableBuilder(
    column: $table.maxHp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mana => $composableBuilder(
    column: $table.mana,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get coreLevel => $composableBuilder(
    column: $table.coreLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get coreProgress => $composableBuilder(
    column: $table.coreProgress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get strength => $composableBuilder(
    column: $table.strength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get agility => $composableBuilder(
    column: $table.agility,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intelligence => $composableBuilder(
    column: $table.intelligence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get perception => $composableBuilder(
    column: $table.perception,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endurance => $composableBuilder(
    column: $table.endurance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CharacterRank, CharacterRank, String>
  get rank => $composableBuilder(
    column: $table.rank,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get aspect => $composableBuilder(
    column: $table.aspect,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get abilitiesRevealed => $composableBuilder(
    column: $table.abilitiesRevealed,
    builder: (column) => ColumnFilters(column),
  );

  $$ChildhoodChoicesTableFilterComposer get childhoodChoiceId {
    final $$ChildhoodChoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.childhoodChoiceId,
      referencedTable: $db.childhoodChoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChildhoodChoicesTableFilterComposer(
            $db: $db,
            $table: $db.childhoodChoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MajorEventChoicesTableFilterComposer get majorEventChoiceId {
    final $$MajorEventChoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.majorEventChoiceId,
      referencedTable: $db.majorEventChoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MajorEventChoicesTableFilterComposer(
            $db: $db,
            $table: $db.majorEventChoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DarkAwakeningChoicesTableFilterComposer get darkAwakeningChoiceId {
    final $$DarkAwakeningChoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.darkAwakeningChoiceId,
      referencedTable: $db.darkAwakeningChoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DarkAwakeningChoicesTableFilterComposer(
            $db: $db,
            $table: $db.darkAwakeningChoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> abilitiesRefs(
    Expression<bool> Function($$AbilitiesTableFilterComposer f) f,
  ) {
    final $$AbilitiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.abilities,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AbilitiesTableFilterComposer(
            $db: $db,
            $table: $db.abilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> characterMemoriesRefs(
    Expression<bool> Function($$CharacterMemoriesTableFilterComposer f) f,
  ) {
    final $$CharacterMemoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterMemories,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterMemoriesTableFilterComposer(
            $db: $db,
            $table: $db.characterMemories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> characterTraitsRefs(
    Expression<bool> Function($$CharacterTraitsTableFilterComposer f) f,
  ) {
    final $$CharacterTraitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterTraits,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterTraitsTableFilterComposer(
            $db: $db,
            $table: $db.characterTraits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CharactersTableOrderingComposer
    extends Composer<_$AppDatabase, $CharactersTable> {
  $$CharactersTableOrderingComposer({
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

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentHp => $composableBuilder(
    column: $table.currentHp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxHp => $composableBuilder(
    column: $table.maxHp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mana => $composableBuilder(
    column: $table.mana,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get coreLevel => $composableBuilder(
    column: $table.coreLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get coreProgress => $composableBuilder(
    column: $table.coreProgress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get strength => $composableBuilder(
    column: $table.strength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get agility => $composableBuilder(
    column: $table.agility,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intelligence => $composableBuilder(
    column: $table.intelligence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get perception => $composableBuilder(
    column: $table.perception,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endurance => $composableBuilder(
    column: $table.endurance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rank => $composableBuilder(
    column: $table.rank,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aspect => $composableBuilder(
    column: $table.aspect,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get abilitiesRevealed => $composableBuilder(
    column: $table.abilitiesRevealed,
    builder: (column) => ColumnOrderings(column),
  );

  $$ChildhoodChoicesTableOrderingComposer get childhoodChoiceId {
    final $$ChildhoodChoicesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.childhoodChoiceId,
      referencedTable: $db.childhoodChoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChildhoodChoicesTableOrderingComposer(
            $db: $db,
            $table: $db.childhoodChoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MajorEventChoicesTableOrderingComposer get majorEventChoiceId {
    final $$MajorEventChoicesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.majorEventChoiceId,
      referencedTable: $db.majorEventChoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MajorEventChoicesTableOrderingComposer(
            $db: $db,
            $table: $db.majorEventChoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DarkAwakeningChoicesTableOrderingComposer get darkAwakeningChoiceId {
    final $$DarkAwakeningChoicesTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.darkAwakeningChoiceId,
          referencedTable: $db.darkAwakeningChoices,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DarkAwakeningChoicesTableOrderingComposer(
                $db: $db,
                $table: $db.darkAwakeningChoices,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$CharactersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharactersTable> {
  $$CharactersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get currentHp =>
      $composableBuilder(column: $table.currentHp, builder: (column) => column);

  GeneratedColumn<int> get maxHp =>
      $composableBuilder(column: $table.maxHp, builder: (column) => column);

  GeneratedColumn<int> get mana =>
      $composableBuilder(column: $table.mana, builder: (column) => column);

  GeneratedColumn<int> get coreLevel =>
      $composableBuilder(column: $table.coreLevel, builder: (column) => column);

  GeneratedColumn<int> get coreProgress => $composableBuilder(
    column: $table.coreProgress,
    builder: (column) => column,
  );

  GeneratedColumn<int> get strength =>
      $composableBuilder(column: $table.strength, builder: (column) => column);

  GeneratedColumn<int> get agility =>
      $composableBuilder(column: $table.agility, builder: (column) => column);

  GeneratedColumn<int> get intelligence => $composableBuilder(
    column: $table.intelligence,
    builder: (column) => column,
  );

  GeneratedColumn<int> get perception => $composableBuilder(
    column: $table.perception,
    builder: (column) => column,
  );

  GeneratedColumn<int> get endurance =>
      $composableBuilder(column: $table.endurance, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CharacterRank, String> get rank =>
      $composableBuilder(column: $table.rank, builder: (column) => column);

  GeneratedColumn<String> get aspect =>
      $composableBuilder(column: $table.aspect, builder: (column) => column);

  GeneratedColumn<bool> get abilitiesRevealed => $composableBuilder(
    column: $table.abilitiesRevealed,
    builder: (column) => column,
  );

  $$ChildhoodChoicesTableAnnotationComposer get childhoodChoiceId {
    final $$ChildhoodChoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.childhoodChoiceId,
      referencedTable: $db.childhoodChoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChildhoodChoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.childhoodChoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MajorEventChoicesTableAnnotationComposer get majorEventChoiceId {
    final $$MajorEventChoicesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.majorEventChoiceId,
          referencedTable: $db.majorEventChoices,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MajorEventChoicesTableAnnotationComposer(
                $db: $db,
                $table: $db.majorEventChoices,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$DarkAwakeningChoicesTableAnnotationComposer get darkAwakeningChoiceId {
    final $$DarkAwakeningChoicesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.darkAwakeningChoiceId,
          referencedTable: $db.darkAwakeningChoices,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DarkAwakeningChoicesTableAnnotationComposer(
                $db: $db,
                $table: $db.darkAwakeningChoices,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> abilitiesRefs<T extends Object>(
    Expression<T> Function($$AbilitiesTableAnnotationComposer a) f,
  ) {
    final $$AbilitiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.abilities,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AbilitiesTableAnnotationComposer(
            $db: $db,
            $table: $db.abilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> characterMemoriesRefs<T extends Object>(
    Expression<T> Function($$CharacterMemoriesTableAnnotationComposer a) f,
  ) {
    final $$CharacterMemoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.characterMemories,
          getReferencedColumn: (t) => t.characterId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CharacterMemoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.characterMemories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> characterTraitsRefs<T extends Object>(
    Expression<T> Function($$CharacterTraitsTableAnnotationComposer a) f,
  ) {
    final $$CharacterTraitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterTraits,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterTraitsTableAnnotationComposer(
            $db: $db,
            $table: $db.characterTraits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CharactersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CharactersTable,
          CharacterData,
          $$CharactersTableFilterComposer,
          $$CharactersTableOrderingComposer,
          $$CharactersTableAnnotationComposer,
          $$CharactersTableCreateCompanionBuilder,
          $$CharactersTableUpdateCompanionBuilder,
          (CharacterData, $$CharactersTableReferences),
          CharacterData,
          PrefetchHooks Function({
            bool childhoodChoiceId,
            bool majorEventChoiceId,
            bool darkAwakeningChoiceId,
            bool abilitiesRefs,
            bool characterMemoriesRefs,
            bool characterTraitsRefs,
          })
        > {
  $$CharactersTableTableManager(_$AppDatabase db, $CharactersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CharactersTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CharactersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CharactersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> currentHp = const Value.absent(),
                Value<int> maxHp = const Value.absent(),
                Value<int> mana = const Value.absent(),
                Value<int> coreLevel = const Value.absent(),
                Value<int> coreProgress = const Value.absent(),
                Value<int> strength = const Value.absent(),
                Value<int> agility = const Value.absent(),
                Value<int> intelligence = const Value.absent(),
                Value<int> perception = const Value.absent(),
                Value<int> endurance = const Value.absent(),
                Value<CharacterRank> rank = const Value.absent(),
                Value<String?> aspect = const Value.absent(),
                Value<bool> abilitiesRevealed = const Value.absent(),
                Value<String?> childhoodChoiceId = const Value.absent(),
                Value<String?> majorEventChoiceId = const Value.absent(),
                Value<String?> darkAwakeningChoiceId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharactersCompanion(
                id: id,
                userId: userId,
                name: name,
                currentHp: currentHp,
                maxHp: maxHp,
                mana: mana,
                coreLevel: coreLevel,
                coreProgress: coreProgress,
                strength: strength,
                agility: agility,
                intelligence: intelligence,
                perception: perception,
                endurance: endurance,
                rank: rank,
                aspect: aspect,
                abilitiesRevealed: abilitiesRevealed,
                childhoodChoiceId: childhoodChoiceId,
                majorEventChoiceId: majorEventChoiceId,
                darkAwakeningChoiceId: darkAwakeningChoiceId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String userId,
                required String name,
                Value<int> currentHp = const Value.absent(),
                Value<int> maxHp = const Value.absent(),
                Value<int> mana = const Value.absent(),
                Value<int> coreLevel = const Value.absent(),
                Value<int> coreProgress = const Value.absent(),
                Value<int> strength = const Value.absent(),
                Value<int> agility = const Value.absent(),
                Value<int> intelligence = const Value.absent(),
                Value<int> perception = const Value.absent(),
                Value<int> endurance = const Value.absent(),
                required CharacterRank rank,
                Value<String?> aspect = const Value.absent(),
                Value<bool> abilitiesRevealed = const Value.absent(),
                Value<String?> childhoodChoiceId = const Value.absent(),
                Value<String?> majorEventChoiceId = const Value.absent(),
                Value<String?> darkAwakeningChoiceId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharactersCompanion.insert(
                id: id,
                userId: userId,
                name: name,
                currentHp: currentHp,
                maxHp: maxHp,
                mana: mana,
                coreLevel: coreLevel,
                coreProgress: coreProgress,
                strength: strength,
                agility: agility,
                intelligence: intelligence,
                perception: perception,
                endurance: endurance,
                rank: rank,
                aspect: aspect,
                abilitiesRevealed: abilitiesRevealed,
                childhoodChoiceId: childhoodChoiceId,
                majorEventChoiceId: majorEventChoiceId,
                darkAwakeningChoiceId: darkAwakeningChoiceId,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CharactersTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            childhoodChoiceId = false,
            majorEventChoiceId = false,
            darkAwakeningChoiceId = false,
            abilitiesRefs = false,
            characterMemoriesRefs = false,
            characterTraitsRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (abilitiesRefs) db.abilities,
                if (characterMemoriesRefs) db.characterMemories,
                if (characterTraitsRefs) db.characterTraits,
              ],
              addJoins: <
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
                if (childhoodChoiceId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.childhoodChoiceId,
                            referencedTable: $$CharactersTableReferences
                                ._childhoodChoiceIdTable(db),
                            referencedColumn:
                                $$CharactersTableReferences
                                    ._childhoodChoiceIdTable(db)
                                    .id,
                          )
                          as T;
                }
                if (majorEventChoiceId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.majorEventChoiceId,
                            referencedTable: $$CharactersTableReferences
                                ._majorEventChoiceIdTable(db),
                            referencedColumn:
                                $$CharactersTableReferences
                                    ._majorEventChoiceIdTable(db)
                                    .id,
                          )
                          as T;
                }
                if (darkAwakeningChoiceId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.darkAwakeningChoiceId,
                            referencedTable: $$CharactersTableReferences
                                ._darkAwakeningChoiceIdTable(db),
                            referencedColumn:
                                $$CharactersTableReferences
                                    ._darkAwakeningChoiceIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (abilitiesRefs)
                    await $_getPrefetchedData<
                      CharacterData,
                      $CharactersTable,
                      AbilityData
                    >(
                      currentTable: table,
                      referencedTable: $$CharactersTableReferences
                          ._abilitiesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CharactersTableReferences(
                                db,
                                table,
                                p0,
                              ).abilitiesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.characterId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (characterMemoriesRefs)
                    await $_getPrefetchedData<
                      CharacterData,
                      $CharactersTable,
                      CharacterMemoryData
                    >(
                      currentTable: table,
                      referencedTable: $$CharactersTableReferences
                          ._characterMemoriesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CharactersTableReferences(
                                db,
                                table,
                                p0,
                              ).characterMemoriesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.characterId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (characterTraitsRefs)
                    await $_getPrefetchedData<
                      CharacterData,
                      $CharactersTable,
                      CharacterTraitData
                    >(
                      currentTable: table,
                      referencedTable: $$CharactersTableReferences
                          ._characterTraitsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CharactersTableReferences(
                                db,
                                table,
                                p0,
                              ).characterTraitsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.characterId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CharactersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CharactersTable,
      CharacterData,
      $$CharactersTableFilterComposer,
      $$CharactersTableOrderingComposer,
      $$CharactersTableAnnotationComposer,
      $$CharactersTableCreateCompanionBuilder,
      $$CharactersTableUpdateCompanionBuilder,
      (CharacterData, $$CharactersTableReferences),
      CharacterData,
      PrefetchHooks Function({
        bool childhoodChoiceId,
        bool majorEventChoiceId,
        bool darkAwakeningChoiceId,
        bool abilitiesRefs,
        bool characterMemoriesRefs,
        bool characterTraitsRefs,
      })
    >;
typedef $$AbilitiesTableCreateCompanionBuilder =
    AbilitiesCompanion Function({
      Value<String> id,
      required String characterId,
      required String name,
      Value<String?> description,
      Value<int> manaCost,
      Value<int> cooldown,
      required CharacterRank rankRequired,
      required AspectType aspectType,
      Value<int> rowid,
    });
typedef $$AbilitiesTableUpdateCompanionBuilder =
    AbilitiesCompanion Function({
      Value<String> id,
      Value<String> characterId,
      Value<String> name,
      Value<String?> description,
      Value<int> manaCost,
      Value<int> cooldown,
      Value<CharacterRank> rankRequired,
      Value<AspectType> aspectType,
      Value<int> rowid,
    });

final class $$AbilitiesTableReferences
    extends BaseReferences<_$AppDatabase, $AbilitiesTable, AbilityData> {
  $$AbilitiesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CharactersTable _characterIdTable(_$AppDatabase db) =>
      db.characters.createAlias(
        $_aliasNameGenerator(db.abilities.characterId, db.characters.id),
      );

  $$CharactersTableProcessedTableManager get characterId {
    final $_column = $_itemColumn<String>('character_id')!;

    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AbilitiesTableFilterComposer
    extends Composer<_$AppDatabase, $AbilitiesTable> {
  $$AbilitiesTableFilterComposer({
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

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get manaCost => $composableBuilder(
    column: $table.manaCost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cooldown => $composableBuilder(
    column: $table.cooldown,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CharacterRank, CharacterRank, String>
  get rankRequired => $composableBuilder(
    column: $table.rankRequired,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<AspectType, AspectType, String>
  get aspectType => $composableBuilder(
    column: $table.aspectType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  $$CharactersTableFilterComposer get characterId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AbilitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $AbilitiesTable> {
  $$AbilitiesTableOrderingComposer({
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

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get manaCost => $composableBuilder(
    column: $table.manaCost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cooldown => $composableBuilder(
    column: $table.cooldown,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rankRequired => $composableBuilder(
    column: $table.rankRequired,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aspectType => $composableBuilder(
    column: $table.aspectType,
    builder: (column) => ColumnOrderings(column),
  );

  $$CharactersTableOrderingComposer get characterId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AbilitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AbilitiesTable> {
  $$AbilitiesTableAnnotationComposer({
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

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get manaCost =>
      $composableBuilder(column: $table.manaCost, builder: (column) => column);

  GeneratedColumn<int> get cooldown =>
      $composableBuilder(column: $table.cooldown, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CharacterRank, String> get rankRequired =>
      $composableBuilder(
        column: $table.rankRequired,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<AspectType, String> get aspectType =>
      $composableBuilder(
        column: $table.aspectType,
        builder: (column) => column,
      );

  $$CharactersTableAnnotationComposer get characterId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AbilitiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AbilitiesTable,
          AbilityData,
          $$AbilitiesTableFilterComposer,
          $$AbilitiesTableOrderingComposer,
          $$AbilitiesTableAnnotationComposer,
          $$AbilitiesTableCreateCompanionBuilder,
          $$AbilitiesTableUpdateCompanionBuilder,
          (AbilityData, $$AbilitiesTableReferences),
          AbilityData,
          PrefetchHooks Function({bool characterId})
        > {
  $$AbilitiesTableTableManager(_$AppDatabase db, $AbilitiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$AbilitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$AbilitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$AbilitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> characterId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> manaCost = const Value.absent(),
                Value<int> cooldown = const Value.absent(),
                Value<CharacterRank> rankRequired = const Value.absent(),
                Value<AspectType> aspectType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AbilitiesCompanion(
                id: id,
                characterId: characterId,
                name: name,
                description: description,
                manaCost: manaCost,
                cooldown: cooldown,
                rankRequired: rankRequired,
                aspectType: aspectType,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String characterId,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<int> manaCost = const Value.absent(),
                Value<int> cooldown = const Value.absent(),
                required CharacterRank rankRequired,
                required AspectType aspectType,
                Value<int> rowid = const Value.absent(),
              }) => AbilitiesCompanion.insert(
                id: id,
                characterId: characterId,
                name: name,
                description: description,
                manaCost: manaCost,
                cooldown: cooldown,
                rankRequired: rankRequired,
                aspectType: aspectType,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$AbilitiesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({characterId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                if (characterId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.characterId,
                            referencedTable: $$AbilitiesTableReferences
                                ._characterIdTable(db),
                            referencedColumn:
                                $$AbilitiesTableReferences
                                    ._characterIdTable(db)
                                    .id,
                          )
                          as T;
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

typedef $$AbilitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AbilitiesTable,
      AbilityData,
      $$AbilitiesTableFilterComposer,
      $$AbilitiesTableOrderingComposer,
      $$AbilitiesTableAnnotationComposer,
      $$AbilitiesTableCreateCompanionBuilder,
      $$AbilitiesTableUpdateCompanionBuilder,
      (AbilityData, $$AbilitiesTableReferences),
      AbilityData,
      PrefetchHooks Function({bool characterId})
    >;
typedef $$MemoriesTableCreateCompanionBuilder =
    MemoriesCompanion Function({
      Value<String> id,
      required String name,
      Value<String?> description,
      required MemoryType type,
      required CharacterRank rank,
      Value<String?> bonusStats,
      Value<int> rowid,
    });
typedef $$MemoriesTableUpdateCompanionBuilder =
    MemoriesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<MemoryType> type,
      Value<CharacterRank> rank,
      Value<String?> bonusStats,
      Value<int> rowid,
    });

final class $$MemoriesTableReferences
    extends BaseReferences<_$AppDatabase, $MemoriesTable, MemoryData> {
  $$MemoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CharacterMemoriesTable, List<CharacterMemoryData>>
  _characterMemoriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.characterMemories,
        aliasName: $_aliasNameGenerator(
          db.memories.id,
          db.characterMemories.memoryId,
        ),
      );

  $$CharacterMemoriesTableProcessedTableManager get characterMemoriesRefs {
    final manager = $$CharacterMemoriesTableTableManager(
      $_db,
      $_db.characterMemories,
    ).filter((f) => f.memoryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _characterMemoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MemoriesTableFilterComposer
    extends Composer<_$AppDatabase, $MemoriesTable> {
  $$MemoriesTableFilterComposer({
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

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MemoryType, MemoryType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<CharacterRank, CharacterRank, String>
  get rank => $composableBuilder(
    column: $table.rank,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get bonusStats => $composableBuilder(
    column: $table.bonusStats,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> characterMemoriesRefs(
    Expression<bool> Function($$CharacterMemoriesTableFilterComposer f) f,
  ) {
    final $$CharacterMemoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterMemories,
      getReferencedColumn: (t) => t.memoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterMemoriesTableFilterComposer(
            $db: $db,
            $table: $db.characterMemories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MemoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $MemoriesTable> {
  $$MemoriesTableOrderingComposer({
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

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rank => $composableBuilder(
    column: $table.rank,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bonusStats => $composableBuilder(
    column: $table.bonusStats,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MemoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MemoriesTable> {
  $$MemoriesTableAnnotationComposer({
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

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<MemoryType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CharacterRank, String> get rank =>
      $composableBuilder(column: $table.rank, builder: (column) => column);

  GeneratedColumn<String> get bonusStats => $composableBuilder(
    column: $table.bonusStats,
    builder: (column) => column,
  );

  Expression<T> characterMemoriesRefs<T extends Object>(
    Expression<T> Function($$CharacterMemoriesTableAnnotationComposer a) f,
  ) {
    final $$CharacterMemoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.characterMemories,
          getReferencedColumn: (t) => t.memoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CharacterMemoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.characterMemories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$MemoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MemoriesTable,
          MemoryData,
          $$MemoriesTableFilterComposer,
          $$MemoriesTableOrderingComposer,
          $$MemoriesTableAnnotationComposer,
          $$MemoriesTableCreateCompanionBuilder,
          $$MemoriesTableUpdateCompanionBuilder,
          (MemoryData, $$MemoriesTableReferences),
          MemoryData,
          PrefetchHooks Function({bool characterMemoriesRefs})
        > {
  $$MemoriesTableTableManager(_$AppDatabase db, $MemoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$MemoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$MemoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$MemoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<MemoryType> type = const Value.absent(),
                Value<CharacterRank> rank = const Value.absent(),
                Value<String?> bonusStats = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MemoriesCompanion(
                id: id,
                name: name,
                description: description,
                type: type,
                rank: rank,
                bonusStats: bonusStats,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                required MemoryType type,
                required CharacterRank rank,
                Value<String?> bonusStats = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MemoriesCompanion.insert(
                id: id,
                name: name,
                description: description,
                type: type,
                rank: rank,
                bonusStats: bonusStats,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$MemoriesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({characterMemoriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (characterMemoriesRefs) db.characterMemories,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (characterMemoriesRefs)
                    await $_getPrefetchedData<
                      MemoryData,
                      $MemoriesTable,
                      CharacterMemoryData
                    >(
                      currentTable: table,
                      referencedTable: $$MemoriesTableReferences
                          ._characterMemoriesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$MemoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).characterMemoriesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.memoryId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MemoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MemoriesTable,
      MemoryData,
      $$MemoriesTableFilterComposer,
      $$MemoriesTableOrderingComposer,
      $$MemoriesTableAnnotationComposer,
      $$MemoriesTableCreateCompanionBuilder,
      $$MemoriesTableUpdateCompanionBuilder,
      (MemoryData, $$MemoriesTableReferences),
      MemoryData,
      PrefetchHooks Function({bool characterMemoriesRefs})
    >;
typedef $$CharacterMemoriesTableCreateCompanionBuilder =
    CharacterMemoriesCompanion Function({
      required String characterId,
      required String memoryId,
      Value<bool> isEquipped,
      Value<int> rowid,
    });
typedef $$CharacterMemoriesTableUpdateCompanionBuilder =
    CharacterMemoriesCompanion Function({
      Value<String> characterId,
      Value<String> memoryId,
      Value<bool> isEquipped,
      Value<int> rowid,
    });

final class $$CharacterMemoriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CharacterMemoriesTable,
          CharacterMemoryData
        > {
  $$CharacterMemoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CharactersTable _characterIdTable(_$AppDatabase db) =>
      db.characters.createAlias(
        $_aliasNameGenerator(
          db.characterMemories.characterId,
          db.characters.id,
        ),
      );

  $$CharactersTableProcessedTableManager get characterId {
    final $_column = $_itemColumn<String>('character_id')!;

    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MemoriesTable _memoryIdTable(_$AppDatabase db) =>
      db.memories.createAlias(
        $_aliasNameGenerator(db.characterMemories.memoryId, db.memories.id),
      );

  $$MemoriesTableProcessedTableManager get memoryId {
    final $_column = $_itemColumn<String>('memory_id')!;

    final manager = $$MemoriesTableTableManager(
      $_db,
      $_db.memories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_memoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CharacterMemoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CharacterMemoriesTable> {
  $$CharacterMemoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<bool> get isEquipped => $composableBuilder(
    column: $table.isEquipped,
    builder: (column) => ColumnFilters(column),
  );

  $$CharactersTableFilterComposer get characterId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MemoriesTableFilterComposer get memoryId {
    final $$MemoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memoryId,
      referencedTable: $db.memories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MemoriesTableFilterComposer(
            $db: $db,
            $table: $db.memories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterMemoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CharacterMemoriesTable> {
  $$CharacterMemoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<bool> get isEquipped => $composableBuilder(
    column: $table.isEquipped,
    builder: (column) => ColumnOrderings(column),
  );

  $$CharactersTableOrderingComposer get characterId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MemoriesTableOrderingComposer get memoryId {
    final $$MemoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memoryId,
      referencedTable: $db.memories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MemoriesTableOrderingComposer(
            $db: $db,
            $table: $db.memories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterMemoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharacterMemoriesTable> {
  $$CharacterMemoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<bool> get isEquipped => $composableBuilder(
    column: $table.isEquipped,
    builder: (column) => column,
  );

  $$CharactersTableAnnotationComposer get characterId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MemoriesTableAnnotationComposer get memoryId {
    final $$MemoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memoryId,
      referencedTable: $db.memories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MemoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.memories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterMemoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CharacterMemoriesTable,
          CharacterMemoryData,
          $$CharacterMemoriesTableFilterComposer,
          $$CharacterMemoriesTableOrderingComposer,
          $$CharacterMemoriesTableAnnotationComposer,
          $$CharacterMemoriesTableCreateCompanionBuilder,
          $$CharacterMemoriesTableUpdateCompanionBuilder,
          (CharacterMemoryData, $$CharacterMemoriesTableReferences),
          CharacterMemoryData,
          PrefetchHooks Function({bool characterId, bool memoryId})
        > {
  $$CharacterMemoriesTableTableManager(
    _$AppDatabase db,
    $CharacterMemoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CharacterMemoriesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$CharacterMemoriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$CharacterMemoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> characterId = const Value.absent(),
                Value<String> memoryId = const Value.absent(),
                Value<bool> isEquipped = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterMemoriesCompanion(
                characterId: characterId,
                memoryId: memoryId,
                isEquipped: isEquipped,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String characterId,
                required String memoryId,
                Value<bool> isEquipped = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterMemoriesCompanion.insert(
                characterId: characterId,
                memoryId: memoryId,
                isEquipped: isEquipped,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CharacterMemoriesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({characterId = false, memoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                if (characterId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.characterId,
                            referencedTable: $$CharacterMemoriesTableReferences
                                ._characterIdTable(db),
                            referencedColumn:
                                $$CharacterMemoriesTableReferences
                                    ._characterIdTable(db)
                                    .id,
                          )
                          as T;
                }
                if (memoryId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.memoryId,
                            referencedTable: $$CharacterMemoriesTableReferences
                                ._memoryIdTable(db),
                            referencedColumn:
                                $$CharacterMemoriesTableReferences
                                    ._memoryIdTable(db)
                                    .id,
                          )
                          as T;
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

typedef $$CharacterMemoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CharacterMemoriesTable,
      CharacterMemoryData,
      $$CharacterMemoriesTableFilterComposer,
      $$CharacterMemoriesTableOrderingComposer,
      $$CharacterMemoriesTableAnnotationComposer,
      $$CharacterMemoriesTableCreateCompanionBuilder,
      $$CharacterMemoriesTableUpdateCompanionBuilder,
      (CharacterMemoryData, $$CharacterMemoriesTableReferences),
      CharacterMemoryData,
      PrefetchHooks Function({bool characterId, bool memoryId})
    >;
typedef $$CharacterTraitsTableCreateCompanionBuilder =
    CharacterTraitsCompanion Function({
      required String characterId,
      required String traitId,
      Value<int> rowid,
    });
typedef $$CharacterTraitsTableUpdateCompanionBuilder =
    CharacterTraitsCompanion Function({
      Value<String> characterId,
      Value<String> traitId,
      Value<int> rowid,
    });

final class $$CharacterTraitsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CharacterTraitsTable,
          CharacterTraitData
        > {
  $$CharacterTraitsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CharactersTable _characterIdTable(_$AppDatabase db) =>
      db.characters.createAlias(
        $_aliasNameGenerator(db.characterTraits.characterId, db.characters.id),
      );

  $$CharactersTableProcessedTableManager get characterId {
    final $_column = $_itemColumn<String>('character_id')!;

    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TraitsTable _traitIdTable(_$AppDatabase db) => db.traits.createAlias(
    $_aliasNameGenerator(db.characterTraits.traitId, db.traits.id),
  );

  $$TraitsTableProcessedTableManager get traitId {
    final $_column = $_itemColumn<String>('trait_id')!;

    final manager = $$TraitsTableTableManager(
      $_db,
      $_db.traits,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_traitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CharacterTraitsTableFilterComposer
    extends Composer<_$AppDatabase, $CharacterTraitsTable> {
  $$CharacterTraitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CharactersTableFilterComposer get characterId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TraitsTableFilterComposer get traitId {
    final $$TraitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.traitId,
      referencedTable: $db.traits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitsTableFilterComposer(
            $db: $db,
            $table: $db.traits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterTraitsTableOrderingComposer
    extends Composer<_$AppDatabase, $CharacterTraitsTable> {
  $$CharacterTraitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CharactersTableOrderingComposer get characterId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TraitsTableOrderingComposer get traitId {
    final $$TraitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.traitId,
      referencedTable: $db.traits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitsTableOrderingComposer(
            $db: $db,
            $table: $db.traits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterTraitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharacterTraitsTable> {
  $$CharacterTraitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CharactersTableAnnotationComposer get characterId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TraitsTableAnnotationComposer get traitId {
    final $$TraitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.traitId,
      referencedTable: $db.traits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitsTableAnnotationComposer(
            $db: $db,
            $table: $db.traits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterTraitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CharacterTraitsTable,
          CharacterTraitData,
          $$CharacterTraitsTableFilterComposer,
          $$CharacterTraitsTableOrderingComposer,
          $$CharacterTraitsTableAnnotationComposer,
          $$CharacterTraitsTableCreateCompanionBuilder,
          $$CharacterTraitsTableUpdateCompanionBuilder,
          (CharacterTraitData, $$CharacterTraitsTableReferences),
          CharacterTraitData,
          PrefetchHooks Function({bool characterId, bool traitId})
        > {
  $$CharacterTraitsTableTableManager(
    _$AppDatabase db,
    $CharacterTraitsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$CharacterTraitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CharacterTraitsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$CharacterTraitsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> characterId = const Value.absent(),
                Value<String> traitId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterTraitsCompanion(
                characterId: characterId,
                traitId: traitId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String characterId,
                required String traitId,
                Value<int> rowid = const Value.absent(),
              }) => CharacterTraitsCompanion.insert(
                characterId: characterId,
                traitId: traitId,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CharacterTraitsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({characterId = false, traitId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                if (characterId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.characterId,
                            referencedTable: $$CharacterTraitsTableReferences
                                ._characterIdTable(db),
                            referencedColumn:
                                $$CharacterTraitsTableReferences
                                    ._characterIdTable(db)
                                    .id,
                          )
                          as T;
                }
                if (traitId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.traitId,
                            referencedTable: $$CharacterTraitsTableReferences
                                ._traitIdTable(db),
                            referencedColumn:
                                $$CharacterTraitsTableReferences
                                    ._traitIdTable(db)
                                    .id,
                          )
                          as T;
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

typedef $$CharacterTraitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CharacterTraitsTable,
      CharacterTraitData,
      $$CharacterTraitsTableFilterComposer,
      $$CharacterTraitsTableOrderingComposer,
      $$CharacterTraitsTableAnnotationComposer,
      $$CharacterTraitsTableCreateCompanionBuilder,
      $$CharacterTraitsTableUpdateCompanionBuilder,
      (CharacterTraitData, $$CharacterTraitsTableReferences),
      CharacterTraitData,
      PrefetchHooks Function({bool characterId, bool traitId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TraitsTableTableManager get traits =>
      $$TraitsTableTableManager(_db, _db.traits);
  $$ChildhoodChoicesTableTableManager get childhoodChoices =>
      $$ChildhoodChoicesTableTableManager(_db, _db.childhoodChoices);
  $$MajorEventChoicesTableTableManager get majorEventChoices =>
      $$MajorEventChoicesTableTableManager(_db, _db.majorEventChoices);
  $$DarkAwakeningChoicesTableTableManager get darkAwakeningChoices =>
      $$DarkAwakeningChoicesTableTableManager(_db, _db.darkAwakeningChoices);
  $$CharactersTableTableManager get characters =>
      $$CharactersTableTableManager(_db, _db.characters);
  $$AbilitiesTableTableManager get abilities =>
      $$AbilitiesTableTableManager(_db, _db.abilities);
  $$MemoriesTableTableManager get memories =>
      $$MemoriesTableTableManager(_db, _db.memories);
  $$CharacterMemoriesTableTableManager get characterMemories =>
      $$CharacterMemoriesTableTableManager(_db, _db.characterMemories);
  $$CharacterTraitsTableTableManager get characterTraits =>
      $$CharacterTraitsTableTableManager(_db, _db.characterTraits);
}
