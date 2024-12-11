import 'package:journal_diary_app/model/journal.dart';

class MoodTracker {
  final String entryID;
  final MoodType moodType;
  final DateTime date;

  MoodTracker(
      {required this.entryID, required this.moodType, required this.date});

  factory MoodTracker.fromJournal(Journal journals) {
    return MoodTracker(
        entryID: journals.entryID,
        moodType: journals.mood,
        date: journals.date);
  }
}

class MoodTrackerService {
  final List<MoodTracker> moodTrackers;

  MoodTrackerService({required this.moodTrackers});

  Map<MoodType, List<MoodTracker>> categorizeMoodData() {
    Map<MoodType, List<MoodTracker>> categorizedData = {};

    for (var tracker in moodTrackers) {
      if (!categorizedData.containsKey(tracker.moodType)) {
        categorizedData[tracker.moodType] = [];
      }
      categorizedData[tracker.moodType]!.add(tracker);
    }
    return categorizedData;
  }
}
