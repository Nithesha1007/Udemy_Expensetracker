import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});
  @override
  State<Expenses>  createState() => _ExpensesState();
}
class _ExpensesState extends State<Expenses>{
  final List<Expense>_registeredExpenses =[//we use the model expense here 
         Expense(
          title:'Flutter' , 
          amount: 19.9,
          date: DateTime.now(), 
          category: Category.work
          ),
           Expense(
          title:'Cinema' , 
          amount: 15,
          date: DateTime.now(), //dispaly current date also , we have an option using constructor 
          category: Category.leisure
          ),
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Text(_registeredExpenses.toString()),
          Text("")

        ],
      ),
    );
  }

}
