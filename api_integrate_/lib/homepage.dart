import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class HomePage extends StatefulWidget {
  final String ?title;
  HomePage({ Key? key, @required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final String url ="https://api.github.com/users";
List ?data;
var isLoading=false;

@override
void initState(){
  super.initState();
  getjsondata();
}

Future<void> getjsondata() async {
  var response = await http.get(Uri.parse(url));

  setState(() {
    var convertDatatoJson = json.decode(response.body);
    data = convertDatatoJson;
  });
}


 

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar:AppBar(title:Text('Api app'),
        ),
        body: ListView.builder(itemCount: data?.length,
        itemBuilder: (BuildContext context, index) => Card(
          child:Column(children: <Widget>[
            ListTile(
              leading:Icon(Icons.person),
              title: Text(data![index]['login'],
              style:TextStyle(
                fontSize: 20.0,
              )),
              subtitle: Text(data![index]['url'],
              style:TextStyle(
                fontSize: 15.0,
              )),
            ),

          ],)
        )),
      );

    
  }
}
