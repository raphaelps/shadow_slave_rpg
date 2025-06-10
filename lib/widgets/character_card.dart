// lib/widgets/character_card.dart
import 'package:flutter/material.dart';
// Importe seu modelo de personagem aqui, se for usar CharacterData
// import 'package:shadow_slave_rpg/models/character.dart';

/// Um widget reutilizável para exibir um resumo de um personagem.
/// (Este é um placeholder e pode ser expandido conforme necessário)
class CharacterCard extends StatelessWidget {
  final String characterName;
  final String characterRank;
  final String hpStatus;

  const CharacterCard({
    super.key,
    required this.characterName,
    required this.characterRank,
    required this.hpStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.grey.shade800,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome: $characterName',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Rank: $characterRank',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.grey.shade400),
            ),
            Text(
              'HP: $hpStatus',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(color: Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  }
}
