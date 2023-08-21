import 'package:flutter/material.dart';
import 'package:whatsapp/model/calls.dart';

class Calls extends StatefulWidget {
  const Calls({super.key});

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: callData.length,
        itemBuilder: (context, i) => Column(
          children: [
            Divider(
              height: 20.0,
            ),
            ListTile(
              leading: CircleAvatar(
                maxRadius: 25,
                backgroundImage: NetworkImage(callData[i].imageUrl),
              ),
              title: Text(
                callData[i].name,
                style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),
              ),
               subtitle: Container(padding:EdgeInsets.only(top: 5.0),
              child: Text(callData[i].time,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
              ),
              ),
              ),
              trailing: Icon(Icons.call,color: Color(0xff075E54),),
              selected: true,
              onTap: (){},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Theme.of(context).hintColor,
        onPressed: () {
          print('Button pressed');
        },
        child: Icon(
          Icons.call,
          color: Colors.white,
        ),
      ),
    );
  }
}
