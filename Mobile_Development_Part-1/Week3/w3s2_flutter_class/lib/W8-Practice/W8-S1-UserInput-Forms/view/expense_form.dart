import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:w3s2_flutter_class/W8-Practice/W8-S1-UserInput-Forms/models/expense.dart';

class ExpenseForm extends StatefulWidget {
  final Function(Expense) onSubmit;
  const ExpenseForm({super.key, required this.onSubmit});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  ExpenseType? _selectedExpenseType;
  DateTime? selectedDate;
  bool isTimeSelected = false;

  void onCancel() {
    Navigator.pop(context);
  }

  void onSubmit() {
    final String title = _titleController.text;
    final double amount = double.parse(_amountController.text);

    bool isTitleValid = title.trim().isNotEmpty;
    bool isAmountValid = amount > 0;
    bool valid = isTitleValid && isAmountValid;

    if (valid) {
      Expense expense = Expense(
          title: title,
          amount: amount,
          date: selectedDate!,
          type: _selectedExpenseType!);

      widget.onSubmit(expense);

      // 3.3- Close modal
      Navigator.pop(context);
    } else {
      // 4.1 Compute the error message
      String errorMessage = !isTitleValid
          ? "The title cannot be empty"
          : "The amount shall be a positive number";

      // 4.2 Show error
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
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
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
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
                ElevatedButton(onPressed: onSubmit, child: Text("Add")),
              ],
            )
          ],
        ));
  }
}
