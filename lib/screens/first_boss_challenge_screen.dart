// lib/screens/first_boss_challenge_screen.dart
import 'package:flutter/material.dart';
import 'package:shadow_slave_rpg/database/database.dart';
import 'package:shadow_slave_rpg/main.dart'; // Para acessar a instância global do banco de dados `db`
import 'package:shadow_slave_rpg/models/_models.dart'; // Importa todos os modelos
import 'package:shadow_slave_rpg/utils/dice_roller.dart'; // Para a rolagem de dados
import 'package:shadow_slave_rpg/screens/power_revelation_screen.dart'; // Próxima tela
import 'package:shadow_slave_rpg/screens/character_creation_screen.dart'; // Para resetar a conta
import 'package:drift/drift.dart' show Value; // Para usar Value()

class FirstBossChallengeScreen extends StatefulWidget {
  final CharacterData character;

  const FirstBossChallengeScreen({Key? key, required this.character})
    : super(key: key);

  @override
  State<FirstBossChallengeScreen> createState() =>
      _FirstBossChallengeScreenState();
}

class _FirstBossChallengeScreenState extends State<FirstBossChallengeScreen> {
  late CharacterData _character; // O personagem será inicializado no initState
  late int _bossDifficulty; // Dificuldade do boss
  String _message = 'Enfrente seu primeiro grande desafio!';
  bool _challengeAttempted =
      false; // Para controlar se o desafio já foi tentado

  @override
  void initState() {
    super.initState();
    _character = widget.character; // Recebe o personagem da tela anterior
    _bossDifficulty = DiceRoller.defineBossDifficulty(
      _character.rank.displayName,
    ); // Define a dificuldade do boss com base no rank
  }

  /// Inicia o desafio contra o boss.
  void _startBossChallenge() async {
    if (_challengeAttempted) {
      _showMessage('Você já tentou o desafio. O resultado foi: $_message');
      return;
    }

    setState(() {
      _challengeAttempted = true; // Marca que o desafio foi tentado
      _message = 'Avaliando o desafio...';
    });

    // Simula uma rolagem de d20 para a verificação do boss
    final success = DiceRoller.checkAttribute(
      _character.strength,
      _bossDifficulty,
    );

    if (success) {
      // Personagem venceu o boss
      _showMessage('Vitória! Você derrotou o Primeiro Boss!');
      await _updateCharacterRankAndAspect(); // Atualiza rank e define aspecto
      Future.delayed(const Duration(seconds: 2), () {
        _navigateToPowerRevelationScreen();
      });
    } else {
      // Personagem perdeu o boss
      _showMessage('Derrota! Você falhou em derrotar o Primeiro Boss.');
      Future.delayed(const Duration(seconds: 2), () {
        _handleDefeat();
      });
    }
  }

  /// Atualiza o rank do personagem para Sleeper e define um aspecto inicial.
  Future<void> _updateCharacterRankAndAspect() async {
    final updatedCoreLevel = _character.coreLevel + 1;
    final updatedCoreProgress = 0; // Reseta o progresso do core
    final newRank =
        CharacterRank.sleeper; // Após o primeiro boss, o rank se torna Sleeper

    // Busca a escolha Adulta pelo ID e usa seu AspectType
    String? assignedAspect;
    if (_character.adultChoiceId != null) {
      // RENOMEADO AQUI
      final adultChoice = await db.getAdultChoiceById(
        _character.adultChoiceId!,
      ); // RENOMEADO AQUI
      assignedAspect = adultChoice?.aspectType?.displayName;
    }

    // Fallback caso não encontre ou o aspecto não esteja definido
    assignedAspect ??= AspectType.shadowWeaver.displayName;

    // Criando um CharactersCompanion para a atualização, garantindo que todos os campos sejam Value
    final updatedCharacterCompanion = CharactersCompanion(
      id: Value(
        _character.id,
      ), // ID é necessário para identificar a linha a ser atualizada
      userId: Value(_character.userId),
      name: Value(_character.name),
      currentHp: Value(_character.currentHp),
      maxHp: Value(_character.maxHp),
      mana: Value(_character.mana),
      coreLevel: Value(updatedCoreLevel), // Atualizado
      coreProgress: Value(updatedCoreProgress), // Atualizado
      strength: Value(_character.strength),
      agility: Value(_character.agility),
      intelligence: Value(_character.intelligence),
      perception: Value(_character.perception),
      endurance: Value(_character.endurance),
      rank: Value(newRank), // Atualizado
      aspect: Value(assignedAspect), // Atualizado
      abilitiesRevealed: Value(true), // Atualizado
      childhoodChoiceId: Value(_character.childhoodChoiceId),
      majorEventChoiceId: Value(_character.majorEventChoiceId),
      adultChoiceId: Value(_character.adultChoiceId), // RENOMEADO AQUI
      // NOVAS RESISTÊNCIAS: Garante que os valores atuais são passados para não serem resetados
      resistanceMental: Value(_character.resistanceMental),
      resistanceSpiritual: Value(_character.resistanceSpiritual),
      resistanceElementalHeat: Value(_character.resistanceElementalHeat),
      resistanceElementalCold: Value(_character.resistanceElementalCold),
      resistanceElementalPoison: Value(_character.resistanceElementalPoison),
      resistancePhysical: Value(_character.resistancePhysical),
    );

    // Atualiza o personagem no banco de dados local
    await db.updateCharacter(updatedCharacterCompanion);
    setState(() {
      // Atualiza o objeto CharacterData localmente para refletir as mudanças
      // usando copyWith para as novas colunas
      _character = _character.copyWith(
        rank: newRank,
        aspect: Value(assignedAspect),
        coreLevel: updatedCoreLevel,
        coreProgress: updatedCoreProgress,
        abilitiesRevealed: true,
        // Garante que as resistências são mantidas no objeto local atualizado
        resistanceMental: _character.resistanceMental,
        resistanceSpiritual: _character.resistanceSpiritual,
        resistanceElementalHeat: _character.resistanceElementalHeat,
        resistanceElementalCold: _character.resistanceElementalCold,
        resistanceElementalPoison: _character.resistanceElementalPoison,
        resistancePhysical: _character.resistancePhysical,
      );
    });
    print(
      'Personagem ${_character.name} atualizado para Rank ${newRank.displayName} com Aspecto $assignedAspect',
    );
  }

  /// Lida com a derrota do personagem.
  /// Se o personagem desafiou sozinho, a conta é resetada.
  void _handleDefeat() async {
    _showMessage('Seu personagem foi resetado devido à derrota solo.');
    await _resetCharacterAccount(_character.id); // Reseta a conta
    Future.delayed(const Duration(seconds: 2), () {
      _navigateToCharacterCreation();
    });
  }

  /// Reseta a conta do personagem (deleta do DB local).
  Future<void> _resetCharacterAccount(String characterId) async {
    // Para simplificar, vamos deletar o último personagem criado no DB.
    // Em um jogo real, você buscaria pelo ID do personagem específico.
    final characterToDelete = await db.getAllCharacters();
    if (characterToDelete.isNotEmpty) {
      await db.deleteCharacter(characterToDelete.first);
    }
    // TODO: Adicionar lógica para deletar habilidades, memórias, etc. associadas.
    print('Conta do personagem $characterId resetada.');
  }

  /// Navega de volta para a tela de criação de personagem.
  void _navigateToCharacterCreation() {
    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const CharacterCreationScreen(),
        ),
        (Route<dynamic> route) => false, // Remove todas as rotas anteriores
      );
    }
  }

  /// Navega para a tela de revelação de poderes.
  void _navigateToPowerRevelationScreen() {
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => PowerRevelationScreen(character: _character),
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
          'Primeiro Desafio: Boss',
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Informações do Personagem
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
                        'Personagem: ${_character.name}',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Rank: ${_character.rank.displayName}',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: Colors.grey.shade400),
                      ),
                      Text(
                        'HP: ${_character.currentHp}/${_character.maxHp}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.redAccent,
                        ),
                      ),
                      Text(
                        'Mana: ${_character.mana}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Dificuldade do Boss: $_bossDifficulty (baseado no Rank do Personagem)',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: Colors.orangeAccent),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24.0),

              // Área do Boss (placeholder)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Imagem ou ícone do Boss (futuramente um sprite)
                      Icon(
                        Icons.psychology_alt,
                        size: 120,
                        color: Colors.deepPurpleAccent.shade400,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Primeiro Boss: A Corrupção Incipiente',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _message,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24.0),

              // Botão para iniciar o desafio do boss
              ElevatedButton(
                onPressed:
                    _challengeAttempted
                        ? null
                        : _startBossChallenge, // Desabilita após uma tentativa
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _challengeAttempted
                          ? Colors.grey
                          : Colors.red.shade700, // Cor de fundo
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  _challengeAttempted
                      ? 'Desafio Realizado'
                      : 'Desafiar Primeiro Boss',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
