import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage circle = const AssetImage("images/circle.png");
  AssetImage lucky = const AssetImage("images/rupee.png");
  AssetImage unlucky = const AssetImage("images/sadFace.png");

  List<String>? itemArray;
  int? luckyNumber;

  @override
  void initState() {
    super.initState();
    itemArray = List<String>.generate(25, (index) => "empty");
    generateRandomNumber();
  }

  generateRandomNumber() {
    int random = Random().nextInt(25);
    setState(() {
      luckyNumber = random;
    });
  }

  AssetImage getImage(int index) {
    String currentState = itemArray![index];
    switch (currentState) {
      case "lucky":
        return lucky;
        break;
      case "unlucky":
        return unlucky;
        break;
    }
    return circle;
  }

  playGame(int index) {
    if (luckyNumber == index) {
      setState(() {
        itemArray![index] = "lucky";
      });
    } else {
      setState(() {
        itemArray![index] = "unlucky";
      });
    }
  }

  showAll() {
    setState(() {
      itemArray = List<String>.filled(25, "unlucky");
      itemArray?[luckyNumber!] = "lucky";
    });
  }

  resetGame() {
    setState(() {
      itemArray = List<String>.filled(25, "empty");
    });
    generateRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaratch and win'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GridView.builder(
              
              padding: const EdgeInsets.all(20.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: itemArray!.length,
              itemBuilder: (context, i) => Container(
                color: Colors.white,
                height: 50,
                width: 50,
                child: ElevatedButton(
                  onPressed: () {
                    this.playGame(i);
                  },
                  child: Image(
                    image: this.getImage(i),
                  ),
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.all(20.0),
              
             
              child: ElevatedButton(
                onPressed: () {
                  this.showAll();
                }, 
                child: Text('Show All'),
              ),),
               Container(
                height: 40,
              margin: EdgeInsets.all(20.0),
              
          
                child: ElevatedButton(
                  onPressed: () {
                    this.resetGame();
                  }, 
                  child: Text('Reset'),
                ),
              ),
              
        ],
      ),
    );
  }
}
