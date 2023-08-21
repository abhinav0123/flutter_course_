import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage1 extends StatefulWidget {
  const Homepage1({super.key});

  @override
  State<Homepage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
  List? userData;
  bool isLoading = true;
  final String url = "https://randomuser.me/api/?results=50";
  Future getData() async {
    var response = await http
        .get(Uri.parse(url), headers: {"Accept": " applications/json"});

    List data = jsonDecode(response.body)['results'];
    setState(() {
      userData = data;
      isLoading = false;
    },
    );
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Random users'),
        ),
        body: Container(

          child: Center(
            child: isLoading
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: userData == null ? 0 : userData?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(20.0),
                              child: Image(
                                width: 70,
                                height: 70,
                                image: NetworkImage(
                                    userData![index]['picture']['thumbnail']),
                              ),
                            ),
                             Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(userData![index]['name']['first']+" "+
                                  userData![index]['name']['last'],
                                  style:TextStyle(fontSize: 20.0),),

                                  Row(
                                    children: [
                                      Icon(Icons.phone),
                                      Text("Phone: ${userData![index]['phone']}"),
                                    ],
                                  ),
                                  Text("Gender: ${userData![index]['gender']}"),
                                  Text("Dob: ${userData![index]['dob']['date']}"),
                                  
                                    // Text(userData![index]['dob']),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ));
  }
}
