// lib/models/character.dart
import 'package:drift/drift.dart';
import 'package:shadow_slave_rpg/models/_models.dart';
import 'package:uuid/uuid.dart'; // Importe para gerar IDs únicos

// Instância local do gerador de UUID para uso nos clientDefault
final uuid = Uuid();

// Enum para os ranks do personagem, conforme a lore de Shadow Slave
enum CharacterRank { dormant, sleeper, awakened, ascended, transcendent, saint }

// Extensão para obter o nome formatado do rank
extension CharacterRankExtension on CharacterRank {
  String get displayName {
    switch (this) {
      case CharacterRank.dormant:
        return 'Dormant';
      case CharacterRank.sleeper:
        return 'Sleeper';
      case CharacterRank.awakened:
        return 'Awakened';
      case CharacterRank.ascended:
        return 'Ascended';
      case CharacterRank.transcendent:
        return 'Transcendent';
      case CharacterRank.saint:
        return 'Saint';
    }
  }
}

// Tabela para armazenar os dados dos personagens
@DataClassName('CharacterData') // Nome da classe gerada pelo drift
class Characters extends Table {
  TextColumn get id =>
      text().clientDefault(() => uuid.v4())(); // ID único para o personagem
  TextColumn get userId =>
      text()(); // ID do usuário (para Firebase, se for o caso)
  TextColumn get name =>
      text().withLength(min: 1, max: 50)(); // Nome do personagem
  IntColumn get currentHp =>
      integer().withDefault(const Constant(100))(); // HP atual
  IntColumn get maxHp =>
      integer().withDefault(const Constant(100))(); // HP máximo
  IntColumn get mana => integer().withDefault(const Constant(50))(); // Mana
  IntColumn get coreLevel =>
      integer().withDefault(const Constant(1))(); // Nível do Core (1 a 7)
  IntColumn get coreProgress =>
      integer().withDefault(
        const Constant(0),
      )(); // Progresso do Core (0 a 1000, 0 a 2000, etc.)
  IntColumn get strength =>
      integer().withDefault(const Constant(10))(); // Atributo Força
  IntColumn get agility =>
      integer().withDefault(const Constant(10))(); // Atributo Agilidade
  IntColumn get intelligence =>
      integer().withDefault(const Constant(10))(); // Atributo Inteligência
  IntColumn get perception =>
      integer().withDefault(const Constant(10))(); // Atributo Percepção
  IntColumn get endurance =>
      integer().withDefault(const Constant(10))(); // Atributo Resistência
  TextColumn get rank =>
      text().map(
        const CharacterRankConverter(),
      )(); // Rank do personagem (usando converter)
  TextColumn get aspect =>
      text().nullable()(); // Aspecto do personagem (revelado após o boss)
  BoolColumn get abilitiesRevealed =>
      boolean().withDefault(
        const Constant(false),
      )(); // Se as habilidades foram reveladas

  // NOVAS COLUNAS PARA ARMAZENAR AS ESCOLHAS DE BIOGRAFIA POR ID
  TextColumn get childhoodChoiceId =>
      text().nullable().references(ChildhoodChoices, #id)();
  TextColumn get majorEventChoiceId =>
      text().nullable().references(MajorEventChoices, #id)();
  TextColumn get darkAwakeningChoiceId =>
      text().nullable().references(DarkAwakeningChoices, #id)();

  @override
  Set<Column> get primaryKey => {id}; // Define 'id' como chave primária
}

// Converter para armazenar o enum CharacterRank como String no banco de dados
class CharacterRankConverter extends TypeConverter<CharacterRank, String> {
  const CharacterRankConverter();

  @override
  CharacterRank fromSql(String fromDb) {
    return CharacterRank.values.firstWhere(
      (e) => e.toString().split('.').last == fromDb,
      orElse: () => CharacterRank.dormant, // Valor padrão em caso de erro
    );
  }

  @override
  String toSql(CharacterRank value) {
    return value.toString().split('.').last;
  }
}
