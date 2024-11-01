import 'package:flutter/material.dart';

enum Button {
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  final Color _colors;
  Color get colors => _colors;
  const Button(this._colors);
}

enum IconPosition { right, left }

class CustomButton extends StatelessWidget {
  final Button buttonType;
  final String label;
  final IconData icons;
  final IconPosition iconPosition;

  const CustomButton(
      {super.key,
      required this.label,
      required this.icons,
      this.iconPosition = IconPosition.left,
      this.buttonType = Button.primary});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: buttonType.colors,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: iconPosition == IconPosition.left
                ? [
                    Icon(
                      icons,
                      color: Colors.black,
                    ),
                    Text(
                      label,
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ]
                : [
                    Text(
                      label,
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    Icon(
                      icons,
                      color: Colors.black,
                    ),
                  ],
          ),
        )
      ],
    );
  }
}
