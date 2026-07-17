import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/ui/title_text.dart';
import '../widgets/ui/card_widget.dart';
import '../widgets/ui/instruction_text.dart';
import '../widgets/ui/primary_button.dart';

class StartGameScreen extends StatefulWidget {
  final void Function(int pickedNumber) onPickNumber;

  const StartGameScreen({super.key, required this.onPickNumber});

  @override
  State<StartGameScreen> createState() => _StartGameScreenState();
}

class _StartGameScreenState extends State<StartGameScreen> {
  final TextEditingController _numberController = TextEditingController();

  void _resetInput() {
    _numberController.clear();
  }

  void _confirmInput() {
    final enteredNumber = int.tryParse(_numberController.text);

    if (enteredNumber == null || enteredNumber <= 0 || enteredNumber > 99) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Number!'),
          content:
              const Text('Number has to be a number between 1 and 99.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                _resetInput();
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    widget.onPickNumber(enteredNumber);
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TitleText(text: 'Guess My Number'),
            CardWidget(
              child: Column(
                children: [
                  const InstructionText(text: 'Enter a Number'),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      controller: _numberController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 2,
                      style: const TextStyle(
                        color: AppColors.accent500,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        counterText: '',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.accent500,
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.accent500,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          onPressed: _resetInput,
                          child: const Text('Reset'),
                        ),
                      ),
                      Expanded(
                        child: PrimaryButton(
                          onPressed: _confirmInput,
                          child: const Text('Confirm'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
