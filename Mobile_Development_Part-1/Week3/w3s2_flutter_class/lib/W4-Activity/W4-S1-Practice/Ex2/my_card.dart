import 'package:flutter/material.dart';

enum Product {
  dart("Dart", "A Programming Language", "images/dart.png"),
  flutter("Flutter", "UI Toolkit", "images/flutter.png"),
  firebase("Firebase", "Backend Service", "images/firebase.png");

  final String _title;
  final String _description;
  final String _image;

  String get title => _title;
  String get description => _description;
  String get image => _image;

  const Product(this._title, this._description, this._image);
  @override
  String toString() => "$title, $description, $_image";
}

class Mycard extends StatelessWidget {
  final Product product;

  const Mycard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image(
            image: AssetImage(product._image),
            width: 100,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              product.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Text(
              product._description,
              style: const TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
