// lib/screens/character_status_screen.dart
import 'package:flutter/material.dart';
import 'package:shadow_slave_rpg/models/_models.dart';

import '../database/database.dart'; // Para CharacterData

class CharacterStatusScreen extends StatelessWidget {
  final CharacterData character;

  const CharacterStatusScreen({super.key, required this.character});

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
        child: SingleChildScrollView(
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
                        character.name,
                        style: Theme.of(
                          context,
                        ).textTheme.displaySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Rank: ${character.rank.displayName}',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: Colors.deepPurpleAccent),
                      ),
                      Text(
                        'Aspecto: ${character.aspect ?? 'Não Revelado'}',
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge?.copyWith(color: Colors.amber),
                      ),
                      const Divider(height: 20, color: Colors.grey),
                      _buildStatRow(
                        'HP',
                        '${character.currentHp}/${character.maxHp}',
                        Colors.redAccent,
                      ),
                      _buildStatRow(
                        'Mana',
                        '${character.mana}',
                        Colors.blueAccent,
                      ),
                      _buildStatRow(
                        'Core Level',
                        '${character.coreLevel}',
                        Colors.greenAccent,
                      ),
                      _buildStatRow(
                        'Core Progress',
                        '${character.coreProgress}/${character.coreLevel * 1000}',
                        Colors.cyanAccent,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildAttributesCard(context, character),
              const SizedBox(height: 20),
              _buildSectionTitle(context, 'Traços'),
              _buildTraitsList(character),
              const SizedBox(height: 20),
              _buildSectionTitle(context, 'Habilidades'),
              _buildAbilitiesList(character),
              const SizedBox(height: 20),
              _buildSectionTitle(context, 'Memórias (Equipamentos)'),
              _buildMemoriesList(character),
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
              'Resistência',
              '${character.endurance}',
              Colors.purple.shade300,
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

  // TODO: Implementar lista real de traços
  Widget _buildTraitsList(CharacterData character) {
    // Por enquanto, apenas um placeholder.
    // Você precisaria de um FutureBuilder para carregar os traços do banco de dados.
    return Card(
      elevation: 4,
      color: Colors.grey.shade700,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Traços do personagem serão listados aqui com base nas escolhas de biografia.',
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ),
    );
  }

  // TODO: Implementar lista real de habilidades
  Widget _buildAbilitiesList(CharacterData character) {
    // Por enquanto, apenas um placeholder.
    // Você precisaria de um FutureBuilder para carregar as habilidades do banco de dados
    // filtradas pelo ID do personagem e o Aspecto.
    return Card(
      elevation: 4,
      color: Colors.grey.shade700,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Habilidades do Aspecto e outras habilidades serão listadas aqui.',
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ),
    );
  }

  // TODO: Implementar lista real de memórias/equipamentos
  Widget _buildMemoriesList(CharacterData character) {
    // Por enquanto, apenas um placeholder.
    // Você precisaria de um FutureBuilder para carregar as memórias do banco de dados
    // associadas ao personagem.
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
