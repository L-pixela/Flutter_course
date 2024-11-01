import 'package:flutter/material.dart';
import 'gradiant_button.dart';

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
