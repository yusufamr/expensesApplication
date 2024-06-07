import 'package:flutter/material.dart';

import '../../models/expense_model.dart';
import 'char_bar.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key, required this.expenses}) : super(key: key);
  final List<Expense> expenses;

  List<ExpensesBucket> get buckets {
    return [
      ExpensesBucket.forCategory(expenses, Category.travel),
      ExpensesBucket.forCategory(expenses, Category.work),
      ExpensesBucket.forCategory(expenses, Category.leisure),
      ExpensesBucket.forCategory(expenses, Category.food),
    ];
  }

  double get totalExpense {
    double total = 0;
    for (var element in buckets) {
      total += element.totalExpenses;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 8),
      width: double.infinity,
      height: 175,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.onSecondaryContainer),
      child: Column(

        children: [
          Expanded(
            child: Row(
              children: [
                for (final element in buckets)  ChartBar(fill: element.totalExpenses/totalExpense,),
              ],
            ),
          ),

          Row(
            children: buckets
                .map((e) => Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:2,),
                      child: Icon(categoryIcon[e.category]),
                    )))
                .toList(),
          ),
        ],
      ),
    );
  }
}
