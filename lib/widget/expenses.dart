import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/Expense.dart';
import 'package:flutter_application_4/widget/data_list.dart';
import 'package:flutter_application_4/widget/newExpense.dart';
import 'package:flutter_application_4/widget/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerexpenses1 = [
    Expense(
        name: "flutter course",
        amount: 20.0,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        name: "songdoon",
        amount: 200.0,
        date: DateTime.now(),
        category: Category.travel),
  ];

  void _addExpenseoverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(addNewExpensewidget: addNewExpensewidget),
    );
  }

  void addNewExpensewidget(Expense expense) {
    setState(() {
      _registerexpenses1.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registerexpenses1.indexOf(expense);

    setState(() {
      _registerexpenses1.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text("${expense.name} deleted"),
          duration: const Duration(seconds: 3),
          action: SnackBarAction(
            label: "UNDO",
            onPressed: () {
              setState(() {
                _registerexpenses1.insert(expenseIndex, expense);
              });
            },
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width);

    Widget mainContent = const Center(
      child: Text("No expenses added yet!"),
    );

    if (_registerexpenses1.isNotEmpty) {
      mainContent = Explist(
        expenses: _registerexpenses1,
        removeExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses"),
        actions: [
          IconButton(
            onPressed: () {
              _addExpenseoverlay();
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: width < 600
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Chart(
                    expenses: _registerexpenses1,
                  ),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(
                    expenses: _registerexpenses1,
                  ),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
