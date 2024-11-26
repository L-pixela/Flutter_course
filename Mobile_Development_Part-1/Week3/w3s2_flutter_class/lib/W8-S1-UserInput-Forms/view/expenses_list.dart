import 'package:flutter/material.dart';
import 'package:w3s2_flutter_class/W8-S1-UserInput-Forms/view/expenses_item.dart';

import '../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpensesItem(
          title: expenses[index].title,
          amount: expenses[index].amount,
          type: expenses[index].type,
          date: expenses[index].date),
    );
  }
}

Iterable<ExpensesItem> _buildExpensesList(List<Expense> expenses) {
  return expenses.map((expense) {
    return ExpensesItem(
        title: expense.title,
        amount: expense.amount,
        type: expense.type,
        date: expense.date);
  });
}
