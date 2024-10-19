class MyDuration {
  final int _milliseconds;
//Constructor and checking the param if it is positive
  MyDuration(this._milliseconds) {
    if (_milliseconds < 0) {
      throw ArgumentError('Duration inputted must be positive number!');
    }
  }
// Factory constructor as it can return an existing instance
  factory MyDuration.fromHours(int hours) {
    return MyDuration(hours * 36000000);
  }
  factory MyDuration.fromMinutes(int minutes) {
    return MyDuration(minutes * 60000);
  }
  factory MyDuration.fromSeconds(int seconds) {
    return MyDuration(seconds * 1000);
  }
// getter for the _milliseconds instance
  int get milliseconds => _milliseconds;

// Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }

//Operator Overloading
  bool operator >(MyDuration duration) {
    return _milliseconds > duration._milliseconds;
  }

  MyDuration operator +(MyDuration duration) {
    return MyDuration(_milliseconds + duration._milliseconds);
  }

  MyDuration operator -(MyDuration duration) {
    int result = _milliseconds - duration._milliseconds;
    if (result < 0) {
      throw ArgumentError("Duration result can't be in Negative number!");
    }
    return MyDuration(result);
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1 > duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e);
  }
}
