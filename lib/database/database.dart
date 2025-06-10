// lib/database/database.dart
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// Importe todos os seus modelos de dados
import 'package:shadow_slave_rpg/models/_models.dart';

part 'database.g.dart'; // <--- ESTA LINHA É CRUCIAL!

@DriftDatabase(
  tables: [
    Characters,
    Abilities,
    Memories,
    CharacterMemories,
    Traits,
    ChildhoodChoices,
    MajorEventChoices,
    DarkAwakeningChoices,
    CharacterTraits,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Métodos de acesso a dados (DAOs)
  Future<List<CharacterData>> getAllCharacters() => select(characters).get();
  Future<void> insertCharacter(CharactersCompanion character) =>
      into(characters).insert(character);
  Future<void> updateCharacter(CharactersCompanion character) =>
      update(characters).replace(character);
  Future<void> deleteCharacter(CharacterData character) =>
      delete(characters).delete(character);

  Future<List<ChildhoodChoiceData>> getAllChildhoodChoices() =>
      select(childhoodChoices).get();
  Future<void> insertChildhoodChoice(ChildhoodChoicesCompanion choice) =>
      into(childhoodChoices).insert(choice);
  Future<ChildhoodChoiceData?> getChildhoodChoiceById(String id) =>
      (select(childhoodChoices)
        ..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Future<List<MajorEventChoiceData>> getAllMajorEventChoices() =>
      select(majorEventChoices).get();
  Future<void> insertMajorEventChoice(MajorEventChoicesCompanion choice) =>
      into(majorEventChoices).insert(choice);
  Future<MajorEventChoiceData?> getMajorEventChoiceById(String id) =>
      (select(majorEventChoices)
        ..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Future<List<DarkAwakeningChoiceData>> getAllDarkAwakeningChoices() =>
      select(darkAwakeningChoices).get();
  Future<void> insertDarkAwakeningChoice(
    DarkAwakeningChoicesCompanion choice,
  ) => into(darkAwakeningChoices).insert(choice);
  Future<DarkAwakeningChoiceData?> getDarkAwakeningChoiceById(String id) =>
      (select(darkAwakeningChoices)
        ..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Future<void> insertTrait(TraitsCompanion trait) => into(traits).insert(trait);
  Future<void> insertCharacterTrait(CharacterTraitsCompanion charTrait) =>
      into(characterTraits).insert(charTrait);
  Future<List<TraitData>> getCharacterTraits(String characterId) async {
    final query = select(traits).join([
      innerJoin(characterTraits, characterTraits.traitId.equalsExp(traits.id)),
    ]);

    query.where(characterTraits.characterId.equals(characterId));

    final results = await query.get();
    return results.map((row) => row.readTable(traits)).toList();
  }

  // Métodos para Memórias e CharacterMemories
  Future<List<MemoryData>> getAllMemories() => select(memories).get();
  Future<void> insertMemory(MemoriesCompanion memory) =>
      into(memories).insert(memory);
  Future<void> insertCharacterMemory(
    CharacterMemoriesCompanion characterMemory,
  ) => into(characterMemories).insert(characterMemory);
}

// Função para abrir a conexão com o banco de dados SQLite
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(
      p.join(dbFolder.path, 'db.sqlite'),
    ); // Nome do arquivo do banco de dados
    return NativeDatabase(file);
  });
}
