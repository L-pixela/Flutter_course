import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonTitle;
  const AppButton({super.key, required this.onTap, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.cyan),
            foregroundColor: WidgetStatePropertyAll(Colors.cyanAccent)),
        onPressed: onTap,
        child: Text(
          buttonTitle,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ));
  }
}
