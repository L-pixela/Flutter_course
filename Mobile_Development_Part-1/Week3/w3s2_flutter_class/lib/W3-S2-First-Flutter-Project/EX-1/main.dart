import 'package:flutter/material.dart';

void main() {
  runApp(const Week1());
}

class Week1 extends StatelessWidget {
  const Week1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Walk Home!',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Walk the Path!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.lightBlue,
        ),
        body: Center(
          child: Container(
              margin:
                  const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Yep, This is the Pathway.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
