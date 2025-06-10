// lib/models/biography_choices.dart
import 'package:drift/drift.dart';
//import 'package:uuid/uuid.dart'; // Importe para gerar IDs únicos
import 'package:shadow_slave_rpg/models/character.dart'; // Para CharacterRankConverter
import 'package:shadow_slave_rpg/models/ability.dart'; // Para AspectTypeConverter

// Instância local do gerador de UUID
//final uuid = Uuid();

// Tabela para armazenar os traços que um personagem pode ter
@DataClassName('TraitData')
class Traits extends Table {
  TextColumn get id =>
      text().clientDefault(() => uuid.v4())(); // ID único do traço
  TextColumn get name => text().withLength(min: 1, max: 100)(); // Nome do traço
  TextColumn get description => text().nullable()(); // Descrição do traço

  @override
  Set<Column> get primaryKey => {id};
}

// Tabela para armazenar as escolhas de Infância
@DataClassName('ChildhoodChoiceData')
class ChildhoodChoices extends Table {
  TextColumn get id =>
      text().clientDefault(() => uuid.v4())(); // ID único da escolha
  TextColumn get description =>
      text().withLength(min: 1, max: 255)(); // Descrição da escolha
  TextColumn get traitId =>
      text().references(Traits, #id).nullable()(); // Traço associado (opcional)
  // Pode adicionar colunas para bônus de atributos se a escolha der bônus diretos
  IntColumn get strengthBonus => integer().withDefault(const Constant(0))();
  IntColumn get agilityBonus => integer().withDefault(const Constant(0))();
  IntColumn get intelligenceBonus => integer().withDefault(const Constant(0))();
  IntColumn get perceptionBonus => integer().withDefault(const Constant(0))();
  IntColumn get enduranceBonus => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

// Tabela para armazenar as escolhas de Evento Marcante
@DataClassName('MajorEventChoiceData')
class MajorEventChoices extends Table {
  TextColumn get id => text().clientDefault(() => uuid.v4())();
  TextColumn get description => text().withLength(min: 1, max: 255)();
  TextColumn get traitId => text().references(Traits, #id).nullable()();
  IntColumn get strengthBonus => integer().withDefault(const Constant(0))();
  IntColumn get agilityBonus => integer().withDefault(const Constant(0))();
  IntColumn get intelligenceBonus => integer().withDefault(const Constant(0))();
  IntColumn get perceptionBonus => integer().withDefault(const Constant(0))();
  IntColumn get enduranceBonus => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

// Tabela para armazenar as escolhas de Despertar Sombrio
@DataClassName('DarkAwakeningChoiceData')
class DarkAwakeningChoices extends Table {
  TextColumn get id => text().clientDefault(() => uuid.v4())();
  TextColumn get description => text().withLength(min: 1, max: 255)();
  TextColumn get traitId => text().references(Traits, #id).nullable()();
  IntColumn get strengthBonus => integer().withDefault(const Constant(0))();
  IntColumn get agilityBonus => integer().withDefault(const Constant(0))();
  IntColumn get intelligenceBonus => integer().withDefault(const Constant(0))();
  IntColumn get perceptionBonus => integer().withDefault(const Constant(0))();
  IntColumn get enduranceBonus => integer().withDefault(const Constant(0))();
  TextColumn get aspectType =>
      text()
          .map(const AspectTypeConverter())
          .nullable()(); // Aspecto associado (opcional)

  @override
  Set<Column> get primaryKey => {id};
}

// Tabela de relacionamento entre Personagens e Traços (para traços adquiridos)
@DataClassName('CharacterTraitData')
class CharacterTraits extends Table {
  TextColumn get characterId => text().references(Characters, #id)();
  TextColumn get traitId => text().references(Traits, #id)();

  @override
  Set<Column> get primaryKey => {characterId, traitId};
}
