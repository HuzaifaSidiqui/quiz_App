import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/summary_data.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerScreen extends StatelessWidget {
  const AnswerScreen({
    super.key,
    required this.chosenAnswer,
    required this.onRestart,
  });
  final List<String> chosenAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final getData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = getData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(color: Colors.white, fontSize: 22),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            SummaryData(getData),
            SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              icon: Icon(Icons.refresh),
              label: Text('Restart Quiz!!!'),
            ),
          ],
        ),
      ),
    );
  }
}
