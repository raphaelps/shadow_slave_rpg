// lib/utils/dice_roller.dart
import 'dart:math';

/// Classe utilitária para simular rolagens de dados.
class DiceRoller {
  static final Random random =
      Random(); // Tornando Random acessível publicamente

  /// Rola um dado de 20 faces (d20) e retorna o resultado.
  /// O resultado será um número inteiro entre 1 e 20.
  static int rollD20() {
    return random.nextInt(20) +
        1; // nextInt(20) gera de 0 a 19, então +1 para 1 a 20
  }

  /// Realiza uma verificação de atributo com um d20.
  ///
  /// [attributeValue]: O valor do atributo do personagem (ex: Força, Agilidade).
  /// [difficultyClass]: O valor alvo que a rolagem + atributo deve superar.
  ///
  /// Retorna `true` se a verificação for bem-sucedida, `false` caso contrário.
  static bool checkAttribute(int attributeValue, int difficultyClass) {
    final roll = rollD20();
    print('Rolagem de d20: $roll');
    print('Valor do Atributo: $attributeValue');
    print('Classe de Dificuldade: $difficultyClass');
    final total = roll + attributeValue;
    print('Total da Verificação: $total');
    return total >= difficultyClass;
  }

  /// Gera um número aleatório de desafios pré-boss (entre 1 e 5).
  static int generatePreBossChallengeCount() {
    return random.nextInt(5) + 1; // Gera de 1 a 5 desafios
  }

  /// Define a dificuldade do boss com base em um rank e um fator aleatório.
  /// Pode ser ajustado para ser mais complexo no futuro.
  /// Retorna um valor de Dificuldade (DC) para o boss.
  static int defineBossDifficulty(String characterRank) {
    int baseDifficulty;
    switch (characterRank) {
      case 'Dormant':
        baseDifficulty = 10;
        break;
      case 'Sleeper':
        baseDifficulty = 12;
        break;
      case 'Awakened':
        baseDifficulty = 15;
        break;
      case 'Ascended':
        baseDifficulty = 18;
        break;
      case 'Transcendent':
        baseDifficulty = 20;
        break;
      case 'Saint':
        baseDifficulty = 25;
        break;
      default:
        baseDifficulty = 10;
    }
    // Adiciona um fator aleatório para variar a dificuldade
    return baseDifficulty + random.nextInt(5); // Varia de +0 a +4
  }
}
