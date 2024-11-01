import 'package:flutter/material.dart';

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
