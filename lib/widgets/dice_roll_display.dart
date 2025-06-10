// lib/widgets/dice_roll_display.dart
import 'package:flutter/material.dart';

/// Um widget simples para exibir o resultado de uma rolagem de dados.
/// (Este é um placeholder e pode ser aprimorado com animações)
class DiceRollDisplay extends StatelessWidget {
  final int rollResult;
  final String? message;

  const DiceRollDisplay({super.key, required this.rollResult, this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Resultado da Rolagem:',
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: Colors.white70),
        ),
        Text(
          '$rollResult',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: Colors.amberAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (message != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              message!,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade400),
            ),
          ),
      ],
    );
  }
}
