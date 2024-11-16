class JokesModel {
  List<JokeTile> tiles;

  JokesModel({required this.tiles});
}

class JokeTile {
  String title;
  String description;

  JokeTile({required this.title, required this.description});
}
