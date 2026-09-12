
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/expenses_list.dart/expense_item.dart';

import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});//inga expenses file dha venum nammaku
  final List<Expense> expenses;//idhula expense vandhu namba create panna class , expenses vandhu andha class use panna ah title,category adhulam
  final void Function (Expense expense) onRemoveExpense;//create a function use disimmible 
  @override

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
        itemBuilder: (context, index) =>Dismissible(//to swapping effect like left to right
          key: ValueKey(expenses[index]), //must we provide a key 
          background: Container(
            color: Theme.of(context).colorScheme.error.withValues(alpha: 0.75),//used to show red colour when user delete the card
            margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),//we set the error red margin here already we set margin in mindart so here override here 
          ),
          onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
          },
        child: ExpenseItem(expenses[index]
        ), 
        ),
        );

  }
}