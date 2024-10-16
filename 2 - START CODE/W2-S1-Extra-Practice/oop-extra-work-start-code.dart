// Class Tree
class Tree {
  String type;
  double height;

  Tree(this.type, this.height);
}

class Window {
  String type;
  double width;
  double height;
  String color;
  Window(this.type, this.width, this.height, this.color);
}

class Door {
  String type;
  double width;
  double height;
  String color;
  Door(this.type, this.width, this.height, this.color);
}

class Roof {
  String type;
  String color;
  Roof(this.type, this.color);
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
  Tree appleTree = new Tree("Apple", 2);
  Door h1Door = new Door("Normal", 1, 2, "Wooden");
  Window w1 = new Window("Sliding", 2, 1.5, "White");
  Roof houseRoof = Roof('Gable', 'Gray');

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
