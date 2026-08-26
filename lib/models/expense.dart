
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();//yMd is year month date format, we can use any format like yMEd, yMMMEd, yMMMMd, yMMMMEEEEd, etc.also dateformat is a class provided by intl package, we can use it to format the date in any format we want.

final uuid = Uuid();//uuid class to create an object based on it , which i will store final variable called uuid anywhere in this file we use it 
enum Category{
food,travel,leisure,work}//here no need quotation 

const categoryIcons = {//we can use the category value also not only definition also store the value
  Category.food : Icons.lunch_dining,//key value pair 
  Category.travel : Icons.flight,
  Category.leisure : Icons.movie,
  Category.work:Icons.work,
};
class Expense {
  Expense({
  required this.title,
  required this.amount,
  required this.date,
  required this.category//also accept the value 
  }) :id = uuid.v4();//: is initializer, v4 is to generate string unique id
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;//here no string value we mention alternatively we write what in enum that name should mention here


  String get formattedDate{//getter method to format the date in yMd format, we can use it anywhere in this file
    return formatter.format( date);//here we use the formatter object to format the date in yMd format, format method is used to format the date in the format we want, here we use yMd format
  }
}