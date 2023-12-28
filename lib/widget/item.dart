import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/Expense.dart';
//import 'package:flutter_application_4/widget/data_list.dart';

class Item extends StatelessWidget {
  const Item(this.expenses, {super.key});
  final Expense expenses;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          children: [
            Text(
              expenses.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('\$${expenses.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expenses.category]),
                    const SizedBox(width: 4),
                    Text(expenses.formattedDate),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
