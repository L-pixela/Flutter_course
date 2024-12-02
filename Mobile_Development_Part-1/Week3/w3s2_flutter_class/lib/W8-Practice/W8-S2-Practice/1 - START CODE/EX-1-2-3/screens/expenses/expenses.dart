import 'package:flutter/material.dart';

import '../../models/expense.dart';
import 'expenses_form.dart';
import 'expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpenses = [
    Expense(
        type: ExpenseType.travel,
        title: "Cambodia",
        amount: 150.5,
        date: DateTime.now()),
    Expense(
        type: ExpenseType.leisure,
        title: "Vacation",
        amount: 2000.522,
        date: DateTime.now()),
    Expense(
        type: ExpenseType.work,
        title: "Workings",
        amount: 100000,
        date: DateTime.now()),
    Expense(
        type: ExpenseType.food,
        title: "Pizza",
        amount: 18.55,
        date: DateTime.now()),
  ];

  void _removeExpense(Expense expenses) {
    setState(() {
      _registerExpenses.remove(expenses);
    });
  }

  void _addExpense(Expense expenses) {
    setState(() {
      _registerExpenses.add(expenses);
    });
  }

  void onPressed() {
    setState(() {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => ExpenseForm(onCreated: _addExpense),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Expenses',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: onPressed,
            ),
          ],
        ),
        body: ExpensesList(
          expenses: _registerExpenses,
          onRemoveExpense: _removeExpense,
        ));
  }
}
