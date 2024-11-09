// ignore_for_file: file_names

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Cooking Widget",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.pink,
            elevation: 2,
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: Colors.green, height: 200),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: Colors.blue, height: 200),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: Colors.red, height: 1000),
                )
              ],
            ),
          ),
        )),
  );
}
