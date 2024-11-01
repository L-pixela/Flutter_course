import 'custom_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Custom Button",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: const Column(
          children: [
            CustomButton(
              label: "RUN",
              icons: Icons.run_circle,
              iconPosition: IconPosition.right,
              buttonType: Button.disabled,
            ),
            CustomButton(
                label: "WALK",
                iconPosition: IconPosition.right,
                icons: Icons.nordic_walking_rounded),
            CustomButton(
              label: "JAVASCRIPT",
              icons: Icons.javascript,
              buttonType: Button.secondary,
            )
          ],
        )),
  ));
}
