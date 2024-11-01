import 'package:flutter/material.dart';
import 'my_card.dart';

void main() {
  runApp(const Exercise2());
}

class Exercise2 extends StatelessWidget {
  const Exercise2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Dev",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Mycard(product: Product.dart),
              Mycard(product: Product.firebase),
              Mycard(product: Product.flutter),
            ],
          )),
    );
  }
}
