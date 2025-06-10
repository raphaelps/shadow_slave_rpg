// main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shadow_slave_rpg/firebase_options.dart';

import 'package:shadow_slave_rpg/screens/character_creation_screen.dart';
import 'package:shadow_slave_rpg/database/database.dart';
import 'package:shadow_slave_rpg/models/_models.dart';
import 'package:drift/drift.dart'; // Importe para usar Value()

// Variável global para a instância do banco de dados drift
late AppDatabase db;

// Função _populateInitialData AGORA NO NÍVEL SUPERIOR DO ARQUIVO
/// Função para popular o banco de dados com dados iniciais se estiver vazio.
Future<void> _populateInitialData(AppDatabase database) async {
  // Popula Memórias se estiverem vazias
  if ((await database.getAllMemories()).isEmpty) {
    await database.batch((batch) {
      batch.insert(
        database.memories,
        MemoriesCompanion.insert(
          name: 'Luva do Viajante Sombrio',
          description: Value('Concede bônus em agilidade.'),
          type: MemoryType.accessory,
          rank: CharacterRank.dormant,
          bonusStats: Value('{"agility": 2}'), // JSON string
        ),
      );
      batch.insert(
        database.memories,
        MemoriesCompanion.insert(
          name: 'Faca das Sombras Velozes',
          description: Value('Uma arma rápida para ataques furtivos.'),
          type: MemoryType.weapon,
          rank: CharacterRank.sleeper,
          bonusStats: Value('{"strength": 1}'),
        ),
      );
      batch.insert(
        database.memories,
        MemoriesCompanion.insert(
          name: 'Amuleto da Percepção Onírica',
          description: Value('Melhora a percepção em ambientes de pesadelo.'),
          type: MemoryType.accessory,
          rank: CharacterRank.dormant,
          bonusStats: Value('{"perception": 2}'),
        ),
      );
      batch.insert(
        database.memories,
        MemoriesCompanion.insert(
          name: 'Placa Rúnica de Defesa',
          description: Value('Um artefato protetor que absorve dano.'),
          type: MemoryType.armor,
          rank: CharacterRank.awakened,
          bonusStats: Value('{"endurance": 3}'),
        ),
      );
      batch.insert(
        database.memories,
        MemoriesCompanion.insert(
          name: 'Essência Curativa Bruta',
          description: Value('Pode ser consumida para restaurar HP.'),
          type: MemoryType.utility,
          rank: CharacterRank.dormant,
          bonusStats: Value('{"hp_restore": 20}'),
        ),
      );
    });
    print('Memórias iniciais populadas.');
  }
  // As escolhas de biografia são populadas na CharacterCreationScreen.
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  db = AppDatabase();

  // Chame a função _populateInitialData aqui
  await _populateInitialData(db);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shadow Slave RPG',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const CharacterCreationScreen(),
    );
  }
}
