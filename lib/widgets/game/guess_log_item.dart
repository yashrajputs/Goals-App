import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class GuessLogItem extends StatelessWidget {
  final int roundNumber;
  final int guess;

  const GuessLogItem({
    super.key,
    required this.roundNumber,
    required this.guess,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.accent500,
        border: Border.all(color: AppColors.primary800, width: 1),
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 0),
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '#$roundNumber',
            style: const TextStyle(fontFamily: 'OpenSans'),
          ),
          Text(
            "Opponent's Guess: $guess",
            style: const TextStyle(fontFamily: 'OpenSans'),
          ),
        ],
      ),
    );
  }
}
