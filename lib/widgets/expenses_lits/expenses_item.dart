import 'package:expenses/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({Key? key, required this.expense}) : super(key: key);
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(child:
    Padding (
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 16),
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.tittle,style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: 4,),
            Row(
              children: [
                Text('\$${expense.amount.toString()}',style: Theme.of(context).textTheme.titleLarge,),
                const Spacer(),
                Row(
                  children: [
                     Icon(categoryIcon[expense.category]),
                    const SizedBox(width: 4,),
                    Text(expense.formattedDate,style: Theme.of(context).textTheme.titleLarge,)
                  ],
                )
              ],
            )

          ],
        ),

    )
    );
  }
}
