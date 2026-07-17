import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class InstructionText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const InstructionText({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'OpenSans',
        color: AppColors.accent500,
        fontSize: 24,
      ).merge(style),
    );
  }
}
