import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Camera extends StatefulWidget {
  // const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: _optionsDialogBox,
        child: Icon(Icons.add_a_photo),
        tooltip: 'Open Camera',
      ),
    
      body: Container(
        color: Colors.white,
        child: Center(
          child: _image == null ? const Text('Click and add image',style: TextStyle(fontWeight: FontWeight.bold),) : Image.file(_image!),
        ),
      ),
      
    );
  }

  Future<void> openGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  Future<void> openCamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
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
