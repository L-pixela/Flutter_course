import 'package:journal_diary_app/model/mood_tracker.dart';

import '../model/journal.dart';

List<Journal> journals = [
  Journal(
    title: "Journal 1",
    content:
        "this is for testing, this is for testing, this is for testing, this is for testing",
    mood: MoodType.happy,
  ),
  Journal(
    title: "Journal 2",
    content: "this is for testing1",
    mood: MoodType.mad,
  ),
  Journal(
    title: "Journal 3",
    content: "this is for testing2",
    mood: MoodType.sad,
  ),
];

List<MoodTracker> moodTrackers = [];
