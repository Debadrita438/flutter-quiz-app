import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((data) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 25,
                width: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: data['selected_answer'] == data['correct_answer']
                      ? Colors.cyan
                      : Colors.red[200],
                ),
                margin: const EdgeInsets.only(right: 15),
                child: Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 52, 14, 139),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (data['question'] as String),
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      data['selected_answer'] as String,
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 41, 23, 71),
                      ),
                    ),
                    Text(
                      data['correct_answer'] as String,
                      style: GoogleFonts.lato(
                        color: Colors.cyan,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList()),
      ),
    );
  }
}
