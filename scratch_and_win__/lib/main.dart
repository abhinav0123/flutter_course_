import "package:flutter/material.dart";

import "HomePage.dart";

void main(){
  runApp(const ScratchApp());
}
class ScratchApp extends StatelessWidget {
  const ScratchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scratch and win',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const HomePage(),
    );
  }
}