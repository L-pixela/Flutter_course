import 'package:flutter/material.dart';

void main() {
  runApp(const Exercise3());
}

class Exercise3 extends StatelessWidget {
  const Exercise3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
          child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.blue[100],
            ),
            child: const Text(
              "OOP",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  decoration: TextDecoration.none),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.blue[300],
            ),
            child: const Text(
              "DART",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  decoration: TextDecoration.none),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                gradient:
                    const LinearGradient(colors: [Colors.blue, Colors.purple])),
            child: const Text(
              "FLUTTER",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  decoration: TextDecoration.none),
            ),
          ),
        ],
      )),
    );
  }
}

class GradiantButton extends StatelessWidget {
  final String text;
  final Color start;
  final Color end;
  const GradiantButton(
      {super.key, required this.text, required this.start, required this.end});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          gradient: LinearGradient(colors: [start, end])),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 35, decoration: TextDecoration.none),
      ),
    );
  }
}
