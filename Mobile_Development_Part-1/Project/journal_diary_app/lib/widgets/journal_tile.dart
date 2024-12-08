import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/journal.dart';

class JournalTile extends StatelessWidget {
  final Journal journals;
  const JournalTile({super.key, required this.journals});

  final TextStyle _titleStyle = const TextStyle(
      fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold);

  final TextStyle _contentStyle =
      const TextStyle(fontSize: 14, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.cyan,
        elevation: 3,
        shadowColor: Colors.black,
        child: Row(
          children: [
            Container(
              width: 70,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat.MMM().format(journals.date).toUpperCase(),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat('EEE').format(journals.date).toUpperCase(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat.y().format(journals.date),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(
                width: 100,
                child: Center(
                  child: Text(
                    journals.title,
                    style: _titleStyle,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  journals.content,
                  style: _contentStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Image.asset(
                journals.mood.icons,
                width: 50,
                height: 50,
              ),
            )
          ],
        ));
  }
}
