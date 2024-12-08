import 'package:flutter/material.dart';
import 'package:journal_diary_app/database/data.dart';
import 'package:journal_diary_app/model/journal.dart';

class JournalContent extends StatefulWidget {
  final Journal journals;
  final TextEditingController controller;
  const JournalContent(
      {super.key, required this.journals, required this.controller});

  @override
  State<JournalContent> createState() => _JournalContentState();
}

class _JournalContentState extends State<JournalContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Journal"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: widget.controller,
            )
          ],
        ),
      ),
    );
  }
}
