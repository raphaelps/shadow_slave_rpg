// lib/screens/power_revelation_screen.dart
import 'package:flutter/material.dart';
import 'package:shadow_slave_rpg/database/database.dart';
import 'package:shadow_slave_rpg/models/_models.dart'; // Para CharacterData, AspectType, AbilityData, TraitData, PowerData
import 'package:shadow_slave_rpg/screens/character_status_screen.dart'; // Próxima tela
import 'package:shadow_slave_rpg/main.dart'; // Para acessar o banco de dados `db`

class PowerRevelationScreen extends StatefulWidget {
  final CharacterData character;

  const PowerRevelationScreen({Key? key, required this.character})
    : super(key: key);

  @override
  State<PowerRevelationScreen> createState() => _PowerRevelationScreenState();
}

class _PowerRevelationScreenState extends State<PowerRevelationScreen> {
  late CharacterData _character;
  String? _aspectDescription;
  List<TraitData> _revealedTraits = [];
  List<AbilityData> _revealedAbilities = [];
  List<PowerData> _revealedPowers = []; // NOVO: Para listar os poderes
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _character = widget.character;
    _loadRevealedPowersAndTraits();
  }

  Future<void> _loadRevealedPowersAndTraits() async {
    // Carregar descrição do aspecto (exemplo hardcoded por enquanto)
    _aspectDescription = _getAspectDescription(_character.aspect);

    // Carregar traços do personagem
    _revealedTraits = await db.getCharacterTraits(_character.id);

    // Carregar habilidades baseadas no Aspecto e Rank do personagem
    if (_character.aspect != null) {
      final aspectEnum = AspectType.values.firstWhere(
        (e) => e.displayName == _character.aspect,
        orElse: () => AspectType.shadowWeaver, // Fallback
      );
      _revealedAbilities = await db.getAbilitiesByAspectAndRank(
        aspectType: aspectEnum,
        rank: _character.rank,
      );
    }

    // NOVO: Carregar poderes do personagem (se houver algum associado)
    // Por enquanto, vamos assumir que o primeiro boss não dá poderes,
    // mas em futuras implementações, você pode associar poderes ao vencer bosses.
    // Para fins de demonstração, vamos dar um poder "aleatório" se o personagem vence.
    // (Lembrando que o poder será adicionado ao personagem em FirstBossChallengeScreen ou em outro lugar)
    _revealedPowers = await db.getCharacterPowers(_character.id);

    setState(() {
      _isLoading = false;
    });
  }

  // TODO: Implementar descrições mais detalhadas para cada Aspecto.
  // Isso pode ser carregado do DB ou de um JSON local.
  String _getAspectDescription(String? aspect) {
    switch (aspect) {
      case 'Kinetic':
        return 'O Aspecto Cinético concede maestria sobre o movimento, força e impacto.';
      case 'Illusionist':
        return 'O Aspecto Ilusionista permite manipular a percepção e criar realidades falsas.';
      case 'Venomous':
        return 'O Aspecto Venenoso concede controle sobre toxinas e doenças.';
      case 'Geomancer':
        return 'O Aspecto Geomante concede poder sobre a terra e suas formações.';
      case 'Shadow Weaver':
        return 'O Aspecto Tecelão das Sombras permite manipular as sombras para ataque ou defesa.';
      case 'Psychic':
        return 'O Aspecto Psíquico concede poder sobre a mente e a energia mental.';
      default:
        return 'Um poder misterioso e recém-despertado, ainda a ser explorado.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Revelação de Poderes',
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
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Parabéns, ${_character.name}!',
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Você derrotou o Primeiro Boss e despertou seu verdadeiro potencial!',
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge?.copyWith(color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),

                      // Card de Aspecto Revelado
                      Card(
                        elevation: 8,
                        color: Colors.grey.shade800,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            children: [
                              Text(
                                'Seu Aspecto Revelado:',
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall?.copyWith(
                                  color: Colors.orangeAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                _character.aspect ?? 'Não Revelado',
                                style: Theme.of(
                                  context,
                                ).textTheme.displaySmall?.copyWith(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                _aspectDescription ??
                                    'Descrição do aspecto indisponível.',
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Card de Traços Desbloqueados
                      if (_revealedTraits.isNotEmpty)
                        Card(
                          elevation: 6,
                          color: Colors.grey.shade800,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Traços Desbloqueados:',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineSmall?.copyWith(
                                    color: Colors.lightGreenAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Divider(height: 20, color: Colors.grey),
                                ..._revealedTraits.map(
                                  (trait) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4.0,
                                    ),
                                    child: Text(
                                      '• ${trait.name}: ${trait.description ?? ''}',
                                      style: TextStyle(
                                        color: Colors.grey.shade300,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      const SizedBox(height: 20),

                      // Card de Habilidades Desbloqueadas
                      if (_revealedAbilities.isNotEmpty)
                        Card(
                          elevation: 6,
                          color: Colors.grey.shade800,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Habilidades Desbloqueadas:',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineSmall?.copyWith(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Divider(height: 20, color: Colors.grey),
                                ..._revealedAbilities.map(
                                  (ability) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4.0,
                                    ),
                                    child: Text(
                                      '• ${ability.name} (Custo Mana: ${ability.manaCost}, Cooldown: ${ability.cooldown}s): ${ability.description ?? ''}',
                                      style: TextStyle(
                                        color: Colors.grey.shade300,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      const SizedBox(height: 20),

                      // NOVO: Card de Poderes Desbloqueados
                      if (_revealedPowers.isNotEmpty)
                        Card(
                          elevation: 6,
                          color: Colors.grey.shade800,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Poderes Desbloqueados:',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineSmall?.copyWith(
                                    color: Colors.deepOrangeAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Divider(height: 20, color: Colors.grey),
                                ..._revealedPowers.map(
                                  (power) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4.0,
                                    ),
                                    child: Text(
                                      '• ${power.name} (Fonte: ${power.sourceType ?? 'Desconhecida'}): ${power.description ?? ''}',
                                      style: TextStyle(
                                        color: Colors.grey.shade300,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      const SizedBox(height: 40),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder:
                                  (context) => CharacterStatusScreen(
                                    character: _character,
                                  ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 30.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 5,
                        ),
                        child: const Text(
                          'Ver Status do Personagem',
                          style: TextStyle(
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
