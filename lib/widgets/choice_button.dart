// lib/widgets/choice_button.dart
import 'package:flutter/material.dart';

/// Um botão reutilizável para opções de escolha na criação de personagem.
///
/// [text]: O texto a ser exibido no botão.
/// [isSelected]: Se o botão está atualmente selecionado.
/// [onTap]: Função a ser chamada quando o botão é pressionado.
class ChoiceButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const ChoiceButton({
    super.key,
    required this.text,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? Colors.deepPurpleAccent.shade700
                  : Colors.grey.shade800,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: isSelected ? Colors.deepPurpleAccent : Colors.grey.shade700,
            width: 2.0,
          ),
          boxShadow:
              isSelected
                  ? [
                    BoxShadow(
                      color: Colors.deepPurpleAccent.withOpacity(0.4),
                      blurRadius: 8.0,
                      spreadRadius: 2.0,
                    ),
                  ]
                  : null,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade300,
            fontSize: 16.0,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
