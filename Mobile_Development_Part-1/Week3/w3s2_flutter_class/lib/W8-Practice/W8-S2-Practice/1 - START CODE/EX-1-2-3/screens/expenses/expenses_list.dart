import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatefulWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });
  final List<Expense> expenses;
  final Function(Expense) onRemoveExpense;

  @override
  State<ExpensesList> createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  Expense? _lastRemovedExpense;
  int? _lastRemovedIndex;

  void _showUndoSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Expenses is removed. Do you want to undo it?"),
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
    return widget.expenses.isEmpty
        ? Center(
            child: Text("No Expenses Regiested"),
          )
        : ListView.builder(
            itemCount: widget.expenses.length,
            itemBuilder: (context, index) {
              final expense = widget.expenses[index];
              return Dismissible(
                  onDismissed: (direction) {
                    setState(() {
                      _lastRemovedExpense = expense;
                      _lastRemovedIndex = index;
                      widget.onRemoveExpense(expense);
                    });
                    _showUndoSnackBar(context);
                  },
                  key: Key(widget.expenses[index].id),
                  child: ExpenseItem(expense));
            });
  }
}
