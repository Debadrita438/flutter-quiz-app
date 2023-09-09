import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 80),
          ),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 220, 183, 245),
              fontSize: 24,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
