enum Position {
  top("Top of"),
  left("Left side"),
  right("Right Side"),
  behind("Behind of"),
  next_to("Next to"),
  front("Front of");

  final String position;
  const Position(this.position);
  String toString() => position;
}

// Class Tree
class Tree {
  String type;
  double height;
  Position position;
  Tree(
      {required this.type,
      required this.height,
      this.position = Position.next_to});
}

class Window {
  String type;
  double width;
  double height;
  String color;
  Position position;
  Window(
      {required this.type,
      required this.width,
      required this.height,
      required this.color,
      this.position = Position.front});
}

class Door {
  String type;
  double width;
  double height;
  String color;
  Position position;
  Door(
      {required this.type,
      required this.width,
      required this.height,
      required this.color,
      this.position = Position.front});
}

class Roof {
  String type;
  String color;
  Position position;
  Roof({required this.type, required this.color, this.position = Position.top});
}

// Class House
class House {
  String address;
  List<Tree> trees = []; // by default empty
  List<Window> window = [];
  List<Roof> roof = [];
  List<Door> door = [];

  House(this.address);

  void addTree(Tree newTree) {
    this.trees.add(newTree);
  }

  void addWindow(Window newWindow) {
    this.window.add(newWindow);
  }

  void addRoof(Roof newRoof) {
    this.roof.add(newRoof);
  }

  void addDoor(Door newDoor) {
    this.door.add(newDoor);
  }

  @override
  String toString() {
    return "Address : $address";
  }
}

void main() {
  Tree appleTree = new Tree(type: "Apple", height: 2);
  Door h1Door = new Door(type: "Normal", width: 1, height: 2, color: "Wooden");
  Window w1 =
      new Window(type: "Sliding", height: 0.5, width: 2, color: "White");
  Roof houseRoof = Roof(type: 'Gable', color: 'Gray');

  House h1 = new House("Phnom Penh");
  h1.addDoor(h1Door);
  h1.addRoof(houseRoof);
  h1.addTree(appleTree);
  h1.addWindow(w1);

  print('House Address: ${h1.address}');
  print('Trees: ${h1.trees.map((tree) => tree.type).join(', ')}');
  print('Windows: ${h1.window.map((window) => window.color).join(', ')}');
  print('Doors: ${h1.door.map((door) => door.color).join(', ')}');
  print('Roofs: ${h1.roof.map((roof) => roof.color).join(', ')}');
}
