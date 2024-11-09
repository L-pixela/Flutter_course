// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';

class SeasonChange extends StatefulWidget {
  final String country;

  const SeasonChange({super.key, required this.country});

  @override
  State<SeasonChange> createState() => _SeasonChangeState(country);
}

class _SeasonChangeState extends State<SeasonChange> {
  final String country;
  List<String> season = [
    "season/winter.png",
    "season/spring.png",
    "season/summer.png",
    "season/autumn.png",
  ];
  String seasonDisplay = '';
  int counter = 0;

  _SeasonChangeState(this.country);

  void changeSeason() {
    setState(() {
      counter = (counter + 1) % season.length;
      seasonDisplay = season[counter];
    });
  }

  @override
  void initState() {
    super.initState();
    seasonDisplay = season[counter];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(10),
              child: InkWell(
                onTap: changeSeason,
                child: Image(
                  image: AssetImage(seasonDisplay),
                  height: 280,
                  width: 100,
                ),
              )),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              country,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        appBar: AppBar(
          title: Text(
            "SEASONS OF COUNTRY",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                border: Border.all(color: Colors.grey)),
            height: 450,
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Seasons",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.5),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: SeasonChange(
                        country: "CAMBODIA",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: SeasonChange(country: "FRANCE"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: SeasonChange(country: "CHINA"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
  ));
}
