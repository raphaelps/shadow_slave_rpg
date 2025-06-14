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
  static const VerificationMeta _isStrengthMeta = const VerificationMeta(
    'isStrength',
  );
  @override
  late final GeneratedColumn<bool> isStrength = GeneratedColumn<bool>(
    'is_strength',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_strength" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isWeaknessMeta = const VerificationMeta(
    'isWeakness',
  );
  @override
  late final GeneratedColumn<bool> isWeakness = GeneratedColumn<bool>(
    'is_weakness',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_weakness" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    isStrength,
    isWeakness,
  ];
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
    if (data.containsKey('is_strength')) {
      context.handle(
        _isStrengthMeta,
        isStrength.isAcceptableOrUnknown(data['is_strength']!, _isStrengthMeta),
      );
    }
    if (data.containsKey('is_weakness')) {
      context.handle(
        _isWeaknessMeta,
        isWeakness.isAcceptableOrUnknown(data['is_weakness']!, _isWeaknessMeta),
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
      isStrength:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_strength'],
          )!,
      isWeakness:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_weakness'],
          )!,
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
  final bool isStrength;
  final bool isWeakness;
  const TraitData({
    required this.id,
    required this.name,
    this.description,
    required this.isStrength,
    required this.isWeakness,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_strength'] = Variable<bool>(isStrength);
    map['is_weakness'] = Variable<bool>(isWeakness);
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
      isStrength: Value(isStrength),
      isWeakness: Value(isWeakness),
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
      isStrength: serializer.fromJson<bool>(json['isStrength']),
      isWeakness: serializer.fromJson<bool>(json['isWeakness']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'isStrength': serializer.toJson<bool>(isStrength),
      'isWeakness': serializer.toJson<bool>(isWeakness),
    };
  }

  TraitData copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    bool? isStrength,
    bool? isWeakness,
  }) => TraitData(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    isStrength: isStrength ?? this.isStrength,
    isWeakness: isWeakness ?? this.isWeakness,
  );
  TraitData copyWithCompanion(TraitsCompanion data) {
    return TraitData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      isStrength:
          data.isStrength.present ? data.isStrength.value : this.isStrength,
      isWeakness:
          data.isWeakness.present ? data.isWeakness.value : this.isWeakness,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TraitData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isStrength: $isStrength, ')
          ..write('isWeakness: $isWeakness')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, isStrength, isWeakness);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TraitData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.isStrength == this.isStrength &&
          other.isWeakness == this.isWeakness);
}

class TraitsCompanion extends UpdateCompanion<TraitData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<bool> isStrength;
  final Value<bool> isWeakness;
  final Value<int> rowid;
  const TraitsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.isStrength = const Value.absent(),
    this.isWeakness = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TraitsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.isStrength = const Value.absent(),
    this.isWeakness = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<TraitData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<bool>? isStrength,
    Expression<bool>? isWeakness,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (isStrength != null) 'is_strength': isStrength,
      if (isWeakness != null) 'is_weakness': isWeakness,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TraitsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<bool>? isStrength,
    Value<bool>? isWeakness,
    Value<int>? rowid,
  }) {
    return TraitsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isStrength: isStrength ?? this.isStrength,
      isWeakness: isWeakness ?? this.isWeakness,
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
    if (isStrength.present) {
      map['is_strength'] = Variable<bool>(isStrength.value);
    }
    if (isWeakness.present) {
      map['is_weakness'] = Variable<bool>(isWeakness.value);
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
          ..write('isStrength: $isStrength, ')
          ..write('isWeakness: $isWeakness, ')
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

class $AdultChoicesTable extends AdultChoices
    with TableInfo<$AdultChoicesTable, AdultChoiceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdultChoicesTable(this.attachedDatabase, [this._alias]);
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
      ).withConverter<AspectType?>($AdultChoicesTable.$converteraspectTypen);
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
  static const String $name = 'adult_choices';
  @override
  VerificationContext validateIntegrity(
    Insertable<AdultChoiceData> instance, {
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
  AdultChoiceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AdultChoiceData(
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
      aspectType: $AdultChoicesTable.$converteraspectTypen.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}aspect_type'],
        ),
      ),
    );
  }

  @override
  $AdultChoicesTable createAlias(String alias) {
    return $AdultChoicesTable(attachedDatabase, alias);
  }

  static TypeConverter<AspectType, String> $converteraspectType =
      const AspectTypeConverter();
  static TypeConverter<AspectType?, String?> $converteraspectTypen =
      NullAwareTypeConverter.wrap($converteraspectType);
}

class AdultChoiceData extends DataClass implements Insertable<AdultChoiceData> {
  final String id;
  final String description;
  final String? traitId;
  final int strengthBonus;
  final int agilityBonus;
  final int intelligenceBonus;
  final int perceptionBonus;
  final int enduranceBonus;
  final AspectType? aspectType;
  const AdultChoiceData({
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
        $AdultChoicesTable.$converteraspectTypen.toSql(aspectType),
      );
    }
    return map;
  }

  AdultChoicesCompanion toCompanion(bool nullToAbsent) {
    return AdultChoicesCompanion(
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

  factory AdultChoiceData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AdultChoiceData(
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

  AdultChoiceData copyWith({
    String? id,
    String? description,
    Value<String?> traitId = const Value.absent(),
    int? strengthBonus,
    int? agilityBonus,
    int? intelligenceBonus,
    int? perceptionBonus,
    int? enduranceBonus,
    Value<AspectType?> aspectType = const Value.absent(),
  }) => AdultChoiceData(
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
  AdultChoiceData copyWithCompanion(AdultChoicesCompanion data) {
    return AdultChoiceData(
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
    return (StringBuffer('AdultChoiceData(')
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
      (other is AdultChoiceData &&
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

class AdultChoicesCompanion extends UpdateCompanion<AdultChoiceData> {
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
  const AdultChoicesCompanion({
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
  AdultChoicesCompanion.insert({
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
  static Insertable<AdultChoiceData> custom({
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

  AdultChoicesCompanion copyWith({
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
    return AdultChoicesCompanion(
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
        $AdultChoicesTable.$converteraspectTypen.toSql(aspectType.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdultChoicesCompanion(')
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
  static const VerificationMeta _adultChoiceIdMeta = const VerificationMeta(
    'adultChoiceId',
  );
  @override
  late final GeneratedColumn<String> adultChoiceId = GeneratedColumn<String>(
    'adult_choice_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES adult_choices (id)',
    ),
  );
  static const VerificationMeta _resistanceMentalMeta = const VerificationMeta(
    'resistanceMental',
  );
  @override
  late final GeneratedColumn<int> resistanceMental = GeneratedColumn<int>(
    'resistance_mental',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _resistanceSpiritualMeta =
      const VerificationMeta('resistanceSpiritual');
  @override
  late final GeneratedColumn<int> resistanceSpiritual = GeneratedColumn<int>(
    'resistance_spiritual',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _resistanceElementalHeatMeta =
      const VerificationMeta('resistanceElementalHeat');
  @override
  late final GeneratedColumn<int> resistanceElementalHeat =
      GeneratedColumn<int>(
        'resistance_elemental_heat',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _resistanceElementalColdMeta =
      const VerificationMeta('resistanceElementalCold');
  @override
  late final GeneratedColumn<int> resistanceElementalCold =
      GeneratedColumn<int>(
        'resistance_elemental_cold',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _resistanceElementalPoisonMeta =
      const VerificationMeta('resistanceElementalPoison');
  @override
  late final GeneratedColumn<int> resistanceElementalPoison =
      GeneratedColumn<int>(
        'resistance_elemental_poison',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _resistancePhysicalMeta =
      const VerificationMeta('resistancePhysical');
  @override
  late final GeneratedColumn<int> resistancePhysical = GeneratedColumn<int>(
    'resistance_physical',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
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
    adultChoiceId,
    resistanceMental,
    resistanceSpiritual,
    resistanceElementalHeat,
    resistanceElementalCold,
    resistanceElementalPoison,
    resistancePhysical,
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
    if (data.containsKey('adult_choice_id')) {
      context.handle(
        _adultChoiceIdMeta,
        adultChoiceId.isAcceptableOrUnknown(
          data['adult_choice_id']!,
          _adultChoiceIdMeta,
        ),
      );
    }
    if (data.containsKey('resistance_mental')) {
      context.handle(
        _resistanceMentalMeta,
        resistanceMental.isAcceptableOrUnknown(
          data['resistance_mental']!,
          _resistanceMentalMeta,
        ),
      );
    }
    if (data.containsKey('resistance_spiritual')) {
      context.handle(
        _resistanceSpiritualMeta,
        resistanceSpiritual.isAcceptableOrUnknown(
          data['resistance_spiritual']!,
          _resistanceSpiritualMeta,
        ),
      );
    }
    if (data.containsKey('resistance_elemental_heat')) {
      context.handle(
        _resistanceElementalHeatMeta,
        resistanceElementalHeat.isAcceptableOrUnknown(
          data['resistance_elemental_heat']!,
          _resistanceElementalHeatMeta,
        ),
      );
    }
    if (data.containsKey('resistance_elemental_cold')) {
      context.handle(
        _resistanceElementalColdMeta,
        resistanceElementalCold.isAcceptableOrUnknown(
          data['resistance_elemental_cold']!,
          _resistanceElementalColdMeta,
        ),
      );
    }
    if (data.containsKey('resistance_elemental_poison')) {
      context.handle(
        _resistanceElementalPoisonMeta,
        resistanceElementalPoison.isAcceptableOrUnknown(
          data['resistance_elemental_poison']!,
          _resistanceElementalPoisonMeta,
        ),
      );
    }
    if (data.containsKey('resistance_physical')) {
      context.handle(
        _resistancePhysicalMeta,
        resistancePhysical.isAcceptableOrUnknown(
          data['resistance_physical']!,
          _resistancePhysicalMeta,
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
      adultChoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}adult_choice_id'],
      ),
      resistanceMental:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}resistance_mental'],
          )!,
      resistanceSpiritual:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}resistance_spiritual'],
          )!,
      resistanceElementalHeat:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}resistance_elemental_heat'],
          )!,
      resistanceElementalCold:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}resistance_elemental_cold'],
          )!,
      resistanceElementalPoison:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}resistance_elemental_poison'],
          )!,
      resistancePhysical:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}resistance_physical'],
          )!,
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
  final String? adultChoiceId;
  final int resistanceMental;
  final int resistanceSpiritual;
  final int resistanceElementalHeat;
  final int resistanceElementalCold;
  final int resistanceElementalPoison;
  final int resistancePhysical;
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
    this.adultChoiceId,
    required this.resistanceMental,
    required this.resistanceSpiritual,
    required this.resistanceElementalHeat,
    required this.resistanceElementalCold,
    required this.resistanceElementalPoison,
    required this.resistancePhysical,
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
    if (!nullToAbsent || adultChoiceId != null) {
      map['adult_choice_id'] = Variable<String>(adultChoiceId);
    }
    map['resistance_mental'] = Variable<int>(resistanceMental);
    map['resistance_spiritual'] = Variable<int>(resistanceSpiritual);
    map['resistance_elemental_heat'] = Variable<int>(resistanceElementalHeat);
    map['resistance_elemental_cold'] = Variable<int>(resistanceElementalCold);
    map['resistance_elemental_poison'] = Variable<int>(
      resistanceElementalPoison,
    );
    map['resistance_physical'] = Variable<int>(resistancePhysical);
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
      adultChoiceId:
          adultChoiceId == null && nullToAbsent
              ? const Value.absent()
              : Value(adultChoiceId),
      resistanceMental: Value(resistanceMental),
      resistanceSpiritual: Value(resistanceSpiritual),
      resistanceElementalHeat: Value(resistanceElementalHeat),
      resistanceElementalCold: Value(resistanceElementalCold),
      resistanceElementalPoison: Value(resistanceElementalPoison),
      resistancePhysical: Value(resistancePhysical),
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
      adultChoiceId: serializer.fromJson<String?>(json['adultChoiceId']),
      resistanceMental: serializer.fromJson<int>(json['resistanceMental']),
      resistanceSpiritual: serializer.fromJson<int>(
        json['resistanceSpiritual'],
      ),
      resistanceElementalHeat: serializer.fromJson<int>(
        json['resistanceElementalHeat'],
      ),
      resistanceElementalCold: serializer.fromJson<int>(
        json['resistanceElementalCold'],
      ),
      resistanceElementalPoison: serializer.fromJson<int>(
        json['resistanceElementalPoison'],
      ),
      resistancePhysical: serializer.fromJson<int>(json['resistancePhysical']),
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
      'adultChoiceId': serializer.toJson<String?>(adultChoiceId),
      'resistanceMental': serializer.toJson<int>(resistanceMental),
      'resistanceSpiritual': serializer.toJson<int>(resistanceSpiritual),
      'resistanceElementalHeat': serializer.toJson<int>(
        resistanceElementalHeat,
      ),
      'resistanceElementalCold': serializer.toJson<int>(
        resistanceElementalCold,
      ),
      'resistanceElementalPoison': serializer.toJson<int>(
        resistanceElementalPoison,
      ),
      'resistancePhysical': serializer.toJson<int>(resistancePhysical),
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
    Value<String?> adultChoiceId = const Value.absent(),
    int? resistanceMental,
    int? resistanceSpiritual,
    int? resistanceElementalHeat,
    int? resistanceElementalCold,
    int? resistanceElementalPoison,
    int? resistancePhysical,
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
    adultChoiceId:
        adultChoiceId.present ? adultChoiceId.value : this.adultChoiceId,
    resistanceMental: resistanceMental ?? this.resistanceMental,
    resistanceSpiritual: resistanceSpiritual ?? this.resistanceSpiritual,
    resistanceElementalHeat:
        resistanceElementalHeat ?? this.resistanceElementalHeat,
    resistanceElementalCold:
        resistanceElementalCold ?? this.resistanceElementalCold,
    resistanceElementalPoison:
        resistanceElementalPoison ?? this.resistanceElementalPoison,
    resistancePhysical: resistancePhysical ?? this.resistancePhysical,
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
      adultChoiceId:
          data.adultChoiceId.present
              ? data.adultChoiceId.value
              : this.adultChoiceId,
      resistanceMental:
          data.resistanceMental.present
              ? data.resistanceMental.value
              : this.resistanceMental,
      resistanceSpiritual:
          data.resistanceSpiritual.present
              ? data.resistanceSpiritual.value
              : this.resistanceSpiritual,
      resistanceElementalHeat:
          data.resistanceElementalHeat.present
              ? data.resistanceElementalHeat.value
              : this.resistanceElementalHeat,
      resistanceElementalCold:
          data.resistanceElementalCold.present
              ? data.resistanceElementalCold.value
              : this.resistanceElementalCold,
      resistanceElementalPoison:
          data.resistanceElementalPoison.present
              ? data.resistanceElementalPoison.value
              : this.resistanceElementalPoison,
      resistancePhysical:
          data.resistancePhysical.present
              ? data.resistancePhysical.value
              : this.resistancePhysical,
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
          ..write('adultChoiceId: $adultChoiceId, ')
          ..write('resistanceMental: $resistanceMental, ')
          ..write('resistanceSpiritual: $resistanceSpiritual, ')
          ..write('resistanceElementalHeat: $resistanceElementalHeat, ')
          ..write('resistanceElementalCold: $resistanceElementalCold, ')
          ..write('resistanceElementalPoison: $resistanceElementalPoison, ')
          ..write('resistancePhysical: $resistancePhysical')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
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
    adultChoiceId,
    resistanceMental,
    resistanceSpiritual,
    resistanceElementalHeat,
    resistanceElementalCold,
    resistanceElementalPoison,
    resistancePhysical,
  ]);
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
          other.adultChoiceId == this.adultChoiceId &&
          other.resistanceMental == this.resistanceMental &&
          other.resistanceSpiritual == this.resistanceSpiritual &&
          other.resistanceElementalHeat == this.resistanceElementalHeat &&
          other.resistanceElementalCold == this.resistanceElementalCold &&
          other.resistanceElementalPoison == this.resistanceElementalPoison &&
          other.resistancePhysical == this.resistancePhysical);
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
  final Value<String?> adultChoiceId;
  final Value<int> resistanceMental;
  final Value<int> resistanceSpiritual;
  final Value<int> resistanceElementalHeat;
  final Value<int> resistanceElementalCold;
  final Value<int> resistanceElementalPoison;
  final Value<int> resistancePhysical;
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
    this.adultChoiceId = const Value.absent(),
    this.resistanceMental = const Value.absent(),
    this.resistanceSpiritual = const Value.absent(),
    this.resistanceElementalHeat = const Value.absent(),
    this.resistanceElementalCold = const Value.absent(),
    this.resistanceElementalPoison = const Value.absent(),
    this.resistancePhysical = const Value.absent(),
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
    this.adultChoiceId = const Value.absent(),
    this.resistanceMental = const Value.absent(),
    this.resistanceSpiritual = const Value.absent(),
    this.resistanceElementalHeat = const Value.absent(),
    this.resistanceElementalCold = const Value.absent(),
    this.resistanceElementalPoison = const Value.absent(),
    this.resistancePhysical = const Value.absent(),
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
    Expression<String>? adultChoiceId,
    Expression<int>? resistanceMental,
    Expression<int>? resistanceSpiritual,
    Expression<int>? resistanceElementalHeat,
    Expression<int>? resistanceElementalCold,
    Expression<int>? resistanceElementalPoison,
    Expression<int>? resistancePhysical,
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
      if (adultChoiceId != null) 'adult_choice_id': adultChoiceId,
      if (resistanceMental != null) 'resistance_mental': resistanceMental,
      if (resistanceSpiritual != null)
        'resistance_spiritual': resistanceSpiritual,
      if (resistanceElementalHeat != null)
        'resistance_elemental_heat': resistanceElementalHeat,
      if (resistanceElementalCold != null)
        'resistance_elemental_cold': resistanceElementalCold,
      if (resistanceElementalPoison != null)
        'resistance_elemental_poison': resistanceElementalPoison,
      if (resistancePhysical != null) 'resistance_physical': resistancePhysical,
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
    Value<String?>? adultChoiceId,
    Value<int>? resistanceMental,
    Value<int>? resistanceSpiritual,
    Value<int>? resistanceElementalHeat,
    Value<int>? resistanceElementalCold,
    Value<int>? resistanceElementalPoison,
    Value<int>? resistancePhysical,
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
      adultChoiceId: adultChoiceId ?? this.adultChoiceId,
      resistanceMental: resistanceMental ?? this.resistanceMental,
      resistanceSpiritual: resistanceSpiritual ?? this.resistanceSpiritual,
      resistanceElementalHeat:
          resistanceElementalHeat ?? this.resistanceElementalHeat,
      resistanceElementalCold:
          resistanceElementalCold ?? this.resistanceElementalCold,
      resistanceElementalPoison:
          resistanceElementalPoison ?? this.resistanceElementalPoison,
      resistancePhysical: resistancePhysical ?? this.resistancePhysical,
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
    if (adultChoiceId.present) {
      map['adult_choice_id'] = Variable<String>(adultChoiceId.value);
    }
    if (resistanceMental.present) {
      map['resistance_mental'] = Variable<int>(resistanceMental.value);
    }
    if (resistanceSpiritual.present) {
      map['resistance_spiritual'] = Variable<int>(resistanceSpiritual.value);
    }
    if (resistanceElementalHeat.present) {
      map['resistance_elemental_heat'] = Variable<int>(
        resistanceElementalHeat.value,
      );
    }
    if (resistanceElementalCold.present) {
      map['resistance_elemental_cold'] = Variable<int>(
        resistanceElementalCold.value,
      );
    }
    if (resistanceElementalPoison.present) {
      map['resistance_elemental_poison'] = Variable<int>(
        resistanceElementalPoison.value,
      );
    }
    if (resistancePhysical.present) {
      map['resistance_physical'] = Variable<int>(resistancePhysical.value);
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
          ..write('adultChoiceId: $adultChoiceId, ')
          ..write('resistanceMental: $resistanceMental, ')
          ..write('resistanceSpiritual: $resistanceSpiritual, ')
          ..write('resistanceElementalHeat: $resistanceElementalHeat, ')
          ..write('resistanceElementalCold: $resistanceElementalCold, ')
          ..write('resistanceElementalPoison: $resistanceElementalPoison, ')
          ..write('resistancePhysical: $resistancePhysical, ')
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
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  late final GeneratedColumnWithTypeConverter<AspectType?, String> aspectType =
      GeneratedColumn<String>(
        'aspect_type',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<AspectType?>($AbilitiesTable.$converteraspectTypen);
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
      characterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_id'],
      ),
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
      aspectType: $AbilitiesTable.$converteraspectTypen.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}aspect_type'],
        ),
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
  static TypeConverter<AspectType?, String?> $converteraspectTypen =
      NullAwareTypeConverter.wrap($converteraspectType);
}

class AbilityData extends DataClass implements Insertable<AbilityData> {
  final String id;
  final String? characterId;
  final String name;
  final String? description;
  final int manaCost;
  final int cooldown;
  final CharacterRank rankRequired;
  final AspectType? aspectType;
  const AbilityData({
    required this.id,
    this.characterId,
    required this.name,
    this.description,
    required this.manaCost,
    required this.cooldown,
    required this.rankRequired,
    this.aspectType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || characterId != null) {
      map['character_id'] = Variable<String>(characterId);
    }
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
    if (!nullToAbsent || aspectType != null) {
      map['aspect_type'] = Variable<String>(
        $AbilitiesTable.$converteraspectTypen.toSql(aspectType),
      );
    }
    return map;
  }

  AbilitiesCompanion toCompanion(bool nullToAbsent) {
    return AbilitiesCompanion(
      id: Value(id),
      characterId:
          characterId == null && nullToAbsent
              ? const Value.absent()
              : Value(characterId),
      name: Value(name),
      description:
          description == null && nullToAbsent
              ? const Value.absent()
              : Value(description),
      manaCost: Value(manaCost),
      cooldown: Value(cooldown),
      rankRequired: Value(rankRequired),
      aspectType:
          aspectType == null && nullToAbsent
              ? const Value.absent()
              : Value(aspectType),
    );
  }

  factory AbilityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AbilityData(
      id: serializer.fromJson<String>(json['id']),
      characterId: serializer.fromJson<String?>(json['characterId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      manaCost: serializer.fromJson<int>(json['manaCost']),
      cooldown: serializer.fromJson<int>(json['cooldown']),
      rankRequired: serializer.fromJson<CharacterRank>(json['rankRequired']),
      aspectType: serializer.fromJson<AspectType?>(json['aspectType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'characterId': serializer.toJson<String?>(characterId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'manaCost': serializer.toJson<int>(manaCost),
      'cooldown': serializer.toJson<int>(cooldown),
      'rankRequired': serializer.toJson<CharacterRank>(rankRequired),
      'aspectType': serializer.toJson<AspectType?>(aspectType),
    };
  }

  AbilityData copyWith({
    String? id,
    Value<String?> characterId = const Value.absent(),
    String? name,
    Value<String?> description = const Value.absent(),
    int? manaCost,
    int? cooldown,
    CharacterRank? rankRequired,
    Value<AspectType?> aspectType = const Value.absent(),
  }) => AbilityData(
    id: id ?? this.id,
    characterId: characterId.present ? characterId.value : this.characterId,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    manaCost: manaCost ?? this.manaCost,
    cooldown: cooldown ?? this.cooldown,
    rankRequired: rankRequired ?? this.rankRequired,
    aspectType: aspectType.present ? aspectType.value : this.aspectType,
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
  final Value<String?> characterId;
  final Value<String> name;
  final Value<String?> description;
  final Value<int> manaCost;
  final Value<int> cooldown;
  final Value<CharacterRank> rankRequired;
  final Value<AspectType?> aspectType;
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
    this.characterId = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.manaCost = const Value.absent(),
    this.cooldown = const Value.absent(),
    required CharacterRank rankRequired,
    this.aspectType = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       rankRequired = Value(rankRequired);
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
    Value<String?>? characterId,
    Value<String>? name,
    Value<String?>? description,
    Value<int>? manaCost,
    Value<int>? cooldown,
    Value<CharacterRank>? rankRequired,
    Value<AspectType?>? aspectType,
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
        $AbilitiesTable.$converteraspectTypen.toSql(aspectType.value),
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

class $PowersTable extends Powers with TableInfo<$PowersTable, PowerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PowersTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _sourceTypeMeta = const VerificationMeta(
    'sourceType',
  );
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
    'source_type',
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
  late final GeneratedColumnWithTypeConverter<CharacterRank?, String>
  rankRequired = GeneratedColumn<String>(
    'rank_required',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<CharacterRank?>($PowersTable.$converterrankRequiredn);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    sourceType,
    manaCost,
    cooldown,
    rankRequired,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'powers';
  @override
  VerificationContext validateIntegrity(
    Insertable<PowerData> instance, {
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
    if (data.containsKey('source_type')) {
      context.handle(
        _sourceTypeMeta,
        sourceType.isAcceptableOrUnknown(data['source_type']!, _sourceTypeMeta),
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
  PowerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PowerData(
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
      sourceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_type'],
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
      rankRequired: $PowersTable.$converterrankRequiredn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}rank_required'],
        ),
      ),
    );
  }

  @override
  $PowersTable createAlias(String alias) {
    return $PowersTable(attachedDatabase, alias);
  }

  static TypeConverter<CharacterRank, String> $converterrankRequired =
      const CharacterRankConverter();
  static TypeConverter<CharacterRank?, String?> $converterrankRequiredn =
      NullAwareTypeConverter.wrap($converterrankRequired);
}

class PowerData extends DataClass implements Insertable<PowerData> {
  final String id;
  final String name;
  final String? description;
  final String? sourceType;
  final int manaCost;
  final int cooldown;
  final CharacterRank? rankRequired;
  const PowerData({
    required this.id,
    required this.name,
    this.description,
    this.sourceType,
    required this.manaCost,
    required this.cooldown,
    this.rankRequired,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || sourceType != null) {
      map['source_type'] = Variable<String>(sourceType);
    }
    map['mana_cost'] = Variable<int>(manaCost);
    map['cooldown'] = Variable<int>(cooldown);
    if (!nullToAbsent || rankRequired != null) {
      map['rank_required'] = Variable<String>(
        $PowersTable.$converterrankRequiredn.toSql(rankRequired),
      );
    }
    return map;
  }

  PowersCompanion toCompanion(bool nullToAbsent) {
    return PowersCompanion(
      id: Value(id),
      name: Value(name),
      description:
          description == null && nullToAbsent
              ? const Value.absent()
              : Value(description),
      sourceType:
          sourceType == null && nullToAbsent
              ? const Value.absent()
              : Value(sourceType),
      manaCost: Value(manaCost),
      cooldown: Value(cooldown),
      rankRequired:
          rankRequired == null && nullToAbsent
              ? const Value.absent()
              : Value(rankRequired),
    );
  }

  factory PowerData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PowerData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      sourceType: serializer.fromJson<String?>(json['sourceType']),
      manaCost: serializer.fromJson<int>(json['manaCost']),
      cooldown: serializer.fromJson<int>(json['cooldown']),
      rankRequired: serializer.fromJson<CharacterRank?>(json['rankRequired']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'sourceType': serializer.toJson<String?>(sourceType),
      'manaCost': serializer.toJson<int>(manaCost),
      'cooldown': serializer.toJson<int>(cooldown),
      'rankRequired': serializer.toJson<CharacterRank?>(rankRequired),
    };
  }

  PowerData copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> sourceType = const Value.absent(),
    int? manaCost,
    int? cooldown,
    Value<CharacterRank?> rankRequired = const Value.absent(),
  }) => PowerData(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    sourceType: sourceType.present ? sourceType.value : this.sourceType,
    manaCost: manaCost ?? this.manaCost,
    cooldown: cooldown ?? this.cooldown,
    rankRequired: rankRequired.present ? rankRequired.value : this.rankRequired,
  );
  PowerData copyWithCompanion(PowersCompanion data) {
    return PowerData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      sourceType:
          data.sourceType.present ? data.sourceType.value : this.sourceType,
      manaCost: data.manaCost.present ? data.manaCost.value : this.manaCost,
      cooldown: data.cooldown.present ? data.cooldown.value : this.cooldown,
      rankRequired:
          data.rankRequired.present
              ? data.rankRequired.value
              : this.rankRequired,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PowerData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('sourceType: $sourceType, ')
          ..write('manaCost: $manaCost, ')
          ..write('cooldown: $cooldown, ')
          ..write('rankRequired: $rankRequired')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    sourceType,
    manaCost,
    cooldown,
    rankRequired,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PowerData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.sourceType == this.sourceType &&
          other.manaCost == this.manaCost &&
          other.cooldown == this.cooldown &&
          other.rankRequired == this.rankRequired);
}

class PowersCompanion extends UpdateCompanion<PowerData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> sourceType;
  final Value<int> manaCost;
  final Value<int> cooldown;
  final Value<CharacterRank?> rankRequired;
  final Value<int> rowid;
  const PowersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.manaCost = const Value.absent(),
    this.cooldown = const Value.absent(),
    this.rankRequired = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PowersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.manaCost = const Value.absent(),
    this.cooldown = const Value.absent(),
    this.rankRequired = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<PowerData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? sourceType,
    Expression<int>? manaCost,
    Expression<int>? cooldown,
    Expression<String>? rankRequired,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (sourceType != null) 'source_type': sourceType,
      if (manaCost != null) 'mana_cost': manaCost,
      if (cooldown != null) 'cooldown': cooldown,
      if (rankRequired != null) 'rank_required': rankRequired,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PowersCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? sourceType,
    Value<int>? manaCost,
    Value<int>? cooldown,
    Value<CharacterRank?>? rankRequired,
    Value<int>? rowid,
  }) {
    return PowersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      sourceType: sourceType ?? this.sourceType,
      manaCost: manaCost ?? this.manaCost,
      cooldown: cooldown ?? this.cooldown,
      rankRequired: rankRequired ?? this.rankRequired,
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
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (manaCost.present) {
      map['mana_cost'] = Variable<int>(manaCost.value);
    }
    if (cooldown.present) {
      map['cooldown'] = Variable<int>(cooldown.value);
    }
    if (rankRequired.present) {
      map['rank_required'] = Variable<String>(
        $PowersTable.$converterrankRequiredn.toSql(rankRequired.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PowersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('sourceType: $sourceType, ')
          ..write('manaCost: $manaCost, ')
          ..write('cooldown: $cooldown, ')
          ..write('rankRequired: $rankRequired, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CharacterPowersTable extends CharacterPowers
    with TableInfo<$CharacterPowersTable, CharacterPowerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterPowersTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _powerIdMeta = const VerificationMeta(
    'powerId',
  );
  @override
  late final GeneratedColumn<String> powerId = GeneratedColumn<String>(
    'power_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES powers (id)',
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
  List<GeneratedColumn> get $columns => [characterId, powerId, isEquipped];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_powers';
  @override
  VerificationContext validateIntegrity(
    Insertable<CharacterPowerData> instance, {
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
    if (data.containsKey('power_id')) {
      context.handle(
        _powerIdMeta,
        powerId.isAcceptableOrUnknown(data['power_id']!, _powerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_powerIdMeta);
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
  Set<GeneratedColumn> get $primaryKey => {characterId, powerId};
  @override
  CharacterPowerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterPowerData(
      characterId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}character_id'],
          )!,
      powerId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}power_id'],
          )!,
      isEquipped:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_equipped'],
          )!,
    );
  }

  @override
  $CharacterPowersTable createAlias(String alias) {
    return $CharacterPowersTable(attachedDatabase, alias);
  }
}

class CharacterPowerData extends DataClass
    implements Insertable<CharacterPowerData> {
  final String characterId;
  final String powerId;
  final bool isEquipped;
  const CharacterPowerData({
    required this.characterId,
    required this.powerId,
    required this.isEquipped,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['character_id'] = Variable<String>(characterId);
    map['power_id'] = Variable<String>(powerId);
    map['is_equipped'] = Variable<bool>(isEquipped);
    return map;
  }

  CharacterPowersCompanion toCompanion(bool nullToAbsent) {
    return CharacterPowersCompanion(
      characterId: Value(characterId),
      powerId: Value(powerId),
      isEquipped: Value(isEquipped),
    );
  }

  factory CharacterPowerData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterPowerData(
      characterId: serializer.fromJson<String>(json['characterId']),
      powerId: serializer.fromJson<String>(json['powerId']),
      isEquipped: serializer.fromJson<bool>(json['isEquipped']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'characterId': serializer.toJson<String>(characterId),
      'powerId': serializer.toJson<String>(powerId),
      'isEquipped': serializer.toJson<bool>(isEquipped),
    };
  }

  CharacterPowerData copyWith({
    String? characterId,
    String? powerId,
    bool? isEquipped,
  }) => CharacterPowerData(
    characterId: characterId ?? this.characterId,
    powerId: powerId ?? this.powerId,
    isEquipped: isEquipped ?? this.isEquipped,
  );
  CharacterPowerData copyWithCompanion(CharacterPowersCompanion data) {
    return CharacterPowerData(
      characterId:
          data.characterId.present ? data.characterId.value : this.characterId,
      powerId: data.powerId.present ? data.powerId.value : this.powerId,
      isEquipped:
          data.isEquipped.present ? data.isEquipped.value : this.isEquipped,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterPowerData(')
          ..write('characterId: $characterId, ')
          ..write('powerId: $powerId, ')
          ..write('isEquipped: $isEquipped')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(characterId, powerId, isEquipped);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterPowerData &&
          other.characterId == this.characterId &&
          other.powerId == this.powerId &&
          other.isEquipped == this.isEquipped);
}

class CharacterPowersCompanion extends UpdateCompanion<CharacterPowerData> {
  final Value<String> characterId;
  final Value<String> powerId;
  final Value<bool> isEquipped;
  final Value<int> rowid;
  const CharacterPowersCompanion({
    this.characterId = const Value.absent(),
    this.powerId = const Value.absent(),
    this.isEquipped = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharacterPowersCompanion.insert({
    required String characterId,
    required String powerId,
    this.isEquipped = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : characterId = Value(characterId),
       powerId = Value(powerId);
  static Insertable<CharacterPowerData> custom({
    Expression<String>? characterId,
    Expression<String>? powerId,
    Expression<bool>? isEquipped,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (characterId != null) 'character_id': characterId,
      if (powerId != null) 'power_id': powerId,
      if (isEquipped != null) 'is_equipped': isEquipped,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharacterPowersCompanion copyWith({
    Value<String>? characterId,
    Value<String>? powerId,
    Value<bool>? isEquipped,
    Value<int>? rowid,
  }) {
    return CharacterPowersCompanion(
      characterId: characterId ?? this.characterId,
      powerId: powerId ?? this.powerId,
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
    if (powerId.present) {
      map['power_id'] = Variable<String>(powerId.value);
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
    return (StringBuffer('CharacterPowersCompanion(')
          ..write('characterId: $characterId, ')
          ..write('powerId: $powerId, ')
          ..write('isEquipped: $isEquipped, ')
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
  late final $AdultChoicesTable adultChoices = $AdultChoicesTable(this);
  late final $CharactersTable characters = $CharactersTable(this);
  late final $AbilitiesTable abilities = $AbilitiesTable(this);
  late final $MemoriesTable memories = $MemoriesTable(this);
  late final $CharacterMemoriesTable characterMemories =
      $CharacterMemoriesTable(this);
  late final $CharacterTraitsTable characterTraits = $CharacterTraitsTable(
    this,
  );
  late final $PowersTable powers = $PowersTable(this);
  late final $CharacterPowersTable characterPowers = $CharacterPowersTable(
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
    adultChoices,
    characters,
    abilities,
    memories,
    characterMemories,
    characterTraits,
    powers,
    characterPowers,
  ];
}

typedef $$TraitsTableCreateCompanionBuilder =
    TraitsCompanion Function({
      Value<String> id,
      required String name,
      Value<String?> description,
      Value<bool> isStrength,
      Value<bool> isWeakness,
      Value<int> rowid,
    });
typedef $$TraitsTableUpdateCompanionBuilder =
    TraitsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<bool> isStrength,
      Value<bool> isWeakness,
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

  static MultiTypedResultKey<$AdultChoicesTable, List<AdultChoiceData>>
  _adultChoicesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.adultChoices,
    aliasName: $_aliasNameGenerator(db.traits.id, db.adultChoices.traitId),
  );

  $$AdultChoicesTableProcessedTableManager get adultChoicesRefs {
    final manager = $$AdultChoicesTableTableManager(
      $_db,
      $_db.adultChoices,
    ).filter((f) => f.traitId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_adultChoicesRefsTable($_db));
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

  ColumnFilters<bool> get isStrength => $composableBuilder(
    column: $table.isStrength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isWeakness => $composableBuilder(
    column: $table.isWeakness,
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

  Expression<bool> adultChoicesRefs(
    Expression<bool> Function($$AdultChoicesTableFilterComposer f) f,
  ) {
    final $$AdultChoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.adultChoices,
      getReferencedColumn: (t) => t.traitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdultChoicesTableFilterComposer(
            $db: $db,
            $table: $db.adultChoices,
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

  ColumnOrderings<bool> get isStrength => $composableBuilder(
    column: $table.isStrength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isWeakness => $composableBuilder(
    column: $table.isWeakness,
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

  GeneratedColumn<bool> get isStrength => $composableBuilder(
    column: $table.isStrength,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isWeakness => $composableBuilder(
    column: $table.isWeakness,
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

  Expression<T> adultChoicesRefs<T extends Object>(
    Expression<T> Function($$AdultChoicesTableAnnotationComposer a) f,
  ) {
    final $$AdultChoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.adultChoices,
      getReferencedColumn: (t) => t.traitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdultChoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.adultChoices,
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
            bool adultChoicesRefs,
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
                Value<bool> isStrength = const Value.absent(),
                Value<bool> isWeakness = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TraitsCompanion(
                id: id,
                name: name,
                description: description,
                isStrength: isStrength,
                isWeakness: isWeakness,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<bool> isStrength = const Value.absent(),
                Value<bool> isWeakness = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TraitsCompanion.insert(
                id: id,
                name: name,
                description: description,
                isStrength: isStrength,
                isWeakness: isWeakness,
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
            adultChoicesRefs = false,
            characterTraitsRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (childhoodChoicesRefs) db.childhoodChoices,
                if (majorEventChoicesRefs) db.majorEventChoices,
                if (adultChoicesRefs) db.adultChoices,
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
                  if (adultChoicesRefs)
                    await $_getPrefetchedData<
                      TraitData,
                      $TraitsTable,
                      AdultChoiceData
                    >(
                      currentTable: table,
                      referencedTable: $$TraitsTableReferences
                          ._adultChoicesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$TraitsTableReferences(
                                db,
                                table,
                                p0,
                              ).adultChoicesRefs,
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
        bool adultChoicesRefs,
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
typedef $$AdultChoicesTableCreateCompanionBuilder =
    AdultChoicesCompanion Function({
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
typedef $$AdultChoicesTableUpdateCompanionBuilder =
    AdultChoicesCompanion Function({
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

final class $$AdultChoicesTableReferences
    extends BaseReferences<_$AppDatabase, $AdultChoicesTable, AdultChoiceData> {
  $$AdultChoicesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TraitsTable _traitIdTable(_$AppDatabase db) => db.traits.createAlias(
    $_aliasNameGenerator(db.adultChoices.traitId, db.traits.id),
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
      db.adultChoices.id,
      db.characters.adultChoiceId,
    ),
  );

  $$CharactersTableProcessedTableManager get charactersRefs {
    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.adultChoiceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_charactersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AdultChoicesTableFilterComposer
    extends Composer<_$AppDatabase, $AdultChoicesTable> {
  $$AdultChoicesTableFilterComposer({
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
      getReferencedColumn: (t) => t.adultChoiceId,
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

class $$AdultChoicesTableOrderingComposer
    extends Composer<_$AppDatabase, $AdultChoicesTable> {
  $$AdultChoicesTableOrderingComposer({
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

class $$AdultChoicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AdultChoicesTable> {
  $$AdultChoicesTableAnnotationComposer({
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
      getReferencedColumn: (t) => t.adultChoiceId,
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

class $$AdultChoicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AdultChoicesTable,
          AdultChoiceData,
          $$AdultChoicesTableFilterComposer,
          $$AdultChoicesTableOrderingComposer,
          $$AdultChoicesTableAnnotationComposer,
          $$AdultChoicesTableCreateCompanionBuilder,
          $$AdultChoicesTableUpdateCompanionBuilder,
          (AdultChoiceData, $$AdultChoicesTableReferences),
          AdultChoiceData,
          PrefetchHooks Function({bool traitId, bool charactersRefs})
        > {
  $$AdultChoicesTableTableManager(_$AppDatabase db, $AdultChoicesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$AdultChoicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$AdultChoicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$AdultChoicesTableAnnotationComposer($db: db, $table: table),
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
              }) => AdultChoicesCompanion(
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
              }) => AdultChoicesCompanion.insert(
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
                          $$AdultChoicesTableReferences(db, table, e),
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
                            referencedTable: $$AdultChoicesTableReferences
                                ._traitIdTable(db),
                            referencedColumn:
                                $$AdultChoicesTableReferences
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
                      AdultChoiceData,
                      $AdultChoicesTable,
                      CharacterData
                    >(
                      currentTable: table,
                      referencedTable: $$AdultChoicesTableReferences
                          ._charactersRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$AdultChoicesTableReferences(
                                db,
                                table,
                                p0,
                              ).charactersRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.adultChoiceId == item.id,
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

typedef $$AdultChoicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AdultChoicesTable,
      AdultChoiceData,
      $$AdultChoicesTableFilterComposer,
      $$AdultChoicesTableOrderingComposer,
      $$AdultChoicesTableAnnotationComposer,
      $$AdultChoicesTableCreateCompanionBuilder,
      $$AdultChoicesTableUpdateCompanionBuilder,
      (AdultChoiceData, $$AdultChoicesTableReferences),
      AdultChoiceData,
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
      Value<String?> adultChoiceId,
      Value<int> resistanceMental,
      Value<int> resistanceSpiritual,
      Value<int> resistanceElementalHeat,
      Value<int> resistanceElementalCold,
      Value<int> resistanceElementalPoison,
      Value<int> resistancePhysical,
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
      Value<String?> adultChoiceId,
      Value<int> resistanceMental,
      Value<int> resistanceSpiritual,
      Value<int> resistanceElementalHeat,
      Value<int> resistanceElementalCold,
      Value<int> resistanceElementalPoison,
      Value<int> resistancePhysical,
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

  static $AdultChoicesTable _adultChoiceIdTable(_$AppDatabase db) =>
      db.adultChoices.createAlias(
        $_aliasNameGenerator(db.characters.adultChoiceId, db.adultChoices.id),
      );

  $$AdultChoicesTableProcessedTableManager? get adultChoiceId {
    final $_column = $_itemColumn<String>('adult_choice_id');
    if ($_column == null) return null;
    final manager = $$AdultChoicesTableTableManager(
      $_db,
      $_db.adultChoices,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_adultChoiceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
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

  static MultiTypedResultKey<$CharacterPowersTable, List<CharacterPowerData>>
  _characterPowersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.characterPowers,
    aliasName: $_aliasNameGenerator(
      db.characters.id,
      db.characterPowers.characterId,
    ),
  );

  $$CharacterPowersTableProcessedTableManager get characterPowersRefs {
    final manager = $$CharacterPowersTableTableManager(
      $_db,
      $_db.characterPowers,
    ).filter((f) => f.characterId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _characterPowersRefsTable($_db),
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

  ColumnFilters<int> get resistanceMental => $composableBuilder(
    column: $table.resistanceMental,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get resistanceSpiritual => $composableBuilder(
    column: $table.resistanceSpiritual,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get resistanceElementalHeat => $composableBuilder(
    column: $table.resistanceElementalHeat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get resistanceElementalCold => $composableBuilder(
    column: $table.resistanceElementalCold,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get resistanceElementalPoison => $composableBuilder(
    column: $table.resistanceElementalPoison,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get resistancePhysical => $composableBuilder(
    column: $table.resistancePhysical,
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

  $$AdultChoicesTableFilterComposer get adultChoiceId {
    final $$AdultChoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.adultChoiceId,
      referencedTable: $db.adultChoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdultChoicesTableFilterComposer(
            $db: $db,
            $table: $db.adultChoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
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

  Expression<bool> characterPowersRefs(
    Expression<bool> Function($$CharacterPowersTableFilterComposer f) f,
  ) {
    final $$CharacterPowersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterPowers,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterPowersTableFilterComposer(
            $db: $db,
            $table: $db.characterPowers,
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

  ColumnOrderings<int> get resistanceMental => $composableBuilder(
    column: $table.resistanceMental,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get resistanceSpiritual => $composableBuilder(
    column: $table.resistanceSpiritual,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get resistanceElementalHeat => $composableBuilder(
    column: $table.resistanceElementalHeat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get resistanceElementalCold => $composableBuilder(
    column: $table.resistanceElementalCold,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get resistanceElementalPoison => $composableBuilder(
    column: $table.resistanceElementalPoison,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get resistancePhysical => $composableBuilder(
    column: $table.resistancePhysical,
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

  $$AdultChoicesTableOrderingComposer get adultChoiceId {
    final $$AdultChoicesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.adultChoiceId,
      referencedTable: $db.adultChoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdultChoicesTableOrderingComposer(
            $db: $db,
            $table: $db.adultChoices,
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

  GeneratedColumn<int> get resistanceMental => $composableBuilder(
    column: $table.resistanceMental,
    builder: (column) => column,
  );

  GeneratedColumn<int> get resistanceSpiritual => $composableBuilder(
    column: $table.resistanceSpiritual,
    builder: (column) => column,
  );

  GeneratedColumn<int> get resistanceElementalHeat => $composableBuilder(
    column: $table.resistanceElementalHeat,
    builder: (column) => column,
  );

  GeneratedColumn<int> get resistanceElementalCold => $composableBuilder(
    column: $table.resistanceElementalCold,
    builder: (column) => column,
  );

  GeneratedColumn<int> get resistanceElementalPoison => $composableBuilder(
    column: $table.resistanceElementalPoison,
    builder: (column) => column,
  );

  GeneratedColumn<int> get resistancePhysical => $composableBuilder(
    column: $table.resistancePhysical,
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

  $$AdultChoicesTableAnnotationComposer get adultChoiceId {
    final $$AdultChoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.adultChoiceId,
      referencedTable: $db.adultChoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdultChoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.adultChoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
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

  Expression<T> characterPowersRefs<T extends Object>(
    Expression<T> Function($$CharacterPowersTableAnnotationComposer a) f,
  ) {
    final $$CharacterPowersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterPowers,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterPowersTableAnnotationComposer(
            $db: $db,
            $table: $db.characterPowers,
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
            bool adultChoiceId,
            bool characterMemoriesRefs,
            bool characterTraitsRefs,
            bool characterPowersRefs,
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
                Value<String?> adultChoiceId = const Value.absent(),
                Value<int> resistanceMental = const Value.absent(),
                Value<int> resistanceSpiritual = const Value.absent(),
                Value<int> resistanceElementalHeat = const Value.absent(),
                Value<int> resistanceElementalCold = const Value.absent(),
                Value<int> resistanceElementalPoison = const Value.absent(),
                Value<int> resistancePhysical = const Value.absent(),
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
                adultChoiceId: adultChoiceId,
                resistanceMental: resistanceMental,
                resistanceSpiritual: resistanceSpiritual,
                resistanceElementalHeat: resistanceElementalHeat,
                resistanceElementalCold: resistanceElementalCold,
                resistanceElementalPoison: resistanceElementalPoison,
                resistancePhysical: resistancePhysical,
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
                Value<String?> adultChoiceId = const Value.absent(),
                Value<int> resistanceMental = const Value.absent(),
                Value<int> resistanceSpiritual = const Value.absent(),
                Value<int> resistanceElementalHeat = const Value.absent(),
                Value<int> resistanceElementalCold = const Value.absent(),
                Value<int> resistanceElementalPoison = const Value.absent(),
                Value<int> resistancePhysical = const Value.absent(),
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
                adultChoiceId: adultChoiceId,
                resistanceMental: resistanceMental,
                resistanceSpiritual: resistanceSpiritual,
                resistanceElementalHeat: resistanceElementalHeat,
                resistanceElementalCold: resistanceElementalCold,
                resistanceElementalPoison: resistanceElementalPoison,
                resistancePhysical: resistancePhysical,
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
            adultChoiceId = false,
            characterMemoriesRefs = false,
            characterTraitsRefs = false,
            characterPowersRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (characterMemoriesRefs) db.characterMemories,
                if (characterTraitsRefs) db.characterTraits,
                if (characterPowersRefs) db.characterPowers,
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
                if (adultChoiceId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.adultChoiceId,
                            referencedTable: $$CharactersTableReferences
                                ._adultChoiceIdTable(db),
                            referencedColumn:
                                $$CharactersTableReferences
                                    ._adultChoiceIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
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
                  if (characterPowersRefs)
                    await $_getPrefetchedData<
                      CharacterData,
                      $CharactersTable,
                      CharacterPowerData
                    >(
                      currentTable: table,
                      referencedTable: $$CharactersTableReferences
                          ._characterPowersRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CharactersTableReferences(
                                db,
                                table,
                                p0,
                              ).characterPowersRefs,
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
        bool adultChoiceId,
        bool characterMemoriesRefs,
        bool characterTraitsRefs,
        bool characterPowersRefs,
      })
    >;
typedef $$AbilitiesTableCreateCompanionBuilder =
    AbilitiesCompanion Function({
      Value<String> id,
      Value<String?> characterId,
      required String name,
      Value<String?> description,
      Value<int> manaCost,
      Value<int> cooldown,
      required CharacterRank rankRequired,
      Value<AspectType?> aspectType,
      Value<int> rowid,
    });
typedef $$AbilitiesTableUpdateCompanionBuilder =
    AbilitiesCompanion Function({
      Value<String> id,
      Value<String?> characterId,
      Value<String> name,
      Value<String?> description,
      Value<int> manaCost,
      Value<int> cooldown,
      Value<CharacterRank> rankRequired,
      Value<AspectType?> aspectType,
      Value<int> rowid,
    });

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

  ColumnFilters<String> get characterId => $composableBuilder(
    column: $table.characterId,
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

  ColumnWithTypeConverterFilters<AspectType?, AspectType, String>
  get aspectType => $composableBuilder(
    column: $table.aspectType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
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

  ColumnOrderings<String> get characterId => $composableBuilder(
    column: $table.characterId,
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

  GeneratedColumn<String> get characterId => $composableBuilder(
    column: $table.characterId,
    builder: (column) => column,
  );

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

  GeneratedColumnWithTypeConverter<AspectType?, String> get aspectType =>
      $composableBuilder(
        column: $table.aspectType,
        builder: (column) => column,
      );
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
          (
            AbilityData,
            BaseReferences<_$AppDatabase, $AbilitiesTable, AbilityData>,
          ),
          AbilityData,
          PrefetchHooks Function()
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
                Value<String?> characterId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> manaCost = const Value.absent(),
                Value<int> cooldown = const Value.absent(),
                Value<CharacterRank> rankRequired = const Value.absent(),
                Value<AspectType?> aspectType = const Value.absent(),
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
                Value<String?> characterId = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<int> manaCost = const Value.absent(),
                Value<int> cooldown = const Value.absent(),
                required CharacterRank rankRequired,
                Value<AspectType?> aspectType = const Value.absent(),
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
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
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
      (
        AbilityData,
        BaseReferences<_$AppDatabase, $AbilitiesTable, AbilityData>,
      ),
      AbilityData,
      PrefetchHooks Function()
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
typedef $$PowersTableCreateCompanionBuilder =
    PowersCompanion Function({
      Value<String> id,
      required String name,
      Value<String?> description,
      Value<String?> sourceType,
      Value<int> manaCost,
      Value<int> cooldown,
      Value<CharacterRank?> rankRequired,
      Value<int> rowid,
    });
typedef $$PowersTableUpdateCompanionBuilder =
    PowersCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<String?> sourceType,
      Value<int> manaCost,
      Value<int> cooldown,
      Value<CharacterRank?> rankRequired,
      Value<int> rowid,
    });

final class $$PowersTableReferences
    extends BaseReferences<_$AppDatabase, $PowersTable, PowerData> {
  $$PowersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CharacterPowersTable, List<CharacterPowerData>>
  _characterPowersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.characterPowers,
    aliasName: $_aliasNameGenerator(db.powers.id, db.characterPowers.powerId),
  );

  $$CharacterPowersTableProcessedTableManager get characterPowersRefs {
    final manager = $$CharacterPowersTableTableManager(
      $_db,
      $_db.characterPowers,
    ).filter((f) => f.powerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _characterPowersRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PowersTableFilterComposer
    extends Composer<_$AppDatabase, $PowersTable> {
  $$PowersTableFilterComposer({
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

  ColumnFilters<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
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

  ColumnWithTypeConverterFilters<CharacterRank?, CharacterRank, String>
  get rankRequired => $composableBuilder(
    column: $table.rankRequired,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  Expression<bool> characterPowersRefs(
    Expression<bool> Function($$CharacterPowersTableFilterComposer f) f,
  ) {
    final $$CharacterPowersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterPowers,
      getReferencedColumn: (t) => t.powerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterPowersTableFilterComposer(
            $db: $db,
            $table: $db.characterPowers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PowersTableOrderingComposer
    extends Composer<_$AppDatabase, $PowersTable> {
  $$PowersTableOrderingComposer({
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

  ColumnOrderings<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
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
}

class $$PowersTableAnnotationComposer
    extends Composer<_$AppDatabase, $PowersTable> {
  $$PowersTableAnnotationComposer({
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

  GeneratedColumn<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get manaCost =>
      $composableBuilder(column: $table.manaCost, builder: (column) => column);

  GeneratedColumn<int> get cooldown =>
      $composableBuilder(column: $table.cooldown, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CharacterRank?, String> get rankRequired =>
      $composableBuilder(
        column: $table.rankRequired,
        builder: (column) => column,
      );

  Expression<T> characterPowersRefs<T extends Object>(
    Expression<T> Function($$CharacterPowersTableAnnotationComposer a) f,
  ) {
    final $$CharacterPowersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterPowers,
      getReferencedColumn: (t) => t.powerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterPowersTableAnnotationComposer(
            $db: $db,
            $table: $db.characterPowers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PowersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PowersTable,
          PowerData,
          $$PowersTableFilterComposer,
          $$PowersTableOrderingComposer,
          $$PowersTableAnnotationComposer,
          $$PowersTableCreateCompanionBuilder,
          $$PowersTableUpdateCompanionBuilder,
          (PowerData, $$PowersTableReferences),
          PowerData,
          PrefetchHooks Function({bool characterPowersRefs})
        > {
  $$PowersTableTableManager(_$AppDatabase db, $PowersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PowersTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$PowersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$PowersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> sourceType = const Value.absent(),
                Value<int> manaCost = const Value.absent(),
                Value<int> cooldown = const Value.absent(),
                Value<CharacterRank?> rankRequired = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PowersCompanion(
                id: id,
                name: name,
                description: description,
                sourceType: sourceType,
                manaCost: manaCost,
                cooldown: cooldown,
                rankRequired: rankRequired,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> sourceType = const Value.absent(),
                Value<int> manaCost = const Value.absent(),
                Value<int> cooldown = const Value.absent(),
                Value<CharacterRank?> rankRequired = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PowersCompanion.insert(
                id: id,
                name: name,
                description: description,
                sourceType: sourceType,
                manaCost: manaCost,
                cooldown: cooldown,
                rankRequired: rankRequired,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$PowersTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({characterPowersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (characterPowersRefs) db.characterPowers,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (characterPowersRefs)
                    await $_getPrefetchedData<
                      PowerData,
                      $PowersTable,
                      CharacterPowerData
                    >(
                      currentTable: table,
                      referencedTable: $$PowersTableReferences
                          ._characterPowersRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$PowersTableReferences(
                                db,
                                table,
                                p0,
                              ).characterPowersRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.powerId == item.id,
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

typedef $$PowersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PowersTable,
      PowerData,
      $$PowersTableFilterComposer,
      $$PowersTableOrderingComposer,
      $$PowersTableAnnotationComposer,
      $$PowersTableCreateCompanionBuilder,
      $$PowersTableUpdateCompanionBuilder,
      (PowerData, $$PowersTableReferences),
      PowerData,
      PrefetchHooks Function({bool characterPowersRefs})
    >;
typedef $$CharacterPowersTableCreateCompanionBuilder =
    CharacterPowersCompanion Function({
      required String characterId,
      required String powerId,
      Value<bool> isEquipped,
      Value<int> rowid,
    });
typedef $$CharacterPowersTableUpdateCompanionBuilder =
    CharacterPowersCompanion Function({
      Value<String> characterId,
      Value<String> powerId,
      Value<bool> isEquipped,
      Value<int> rowid,
    });

final class $$CharacterPowersTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CharacterPowersTable,
          CharacterPowerData
        > {
  $$CharacterPowersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CharactersTable _characterIdTable(_$AppDatabase db) =>
      db.characters.createAlias(
        $_aliasNameGenerator(db.characterPowers.characterId, db.characters.id),
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

  static $PowersTable _powerIdTable(_$AppDatabase db) => db.powers.createAlias(
    $_aliasNameGenerator(db.characterPowers.powerId, db.powers.id),
  );

  $$PowersTableProcessedTableManager get powerId {
    final $_column = $_itemColumn<String>('power_id')!;

    final manager = $$PowersTableTableManager(
      $_db,
      $_db.powers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_powerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CharacterPowersTableFilterComposer
    extends Composer<_$AppDatabase, $CharacterPowersTable> {
  $$CharacterPowersTableFilterComposer({
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

  $$PowersTableFilterComposer get powerId {
    final $$PowersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.powerId,
      referencedTable: $db.powers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PowersTableFilterComposer(
            $db: $db,
            $table: $db.powers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterPowersTableOrderingComposer
    extends Composer<_$AppDatabase, $CharacterPowersTable> {
  $$CharacterPowersTableOrderingComposer({
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

  $$PowersTableOrderingComposer get powerId {
    final $$PowersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.powerId,
      referencedTable: $db.powers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PowersTableOrderingComposer(
            $db: $db,
            $table: $db.powers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterPowersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharacterPowersTable> {
  $$CharacterPowersTableAnnotationComposer({
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

  $$PowersTableAnnotationComposer get powerId {
    final $$PowersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.powerId,
      referencedTable: $db.powers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PowersTableAnnotationComposer(
            $db: $db,
            $table: $db.powers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterPowersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CharacterPowersTable,
          CharacterPowerData,
          $$CharacterPowersTableFilterComposer,
          $$CharacterPowersTableOrderingComposer,
          $$CharacterPowersTableAnnotationComposer,
          $$CharacterPowersTableCreateCompanionBuilder,
          $$CharacterPowersTableUpdateCompanionBuilder,
          (CharacterPowerData, $$CharacterPowersTableReferences),
          CharacterPowerData,
          PrefetchHooks Function({bool characterId, bool powerId})
        > {
  $$CharacterPowersTableTableManager(
    _$AppDatabase db,
    $CharacterPowersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$CharacterPowersTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CharacterPowersTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$CharacterPowersTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> characterId = const Value.absent(),
                Value<String> powerId = const Value.absent(),
                Value<bool> isEquipped = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterPowersCompanion(
                characterId: characterId,
                powerId: powerId,
                isEquipped: isEquipped,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String characterId,
                required String powerId,
                Value<bool> isEquipped = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterPowersCompanion.insert(
                characterId: characterId,
                powerId: powerId,
                isEquipped: isEquipped,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CharacterPowersTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({characterId = false, powerId = false}) {
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
                            referencedTable: $$CharacterPowersTableReferences
                                ._characterIdTable(db),
                            referencedColumn:
                                $$CharacterPowersTableReferences
                                    ._characterIdTable(db)
                                    .id,
                          )
                          as T;
                }
                if (powerId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.powerId,
                            referencedTable: $$CharacterPowersTableReferences
                                ._powerIdTable(db),
                            referencedColumn:
                                $$CharacterPowersTableReferences
                                    ._powerIdTable(db)
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

typedef $$CharacterPowersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CharacterPowersTable,
      CharacterPowerData,
      $$CharacterPowersTableFilterComposer,
      $$CharacterPowersTableOrderingComposer,
      $$CharacterPowersTableAnnotationComposer,
      $$CharacterPowersTableCreateCompanionBuilder,
      $$CharacterPowersTableUpdateCompanionBuilder,
      (CharacterPowerData, $$CharacterPowersTableReferences),
      CharacterPowerData,
      PrefetchHooks Function({bool characterId, bool powerId})
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
  $$AdultChoicesTableTableManager get adultChoices =>
      $$AdultChoicesTableTableManager(_db, _db.adultChoices);
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
  $$PowersTableTableManager get powers =>
      $$PowersTableTableManager(_db, _db.powers);
  $$CharacterPowersTableTableManager get characterPowers =>
      $$CharacterPowersTableTableManager(_db, _db.characterPowers);
}
