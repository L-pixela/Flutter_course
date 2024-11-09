// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final String title;
  final String description;
  const FavoriteButton(
      {super.key, required this.title, required this.description});

  @override
  State<FavoriteButton> createState() =>
      _FavoriteButtonState(title, description);
}

class _FavoriteButtonState extends State<FavoriteButton> {
  String title;
  String description;

  bool isHearted = false;

  _FavoriteButtonState(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black)),
          ),
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  flex: 7,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          description,
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ])),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isHearted = !isHearted;
                    });
                  },
                  icon: isHearted
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.favorite,
                          color: Colors.grey,
                        ))
            ],
          ),
        )
      ],
    );
  }
}

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text(
              "Favorite cards",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: const [
              FavoriteButton(
                title: "Do Homework",
                description: "Mobile Application Development",
              ),
              FavoriteButton(
                title: "Read Article",
                description: "Research Methodology",
              ),
              FavoriteButton(
                title: "Write Project Proposal",
                description: "Project Management",
              ),
              FavoriteButton(
                title: "Write a Paragraph",
                description: "Design Thinking",
              ),
            ],
          )),
    ));
