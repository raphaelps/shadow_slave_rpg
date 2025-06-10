// lib/models/memory.dart
import 'package:drift/drift.dart';
//import 'package:uuid/uuid.dart'; // Importe para gerar IDs únicos
import 'package:shadow_slave_rpg/models/character.dart'; // Para CharacterRankConverter

// Instância local do gerador de UUID
//final uuid = Uuid();

// Enum para os tipos de Memória/Equipamento
enum MemoryType { weapon, armor, accessory, utility }

// Extensão para obter o nome formatado do tipo de memória
extension MemoryTypeExtension on MemoryType {
  String get displayName {
    switch (this) {
      case MemoryType.weapon:
        return 'Weapon';
      case MemoryType.armor:
        return 'Armor';
      case MemoryType.accessory:
        return 'Accessory';
      case MemoryType.utility:
        return 'Utility';
    }
  }
}

// Converter para armazenar o enum MemoryType como String no banco de dados
class MemoryTypeConverter extends TypeConverter<MemoryType, String> {
  const MemoryTypeConverter();

  @override
  MemoryType fromSql(String fromDb) {
    return MemoryType.values.firstWhere(
      (e) => e.toString().split('.').last == fromDb,
      orElse: () => MemoryType.utility, // Valor padrão
    );
  }

  @override
  String toSql(MemoryType value) {
    return value.toString().split('.').last;
  }
}

// Tabela para armazenar as Memórias (equipamentos)
@DataClassName('MemoryData')
class Memories extends Table {
  TextColumn get id =>
      text().clientDefault(() => uuid.v4())(); // ID único da memória
  TextColumn get name =>
      text().withLength(min: 1, max: 100)(); // Nome da memória
  TextColumn get description => text().nullable()(); // Descrição
  TextColumn get type =>
      text().map(const MemoryTypeConverter())(); // Tipo de memória
  TextColumn get rank =>
      text().map(const CharacterRankConverter())(); // Rank da memória
  TextColumn get bonusStats =>
      text().nullable()(); // Bônus de status (pode ser JSON string)

  @override
  Set<Column> get primaryKey => {id};
}

// Tabela de relacionamento entre Personagens e Memórias (inventário)
@DataClassName('CharacterMemoryData')
class CharacterMemories extends Table {
  TextColumn get characterId =>
      text().references(
        Characters,
        #id,
      )(); // Chave estrangeira para o personagem
  TextColumn get memoryId =>
      text().references(Memories, #id)(); // Chave estrangeira para a memória
  BoolColumn get isEquipped =>
      boolean().withDefault(
        const Constant(false),
      )(); // Se a memória está equipada

  @override
  Set<Column> get primaryKey => {characterId, memoryId}; // Chave primária composta
}
