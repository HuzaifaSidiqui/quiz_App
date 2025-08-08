import 'package:flutter/material.dart';
import 'package:quiz_app/main_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/answer_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  // void initState() {
  //   activeScreen = MainScreen(switchScreen);
  //   super.initState();
  // }

  List<String> selectedAnswer = [];
  var activeScreen = 'main_screen';

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen = 'question_screen';
    });
  }

  void chosenAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'answer_screen';
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 82, 24, 177),
                Color.fromARGB(255, 38, 2, 100),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen == 'answer_screen'
              ? AnswerScreen(chosenAnswer: selectedAnswer)
              : activeScreen == 'main_screen'
              ? MainScreen(switchScreen)
              : QuestionsScreen(onSelectAnswer: chosenAnswer),
        ),
      ),
    );
  }
}
