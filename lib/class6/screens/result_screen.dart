import 'package:bdapps/class6/models/question.dart';
import 'package:bdapps/class6/models/quiz_result.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final QuizResult result;
  final List<Question> questions;
  const ResultScreen({
    super.key,
    required this.result,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Your Score: ${result.totalScore}/${result.maxScore}',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
