import 'package:flutter/material.dart';

enum Button {
  selected("Selected", Colors.white, Color.fromARGB(255, 0, 140, 255)),
  unselected("", Colors.black, Color.fromARGB(255, 225, 242, 255));

  final String _label;
  final Color _color;
  final Color _bgColor;
  String get label => _label;
  Color get color => _color;
  Color get bgColor => _bgColor;

  const Button(this._label, this._color, this._bgColor);
}

class SelectButton extends StatefulWidget {
  const SelectButton({super.key});

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  bool isPressed = false;

  ButtonStyle style1 = ElevatedButton.styleFrom(
      textStyle: TextStyle(
          color: Button.selected.color,
          fontWeight: FontWeight.bold,
          fontSize: 28),
      backgroundColor: Button.selected.bgColor);
  ButtonStyle style2 = ElevatedButton.styleFrom(
      textStyle: TextStyle(
          color: Button.unselected.color,
          fontWeight: FontWeight.bold,
          fontSize: 28),
      backgroundColor: Button.unselected.bgColor);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                isPressed = !isPressed;
              });
            },
            style: isPressed ? style1 : style2,
            child: Center(
              child: isPressed
                  ? Text(Button.selected.label)
                  : Text(Button.unselected.label),
            )),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "SELECT BUTTON",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[500],
          elevation: 5,
        ),
        body: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SelectButton(),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SelectButton(),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SelectButton(),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SelectButton(),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SelectButton(),
              ),
            ],
          ),
        ))));
