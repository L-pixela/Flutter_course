import 'package:flutter/material.dart';

void main() {
  runApp(const Exercise2());
}

class Exercise2 extends StatelessWidget {
  const Exercise2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Runner!',
      home: Container(
        color: Colors.blue[300],
        padding: const EdgeInsets.all(50),
        margin: const EdgeInsets.all(40),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue[500],
          ),
          child: const Center(
            child: Text(
              'CADT STUDENTS',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
