import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.isCorrectAnswer,
    required this.questionIndex,
  });

  final bool isCorrectAnswer;
  final int questionIndex;

  @override
  Widget build(context) {
    int questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer ? Colors.blue[200] : Colors.pink[200],
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNumber.toString(),
        style: GoogleFonts.lato(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
