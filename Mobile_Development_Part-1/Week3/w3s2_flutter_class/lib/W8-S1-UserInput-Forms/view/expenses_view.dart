import 'package:flutter/material.dart';
import 'package:w3s2_flutter_class/W8-S1-UserInput-Forms/models/expense.dart';
import 'package:w3s2_flutter_class/W8-S1-UserInput-Forms/view/expenses_list.dart';

class ExpensesView extends StatelessWidget {
  ExpensesView({super.key});

  final List<Expense> _registerExpenses = [
    Expense(
        type: ExpenseType.travel,
        title: "Cambodia",
        amount: 150.5,
        date: DateTime.now()),
    Expense(
        type: ExpenseType.travel,
        title: "France",
        amount: 150.5,
        date: DateTime.now()),
    Expense(
        type: ExpenseType.travel,
        title: "Canada",
        amount: 150.5,
        date: DateTime.now()),
    Expense(
        type: ExpenseType.travel,
        title: "Japan",
        amount: 150.5,
        date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return ExpensesList(expenses: _registerExpenses);
  }
}
