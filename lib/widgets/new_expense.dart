

import 'package:expenses/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key, required this.onAddExpense}) : super(key: key);
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  final DateFormat dateormatter = DateFormat.yMd();
  Category _selectedCategory = Category.travel;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefixText: '\$',
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? "Selected Date"
                        : dateormatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: () async {
                        final now = DateTime.now();
                        final firstDate =
                            DateTime(now.year - 1, now.month, now.day);
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: now,
                          firstDate: firstDate,
                          lastDate: now,
                        );
                        setState(() {
                          _selectedDate = selectedDate;
                        });
                      },
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                    .toList(),
                onChanged: (newVal) {
                  if (newVal == null) {
                    return;
                  }
                  _selectedCategory = newVal;
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child:const  Text('Cancel'),
              ),
              ElevatedButton(
                  onPressed: () {
                    final double? amountDouble =
                        double.tryParse(_amountController.text);
                    final bool ammountIsInvalid =
                        amountDouble == null || amountDouble <= 0;
                    if (_titleController.text == null ||
                        _selectedDate == null ||
                        ammountIsInvalid) {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              title: const Text('Invalid Input'),
                              content: const Text(
                                  "please make sure that title,amount and date was entered"),
                              actions: [
                                TextButton(
                                    onPressed: () => Navigator.pop(ctx),
                                    child: const Text('Okay'))
                              ],
                            );
                          });
                    } else {
                      widget.onAddExpense(Expense(
                          category: _selectedCategory,
                          tittle: _titleController.text,
                          amount: double.parse(_amountController.text),
                          date: _selectedDate!));
                    Navigator.pop(context);
                    }
                  },
                  child: const Text("Save Expense")),
            ],
          )
        ]),
      ),
    );
  }
}
