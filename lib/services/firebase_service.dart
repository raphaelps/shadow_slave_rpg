// lib/services/firebase_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart'; // Para gerar IDs de usuário anônimos

// Variáveis globais fornecidas pelo ambiente Canvas.
// Elas serão populadas em tempo de execução.
// Use valores padrão para desenvolvimento local fora do ambiente Canvas.
const String __app_id = String.fromEnvironment(
  'APP_ID',
  defaultValue: 'default-app-id',
);
const String __firebase_config = String.fromEnvironment(
  'FIREBASE_CONFIG',
  defaultValue: '{}',
);
const String __initial_auth_token = String.fromEnvironment(
  'INITIAL_AUTH_TOKEN',
  defaultValue: '',
);

/// Serviço para gerenciar a autenticação e interação com o Firebase Firestore.
class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Variáveis para armazenar o ID do usuário e o status de autenticação
  String? _userId;
  bool _isAuthReady = false;

  String? get userId => _userId;
  bool get isAuthReady => _isAuthReady;

  /// Inicializa o serviço Firebase, autenticando o usuário.
  /// Tenta autenticar com um token customizado se disponível, caso contrário, usa autenticação anônima.
  Future<void> initializeAuth() async {
    try {
      if (__initial_auth_token.isNotEmpty) {
        // Tenta autenticar com o token customizado fornecido pelo ambiente Canvas
        await _auth.signInWithCustomToken(__initial_auth_token);
        print('Firebase: Autenticado com token customizado.');
      } else {
        // Se não houver token customizado, tenta autenticar anonimamente
        await _auth.signInAnonymously();
        print('Firebase: Autenticado anonimamente.');
      }

      // Escuta mudanças no estado de autenticação para atualizar o userId
      _auth.authStateChanges().listen((User? user) {
        if (user != null) {
          _userId = user.uid;
          _isAuthReady = true;
          print('Firebase: Usuário autenticado: $_userId');
        } else {
          _userId = null;
          _isAuthReady = true; // Ainda pronto, mas sem usuário logado
          print('Firebase: Nenhum usuário autenticado.');
        }
      });
    } catch (e) {
      print('Firebase: Erro ao inicializar autenticação: $e');
      _isAuthReady =
          true; // Marcar como pronto mesmo com erro, para não travar o app
      // Se a autenticação falhar, podemos gerar um userId temporário para dados locais
      _userId = _auth.currentUser?.uid ?? randomAlphaNumeric(20);
      print('Firebase: Usando ID de usuário fallback: $_userId');
    }
  }

  /// Salva dados de um personagem no Firestore.
  /// Os dados são salvos em um caminho público para demonstração.
  ///
  /// [characterData]: Um mapa contendo os dados do personagem.
  Future<void> saveCharacterToFirestore(
    Map<String, dynamic> characterData,
  ) async {
    if (!_isAuthReady || _userId == null) {
      print(
        'Firebase: Serviço de autenticação não pronto ou usuário não logado.',
      );
      return;
    }

    try {
      // Usamos o __app_id para isolar os dados do seu aplicativo no Firestore
      // e o userId para identificar o proprietário do personagem.
      // O campo 'userId' também é salvo no documento para facilitar consultas.
      final docRef = _firestore
          .collection('artifacts')
          .doc(__app_id)
          .collection('public')
          .doc('data')
          .collection('characters')
          .doc(
            characterData['id'],
          ); // Usar o ID do personagem como ID do documento

      await docRef.set({
        ...characterData,
        'userId': _userId, // Adiciona o userId ao documento
        'timestamp':
            FieldValue.serverTimestamp(), // Adiciona um timestamp de criação/atualização
      });
      print(
        'Firebase: Personagem ${characterData['name']} salvo no Firestore com sucesso.',
      );
    } catch (e) {
      print('Firebase: Erro ao salvar personagem no Firestore: $e');
    }
  }

  /// Carrega todos os personagens do Firestore para o usuário atual.
  /// Retorna uma lista de mapas contendo os dados dos personagens.
  Future<List<Map<String, dynamic>>> loadCharactersFromFirestore() async {
    if (!_isAuthReady || _userId == null) {
      print(
        'Firebase: Serviço de autenticação não pronto ou usuário não logado.',
      );
      return [];
    }

    try {
      final querySnapshot =
          await _firestore
              .collection('artifacts')
              .doc(__app_id)
              .collection('public')
              .doc('data')
              .collection('characters')
              .where('userId', isEqualTo: _userId) // Filtra por userId
              .get();

      final characters = querySnapshot.docs.map((doc) => doc.data()).toList();
      print(
        'Firebase: ${characters.length} personagens carregados do Firestore.',
      );
      return characters;
    } catch (e) {
      print('Firebase: Erro ao carregar personagens do Firestore: $e');
      return [];
    }
  }
}
