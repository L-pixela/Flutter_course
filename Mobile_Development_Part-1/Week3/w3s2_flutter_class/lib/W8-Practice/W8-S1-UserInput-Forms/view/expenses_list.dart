import 'package:flutter/material.dart';
import 'package:w3s2_flutter_class/W8-Practice/W8-S1-UserInput-Forms/view/expenses_item.dart';

import '../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.removeExpense});
  final List<Expense> expenses;
  final Function(Expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
            onDismissed: (direction) => removeExpense(expenses[index]),
            key: Key(expenses[index].id),
            child: ExpensesItem(expense: expenses[index])));
  }
}
