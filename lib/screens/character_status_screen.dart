// lib/screens/character_status_screen.dart
import 'package:flutter/material.dart';
import 'package:shadow_slave_rpg/database/database.dart';
import 'package:shadow_slave_rpg/models/_models.dart'; // Para CharacterData, TraitData, AbilityData, PowerData, AspectType, CharacterRank
import 'package:shadow_slave_rpg/main.dart'; // Para acessar o banco de dados `db`

class CharacterStatusScreen extends StatefulWidget {
  // Mudado para StatefulWidget
  final CharacterData character;

  const CharacterStatusScreen({Key? key, required this.character})
    : super(key: key);

  @override
  State<CharacterStatusScreen> createState() => _CharacterStatusScreenState();
}

class _CharacterStatusScreenState extends State<CharacterStatusScreen> {
  late CharacterData _character;
  List<TraitData> _characterTraits = [];
  List<AbilityData> _characterAbilities = [];
  List<PowerData> _characterPowers =
      []; // NOVO: Para listar os poderes do personagem
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _character = widget.character;
    _loadCharacterDetails();
  }

  Future<void> _loadCharacterDetails() async {
    // Carregar traços do personagem
    final traits = await db.getCharacterTraits(_character.id);

    // Carregar habilidades baseadas no Aspecto e Rank do personagem
    List<AbilityData> abilities = [];
    if (_character.aspect != null) {
      final aspectEnum = AspectType.values.firstWhere(
        (e) => e.displayName == _character.aspect,
        orElse: () => AspectType.shadowWeaver, // Fallback
      );
      // Carrega habilidades globais do Aspecto para o rank atual
      abilities = await db.getAbilitiesByAspectAndRank(
        aspectType: aspectEnum,
        rank: _character.rank,
      );
      // TODO: Futuramente, você também pode carregar habilidades que são específicas do personagem
      // e não apenas globais do Aspecto/Rank.
    }

    // NOVO: Carregar poderes do personagem
    final powers = await db.getCharacterPowers(_character.id);

    setState(() {
      _characterTraits = traits;
      _characterAbilities = abilities;
      _characterPowers = powers; // Atribui os poderes carregados
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Status do Personagem',
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
                                _character.name,
                                style: Theme.of(
                                  context,
                                ).textTheme.displaySmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Rank: ${_character.rank.displayName}',
                                style: Theme.of(context).textTheme.headlineSmall
                                    ?.copyWith(color: Colors.deepPurpleAccent),
                              ),
                              Text(
                                'Aspecto: ${_character.aspect ?? 'Não Revelado'}',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(color: Colors.amber),
                              ),
                              const Divider(height: 20, color: Colors.grey),
                              _buildStatRow(
                                'HP',
                                '${_character.currentHp}/${_character.maxHp}',
                                Colors.redAccent,
                              ),
                              _buildStatRow(
                                'Mana',
                                '${_character.mana}',
                                Colors.blueAccent,
                              ),
                              _buildStatRow(
                                'Core Level',
                                '${_character.coreLevel}',
                                Colors.greenAccent,
                              ),
                              _buildStatRow(
                                'Core Progress',
                                '${_character.coreProgress}/${_character.coreLevel * 1000}',
                                Colors.cyanAccent,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildAttributesCard(context, _character),
                      const SizedBox(height: 20),
                      // Card para Resistências
                      _buildResistancesCard(context, _character),
                      const SizedBox(height: 20),
                      _buildSectionTitle(context, 'Traços'),
                      _buildTraitsList(
                        _characterTraits,
                      ), // Passando a lista de traços carregada
                      const SizedBox(height: 20),
                      _buildSectionTitle(context, 'Habilidades'),
                      _buildAbilitiesList(
                        _characterAbilities,
                      ), // Passando a lista de habilidades carregada
                      const SizedBox(height: 20),
                      _buildSectionTitle(
                        context,
                        'Poderes',
                      ), // NOVO TÍTULO DE SEÇÃO
                      _buildPowersList(
                        _characterPowers,
                      ), // NOVO: Passando a lista de poderes carregada
                      const SizedBox(height: 20),
                      _buildSectionTitle(context, 'Memórias (Equipamentos)'),
                      _buildMemoriesList(
                        _character,
                      ), // Esta função precisará ser expandida para carregar memórias
                    ],
                  ),
                ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 16)),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttributesCard(BuildContext context, CharacterData character) {
    return Card(
      elevation: 6,
      color: Colors.grey.shade800,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Atributos',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(height: 20, color: Colors.grey),
            _buildStatRow(
              'Força',
              '${character.strength}',
              Colors.red.shade300,
            ),
            _buildStatRow(
              'Agilidade',
              '${character.agility}',
              Colors.green.shade300,
            ),
            _buildStatRow(
              'Inteligência',
              '${character.intelligence}',
              Colors.blue.shade300,
            ),
            _buildStatRow(
              'Percepção',
              '${character.perception}',
              Colors.orange.shade300,
            ),
            _buildStatRow(
              'Resistência (Endurance)',
              '${character.endurance}',
              Colors.purple.shade300,
            ),
          ],
        ),
      ),
    );
  }

  // Widget para exibir as Resistências
  Widget _buildResistancesCard(BuildContext context, CharacterData character) {
    return Card(
      elevation: 6,
      color: Colors.grey.shade800,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resistências',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(height: 20, color: Colors.grey),
            _buildStatRow(
              'Mental',
              '${character.resistanceMental}',
              Colors.lightBlue.shade300,
            ),
            _buildStatRow(
              'Espiritual',
              '${character.resistanceSpiritual}',
              Colors.purple.shade300,
            ),
            _buildStatRow(
              'Física',
              '${character.resistancePhysical}',
              Colors.brown.shade300,
            ),
            const SizedBox(height: 10),
            Text(
              'Elemental:',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            _buildStatRow(
              '  Calor',
              '${character.resistanceElementalHeat}',
              Colors.deepOrange.shade300,
            ),
            _buildStatRow(
              '  Frio',
              '${character.resistanceElementalCold}',
              Colors.blue.shade300,
            ),
            _buildStatRow(
              '  Veneno',
              '${character.resistanceElementalPoison}',
              Colors.green.shade300,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Função para construir a lista de traços
  Widget _buildTraitsList(List<TraitData> traits) {
    if (traits.isEmpty) {
      return Card(
        elevation: 4,
        color: Colors.grey.shade700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Nenhum traço desbloqueado ainda.',
            style: TextStyle(color: Colors.grey, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return Card(
      elevation: 4,
      color: Colors.grey.shade700,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              traits
                  .map(
                    (trait) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        // Usando Row para ícone de força/fraqueza
                        children: [
                          Icon(
                            trait.isStrength
                                ? Icons.add_circle
                                : (trait.isWeakness
                                    ? Icons.remove_circle
                                    : Icons.info_outline),
                            color:
                                trait.isStrength
                                    ? Colors.green
                                    : (trait.isWeakness
                                        ? Colors.red
                                        : Colors.blueGrey),
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '${trait.name}: ${trait.description ?? ''}',
                              style: TextStyle(
                                color: Colors.grey.shade300,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }

  // Função para construir a lista de habilidades
  Widget _buildAbilitiesList(List<AbilityData> abilities) {
    if (abilities.isEmpty) {
      return Card(
        elevation: 4,
        color: Colors.grey.shade700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Nenhuma habilidade desbloqueada para este Aspecto/Rank.',
            style: TextStyle(color: Colors.grey, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return Card(
      elevation: 4,
      color: Colors.grey.shade700,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              abilities
                  .map(
                    (ability) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '• ${ability.name} (Mana: ${ability.manaCost}, Cooldown: ${ability.cooldown}s): ${ability.description ?? ''}',
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }

  // NOVO: Função para construir a lista de Poderes
  Widget _buildPowersList(List<PowerData> powers) {
    if (powers.isEmpty) {
      return Card(
        elevation: 4,
        color: Colors.grey.shade700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Nenhum poder adquirido ainda.',
            style: TextStyle(color: Colors.grey, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return Card(
      elevation: 4,
      color: Colors.grey.shade700,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              powers
                  .map(
                    (power) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '• ${power.name} (Fonte: ${power.sourceType ?? 'Desconhecida'}): ${power.description ?? ''}',
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }

  // TODO: Implementar lista real de memórias/equipamentos
  Widget _buildMemoriesList(CharacterData character) {
    return Card(
      elevation: 4,
      color: Colors.grey.shade700,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Memórias (equipamentos) adquiridas serão listadas aqui.',
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ),
    );
  }
}
