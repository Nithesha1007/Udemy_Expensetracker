import 'package:expense_tracker/widget/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255,96, 59, 181));//kmeans use globale , seedcolor means set one seed use all
void main(){
  runApp(
    MaterialApp (
      theme: ThemeData().copyWith(//copywith method provide by theme , used to modify specify styling in app 
    
        //useMaterial3: true,
       colorScheme: kColorScheme,
       
       appBarTheme: AppBarTheme().copyWith(//Take the default AppBar theme and change only the properties we specify.
        backgroundColor: kColorScheme.onPrimaryContainer,//This changes the background color of the AppBar.
        foregroundColor: kColorScheme.primaryContainer,//This changes the color of content displayed on top of the AppBar background, such as:title,icon etc
       ),
       scaffoldBackgroundColor: kColorScheme.onPrimary
        ),
         home: Expenses(),
         debugShowCheckedModeBanner: false,
         
    ),
  );
}