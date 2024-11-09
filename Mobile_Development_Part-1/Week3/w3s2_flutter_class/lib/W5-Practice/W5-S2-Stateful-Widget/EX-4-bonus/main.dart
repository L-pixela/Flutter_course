import 'package:flutter/material.dart';
import 'ex_4_bonus.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 56, 201, 63),
        appBar: AppBar(
          title: Text(
            'Progress Bar',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[600],
          elevation: 4,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              ProgressBarWiget(
                title: "Flutter",
              ),
              ProgressBarWiget(
                title: "Database",
              ),
              ProgressBarWiget(
                title: "Score",
              ),
              ProgressBarWiget(
                title: "Skills",
              ),
              ProgressBarWiget(
                title: "Run",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
