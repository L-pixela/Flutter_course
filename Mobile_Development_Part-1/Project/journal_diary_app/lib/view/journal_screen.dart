import 'package:flutter/material.dart';
import 'package:journal_diary_app/model/journal.dart';
import 'package:journal_diary_app/widgets/app_button.dart';
import 'package:journal_diary_app/widgets/journal_entry.dart';
import 'package:journal_diary_app/widgets/journal_tile.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../database/data.dart';
import 'package:intl/intl.dart';

import '../widgets/mood_indicator.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Journal",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 2,
        automaticallyImplyLeading: false,
        actions: [
          Icon(Icons.calendar_month),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              DateFormat.yMd().format(DateTime.now()),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Journal Page!",
                  style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  DynamicCircularPercentIndicator(
                    moods: [
                      {'label': 'Item 1', 'percent': 0.3, 'color': Colors.blue},
                      {'label': 'Item 2', 'percent': 0.2, 'color': Colors.red},
                      {
                        'label': 'Item 3',
                        'percent': 0.5,
                        'color': Colors.green
                      },
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Something"),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: journals.length,
                  itemBuilder: (context, index) =>
                      JournalTile(journals: journals[index]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  shape: CircleBorder(),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => JournalEntry()));
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
