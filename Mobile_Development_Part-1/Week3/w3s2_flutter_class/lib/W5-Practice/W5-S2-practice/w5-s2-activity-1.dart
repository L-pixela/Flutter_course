// ignore_for_file: file_names

import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    home: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            height: 200,
            color: Colors.blue,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Container(
                height: 100,
                color: Colors.green,
              )),
              Container(
                color: Colors.pink,
                width: 100,
                height: 100,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Colors.yellow,
                  )),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Colors.yellow,
                  )),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Colors.yellow,
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            color: Colors.pink,
          ))
        ],
      ),
    ),
  ));
}
