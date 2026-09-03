
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  //method1
  // var _enteredTitle = '';//user enterd value stored here when button was pressed
  //  void _saveTitleInput(String inputValue){//for 
  //  _enteredTitle = inputValue;//store here when user enter the value in textfield
  // }
  final _titleController = TextEditingController();//its store the user enter 
  final _amountController = TextEditingController();
      DateTime? _selectedDate;
      Category _selectedCategory = Category.food;//for initial value to seen in output of dropdown 
  void _presentDatePicker() async{
    final now = DateTime.now();
    final firstDate =DateTime(now.year-1, now.month,now.day);//using final now reduce one year , month,day all was now        652
  final pickedDate = await showDatePicker(
      context: context,
     firstDate: firstDate,
      lastDate: now,
      initialDate: now,
      );
      setState(() {
        _selectedDate = pickedDate;
      });
  }
void _submitExpenseData(){
  final enteredAmount = double.tryParse(_amountController.text);//tryparse('hello')=> null . tryparse('2.7') => 2.7
  final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
  if(_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null) {//if user not entered the tile , amount,category and click save expense shown a showdialog pop message enter the value 
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Invalid Input"),
      content: Text("Please make entered a title,amount,category"),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Okay")),
      ],
    ));
    return;
  }
}
  @override//when we use controller must we use the dipose otherwise it live in meomoey  app will crash
  void dispose(){
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
    child: Column(
      children: [
        TextField(
            maxLength: 50,
            controller: _titleController,//use our controller using controller
            decoration: InputDecoration(
              label: Text("Title"),
            ),
        ),
        Row(
          children:[
                  Expanded(
                    child: TextField(
                     controller: _amountController,
                                     decoration: const InputDecoration(
                    prefixText: "\$ ",// using the slash we use the dollar sign
                    label: Text("Amount"),
                                     ),
                                     
                                     keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _selectedDate == null //select pandra date null erundha
                          ? "No Date Selected"//true na no date selected nu print aganum
                          : formatter.format(_selectedDate!)//false na namba model create panirukom formatter nu aula ymd year,month,date erukum adhu use pani user ena select pannangalo adhu show pandrom
                        ),
                     IconButton(
                      onPressed: _presentDatePicker,
                     icon: Icon(Icons.calendar_month),
                     ),
                      ],
                    )
                  )
          ]
            
                 
        ),
        
      SizedBox(height: 16,),
        Row(children: [
         DropdownButton(
          value: _selectedCategory,
          items: Category.values.map((Category) => DropdownMenuItem(//fetch the category from enum and access all value and add a map method
            value: Category,//after setstate store the category
            child: Text(Category.name.toUpperCase()))//in output our catrgory , name is a property enum,dart,all name should upeercase user the touppercase
          ).toList(),//must provide a iterable list , 
          
          onChanged: (value){//value because user select value , check if null oru not if null stop its not null run the setaste 
            if(value == null){
              return ;
            }
            setState(() {
              _selectedCategory =value;//user select value store and update the value in the screen
            });
          }),
          const Spacer(),
          TextButton(onPressed: (){
            Navigator.pop(context);//remove from the model bottom sheeet
          }, child: Text("cancel")),
          ElevatedButton(onPressed:_submitExpenseData,//we create a function if null shown error
           child: Text("Save Expense")),
 
            
        ],)
      ],
    ),
    );
  }
}