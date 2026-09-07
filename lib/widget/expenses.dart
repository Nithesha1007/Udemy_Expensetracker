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
    final expenseIndex = _registeredExpenses.indexOf(expense);//this is for in action onpressed we want index of we create this variable,Before removing the expense, you save its current position.
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(//used to shown in bottom any message 
        SnackBar//message shown in bottom
      (
        content: Text("Expense Deleted"),//to display
         duration: Duration(seconds: 3),//after three second it disapper
         action: SnackBarAction(//must provide 
          label: 'undo', //if user swipe accidentally undo using restore this expense
          onPressed: (){
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);//if user click undo using that expense index variale and expense we undo this expense
            });
          }
          ),
      )
      );

  }
  @override
  Widget build(BuildContext context){
    Widget mainContent = Center(//in output there is not expense in listview then show a text 
      child: Text("No expenses found, Start adding some !"),
    );
    if(_registeredExpenses.isNotEmpty){//if content are there add or remove the listview 
             mainContent=   ExpensesList(//maincontent is varibale store the expense list remove or add 
              expenses:_registeredExpenses, // if user add use register here
              onRemoveExpense: _removeExpense);// epd register pandrom internall ah remove vum pandrom using expense list
            
        
    }
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
            child: mainContent
            )

        ],
      ),
    );
  }

}
