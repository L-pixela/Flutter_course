import 'package:flutter/material.dart';
import '../model/profile_tile_model.dart';

ProfileData myProfile = ProfileData(
    name: "Sovatanak",
    position: "Flutter Developer",
    avatarUrl: 'assets/W6-S2-images/pikachu.jpg',
    tiles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(
          icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(
          icon: Icons.email,
          title: "Mail",
          value: "sovatanak@student.cadt.edu.kh"),
      TileData(
          icon: Icons.flutter_dash,
          title: "Flutter",
          value: "Flutter is what makes this app."),
      TileData(icon: Icons.house, title: "Jokes", value: "Blue House"),
    ]);
