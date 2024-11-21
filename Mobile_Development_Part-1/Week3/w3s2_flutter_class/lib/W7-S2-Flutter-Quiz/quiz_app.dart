import 'package:flutter/material.dart';
import 'package:w3s2_flutter_class/W7-S2-Flutter-Quiz/screens/welcome_screen.dart';
import 'model/quiz.dart';
import 'screens/result_screen.dart';
import 'screens/question_screen.dart';
import 'model/submission.dart';

Color appColor = Colors.blue[500] as Color;

enum QuizState { notStarted, started, finished }

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState _quizState = QuizState.notStarted;
  int currentQuestionIndex = 0;
  Submission _submission = Submission();

  Widget get getQuizState {
    if (_quizState == QuizState.notStarted) {
      return WelcomeScreen(
        onPressed: _startQuiz,
      );
    } else if (_quizState == QuizState.started) {
      return QuestionScreen(
        question: widget.quiz.questions[currentQuestionIndex],
        onAnswered: _answerQuestion,
      );
    } else if (_quizState == QuizState.finished) {
      return ResultScreen(
        onPressed: _finishQuiz,
        score: _submission.getScore(),
        submission: _submission,
        quiz: widget.quiz,
      );
    }
    return WelcomeScreen(
      onPressed: _startQuiz,
    );
  }

  void _startQuiz() {
    setState(() {
      _quizState = QuizState.started;
      currentQuestionIndex = 0;
      _submission = Submission();
    });
  }

  void _answerQuestion(String answer) {
    Question currentQuestion = widget.quiz.questions[currentQuestionIndex];
    _submission.addAnswer(currentQuestion, answer);

    setState(() {
      if (currentQuestionIndex < widget.quiz.questions.length - 1) {
        currentQuestionIndex++;
      } else {
        _quizState = QuizState.finished;
      }
    });
  }

  void _finishQuiz() {
    setState(() {
      _quizState = QuizState.notStarted;
      currentQuestionIndex = 0;
      _submission.answers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[getQuizState],
          ),
        ),
      ),
    );
  }
}
