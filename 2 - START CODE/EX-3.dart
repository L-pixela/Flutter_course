void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  // You code
  var passedStudent = scores.where((scores) => scores >= 50);
  print(
      " ${passedStudent.toList()} \n ${passedStudent.length} Students Passed!");
}
