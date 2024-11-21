import 'quiz.dart';

class Answer {
  String questionAnswer;

  Answer(this.questionAnswer);

  bool isCorrect(Question question) {
    return questionAnswer == question.goodAnswer;
  }
}

class Submission {
  Map<Question, Answer> answers = {};

  int getScore() {
    int score = 0;
    for (var entry in answers.entries) {
      if (entry.value.isCorrect(entry.key)) {
        score++;
      }
    }
    return score;
  }

  Answer? getAnswerFor(Question question) {
    return answers[question];
  }

  void addAnswer(Question question, String answer) {
    answers[question] = Answer(answer);
  }

  void removeAnswer() {
    answers.clear();
  }
}
