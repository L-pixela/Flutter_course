import 'package:flutter/material.dart';

class ProgressBarWiget extends StatefulWidget {
  final String title;
  const ProgressBarWiget({
    super.key,
    required this.title,
  });

  @override
  State<ProgressBarWiget> createState() => _ProgressBarWiget();
}

class _ProgressBarWiget extends State<ProgressBarWiget> {
  double _progress = 0;

  Color? get _progressColor {
    int colorValue = _progress.toInt() * 100;
    if (_progress == 10) {
      return Colors.green;
    } else {
      return Colors.blue[colorValue];
    }
  }

  void _incrementProgress() {
    setState(() {
      if (_progress < 10) {
        _progress++;
      }
    });
  }

  void _decrementProgress() {
    setState(() {
      if (_progress > 0) {
        _progress--;
      }
    });
  }

  void sliderProgress(double index) {
    setState(() {
      _progress = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: FittedBox(
        child: Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(top: 20, bottom: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 3)]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _decrementProgress,
                      icon: Icon(Icons.keyboard_arrow_down),
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: IconButton(
                        onPressed: _incrementProgress,
                        icon: Icon(Icons.keyboard_arrow_up),
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Score Rate: ${_progress.round().toString()}",
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 16,
                      fontWeight: FontWeight.w200),
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: 400,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  Container(
                    width: 40 * _progress,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(),
                        color: _progressColor),
                  ),
                ],
              ),
              Slider(
                  activeColor: Colors.blue[900],
                  inactiveColor: Colors.black,
                  value: _progress,
                  min: 0,
                  max: 10,
                  label: _progress.round().toString(),
                  onChanged: (double value) {
                    sliderProgress(value);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
