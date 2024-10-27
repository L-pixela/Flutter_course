import 'package:flutter/material.dart';

void main() {
  runApp(const Exercise3());
}

class Exercise3 extends StatelessWidget {
  const Exercise3({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
          child: Column(
        children: [
          CustomCard(
            text: 'Button 1!!!!!',
            start: Colors.purple,
            end: Colors.orange,
          ),
          CustomCard(
            text: 'Button 2!!!!!',
            start: Colors.orange,
            end: Colors.green,
          ),
          CustomCard(
            text: 'Button 3!!!!!',
            start: Colors.red,
            end: Colors.blue,
          ),
          CustomCard(
            text: 'Button 4!!!!!',
            start: Colors.pink,
            end: Colors.purple,
          ),
          CustomCard(
            text: 'Button 5!!!!!',
            start: Colors.blue,
            end: Colors.green,
          ),
          CustomCard(text: 'Button 6!!!!!'),
        ],
      )),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color start;
  final Color end;
  const CustomCard(
      {super.key,
      required this.text,
      this.start = Colors.brown,
      this.end = Colors.green});
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
