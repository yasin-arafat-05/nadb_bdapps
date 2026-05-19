class Questions {
  final String text;
  final List<String> options;
  final int correctAns;
  int? _userAnswer;

  Questions({
    required this.text,
    required this.options,
    required this.correctAns,
  });

  bool get isCorrect => _userAnswer == correctAns;
  bool get isAnswered => _userAnswer != null;

  // get is the user is answer or not
  void answer(int index) {
    if (!isAnswered) _userAnswer = index;
  }
}


class QuizEngine {
  final List<Questions> _questions;
  int _current = 0;

  QuizEngine(this._questions);
  // Named constructor for demo questions:
  factory QuizEngine.demo() {
    return QuizEngine([
      Questions(
        text: 'Capital of Bangladesh?',
        options: ['Dhaka', 'Chittagong', 'sylet'],
        correctAns: 0,
      ),
      Questions(
        text: 'What is 7*8?',
        options: ['63', '42', '56'],
        correctAns: 2,
      ),
    ]);
  }

  Questions get current => _questions[_current];
  bool get hasNext => _current < _questions.length - 1;
  bool get isFinished => _current >= _questions.length;

  void submitanswer(){
    
  }

}

class QuizeResult {
  final int score;
  final int total;
  QuizeResult(this.score, this.total);
  String get summery => 'Your schored $score/$total';
}

void main() {}
