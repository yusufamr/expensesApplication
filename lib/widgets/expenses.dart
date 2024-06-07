import 'package:expenses/widgets/chart/chart.dart';
import 'package:expenses/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import '../models/expense_model.dart';
import 'expenses_lits/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        category: Category.work,
        tittle: 'flutter Course',
        amount: 9.9,
        date: DateTime.now()),
    Expense(
        category: Category.food,
        tittle: 'burger ',
        amount: 3.9,
        date: DateTime.now()),
    Expense(
        category: Category.travel,
        tittle: 'going to thiland',
        amount: 5.0,
        date: DateTime.now()),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses Tracker"),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return NewExpense(
                        onAddExpense: _addExpense,
                      );
                    });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(child: Chart(expenses: _registeredExpenses)),
            Expanded(
                child: ExpensesList(
                    registeredExpenses: _registeredExpenses,
                    onRemoveExpense: _removeExpense)),
          ],
        ),
      ),
    );
  }
}
