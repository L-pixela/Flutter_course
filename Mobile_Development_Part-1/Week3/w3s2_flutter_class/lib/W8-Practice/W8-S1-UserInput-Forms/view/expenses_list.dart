import 'package:flutter/material.dart';
import 'package:w3s2_flutter_class/W8-Practice/W8-S1-UserInput-Forms/view/expenses_item.dart';

import '../models/expense.dart';

class ExpensesList extends StatefulWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.removeExpense});
  final List<Expense> expenses;
  final Function(Expense) removeExpense;

  @override
  State<ExpensesList> createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  Expense? _lastRemovedExpense;
  int? _lastRemovedIndex;

  void _showUndoSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Expenses is removed. You wanna undo it?"),
      duration: Duration(seconds: 3),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              if (_lastRemovedExpense != null && _lastRemovedIndex != null) {
                widget.expenses
                    .insert(_lastRemovedIndex!, _lastRemovedExpense!);
              }
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.expenses.length,
        itemBuilder: (context, index) => Dismissible(
            onDismissed: (direction) {
              setState(() {
                _lastRemovedExpense = widget.expenses[index];
                _lastRemovedIndex = index;
                widget.removeExpense(widget.expenses[index]);
              });
              _showUndoSnackBar(context);
            },
            key: Key(widget.expenses[index].id),
            child: ExpensesItem(expense: widget.expenses[index])));
  }
}
