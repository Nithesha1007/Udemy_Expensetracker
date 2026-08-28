import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/expenses_list.dart/expenses_list.dart';
import 'package:expense_tracker/widget/new_expense.dart';
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
  void _openAddExpenseOverlay(){
    showModalBottomSheet(
      context: context,
       builder: (context) => NewExpense(),
      );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter ExpenseTracker"),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Text("The Chart"),
          Expanded(
            child: ExpensesList(expenses:_registeredExpenses )),
        

        ],
      ),
    );
  }

}
