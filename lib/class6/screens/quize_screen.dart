import 'package:bdapps/class6/data/question_data.dart';
import 'package:bdapps/class6/models/question.dart';
import 'package:bdapps/class6/models/quiz_result.dart';
import 'package:bdapps/class6/screens/result_screen.dart';
import 'package:bdapps/class6/theme/app_theme.dart';
import 'package:bdapps/class6/widgets/answer_buttons.dart';
import 'package:flutter/material.dart';

class QuizeScreen extends StatefulWidget {
  const QuizeScreen({super.key});

  @override
  State<QuizeScreen> createState() => _QuizeScreenState();
}

class _QuizeScreenState extends State<QuizeScreen> {
  int _currentIndex = 0;
  int _score = 0;
  int? _selectedIndex;
  bool _answered = false;
  Question? _currentQuestion;
  final List<AnswerRecord> _records = [];
  final List<Question> questions = QuestionData.flutterQuestion;

  void _selectAnswer(int index) {
    if (_answered) return;

    final isCorrect = index == _currentQuestion!.correctIndex;
    final points = isCorrect ? _currentQuestion!.difficulty.points : 0;

    setState(() {
      _selectedIndex = index;
      _answered = true;
      _score += points;
    });

    _records.add(
      AnswerRecord(
        questionId: _currentQuestion!.id,
        selectedIndex: index,
        correctIndex: _currentQuestion!.correctIndex,
        isCorrect: isCorrect,
        pointsEarned: points,
      ),
    );
  }

  void _nextQuestion() {
    if (_currentIndex < questions.length - 1) {
      setState(() {
        _currentIndex++;
        _currentQuestion = questions[_currentIndex];
        _selectedIndex = null;
        _answered = false;
      });
    } else {
      _finishQuiz();
    }
  }

  void _finishQuiz() {
    final maxScore = questions.fold<int>(
      0,
      (sum, q) => sum + q.difficulty.points,
    );

    final result = QuizResult(
      totalQuestions: questions.length,
      correctAnswers: _records.where((r) => r.isCorrect).length,
      totalScore: _score,
      maxScore: maxScore,
      answers: _records,
    );

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (_, _, _) =>
            ResultScreen(result: result, questions: questions),
        transitionsBuilder: (_, animation, _, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  AnswerState _stateForOption(int index) {
    if (!_answered) return AnswerState.neutral;
    if (index == _currentQuestion!.correctIndex) {
      return _selectedIndex == index
          ? AnswerState.correct
          : AnswerState.revealed;
    }
    if (index == _selectedIndex) return AnswerState.wrong;
    return AnswerState.neutral;
  }

  static const List<String> _letters = ['A', 'B', 'C', 'D'];

  @override
  void initState() {
    super.initState();
    _currentQuestion = questions[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _currentIndex == questions.length - 1;
    return Scaffold(
      appBar: AppBar(title: Text("Quize")),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppTheme.primaryBlue,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Quize",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: 'Nunito',
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE8EDF8)),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryBlue.withAlpha(60),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tags row
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F4FF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '+${_currentQuestion!.difficulty.points} pts',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.primaryBlue,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // Question text
                  Text(
                    'Q${_currentIndex + 1}. ${_currentQuestion!.text}',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0D1B2A),
                      fontFamily: 'Nunito',
                      height: 1.4,
                    ),
                  ),

                  // Answer options
                  ...List.generate(
                    _currentQuestion!.options.length,
                    (i) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: AnswerButtons(
                        label: _currentQuestion!.options[i],
                        optionLetter: _letters[i],
                        state: _stateForOption(i),
                        ontap: () => _selectAnswer(i),
                      ),
                    ),
                  ),
                  if (_answered)
                    ElevatedButton(
                      onPressed: _nextQuestion,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(isLast ? 'See Results' : 'Next Question'),
                          const SizedBox(width: 8),
                          Icon(
                            isLast
                                ? Icons.emoji_events_rounded
                                : Icons.arrow_forward_rounded,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
