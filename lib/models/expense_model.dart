import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final dayTime = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  final String id;
  final String tittle;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return dayTime.format(date);
  }

  Expense(
      {required this.category,
      required this.tittle,
      required this.amount,
      required this.date})
      : id = uuid.v4();
}

class ExpensesBucket {
  final Category category;
  final List<Expense> expenses;

  ExpensesBucket(this.category, this.expenses);

  ExpensesBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((element) => element.category == category)
            .toList();
  double get totalExpenses {
    double sum =0;
    for (var expense in expenses)
      {
        sum+=expense.amount;
      }
    return sum;
  }
}
