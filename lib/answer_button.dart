import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.buttonLabel, required this.onPressAnswer});

  final String buttonLabel;
  final void Function() onPressAnswer;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onPressAnswer,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 46, 16, 128),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10)
      ),
      child: Text(buttonLabel),
    );
  }
}
