import 'package:flutter/material.dart';

import 'Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp',
      theme: ThemeData(
       appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff075E54),
       ),
       primarySwatch: Colors.green,
        // primaryColor:  Color(0xff075E54),
        hintColor: Color.fromARGB(255, 11, 140, 59),
        tabBarTheme: TabBarTheme(labelColor: Colors.white),
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: Colors.white, fontSize: 16.0),
          bodyMedium: TextStyle(color: Colors.black),
          labelLarge: TextStyle(color: Colors.white),
        ),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
      ),
      home: HomePage(),
    );
  }
}
