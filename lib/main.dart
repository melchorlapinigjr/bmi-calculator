import 'package:bmi_calculator/screens/inputs_page.dart';
import 'package:flutter/material.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData( 
      primaryColor: Color(0xFF0A0E21),
      scaffoldBackgroundColor: Color(0xFF0A0E21),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Color(0xFFFFFFFF),), 
      ),
      accentColor: Colors.black87,
    ),
    home: BmiHome(),
    debugShowCheckedModeBanner: false,
    );
  }
}
