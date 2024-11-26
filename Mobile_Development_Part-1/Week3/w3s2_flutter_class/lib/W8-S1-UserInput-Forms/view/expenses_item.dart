import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:w3s2_flutter_class/W8-S1-UserInput-Forms/models/expense.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({
    super.key,
    required this.title,
    required this.amount,
    required this.type,
    required this.date,
  });
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType type;

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
              Text(title),
              Text('\$ ${amount.toStringAsFixed(2)}'),
              // Text(type.toString()),
            ],
          ),
          Spacer(
            flex: 2,
          ),
          Row(
            children: [
              Icon(type.icon),
              SizedBox(
                width: 8,
              ),
              // Text(date.toString().substring(0, 10)),
              Text(DateFormat.yMd().format(date)),
            ],
          )
        ],
      ),
    ));
  }
}
