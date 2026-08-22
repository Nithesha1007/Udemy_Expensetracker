import 'package:uuid/uuid.dart';

final uuid = Uuid();//uuid class to create an object based on it , which i will store final variable called uuid anywhere in this file we use it 
enum Category{
food,travel,leisure,work//here no need quotation 
}
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
}