import 'package:flutter/material.dart';

void main() {
  return runApp(Looper());
}

List<int> num = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
List<String> numbers = ["Mon", "Tue", "Wed", "Thu", "Fri"];

List<Widget> getLabels() {
  return numbers.map((item) => Text(item)).toList();
}

class Looper extends StatelessWidget {
  const Looper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Looper Man",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text("Start!!!"),
            for (var i = 0; i < 10; i++) Text("$i"),
            Text("End!!!"),
            ...numbers.map((item) => Text(item)),
            ...getLabels()
          ],
        ),
      ),
    );
  }
}
