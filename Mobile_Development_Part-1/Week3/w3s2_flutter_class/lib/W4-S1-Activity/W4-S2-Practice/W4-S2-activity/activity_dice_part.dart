import 'dart:math';
import 'package:flutter/material.dart';

const String diceImage2 = 'assets/dice-w4-s2/dice-2.png';
const String diceImage4 = 'assets/dice-w4-s2/dice-4.png';

List<String> diceImage = [
  'assets/dice-w4-s2/dice-1.png',
  'assets/dice-w4-s2/dice-2.png',
  'assets/dice-w4-s2/dice-3.png',
  'assets/dice-w4-s2/dice-4.png',
  'assets/dice-w4-s2/dice-5.png',
  'assets/dice-w4-s2/dice-6.png',
];

Random random = Random();
String activeDiceImage = diceImage[random.nextInt(diceImage.length)];

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  void rollDice() {
    setState(() {
      activeDiceImage = diceImage[random.nextInt(diceImage.length)];
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeDiceImage,
          width: 200,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Roll Dice'),
        )
      ],
    );
  }
}

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(child: DiceRoller()),
      ),
    ));
