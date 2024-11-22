import 'package:flutter/material.dart';
import 'package:w3s2_flutter_class/W7-S2-Flutter-Quiz/widgets/app_button.dart';
import '../model/quiz.dart';
import '../model/submission.dart';

Iterable<Widget> _buildAnswer(Question question, Submission submission) {
  Answer? userAnswer = submission.getAnswerFor(question);
  return question.possibleAnswers.map((answer) {
    bool isCorrect = answer == question.goodAnswer;
    bool isUserAsnwer =
        userAnswer != null && userAnswer.questionAnswer == answer;
    return Row(
      children: [
        SizedBox(
          width: 15,
        ),
        Text(
          answer,
          style: TextStyle(
              color: answer == question.goodAnswer ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10,
        ),
        if (isUserAsnwer)
          Icon(
            isCorrect ? Icons.check : Icons.close,
            color: isCorrect ? Colors.green : Colors.red,
          ),
      ],
    );
  }).toList();
}

Widget _buildQuiz(Quiz quiz, Submission submission) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: quiz.questions.length,
    itemBuilder: (context, index) {
      final question = quiz.questions[index];
      final userAnswer = submission.getAnswerFor(question);
      final isCorrect = userAnswer != null && userAnswer.isCorrect(question);

      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${index + 1}",
                    style: TextStyle(
                        fontSize: 12,
                        color: isCorrect ? Colors.green : Colors.red),
                    textScaler: TextScaler.linear(5),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(question.title,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ..._buildAnswer(question, submission),
          SizedBox(
            height: 20,
          )
        ],
      );
    },
  );
}

class ResultScreen extends StatelessWidget {
  final VoidCallback onPressed;
  final int score;
  final Submission submission;
  final Quiz quiz;
  const ResultScreen(
      {super.key,
      required this.onPressed,
      required this.score,
      required this.submission,
      required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'You got: $score out of ${quiz.questions.length} pts',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        SizedBox(height: 20),
        Container(
            height: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            margin: EdgeInsets.only(bottom: 20, top: 10, left: 10, right: 10),
            padding: EdgeInsets.all(8),
            child: _buildQuiz(quiz, submission)),
        SizedBox(height: 20),
        AppButton(icon: Icons.restore, "Reset Quiz", onTap: onPressed),
      ],
    );
  }
}
