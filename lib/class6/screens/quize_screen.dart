import 'package:bdapps/class6/data/question_data.dart';
import 'package:bdapps/class6/models/question.dart';
import 'package:bdapps/class6/models/quiz_result.dart';
import 'package:flutter/material.dart';

class QuizeScreen extends StatefulWidget {
  const QuizeScreen({super.key});

  @override
  State<QuizeScreen> createState() => _QuizeScreenState();
}

class _QuizeScreenState extends State<QuizeScreen> {
  int currentIndex = 0;
  int _score = 0;
  int? _selectedIndex;
  bool _answered = false;
  Question? currentQuestion;
  final List<AnswerRecord> _records = [];
  final List<Question> questions = QuestionData.flutterQuestion;

  @override
  void initState() {
    super.initState();
    Question currentQuestion = questions[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quize")),
      body: Column(
        children: [
          Text("Question Text"),
          Row(
            children: List.generate(4, (index) {
              return Container(
                child: Row(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.green),
                      child: Text("Option $index"),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
