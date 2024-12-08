import 'package:flutter/material.dart';
import 'package:journal_diary_app/database/data.dart';
import 'package:journal_diary_app/model/journal.dart';
import 'package:journal_diary_app/view/journal_screen.dart';
import 'package:journal_diary_app/widgets/app_button.dart';

class JournalEntry extends StatefulWidget {
  const JournalEntry({super.key});

  @override
  State<JournalEntry> createState() => _JournalEntryState();
}

class _JournalEntryState extends State<JournalEntry> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  MoodType _selectedMood = MoodType.happy;

  void _saveEntry() {
    String title = _titleController.text;
    String content = _contentController.text;
    setState(() {
      if (_formKey.currentState!.validate()) {
        journals.add(Journal(
          title: title,
          content: content,
          mood: MoodType.happy,
        ));
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => JournalScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Journal",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 4,
        automaticallyImplyLeading: true,
      ),
      body: Center(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text("Journal Entry"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                    labelText: "Your Journal Title",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.title)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter title';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _contentController,
                maxLines: 15,
                decoration: InputDecoration(
                    labelText: "Content",
                    hintText: "How was your day?",
                    alignLabelWithHint: true,
                    border: OutlineInputBorder()),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: DropdownButton(
                      value: _selectedMood,
                      items: MoodType.values
                          .map<DropdownMenuItem<MoodType>>((MoodType value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Row(
                            children: [
                              Text(value.toString()),
                              SizedBox(width: 10),
                              Image.asset(
                                value.icons,
                                width: 20,
                                height: 20,
                              )
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (MoodType? value) {
                        setState(() {
                          _selectedMood = value!;
                        });
                      }),
                ),
                Expanded(child: SizedBox())
              ],
            ),
            AppButton(onTap: _saveEntry, buttonTitle: "Submit")
          ],
        ),
      )),
    );
  }
}
