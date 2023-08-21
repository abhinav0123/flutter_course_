// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:whatsapp/Wcards.dart';
import '../model/chat.dart';
import 'package:image_picker/image_picker.dart';


class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  XFile? _image;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
      children:[ 
          Wcards(
            imageurl:
                'https://media.licdn.com/dms/image/C4D03AQFdGsLL1j4LZQ/profile-displayphoto-shrink_800_800/0/1654685439369?e=2147483647&v=beta&t=FUcG0DgRkqz9Y8NUEoIaJZ35n82eWI23JhWoRKRLOeo',
            name: 'My Status',
            time: 'Tap to add status',
          ),
          Divider(),
          Heading("Recent updates"),
          Wcards(
              name: messageData[1].name,
              imageurl: messageData[1].imageUrl,
              time: messageData[1].time),
          Wcards(
              name: messageData[2].name,
              imageurl: messageData[2].imageUrl,
              time: messageData[2].time),
          Wcards(
              name: messageData[3].name,
              imageurl: messageData[3].imageUrl,
              time: messageData[3].time),
          Wcards(
              name: messageData[4].name,
              imageurl: messageData[4].imageUrl,
              time: messageData[4].time),
          Wcards(
              name: messageData[5].name,
              imageurl: messageData[5].imageUrl,
              time: messageData[5].time),
          Wcards(
              name: messageData[6].name,
              imageurl: messageData[6].imageUrl,
              time: messageData[6].time),
          Wcards(
              name: messageData[7].name,
              imageurl: messageData[7].imageUrl,
              time: messageData[7].time),
          // Wcards(name: messageData[8].name, imageurl: messageData[8].imageUrl, time: messageData[8].time),
      ],
        
      ),
      
       floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Theme.of(context).hintColor,
        onPressed: _optionsDialogBox,
        child: Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ),
      ),
    
      
    );
    
  }
  Future<void> openGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = XFile(image.path);
      });
    }
  }

  Future<void> openCamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = XFile(image.path);
      });
    }
  }
  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(),
            content: SingleChildScrollView(
              child: ListBody(children: [
                GestureDetector(
                  child: Text(
                    'Take a picture',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                  onTap: openCamera,
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                GestureDetector(
                  child: Text(
                    'Take an image from gallery',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                  onTap: openGallery,
                ),
              ]),
            ),
          );
        });
}
}
class Heading extends StatelessWidget {
  // const Heading({super.key});
  final String heading;

  Heading(this.heading);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.only(left: 5.0, top: 5.0),
            child: Text(
              heading,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            ),
            );
  }
}
