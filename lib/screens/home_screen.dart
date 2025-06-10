// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:shadow_slave_rpg/main.dart';
import 'package:shadow_slave_rpg/models/_models.dart';
import 'package:shadow_slave_rpg/screens/character_creation_screen.dart';
import 'package:shadow_slave_rpg/screens/character_status_screen.dart';

import '../database/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CharacterData? _loadedCharacter;

  @override
  void initState() {
    super.initState();
    _loadExistingCharacter();
  }

  Future<void> _loadExistingCharacter() async {
    final characters = await db.getAllCharacters();
    if (characters.isNotEmpty) {
      setState(() {
        _loadedCharacter =
            characters.first; // Carrega o primeiro personagem encontrado
      });
    }
  }

  void _createNewCharacter() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const CharacterCreationScreen()),
    );
  }

  void _viewCharacterStatus() {
    if (_loadedCharacter != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder:
              (context) => CharacterStatusScreen(character: _loadedCharacter!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shadow Slave RPG',
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bem-vindo ao Shadow Slave RPG!',
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium?.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              if (_loadedCharacter == null)
                ElevatedButton(
                  onPressed: _createNewCharacter,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 30.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Iniciar Nova Jornada',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                )
              else
                Column(
                  children: [
                    Text(
                      'Último Personagem: ${_loadedCharacter!.name}',
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge?.copyWith(color: Colors.white70),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _viewCharacterStatus,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 30.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        'Continuar Jornada',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: _createNewCharacter,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade700,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 30.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        'Criar Novo Personagem',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
