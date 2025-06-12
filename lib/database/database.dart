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
    AdultChoices, // RENOMEADO AQUI
    CharacterTraits,
    Powers, // NOVA TABELA
    CharacterPowers, // NOVA TABELA
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

  // Métodos para AdultChoices
  Future<List<AdultChoiceData>> getAllAdultChoices() =>
      select(adultChoices).get();
  Future<void> insertAdultChoice(AdultChoicesCompanion choice) =>
      into(adultChoices).insert(choice);
  Future<AdultChoiceData?> getAdultChoiceById(String id) =>
      (select(adultChoices)
        ..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Future<void> insertTrait(TraitsCompanion trait) => into(traits).insert(trait);
  Future<List<TraitData>> getAllTraits() => select(traits).get();
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

  // Métodos para Habilidades
  Future<void> insertAbility(AbilitiesCompanion ability) =>
      into(abilities).insert(ability);
  Future<List<AbilityData>> getAbilitiesByAspectAndRank({
    required AspectType aspectType,
    required CharacterRank rank,
  }) {
    return (select(abilities)..where(
      (tbl) =>
          tbl.aspectType.equals(aspectType.toString()) &
          tbl.rankRequired.equals(rank.toString()),
    )).get();
  }

  Future<List<AbilityData>> getAbilitiesByCharacterId(String characterId) {
    return (select(abilities)
      ..where((tbl) => tbl.characterId.equals(characterId))).get();
  }

  Future<List<AbilityData>> getAllAbilities() => select(abilities).get();

  // NOVO: Métodos para Poderes
  Future<void> insertPower(PowersCompanion power) => into(powers).insert(power);
  Future<List<PowerData>> getAllPowers() => select(powers).get();
  Future<void> insertCharacterPower(CharacterPowersCompanion charPower) =>
      into(characterPowers).insert(charPower);
  Future<List<PowerData>> getCharacterPowers(String characterId) async {
    final query = select(powers).join([
      innerJoin(characterPowers, characterPowers.powerId.equalsExp(powers.id)),
    ]);

    query.where(characterPowers.characterId.equals(characterId));

    final results = await query.get();
    return results.map((row) => row.readTable(powers)).toList();
  }

  // Métodos para popular Traits, Habilidades e Poderes se estiverem vazios (para testes)
  Future<void> populateDefaultTraitsAndAbilities() async {
    // Popula Traits se estiverem vazias
    if ((await getAllTraits()).isEmpty) {
      await batch((batch) {
        batch.insert(
          traits,
          TraitsCompanion.insert(
            name: 'Determinação Inabalável',
            description: Value('Aumenta a resistência mental.'),
            isStrength: Value(true),
          ),
        );
        batch.insert(
          traits,
          TraitsCompanion.insert(
            name: 'Instinto Selvagem',
            description: Value('Melhora a agilidade e percepção.'),
            isStrength: Value(true),
          ),
        );
        batch.insert(
          traits,
          TraitsCompanion.insert(
            name: 'Mente Analítica',
            description: Value(
              'Aumenta a inteligência em situações complexas.',
            ),
            isStrength: Value(true),
          ),
        );
        batch.insert(
          traits,
          TraitsCompanion.insert(
            name: 'Vínculo Sombrio',
            description: Value('Concede afinidade com Aspectos Sombrios.'),
            isStrength: Value(true),
          ),
        );
        // Pontos fracos
        batch.insert(
          traits,
          TraitsCompanion.insert(
            name: 'Fobia à Luz',
            description: Value('Reduz eficácia sob luz intensa.'),
            isWeakness: Value(true),
          ),
        );
        batch.insert(
          traits,
          TraitsCompanion.insert(
            name: 'Impulsividade',
            description: Value('Pode levar a decisões arriscadas.'),
            isWeakness: Value(true),
          ),
        );
        batch.insert(
          traits,
          TraitsCompanion.insert(
            name: 'Incompreendido',
            description: Value('Dificuldade em formar laços.'),
            isWeakness: Value(true),
          ),
        );

        // Adicione mais traços aqui...
      });
      print('Traços padrão populados.');
    }

    // Popula Habilidades se estiverem vazias
    if ((await getAllAbilities()).isEmpty) {
      await batch((batch) {
        // Habilidades Kinetic
        batch.insert(
          abilities,
          AbilitiesCompanion.insert(
            name: 'Golpe Vibratório',
            description: Value('Um ataque físico com energia cinética.'),
            manaCost: Value(10),
            cooldown: Value(3),
            rankRequired: CharacterRank.sleeper,
            aspectType: Value(AspectType.kinetic),
            characterId: Value(
              'GLOBAL_ABILITY_ID_KINETIC',
            ), // Usado para habilidades globais do aspecto
          ),
        );
        batch.insert(
          abilities,
          AbilitiesCompanion.insert(
            name: 'Impulso Súbito',
            description: Value(
              'Aumenta drasticamente a velocidade por um breve período.',
            ),
            manaCost: Value(15),
            cooldown: Value(5),
            rankRequired: CharacterRank.sleeper,
            aspectType: Value(AspectType.kinetic),
            characterId: Value('GLOBAL_ABILITY_ID_KINETIC'),
          ),
        );

        // Habilidades Illusionist
        batch.insert(
          abilities,
          AbilitiesCompanion.insert(
            name: 'Véu de Fumaça',
            description: Value(
              'Cria uma distração visual para escapar ou enganar.',
            ),
            manaCost: Value(8),
            cooldown: Value(4),
            rankRequired: CharacterRank.sleeper,
            aspectType: Value(AspectType.illusionist),
            characterId: Value('GLOBAL_ABILITY_ID_ILLUSIONIST'),
          ),
        );

        // Habilidades Shadow Weaver
        batch.insert(
          abilities,
          AbilitiesCompanion.insert(
            name: 'Manto das Sombras',
            description: Value(
              'Cobre o usuário com sombras, aumentando a furtividade.',
            ),
            manaCost: Value(12),
            cooldown: Value(6),
            rankRequired: CharacterRank.sleeper,
            aspectType: Value(AspectType.shadowWeaver),
            characterId: Value('GLOBAL_ABILITY_ID_SHADOWWEAVER'),
          ),
        );
        batch.insert(
          abilities,
          AbilitiesCompanion.insert(
            name: 'Convocar Sombra Menor',
            description: Value(
              'Invoca uma pequena criatura de sombra para auxiliar em combate.',
            ),
            manaCost: Value(25),
            cooldown: Value(10),
            rankRequired:
                CharacterRank
                    .awakened, // Exemplo de habilidade de rank mais alto
            aspectType: Value(AspectType.shadowWeaver),
            characterId: Value('GLOBAL_ABILITY_ID_SHADOWWEAVER'),
          ),
        );
        // Adicione mais habilidades para outros aspectos e ranks...
      });
      print('Habilidades padrão populadas.');
    }

    // NOVO: Popula Poderes se estiverem vazios
    if ((await getAllPowers()).isEmpty) {
      await batch((batch) {
        batch.insert(
          powers,
          PowersCompanion.insert(
            name: 'Toque do Vácuo',
            description: Value(
              'Um poder misterioso adquirido de uma entidade primordial. Causa dano de Vazio.',
            ),
            sourceType: Value('BossDrop'),
            manaCost: Value(30),
            cooldown: Value(15),
            rankRequired: Value(CharacterRank.sleeper),
          ),
        );
        batch.insert(
          powers,
          PowersCompanion.insert(
            name: 'Visão do Futuro Fragmentada',
            description: Value(
              'Prevê movimentos inimigos, aumentando sua chance de esquiva.',
            ),
            sourceType: Value('SpecialEvent'),
            manaCost: Value(20),
            cooldown: Value(12),
            rankRequired: Value(CharacterRank.sleeper),
          ),
        );
        // Adicione mais poderes aqui...
      });
      print('Poderes padrão populados.');
    }
  }
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
