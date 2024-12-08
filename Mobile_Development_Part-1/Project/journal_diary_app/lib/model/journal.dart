import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum MoodType {
  happy(moodType: "Happy", icons: "mood_emoji/happy.png", color: Colors.green),
  mad(moodType: "Mad", icons: "mood_emoji/mad.webp", color: Colors.red),
  sad(moodType: "Sad", icons: "mood_emoji/sad.png", color: Colors.blue),
  upset(
      moodType: "Upset",
      icons: "mood_emoji/happy.png",
      color: Colors.lightBlue),
  unfair(
      moodType: "Unfair", icons: "mood_emoji/happy.png", color: Colors.yellow);

  final String moodType;
  final String icons;
  final Color color;

  const MoodType(
      {required this.moodType, required this.icons, required this.color});

  @override
  String toString() => moodType;
}

class Journal {
  static var uuid = Uuid();

  final String entryID;
  final String title;
  final DateTime date;
  final String content;
  final MoodType mood;

  Journal({
    required this.title,
    required this.content,
    required this.mood,
  })  : entryID = uuid.v4(),
        date = DateTime.now();
}
