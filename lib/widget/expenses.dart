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
      isScrollControlled: true,//taking full screen 
      context: context,
       builder: (context) => NewExpense(onAddExpense: _addExpense,),//in new expense it have a function on addexpense, _addexpense was after w register update and shown in home screen using stestate

      );
  }
  void _addExpense(Expense expense){//for user entered the value and save expense
    setState(() {
      _registeredExpenses.add(expense);
    });
  }
  void _removeExpense(Expense expense){
    setState(() {
      _registeredExpenses.remove(expense);
    });
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
            child: ExpensesList(expenses:_registeredExpenses, onRemoveExpense: _removeExpense,)),// epd register pandrom internall ah remove vum pandrom using expense list
            
        

        ],
      ),
    );
  }

}
