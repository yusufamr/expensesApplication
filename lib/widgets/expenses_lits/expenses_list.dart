import 'package:flutter/material.dart';

import '../../models/expense_model.dart';
import 'expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required List<Expense> registeredExpenses, required this.onRemoveExpense,
  }) : _registeredExpenses = registeredExpenses;

  final List<Expense> _registeredExpenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _registeredExpenses.length,
        itemBuilder: (context, index) =>
            Dismissible(
                background: Container(color: Theme
                    .of(context)
                    .colorScheme
                    .error, margin: Theme.of(context).cardTheme.margin),
                key: ValueKey(_registeredExpenses[index]),
        onDismissed: (direction) => onRemoveExpense(_registeredExpenses[index]),
        child: ExpensesItem(
          expense: _registeredExpenses[index],
        )),);
  }
}
