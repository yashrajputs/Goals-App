import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class NumberContainer extends StatelessWidget {
  final int number;

  const NumberContainer({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.accent500, width: 4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        number.toString(),
        style: const TextStyle(
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.bold,
          color: AppColors.accent500,
          fontSize: 36,
        ),
      ),
    );
  }
}
