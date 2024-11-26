import 'package:flutter/material.dart';
import 'package:w3s2_flutter_class/W7-S2-Flutter-Quiz/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onPressed;
  const WelcomeScreen({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/W7-S2-flutter-quiz/quiz-logo.png"),
            width: 200,
            height: 200,
          ),
          SizedBox(height: 30),
          Text("Welcome to the Quiz App"),
          SizedBox(height: 30),
          AppButton(icon: Icons.quiz, "Start Quiz", onTap: onPressed)
        ],
      ),
    );
  }
}
