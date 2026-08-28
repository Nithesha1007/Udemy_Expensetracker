import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var _enteredTitle = '';//user enterd value stored here when button was pressed
   void _saveTitleInput(String inputValue){//for 
   _enteredTitle = inputValue;//store here when user enter the value in textfield

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
    child: Column(
      children: [
        TextField(
            maxLength: 50,
            onChanged: _saveTitleInput,
            decoration: InputDecoration(
              label: Text("Title"),
            ),
 
        ),
        Row(children: [
          ElevatedButton(onPressed: (){
            print(_enteredTitle);
          }, child: Text("Save Expense")),
        ],)
      ],
    ),
    );
  }
}