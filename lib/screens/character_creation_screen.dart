// lib/screens/character_creation_screen.dart
import 'package:flutter/material.dart';
import 'package:shadow_slave_rpg/main.dart'; // Importa a instância global do banco de dados 'db'
import 'package:shadow_slave_rpg/models/_models.dart'; // Importa todos os modelos
import 'package:shadow_slave_rpg/widgets/choice_button.dart';
import 'package:shadow_slave_rpg/screens/pre_boss_challenges_screen.dart'; // Próxima tela
import 'package:firebase_auth/firebase_auth.dart'; // Para obter o userId
import 'package:random_string/random_string.dart'; // Para gerar userId anonimo
import 'package:shadow_slave_rpg/database/database.dart'; // Importa o AppDatabase e as classes geradas
import 'package:drift/drift.dart' show Value; // Importe para usar Value()

class CharacterCreationScreen extends StatefulWidget {
  const CharacterCreationScreen({Key? key}) : super(key: key);

  @override
  State<CharacterCreationScreen> createState() =>
      _CharacterCreationScreenState();
}

class _CharacterCreationScreenState extends State<CharacterCreationScreen> {
  final TextEditingController _nameController = TextEditingController();
  ChildhoodChoiceData? _selectedChildhoodChoice;
  MajorEventChoiceData? _selectedMajorEventChoice;
  AdultChoiceData? _selectedAdultChoice; // RENOMEADO AQUI

  List<ChildhoodChoiceData> _childhoodOptions = [];
  List<MajorEventChoiceData> _majorEventOptions = [];
  List<AdultChoiceData> _adultOptions = []; // RENOMEADO AQUI

  @override
  void initState() {
    super.initState();
    _loadBiographyChoices();
  }

  Future<void> _loadBiographyChoices() async {
    // Popula o banco de dados com escolhas se ele estiver vazio
    await _populateChoicesIfEmpty();

    final childhood = await db.getAllChildhoodChoices();
    final majorEvent = await db.getAllMajorEventChoices();
    final adult = await db.getAllAdultChoices(); // RENOMEADO AQUI

    setState(() {
      _childhoodOptions = childhood;
      _majorEventOptions = majorEvent;
      _adultOptions = adult; // RENOMEADO AQUI
    });
  }

  // Função para popular as tabelas de escolha de biografia apenas se estiverem vazias
  Future<void> _populateChoicesIfEmpty() async {
    if ((await db.getAllChildhoodChoices()).isEmpty) {
      await db.batch((batch) {
        batch.insert(
          db.childhoodChoices,
          ChildhoodChoicesCompanion.insert(
            description: 'Orfanato subterrâneo',
            strengthBonus: Value(1),
          ),
        );
        batch.insert(
          db.childhoodChoices,
          ChildhoodChoicesCompanion.insert(
            description: 'Criação militar rígida',
            enduranceBonus: Value(1),
          ),
        );
        batch.insert(
          db.childhoodChoices,
          ChildhoodChoicesCompanion.insert(
            description: 'Favela infestada por sombras',
            agilityBonus: Value(1),
          ),
        );
        batch.insert(
          db.childhoodChoices,
          ChildhoodChoicesCompanion.insert(
            description: 'Filho de colecionadores de relíquias',
            intelligenceBonus: Value(1),
          ),
        );
        batch.insert(
          db.childhoodChoices,
          ChildhoodChoicesCompanion.insert(
            description: 'Escravo nas fábricas do Norte',
            enduranceBonus: Value(2),
          ),
        );
        batch.insert(
          db.childhoodChoices,
          ChildhoodChoicesCompanion.insert(
            description: 'Nômade do deserto cinzento',
            perceptionBonus: Value(1),
          ),
        );
        batch.insert(
          db.childhoodChoices,
          ChildhoodChoicesCompanion.insert(
            description: 'Vendedor de rua em metrópole',
            intelligenceBonus: Value(1),
          ),
        );
        batch.insert(
          db.childhoodChoices,
          ChildhoodChoicesCompanion.insert(
            description: 'Discípulo de ermitão',
            perceptionBonus: Value(1),
          ),
        );
        batch.insert(
          db.childhoodChoices,
          ChildhoodChoicesCompanion.insert(
            description: 'Sobrevivente de cataclismo',
            strengthBonus: Value(1),
          ),
        );
        batch.insert(
          db.childhoodChoices,
          ChildhoodChoicesCompanion.insert(
            description: 'Membro de clã isolado',
            agilityBonus: Value(1),
          ),
        );
      });
    }

    if ((await db.getAllMajorEventChoices()).isEmpty) {
      await db.batch((batch) {
        batch.insert(
          db.majorEventChoices,
          MajorEventChoicesCompanion.insert(
            description: 'Perdeu ente querido em ataque das sombras',
            intelligenceBonus: Value(1),
          ),
        );
        batch.insert(
          db.majorEventChoices,
          MajorEventChoicesCompanion.insert(
            description: 'Sobreviveu a colapso dimensional',
            perceptionBonus: Value(2),
          ),
        );
        batch.insert(
          db.majorEventChoices,
          MajorEventChoicesCompanion.insert(
            description: 'Traído pelo próprio clã',
            agilityBonus: Value(1),
          ),
        );
        batch.insert(
          db.majorEventChoices,
          MajorEventChoicesCompanion.insert(
            description: 'Descobriu artefato antigo',
            intelligenceBonus: Value(2),
          ),
        );
        batch.insert(
          db.majorEventChoices,
          MajorEventChoicesCompanion.insert(
            description: 'Salvou grupo sozinho',
            strengthBonus: Value(1),
          ),
        );
        batch.insert(
          db.majorEventChoices,
          MajorEventChoicesCompanion.insert(
            description: 'Foi deixado para morrer e sobreviveu',
            enduranceBonus: Value(1),
          ),
        );
        batch.insert(
          db.majorEventChoices,
          MajorEventChoicesCompanion.insert(
            description: 'Enfrentou uma Sombra Primordial',
            strengthBonus: Value(2),
          ),
        );
        batch.insert(
          db.majorEventChoices,
          MajorEventChoicesCompanion.insert(
            description: 'Testemunhou um ritual proibido',
            intelligenceBonus: Value(1),
          ),
        );
        batch.insert(
          db.majorEventChoices,
          MajorEventChoicesCompanion.insert(
            description: 'Teve uma visão apocalíptica',
            perceptionBonus: Value(1),
          ),
        );
        batch.insert(
          db.majorEventChoices,
          MajorEventChoicesCompanion.insert(
            description: 'Resgatou um ser lendário',
            agilityBonus: Value(1),
          ),
        );
      });
    }

    // RENOMEADO: Popula AdultChoices
    if ((await db.getAllAdultChoices()).isEmpty) {
      // RENOMEADO AQUI
      await db.batch((batch) {
        batch.insert(
          db.adultChoices,
          AdultChoicesCompanion.insert(
            description: 'Corvo de ossos',
            aspectType: Value(AspectType.shadowWeaver),
          ),
        );
        batch.insert(
          db.adultChoices,
          AdultChoicesCompanion.insert(
            description: 'Lobo das ruínas',
            aspectType: Value(AspectType.kinetic),
          ),
        );
        batch.insert(
          db.adultChoices,
          AdultChoicesCompanion.insert(
            description: 'Sombra líquida',
            aspectType: Value(AspectType.illusionist),
          ),
        );
        batch.insert(
          db.adultChoices,
          AdultChoicesCompanion.insert(
            description: 'Monólito ambulante',
            aspectType: Value(AspectType.geomancer),
          ),
        );
        batch.insert(
          db.adultChoices,
          AdultChoicesCompanion.insert(
            description: 'Véu de espinhos',
            aspectType: Value(AspectType.venomous),
          ),
        );
        batch.insert(
          db.adultChoices,
          AdultChoicesCompanion.insert(
            description: 'Marionete sem rosto',
            aspectType: Value(AspectType.psychic),
          ),
        );
        batch.insert(
          db.adultChoices,
          AdultChoicesCompanion.insert(
            description: 'Serpente do Medo',
            aspectType: Value(AspectType.venomous),
          ),
        );
        batch.insert(
          db.adultChoices,
          AdultChoicesCompanion.insert(
            description: 'Manto de Ilusões',
            aspectType: Value(AspectType.illusionist),
          ),
        );
        batch.insert(
          db.adultChoices,
          AdultChoicesCompanion.insert(
            description: 'Garras de Destruição',
            aspectType: Value(AspectType.kinetic),
          ),
        );
        batch.insert(
          db.adultChoices,
          AdultChoicesCompanion.insert(
            description: 'Olho da Noite Eterna',
            aspectType: Value(AspectType.shadowWeaver),
          ),
        );
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  // Função para criar o personagem e navegar para a próxima tela
  void _createCharacter() async {
    if (_nameController.text.trim().isEmpty) {
      _showMessage('Por favor, insira um nome para o personagem.');
      return;
    }
    if (_selectedChildhoodChoice == null ||
        _selectedMajorEventChoice == null ||
        _selectedAdultChoice == null) {
      // RENOMEADO AQUI
      _showMessage('Por favor, faça todas as escolhas de biografia.');
      return;
    }

    String currentUserId =
        FirebaseAuth.instance.currentUser?.uid ?? randomAlphaNumeric(20);

    // Calcular atributos baseados nas escolhas de biografia
    int strength = 10;
    int agility = 10;
    int intelligence = 10;
    int perception = 10;
    int endurance = 10;

    strength +=
        _selectedChildhoodChoice!.strengthBonus +
        _selectedMajorEventChoice!.strengthBonus +
        _selectedAdultChoice!.strengthBonus; // RENOMEADO AQUI
    agility +=
        _selectedChildhoodChoice!.agilityBonus +
        _selectedMajorEventChoice!.agilityBonus +
        _selectedAdultChoice!.agilityBonus; // RENOMEADO AQUI
    intelligence +=
        _selectedChildhoodChoice!.intelligenceBonus +
        _selectedMajorEventChoice!.intelligenceBonus +
        _selectedAdultChoice!.intelligenceBonus; // RENOMEADO AQUI
    perception +=
        _selectedChildhoodChoice!.perceptionBonus +
        _selectedMajorEventChoice!.perceptionBonus +
        _selectedAdultChoice!.perceptionBonus; // RENOMEADO AQUI
    endurance +=
        _selectedChildhoodChoice!.enduranceBonus +
        _selectedMajorEventChoice!.enduranceBonus +
        _selectedAdultChoice!.enduranceBonus; // RENOMEADO AQUI

    // Adicionando valores padrão (0) para as novas resistências
    int resistanceMental = 0;
    int resistanceSpiritual = 0;
    int resistanceElementalHeat = 0;
    int resistanceElementalCold = 0;
    int resistanceElementalPoison = 0;
    int resistancePhysical = 0;

    // Cria um novo personagem com valores iniciais e as escolhas de biografia
    final newCharacter = CharactersCompanion.insert(
      userId: currentUserId,
      name: _nameController.text.trim(),
      rank: CharacterRank.dormant, // Começa como Dormant
      strength: Value(strength), // Atributos baseados nas escolhas
      agility: Value(agility),
      intelligence: Value(intelligence),
      perception: Value(perception),
      endurance: Value(endurance),
      childhoodChoiceId: Value(_selectedChildhoodChoice!.id),
      majorEventChoiceId: Value(_selectedMajorEventChoice!.id),
      adultChoiceId: Value(_selectedAdultChoice!.id), // RENOMEADO AQUI
      // NOVAS RESISTÊNCIAS:
      resistanceMental: Value(resistanceMental),
      resistanceSpiritual: Value(resistanceSpiritual),
      resistanceElementalHeat: Value(resistanceElementalHeat),
      resistanceElementalCold: Value(resistanceElementalCold),
      resistanceElementalPoison: Value(resistanceElementalPoison),
      resistancePhysical: Value(resistancePhysical),
    );

    try {
      await db.insertCharacter(newCharacter);
      print('Personagem criado: ${newCharacter.name.value}');
      print(
        'Atributos Iniciais: Str $strength, Agi $agility, Int $intelligence, Per $perception, End $endurance',
      );
      print('Usuário ID: $currentUserId');

      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const PreBossChallengesScreen(),
          ),
        );
      }
    } catch (e) {
      _showMessage('Erro ao criar personagem: $e');
      print('Erro ao criar personagem: $e');
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
          'Criação de Personagem',
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
            _childhoodOptions.isEmpty ||
                    _majorEventOptions.isEmpty ||
                    _adultOptions
                        .isEmpty // RENOMEADO AQUI
                ? const Center(
                  child: CircularProgressIndicator(),
                ) // Mostra carregamento enquanto opções são carregadas
                : SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Nome do Personagem',
                          labelStyle: TextStyle(color: Colors.grey.shade400),
                          filled: true,
                          fillColor: Colors.grey.shade800,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.deepPurpleAccent,
                              width: 2.0,
                            ),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 24.0),

                      Text(
                        '1. Infância (Origem e Condições Iniciais)',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: Colors.white70),
                      ),
                      const SizedBox(height: 12.0),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children:
                            _childhoodOptions.map((choice) {
                              return ChoiceButton(
                                text: choice.description,
                                isSelected: _selectedChildhoodChoice == choice,
                                onTap: () {
                                  setState(() {
                                    _selectedChildhoodChoice = choice;
                                  });
                                },
                              );
                            }).toList(),
                      ),
                      const SizedBox(height: 24.0),

                      Text(
                        '2. Evento Marcante (Trauma ou Ponto de Virada)',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: Colors.white70),
                      ),
                      const SizedBox(height: 12.0),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children:
                            _majorEventOptions.map((choice) {
                              return ChoiceButton(
                                text: choice.description,
                                isSelected: _selectedMajorEventChoice == choice,
                                onTap: () {
                                  setState(() {
                                    _selectedMajorEventChoice = choice;
                                  });
                                },
                              );
                            }).toList(),
                      ),
                      const SizedBox(height: 24.0),

                      // RENOMEADO: Seção de Escolhas Adultas (antigo Despertar Sombrio)
                      Text(
                        '3. Escolha Adulta (Definição de Caminho e Aspecto)',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: Colors.white70),
                      ),
                      const SizedBox(height: 12.0),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children:
                            _adultOptions.map((choice) {
                              // RENOMEADO AQUI
                              return ChoiceButton(
                                text: choice.description,
                                isSelected:
                                    _selectedAdultChoice ==
                                    choice, // RENOMEADO AQUI
                                onTap: () {
                                  setState(() {
                                    _selectedAdultChoice =
                                        choice; // RENOMEADO AQUI
                                  });
                                },
                              );
                            }).toList(),
                      ),
                      const SizedBox(height: 32.0),

                      ElevatedButton(
                        onPressed: _createCharacter,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 5,
                        ),
                        child: const Text(
                          'Criar Personagem',
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
