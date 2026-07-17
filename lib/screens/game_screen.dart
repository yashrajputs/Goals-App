import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/ui/title_text.dart';
import '../widgets/ui/card_widget.dart';
import '../widgets/ui/instruction_text.dart';
import '../widgets/ui/primary_button.dart';
import '../widgets/game/number_container.dart';
import '../widgets/game/guess_log_item.dart';

int generateRandomBetween(int min, int max, int exclude) {
  final rng = Random();
  int rndNum;
  do {
    rndNum = min + rng.nextInt(max - min);
  } while (rndNum == exclude);
  return rndNum;
}

class GameScreen extends StatefulWidget {
  final int userNumber;
  final void Function(int numberOfRounds) onGameOver;

  const GameScreen({
    super.key,
    required this.userNumber,
    required this.onGameOver,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _minBoundary = 1;
  int _maxBoundary = 100;
  late int _currentGuess;
  List<int> _guessRounds = [];

  @override
  void initState() {
    super.initState();
    _currentGuess = generateRandomBetween(1, 100, widget.userNumber);
    _guessRounds = [_currentGuess];
  }

  void _checkGameOver() {
    if (_currentGuess == widget.userNumber) {
      // Use addPostFrameCallback to avoid calling setState during build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onGameOver(_guessRounds.length);
      });
    }
  }

  void _nextGuess(String direction) {
    // direction => 'lower' or 'greater'
    if ((direction == 'lower' && _currentGuess < widget.userNumber) ||
        (direction == 'greater' && _currentGuess > widget.userNumber)) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Don't lie!"),
          content: const Text('You know that this is wrong...'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Sorry!'),
            ),
          ],
        ),
      );
      return;
    }

    if (direction == 'lower') {
      _maxBoundary = _currentGuess;
    } else {
      _minBoundary = _currentGuess + 1;
    }

    final newRndNumber =
        generateRandomBetween(_minBoundary, _maxBoundary, _currentGuess);

    setState(() {
      _currentGuess = newRndNumber;
      _guessRounds.insert(0, newRndNumber);
    });

    // Check if the new guess matches
    if (newRndNumber == widget.userNumber) {
      widget.onGameOver(_guessRounds.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check on initial build
    _checkGameOver();

    final guessRoundsLength = _guessRounds.length;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const TitleText(text: "Opponent's Guess"),
          NumberContainer(number: _currentGuess),
          CardWidget(
            child: Column(
              children: [
                const InstructionText(
                  text: 'Higher or Lower?',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        onPressed: () => _nextGuess('lower'),
                        child:
                            const Icon(Icons.remove, color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: PrimaryButton(
                        onPressed: () => _nextGuess('greater'),
                        child: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _guessRounds.length,
              itemBuilder: (ctx, index) => GuessLogItem(
                roundNumber: guessRoundsLength - index,
                guess: _guessRounds[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
