import 'package:flutter/material.dart';
import 'package:journal_diary_app/view/journal_screen.dart';
import 'package:journal_diary_app/view/welcome_page.dart';

class JournalApp extends StatefulWidget {
  const JournalApp({super.key});

  @override
  State<JournalApp> createState() => _JournalAppState();
}

class _JournalAppState extends State<JournalApp> {
  void _onChangeScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => JournalScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Journal App',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
      ),
      home: WelcomePage(onChangeScreen: _onChangeScreen),
    );
  }
}
