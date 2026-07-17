import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/ui/title_text.dart';
import '../widgets/ui/primary_button.dart';

class GameOverScreen extends StatelessWidget {
  final int roundsNumber;
  final int userNumber;
  final VoidCallback onStartNewGame;

  const GameOverScreen({
    super.key,
    required this.roundsNumber,
    required this.userNumber,
    required this.onStartNewGame,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TitleText(text: 'Game Over!'),
            const SizedBox(height: 36),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary800,
                  width: 3,
                ),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                'assets/images/success.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 36),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 24,
                  color: Colors.white,
                ),
                children: [
                  const TextSpan(text: 'Your phone needed '),
                  TextSpan(
                    text: '$roundsNumber',
                    style: const TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary500,
                    ),
                  ),
                  const TextSpan(text: ' rounds to guess the number '),
                  TextSpan(
                    text: '$userNumber',
                    style: const TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary500,
                    ),
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              onPressed: onStartNewGame,
              child: const Text('Start New Game'),
            ),
          ],
        ),
      ),
    );
  }
}
