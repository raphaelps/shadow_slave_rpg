// lib/screens/pre_boss_challenges_screen.dart
import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:shadow_slave_rpg/main.dart'; // Para acessar a instância global do banco de dados `db`
import 'package:shadow_slave_rpg/models/_models.dart'; // Importa todos os modelos
import 'package:shadow_slave_rpg/utils/dice_roller.dart'; // Para a rolagem de dados
import 'package:shadow_slave_rpg/screens/first_boss_challenge_screen.dart'; // Próxima tela
//import 'package:drift/drift.dart';

import '../database/database.dart'; // Para usar Value()

// Modelo simples para um desafio (poderia ser uma tabela Drift futuramente)
class Challenge {
  final String id;
  final String name;
  final String description;
  final String type; // 'monster', 'player_npc', 'puzzle', 'skill_check'
  final int difficultyRating; // 1-5, para ajustar a dificuldade da rolagem

  Challenge({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.difficultyRating,
  });
}

class PreBossChallengesScreen extends StatefulWidget {
  const PreBossChallengesScreen({super.key});

  @override
  State<PreBossChallengesScreen> createState() =>
      _PreBossChallengesScreenState();
}

class _PreBossChallengesScreenState extends State<PreBossChallengesScreen> {
  CharacterData? _character;
  late int _numberOfChallenges;
  int _challengesCompleted = 0;
  List<Challenge> _activeChallenges =
      []; // Lista dos desafios específicos para esta sessão

  // Pool de desafios disponíveis (hardcoded para demonstração)
  final List<Challenge> _challengePool = [
    Challenge(
      id: 'c1',
      name: 'Emboscada da Sombra',
      description: 'Um grupo de seres sombrios tenta atacá-lo.',
      type: 'monster',
      difficultyRating: 2,
    ),
    Challenge(
      id: 'c2',
      name: 'Desafio do Caçador Solitário',
      description: 'Um Desperto errante busca testar sua força.',
      type: 'player_npc',
      difficultyRating: 3,
    ),
    Challenge(
      id: 'c3',
      name: 'Enigma Antigo',
      description: 'Um artefato selado exige inteligência para ser decifrado.',
      type: 'skill_check',
      difficultyRating: 2,
    ),
    Challenge(
      id: 'c4',
      name: 'Corrupção no Pântano',
      description: 'Atravesse um pântano infestado com uma estranha energia.',
      type: 'skill_check',
      difficultyRating: 1,
    ),
    Challenge(
      id: 'c5',
      name: 'Coleta de Essência',
      description: 'Encontre e colete essências de criaturas menores.',
      type: 'monster',
      difficultyRating: 1,
    ),
    Challenge(
      id: 'c6',
      name: 'Armadilha Ilusória',
      description: 'Superar uma armadilha mental criada por um ilusionista.',
      type: 'skill_check',
      difficultyRating: 3,
    ),
    Challenge(
      id: 'c7',
      name: 'Guardião de Memória',
      description: 'Um ser protege uma memória valiosa.',
      type: 'monster',
      difficultyRating: 4,
    ),
    Challenge(
      id: 'c8',
      name: 'Conflito de Território',
      description: 'Ajude uma facção contra outra.',
      type: 'player_npc',
      difficultyRating: 4,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _loadCharacterAndChallenges();
  }

  /// Carrega o personagem e determina e seleciona os desafios.
  Future<void> _loadCharacterAndChallenges() async {
    final characters = await db.getAllCharacters();
    if (characters.isNotEmpty) {
      setState(() {
        _character = characters.last;
        _numberOfChallenges = DiceRoller.generatePreBossChallengeCount();
        _activeChallenges = _selectRandomChallenges(_numberOfChallenges);
      });
    } else {
      if (mounted) {
        Navigator.of(context).pop(); // Volta se não houver personagem
      }
    }
  }

  /// Seleciona um número aleatório de desafios do pool.
  List<Challenge> _selectRandomChallenges(int count) {
    final List<Challenge> shuffledChallenges = List.from(_challengePool)
      ..shuffle();
    return shuffledChallenges.take(count).toList();
  }

  /// Inicia um desafio, simulando uma batalha baseada em dados.
  void _startChallenge(Challenge challenge) async {
    // Exibe um diálogo de desafio
    await showDialog(
      context: context,
      barrierDismissible: false, // Não permite fechar clicando fora
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            challenge.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                challenge.description,
                style: TextStyle(color: Colors.grey.shade300),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Dificuldade: ${challenge.difficultyRating * 5}', // Multiplicado para ter um DC realista
                style: TextStyle(color: Colors.orangeAccent, fontSize: 16),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
                _resolveChallenge(challenge); // Resolve o desafio
              },
              child: const Text(
                'Aceitar Desafio!',
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Resolve o desafio com base em uma rolagem de dados.
  Future<void> _resolveChallenge(Challenge challenge) async {
    // Escolhe um atributo aleatório para o teste (para maior variedade)
    final attributes = [
      'strength',
      'agility',
      'intelligence',
      'perception',
      'endurance',
    ];
    final randomAttribute =
        attributes[DiceRoller.random.nextInt(attributes.length)];
    int characterAttributeValue;

    switch (randomAttribute) {
      case 'strength':
        characterAttributeValue = _character!.strength;
        break;
      case 'agility':
        characterAttributeValue = _character!.agility;
        break;
      case 'intelligence':
        characterAttributeValue = _character!.intelligence;
        break;
      case 'perception':
        characterAttributeValue = _character!.perception;
        break;
      case 'endurance':
        characterAttributeValue = _character!.endurance;
        break;
      default:
        characterAttributeValue = _character!.strength; // Fallback
    }

    final difficultyClass =
        challenge.difficultyRating * 5 +
        DiceRoller.random.nextInt(5); // Ajusta a DC com aleatoriedade
    final success = DiceRoller.checkAttribute(
      characterAttributeValue,
      difficultyClass,
    );

    String resultMessage;
    if (success) {
      resultMessage =
          'Você superou o Desafio "${challenge.name}" com sucesso usando $randomAttribute!';
      _giveChallengeReward(); // Chama a função de recompensa (await aqui)
    } else {
      resultMessage =
          'Você falhou no Desafio "${challenge.name}". Tente novamente da próxima vez.';
      // TODO: Penalidades menores aqui se desejar (ex: -5 HP temporário)
    }

    _showMessage(resultMessage);

    setState(() {
      _challengesCompleted++;
    });

    // Se todos os desafios forem concluídos, navega para o boss
    if (_challengesCompleted >= _numberOfChallenges) {
      _showMessage('Todos os desafios concluídos! Preparando para o Boss...');
      Future.delayed(const Duration(seconds: 2), () {
        _navigateToBossScreen();
      });
    }
  }

  // TODO: Implementar lógica de recompensa (dar Memórias ou outros bônus)
  void _giveChallengeReward() async {
    // Exemplo de recompensa: uma Memory aleatória
    final allMemories = await db.getAllMemories();
    if (allMemories.isNotEmpty) {
      final randomMemory =
          allMemories[DiceRoller.random.nextInt(allMemories.length)];
      await db.insertCharacterMemory(
        CharacterMemoriesCompanion.insert(
          characterId: _character!.id,
          memoryId: randomMemory.id,
          isEquipped: Value(false), // Não equipada por padrão
        ),
      );
      _showMessage('Você ganhou uma nova Memória: ${randomMemory.name}!');
    } else {
      _showMessage('Você ganhou uma recompensa, mas não há Memórias para dar!');
    }
  }

  /// Navega para a tela do Primeiro Boss.
  void _navigateToBossScreen() {
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder:
              (context) => FirstBossChallengeScreen(character: _character!),
        ),
      );
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Desafios Pré-Boss',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey.shade900,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.grey.shade900, Colors.black87],
          ),
        ),
        child:
            _character == null || _activeChallenges.isEmpty
                ? const Center(
                  child: CircularProgressIndicator(),
                ) // Indicador de carregamento
                : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        elevation: 4,
                        color: Colors.grey.shade800,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Personagem: ${_character!.name}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Rank: ${_character!.rank.displayName}',
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(color: Colors.grey.shade400),
                              ),
                              Text(
                                'HP: ${_character!.currentHp}/${_character!.maxHp}',
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(color: Colors.redAccent),
                              ),
                              Text(
                                'Mana: ${_character!.mana}',
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(color: Colors.blueAccent),
                              ),
                              Text(
                                'Desafios Concluídos: $_challengesCompleted / $_numberOfChallenges',
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(color: Colors.orangeAccent),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24.0),

                      Text(
                        'Desafios Antes do Primeiro Boss:',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12.0),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _activeChallenges.length,
                          itemBuilder: (context, index) {
                            final challenge = _activeChallenges[index];
                            final isChallengeComplete =
                                index <
                                _challengesCompleted; // Verifica se o desafio já foi "concluído"
                            return Card(
                              elevation: 2,
                              color:
                                  isChallengeComplete
                                      ? Colors.green.shade800.withOpacity(0.5)
                                      : Colors.grey.shade700,
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: ListTile(
                                leading: Icon(
                                  isChallengeComplete
                                      ? Icons.check_circle
                                      : Icons.games,
                                  color:
                                      isChallengeComplete
                                          ? Colors.greenAccent
                                          : Colors.deepPurpleAccent,
                                ),
                                title: Text(
                                  challenge.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight:
                                        isChallengeComplete
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                  ),
                                ),
                                subtitle: Text(
                                  challenge.description,
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                                trailing: ElevatedButton(
                                  onPressed:
                                      isChallengeComplete
                                          ? null
                                          : () => _startChallenge(challenge),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        isChallengeComplete
                                            ? Colors.grey
                                            : Colors.deepOrangeAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: Text(
                                    isChallengeComplete
                                        ? 'Completo'
                                        : 'Iniciar',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24.0),

                      SizedBox(
                        // Envolve o ElevatedButton para forçar a largura total
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed:
                              _challengesCompleted >= _numberOfChallenges
                                  ? _navigateToBossScreen
                                  : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _challengesCompleted >= _numberOfChallenges
                                    ? Colors.redAccent
                                    : Colors.grey,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            elevation: 5,
                          ),
                          child: Text(
                            _challengesCompleted >= _numberOfChallenges
                                ? 'Enfrentar Primeiro Boss'
                                : 'Complete os desafios ($_challengesCompleted/$_numberOfChallenges)',
                            textAlign:
                                TextAlign
                                    .center, // Garante centralização do texto
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
