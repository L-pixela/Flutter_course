import 'package:flutter/material.dart';
import 'package:journal_diary_app/widgets/app_button.dart';

class WelcomePage extends StatelessWidget {
  final Function(BuildContext) onChangeScreen;
  const WelcomePage({super.key, required this.onChangeScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 3,
            ),
            Image.asset(
              "welcome_mockup/notebook.png",
              width: 150,
              height: 150,
            ),
            Spacer(
              flex: 2,
            ),
            AppButton(
                onTap: () => onChangeScreen(context),
                buttonTitle: "Let's get Started!"),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
