import 'package:flutter/material.dart';
import '../Ex4/favorite_card.dart';
import '../Ex4/data/jokes.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: FavoriteJokeCard()));

class FavoriteJokeCard extends StatefulWidget {
  const FavoriteJokeCard({super.key});

  @override
  State<FavoriteJokeCard> createState() => _FavoriteJokeCardState();
}

class _FavoriteJokeCardState extends State<FavoriteJokeCard> {
  int? _isFavorite;

  void _onFavoriteClick(int index) {
    setState(() {
      _isFavorite = _isFavorite == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: ListView.builder(
        itemCount: myJokes.tiles.length,
        itemBuilder: (context, index) {
          var tile = myJokes.tiles[index];
          return FavoriteCard(
              jokes: tile.title,
              description: tile.description,
              isFavorite: _isFavorite == index,
              onFavoriteClick: () => _onFavoriteClick(index));
        },
      ),
    );
  }
}
