import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  ExpenseType? _selectedExpenseType;
  DateTime? selectedDate;
  bool isTimeSelected = false;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void onCancel() {
    Navigator.pop(context);
  }

  void onSubmit() {
    final String title = _titleController.text;
    final double amount = double.parse(_amountController.text);

    Expense expense = Expense(
        title: title,
        amount: amount,
        date: selectedDate!,
        type: _selectedExpenseType!);
    if (title.isEmpty) {
      Navigator.pop(context);
    } else {
      widget.onCreated(expense);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _titleController,
                maxLength: 50,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter title",
                    labelText: "Title"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                maxLength: 50,
                decoration: InputDecoration(
                    prefix: Text("\$ "),
                    border: OutlineInputBorder(),
                    hintText: "Enter Amount",
                    labelText: "Amount"),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(8),
                child: DropdownButton(
                  value: _selectedExpenseType,
                  onChanged: (ExpenseType? newValue) {
                    setState(() {
                      _selectedExpenseType = newValue;
                    });
                  },
                  items: ExpenseType.values.map((ExpenseType e) {
                    return DropdownMenuItem<ExpenseType>(
                      value: e,
                      child: Row(
                        children: [
                          Icon(e.icon),
                          SizedBox(
                            width: 8,
                          ),
                          Text(e.type)
                        ],
                      ),
                    );
                  }).toList(),
                )),
            Padding(
              padding: EdgeInsets.all(8),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.calendar_today),
                onPressed: () async {
                  var pickedDate = await showDatePicker(
                    context: context,
                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2019),
                    lastDate: DateTime(2050),
                  );
                  selectedDate = pickedDate;
                  setState(() {
                    if (selectedDate == pickedDate) {
                      isTimeSelected = true;
                    }
                  });
                },
                label: isTimeSelected
                    ? Text(DateFormat.yMd().format(selectedDate!))
                    : Text("Pick a Date"),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: onCancel, child: Text("Cancel")),
                ElevatedButton(
                    onPressed: onSubmit, child: Text("Add New Expense")),
              ],
            )
          ],
        ));
  }
}
