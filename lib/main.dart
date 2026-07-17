import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'screens/start_game_screen.dart';
import 'screens/game_screen.dart';
import 'screens/game_over_screen.dart';

void main() {
  runApp(const GoalsApp());
}

class GoalsApp extends StatelessWidget {
  const GoalsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess My Number',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'OpenSans',
        useMaterial3: true,
      ),
      home: const GameHome(),
    );
  }
}

class GameHome extends StatefulWidget {
  const GameHome({super.key});

  @override
  State<GameHome> createState() => _GameHomeState();
}

class _GameHomeState extends State<GameHome> {
  int? _userNumber;
  bool _gameIsOver = true;
  int _guessRounds = 0;

  void _pickNumber(int pickedNumber) {
    setState(() {
      _userNumber = pickedNumber;
      _gameIsOver = false;
      _guessRounds = 0;
    });
  }

  void _gameOver(int numberOfRounds) {
    setState(() {
      _gameIsOver = true;
      _guessRounds = numberOfRounds;
    });
  }

  void _startNewGame() {
    setState(() {
      _userNumber = null;
      _guessRounds = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = StartGameScreen(onPickNumber: _pickNumber);

    if (_userNumber != null && !_gameIsOver) {
      screen = GameScreen(
        key: ValueKey(_userNumber),
        userNumber: _userNumber!,
        onGameOver: _gameOver,
      );
    }

    if (_gameIsOver && _userNumber != null) {
      screen = GameOverScreen(
        userNumber: _userNumber!,
        roundsNumber: _guessRounds,
        onStartNewGame: _startNewGame,
      );
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary700, AppColors.accent500],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // Background image with low opacity
            Positioned.fill(
              child: Opacity(
                opacity: 0.15,
                child: Image.asset(
                  'assets/images/background.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Main content in SafeArea
            SafeArea(
              child: screen,
            ),
          ],
        ),
      ),
    );
  }
}
