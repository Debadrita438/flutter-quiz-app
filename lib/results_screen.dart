import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers, required this.onSelectRestart});

  final List<String> chosenAnswers;
  final void Function() onSelectRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'selected_answer': chosenAnswers[i],
        'correct_answer': questions[i].answers[0]
      });
    }
    return summary;
  }

  void onPressRestart() {
      onSelectRestart();
    }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numCorrectQuestions = summaryData
        .where((element) =>
            element['selected_answer'] == element['correct_answer'])
        .length;

    

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answered $numCorrectQuestions out of ${questions.length} questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 212, 186, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onPressRestart,
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              label: Text(
                'Restart Quiz!',
                style: GoogleFonts.lato(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
