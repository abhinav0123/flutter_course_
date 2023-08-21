import 'package:api_integrate/homepage2.dart';
import 'package:flutter/material.dart';

// import 'homepage.dart';
import 'homepage1.dart';


void main()=> runApp(MyApi());

class MyApi extends StatelessWidget {
  // const MyApi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch:Colors.orange ,
      ),
      home: MyHomepage(),
    );
  }
}