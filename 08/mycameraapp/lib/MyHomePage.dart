import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Camera App"),
      ),
      body: Center(
          child: _image == null ? const Text("No Image") : Image.file(_image)),
      floatingActionButton: FloatingActionButton(
        onPressed: _optionsDialogBox,
        tooltip: "Open Camera",
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blue,
            shape: const RoundedRectangleBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    onTap: openCamera,
                    child: const Text(
                      'Take a picture',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  GestureDetector(
                    onTap: openGallery,
                    child: const Text(
                      'Select image from gallery',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future openCamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = image as File;
    });
  }

  Future openGallery() async {
    var picture = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _image = picture as File;
    });
  }
}
