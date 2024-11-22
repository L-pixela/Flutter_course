import 'package:flutter/material.dart';
// import 'package:w3s2_flutter_class/W7-S2-Flutter-Quiz/widgets/app_button.dart';

import '../model/quiz.dart';

class QuestionScreen extends StatelessWidget {
  final ValueChanged<String> onAnswered;
  final Question question;
  const QuestionScreen(
      {super.key, required this.question, required this.onAnswered});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            question.title,
            style: TextStyle(
                color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        ...question.possibleAnswers.map((answer) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () => onAnswered(answer),
                child: SizedBox(
                  width: 150,
                  child: Center(
                    child: Text(
                      answer,
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
          );
        }),
        SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            onPressed: () => onAnswered(''),
            child: Text("Skip"),
          ),
        ),
      ],
    );
  }
}
