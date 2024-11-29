import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:w3s2_flutter_class/W8-Practice/W8-S1-UserInput-Forms/models/expense.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(expense.title),
              Text('\$ ${expense.amount.toStringAsFixed(2)}'),
              // Text(type.toString()),
            ],
          ),
          Spacer(
            flex: 2,
          ),
          Row(
            children: [
              Icon(expense.type.icon),
              SizedBox(
                width: 8,
              ),
              // Text(date.toString().substring(0, 10)),
              Text(DateFormat.yMd().format(expense.date)),
            ],
          )
        ],
      ),
    ));
  }
}
