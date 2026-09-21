import 'package:expense_tracker/widget/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255,96, 59, 181));//kmeans use globale , seedcolor means set one seed use all

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 5, 99, 125),
  brightness: Brightness.dark
   );
void main(){
  runApp(
    MaterialApp (
        darkTheme: ThemeData.dark().copyWith(
        
          colorScheme: kDarkColorScheme,


          cardTheme: CardThemeData().copyWith(//we use our varibale kdrkcolorscheme for when change dark theme change the card
        color: kDarkColorScheme.secondaryContainer,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
       ),
       
         elevatedButtonTheme: ElevatedButtonThemeData(//also elevated button color 
        style: ElevatedButton.styleFrom(
         backgroundColor: kDarkColorScheme.primaryContainer,//use our variable
         foregroundColor: kDarkColorScheme.onPrimaryContainer,//used to change when dark theme
        ),
         )
         ),
      theme: ThemeData().copyWith(//copywith method provide by theme , used to modify specify styling in app   
       colorScheme: kColorScheme,
       appBarTheme: AppBarTheme().copyWith(//Take the default AppBar theme and change only the properties we specify.
        backgroundColor: kColorScheme.onPrimaryContainer,//This changes the background color of the AppBar.
        foregroundColor: kColorScheme.primaryContainer,//This changes the color of content displayed on top of the AppBar background, such as:title,icon etc
       ),
       scaffoldBackgroundColor: kColorScheme.onPrimary,
       cardTheme: CardThemeData().copyWith(
        color: kColorScheme.primaryContainer,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
       ),
       elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
         backgroundColor: kColorScheme.primaryContainer,
         

        ),
       ),
       textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 17,
          color: kColorScheme.onSecondaryContainer,
        )
       )
        ),
       // themeMode: ThemeMode.system,// user perference use this object
         home: Expenses(),
         debugShowCheckedModeBanner: false,
         
    ),
  );
}