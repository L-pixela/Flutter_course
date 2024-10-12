class Bracket {
  String s;
  List brackets = [];
  Bracket(this.s);
  //Test String if it has bracket or not.
  bool testString(String s) {
    int round = 0, curly = 0, square = 0;
    for (int i = 0; i < s.length; i++) {
      String char = s[i];
      if (char == '(') {
        round++;
        brackets.add(1);
      } else if (char == ')') {
        round--;
        if (brackets.isEmpty || brackets.removeLast() != 1) return false;
      } else if (char == '{') {
        curly++;
        brackets.add(2);
      } else if (char == '}') {
        curly--;
        if (brackets.isEmpty || brackets.removeLast() != 2) return false;
      } else if (char == '[') {
        square++;
        brackets.add(3);
      } else if (char == ']') {
        square--;
        if (brackets.isEmpty || brackets.removeLast() != 3) return false;
      }
      if (round < 0 || curly < 0 || square < 0) return false;
    }
    return round == 0 && curly == 0 && square == 0;
  }
}

void main() {
  String run = "[{good}]";

  Bracket test = Bracket(run);
  if (test.testString(run) == true) {
    print("Balanced!");
  } else {
    print("UnBalanced!");
  }
}
