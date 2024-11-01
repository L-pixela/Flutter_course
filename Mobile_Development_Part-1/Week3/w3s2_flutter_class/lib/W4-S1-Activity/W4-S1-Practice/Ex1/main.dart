import 'package:flutter/material.dart';
import 'my_button.dart';

class Exercise1 extends StatelessWidget {
  const Exercise1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                "My Hobbies",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              centerTitle: true,
              backgroundColor: Colors.blue[500],
            ),
            body: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HobbyCard(
                  text: 'Flutter',
                  icons: Icons.flutter_dash,
                  colors: Colors.amber,
                ),
                HobbyCard(
                  text: 'Running',
                  icons: Icons.run_circle,
                ),
                HobbyCard(
                  text: 'Walk',
                  icons: Icons.run_circle_sharp,
                  colors: Colors.brown,
                ),
              ],
            )));
  }
}

void main() {
  runApp(const Exercise1());
}
