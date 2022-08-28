import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      cardColor: Colors.white,
      canvasColor: creamColor,
      accentColor:darkBlueColor ,
      buttonColor: darkBlueColor,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: darkBlueColor),
      fontFamily: GoogleFonts.poppins().fontFamily,
      primaryTextTheme: GoogleFonts.latoTextTheme(),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        // textTheme: Theme.of(context).textTheme,
        titleTextStyle: Theme.of(context).textTheme.headline6,
        toolbarTextStyle: Theme.of(context).textTheme.headline4,
        toolbarHeight: 70,
      ));
  static ThemeData darkTheme(BuildContext context) => ThemeData(
     brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      accentColor: Colors.white,
      canvasColor: darkCreamColor,
      buttonColor: lightBlueColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: lightBlueColor,
        
      ),
      primaryTextTheme: GoogleFonts.latoTextTheme(),
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        // textTheme: Theme.of(context).textTheme,
        titleTextStyle: Theme.of(context).textTheme.headline6,
        toolbarTextStyle: Theme.of(context).textTheme.headline4,
        toolbarHeight: 70,
      ));
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBlueColor = Color(0xff403d5a);
  static Color lightBlueColor = Vx.indigo500;
}
