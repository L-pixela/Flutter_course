import 'package:journal_diary_app/model/journal.dart';

class MoodTracker {
  final String entryID;
  final MoodType moodType;
  final DateTime date;

  MoodTracker(
      {required this.entryID, required this.moodType, required this.date});
}
