enum Window {
  slide("Sliding"),
  open("Opening");

  final String win;
  const Window(this.win);
  String toString() => win;
}

enum Floor {
  first("1 Story House"),
  second("2 Story House");

  final String floor;
  const Floor(this.floor);
  String toString() => floor;
}

enum Roof {
  Round("Round"),
  Triangle("Triangle"),
  None("None");

  final String roof;
  const Roof(this.roof);
  String toString() => roof;
}

enum Position {
  top("Top of"),
  left("Left side"),
  right("Right Side"),
  behind("Behind of"),
  next_to("Next to"),
  back("Back"),
  front("Front of");

  final String position;
  const Position(this.position);
  String toString() => position;
}

enum Door {
  Slide("Slide"),
  Open("Open");

  final String door;
  const Door(this.door);
  String toString() => door;
}

// class Tree {
//   String type;

//   Tree(this.type);
//   String toString() => type;
// }
class Windows {
  Window type;
  Position position;

  Windows({this.type = Window.slide, this.position = Position.front});
  String toString() {
    return "Window: $type , Position: $position";
  }
}

class Floors {
  Floor type;
  Position position;

  Floors({this.type = Floor.first, this.position = Position.front});
  String toString() {
    return "Floors: $type , Position: $position";
  }
}

class Roofs {
  Roof type;
  Position position;

  Roofs({this.type = Roof.Triangle, this.position = Position.top});
  String toString() {
    return "Roofs: $type , Position: $position";
  }
}

class Doors {
  Door type;
  Position position;

  Doors({this.type = Door.Open, this.position = Position.front});
  String toString() {
    return "Doors: $type , Position: $position";
  }
}

class House {
  final List<Windows> window = [];
  final List<Floors> floor = [];
  final List<Roofs> roof = [];
  final List<Doors> door = [];
  final String address;

  House({required this.address});

  void addWindow(Windows newWindow) {
    this.window.add(newWindow);
  }

  void addRoof(Roofs newRoof) {
    this.roof.add(newRoof);
  }

  void addDoor(Doors newDoor) {
    this.door.add(newDoor);
  }

  String toString() {
    return "Address: $address - Window: $window - $floor - Door: $door - Roof: $roof";
  }
}

void main() {
  Doors d1 = Doors();
  Doors d2 = Doors(position: Position.back);
  Roofs r = Roofs();
  Windows w1 = Windows(position: Position.right);
  Windows w2 = Windows(position: Position.left);

  House h1 = House(address: "Phnom Penh");
  h1.addDoor(d1);
  h1.addDoor(d2);
  h1.addRoof(r);
  h1.addWindow(w1);
  h1.addWindow(w2);
  print(h1);
}
