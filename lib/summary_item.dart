import 'package:flutter/material.dart';
import 'package:quiz_app/question_identifier.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});
  final Map<String, Object> itemData;

  // int getIntValue(Map<String, Object> map, String key, {int defaultValue = 0}) {
  //   final value = map[key];
  //   if (value is int) return value;
  //   if (value is String) return int.tryParse(value) ?? defaultValue;
  //   return defaultValue;
  // }

  @override
  Widget build(context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer,
          questionIndex: itemData['question_index'] as int,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                itemData['user_answer'] as String,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 114, 71, 233),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                itemData['correct_answer'] as String,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 114, 71, 233),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
