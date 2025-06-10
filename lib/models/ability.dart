// lib/models/ability.dart
import 'package:drift/drift.dart';
//import 'package:uuid/uuid.dart'; // Importe para gerar IDs únicos
import 'package:shadow_slave_rpg/models/character.dart'; // Para CharacterRankConverter

// Instância local do gerador de UUID
//final uuid = Uuid();

// Enum para os tipos de Aspectos
enum AspectType {
  kinetic,
  illusionist,
  venomous,
  geomancer,
  shadowWeaver,
  aquatic,
  guardian,
  psychic,
  alchemist,
  temporal,
  beastmaster,
  lightbringer,
  voidwalker,
  bloodforged,
  songWeaver,
}

// Extensão para obter o nome formatado do Aspecto
extension AspectTypeExtension on AspectType {
  String get displayName {
    switch (this) {
      case AspectType.kinetic:
        return 'Kinetic';
      case AspectType.illusionist:
        return 'Illusionist';
      case AspectType.venomous:
        return 'Venomous';
      case AspectType.geomancer:
        return 'Geomancer';
      case AspectType.shadowWeaver:
        return 'Shadow Weaver';
      case AspectType.aquatic:
        return 'Aquatic';
      case AspectType.guardian:
        return 'Guardian';
      case AspectType.psychic:
        return 'Psychic';
      case AspectType.alchemist:
        return 'Alchemist';
      case AspectType.temporal:
        return 'Temporal';
      case AspectType.beastmaster:
        return 'Beastmaster';
      case AspectType.lightbringer:
        return 'Lightbringer';
      case AspectType.voidwalker:
        return 'Voidwalker';
      case AspectType.bloodforged:
        return 'Bloodforged';
      case AspectType.songWeaver:
        return 'Song Weaver';
    }
  }
}

// Converter para armazenar o enum AspectType como String no banco de dados
class AspectTypeConverter extends TypeConverter<AspectType, String> {
  const AspectTypeConverter();

  @override
  AspectType fromSql(String fromDb) {
    return AspectType.values.firstWhere(
      (e) => e.toString().split('.').last == fromDb,
      orElse: () => AspectType.kinetic, // Valor padrão
    );
  }

  @override
  String toSql(AspectType value) {
    return value.toString().split('.').last;
  }
}

// Tabela para armazenar as habilidades
@DataClassName('AbilityData')
class Abilities extends Table {
  TextColumn get id => text().clientDefault(() => uuid.v4())(); // ID único da habilidade
  TextColumn get characterId => text().references(Characters, #id)(); // Chave estrangeira para o personagem
  TextColumn get name => text().withLength(min: 1, max: 100)(); // Nome da habilidade
  TextColumn get description => text().nullable()(); // Descrição da habilidade
  IntColumn get manaCost => integer().withDefault(const Constant(0))(); // Custo de mana
  IntColumn get cooldown => integer().withDefault(const Constant(0))(); // Tempo de recarga
  TextColumn get rankRequired => text().map(const CharacterRankConverter())(); // Rank necessário para a habilidade
  TextColumn get aspectType => text().map(const AspectTypeConverter())(); // Tipo de aspecto da habilidade

  @override
  Set<Column> get primaryKey => {id};
}
