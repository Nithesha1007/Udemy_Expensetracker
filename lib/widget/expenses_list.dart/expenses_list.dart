
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/expenses_list.dart/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key, required this.expenses});//inga expenses file dha venum nammaku
  final List<Expense> expenses;//idhula expense vandhu namba create panna class , expenses vandhu andha class use panna ah title,category adhulam
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
        itemBuilder: (context, index) => ExpenseItem(expenses[index])
        );

  }
}