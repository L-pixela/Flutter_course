import 'package:flutter/material.dart';

class HobbyCard extends StatelessWidget {
  final String text;
  final Color colors;
  final IconData icons;

  const HobbyCard(
      {super.key,
      required this.text,
      required this.icons,
      this.colors = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: colors),
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
      child: Center(
        child: Row(
          children: [
            Icon(
              icons,
              size: 30,
            ),
            const Padding(padding: EdgeInsets.only(right: 15, left: 10)),
            Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
