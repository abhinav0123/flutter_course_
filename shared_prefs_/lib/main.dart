import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedprefs/homepage.dart';

import 'notesscreen.dart';
import 'homepage.dart';
void main() {
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage1(title: 'Hello ',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
   getCounterValue()async{
        SharedPreferences pref =  await SharedPreferences.getInstance();
        int? count =pref.getInt('counterValue');
        return count;
      }

      setCounterValue()async{
        SharedPreferences pref =await SharedPreferences.getInstance();
        pref.setInt('counterValue', _counter);
      }

  void _incrementCounter() {


    setState(() {

      
      _counter++;
      setCounterValue();
    });
  }
  @override
  void initState() {
    super.initState();
    checkForCounterValue();
  }
checkForCounterValue()async{
  int count= await getCounterValue()??0;
  setState(() {
    _counter = count;

  });

}
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(widget.title),
      ),
      body: Center(
       
        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
