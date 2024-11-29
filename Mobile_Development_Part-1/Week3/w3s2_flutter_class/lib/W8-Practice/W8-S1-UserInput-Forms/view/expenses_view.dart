import 'package:flutter/material.dart';
import 'package:w3s2_flutter_class/W8-Practice/W8-S1-UserInput-Forms/models/expense.dart';
import 'package:w3s2_flutter_class/W8-Practice/W8-S1-UserInput-Forms/view/expense_form.dart';
import 'package:w3s2_flutter_class/W8-Practice/W8-S1-UserInput-Forms/view/expenses_list.dart';

class ExpensesView extends StatefulWidget {
  const ExpensesView({super.key});

  @override
  State<ExpensesView> createState() => _ExpensesViewState();
}

class _ExpensesViewState extends State<ExpensesView> {
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

  void _addExpense(Expense expenses) {
    _registerExpenses.add(expenses);
  }

  void _removeExpense(Expense expenses) {
    _registerExpenses.remove(expenses);
  }

  void onPressed() {
    setState(() {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => ExpenseForm(onSubmit: _addExpense),
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
            expenses: _registerExpenses, removeExpense: _removeExpense));
  }
}
