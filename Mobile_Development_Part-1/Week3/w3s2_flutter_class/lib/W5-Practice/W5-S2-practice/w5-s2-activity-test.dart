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
            color: Colors.blue[800],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Container(
                height: 100,
                color: Colors.green[800],
              )),
              Container(
                height: 100,
                width: 100,
                color: Colors.pink[400],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Colors.yellow[800],
                  )),
              Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Colors.yellow[800],
                  )),
              Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Colors.yellow[800],
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            color: Colors.pink[400],
          ))
        ],
      ),
    ),
  ));
}
