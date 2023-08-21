import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Wcards extends StatelessWidget {
  const Wcards({super.key, required this.name, required this.imageurl, required this.time});
final String name,imageurl,time;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(maxRadius: 25,
      foregroundColor: Colors.deepPurple,
      backgroundImage: NetworkImage(imageurl),
      ),
      title: Text(name,style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),
      ),
      subtitle: Text(time),
    );
  }
}