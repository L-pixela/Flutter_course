enum Direction { north, east, south, west }
// enum can have method, constructor, instance
// _ in dart this protected/private variable

class Robot {
  int x, y;
  Direction direction;
  List directions = Direction.values;

  Robot(this.x, this.y, this.direction);
  //Conditions where the robot turn right
  void turnRight() {
    int currentIndex = directions.indexOf(direction);
    direction = directions[(currentIndex + 1) % 4];
  }

  //Conditions where the robot turn left
  void turnLeft() {
    int currentIndex = directions.indexOf(direction);
    direction = directions[(currentIndex - 1 + 4) % 4];
  }

  //Conditions where the robot advance forward
  void advanced() {
    if (direction == Direction.north) {
      y++;
    } else if (direction == Direction.east) {
      x++;
    } else if (direction == Direction.south) {
      y--;
    } else if (direction == Direction.west) {
      x--;
    }
  }

  //Movement of the Robot to the according instruction
  void movement(String instruction) {
    print("Instruction:");
    for (int i = 0; i < instruction.length; i++) {
      print("${instruction[i]}");
      if (instruction[i] == 'R') {
        turnRight();
      } else if (instruction[i] == 'L') {
        turnLeft();
      } else if (instruction[i] == 'A') {
        advanced();
      }
    }
  }

  // Final Positon Storage
  Map<String, dynamic> getPosition() {
    return {'x': x, 'y': y, 'direction': direction};
  }
}

void main() {
  // Initial position {7, 3} and facing north
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;

  // Example instruction sequence
  const instructions = "RAALAL";

  //Print Start Position
  print("Start Position: ($x,$y)\nDirection: $direction");

  // Process the instructions and get the final position and direction
  Robot walk = Robot(x, y, direction);
  walk.movement(instructions);
  var Position = walk.getPosition();
  // Print the final position and direction
  print("Final position:  (${Position['x']},${Position['y']})");
  print("Facing:  ${Position['direction']}");
}
