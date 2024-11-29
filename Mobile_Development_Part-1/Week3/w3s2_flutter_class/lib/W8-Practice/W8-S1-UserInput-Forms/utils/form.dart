import 'package:flutter/material.dart';
import '../models/expense.dart';

final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
DateTime? selectedDate;

class FormInput extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController amountController;
  final VoidCallback onPressed;
  final ValueChanged<ExpenseType> onChangedDropdown;
  final ExpenseType type;
  final Function(Expense) onSubmit;
  const FormInput(
      {super.key,
      required this.titleController,
      required this.amountController,
      required this.type,
      required this.onPressed,
      required this.onSubmit,
      required this.onChangedDropdown});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Form(
        key: _globalKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Title'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your title';
                }
                return null;
              },
            ),
            TextFormField(
              controller: amountController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Amount'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your amount';
                }
                return null;
              },
            ),
            Row(
              children: [
                DropdownButtonFormField<ExpenseType>(
                  value: type,
                  decoration: InputDecoration(
                      labelText: 'Status', border: OutlineInputBorder()),
                  onChanged: (ExpenseType? newValue) {
                    if (newValue != null) {
                      onChangedDropdown(newValue); // Update the selected type
                    }
                  },
                  items: ExpenseType.values.map((ExpenseType type) {
                    return DropdownMenuItem<ExpenseType>(
                      value: type,
                      child: Text(type.toString()),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return "Please select a status";
                    }
                    return null;
                  },
                ),
                ElevatedButton.icon(
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

                    onPressed;
                  },
                  label: const Text('Pick a date'),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      double value = double.parse(amountController.text);
                      Expense newExpense = Expense(
                          type: type,
                          title: titleController.text,
                          amount: value,
                          date: selectedDate!);
                      onSubmit(newExpense);
                    }
                  },
                  child: Text("Submit your topic")),
            )
          ],
        ),
      ),
    );
  }
}
