import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BG Changer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Random Background"),
          ),
          body: const HomePage(),
        ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var colors = [
    Colors.amber,
    Colors.black,
    Colors.green,
    Colors.blueGrey,
    Colors.pinkAccent,
    Colors.orangeAccent,
    Colors.cyan,
    Colors.yellow
  ];
  var currentColor = Colors.white;
  var btnColor = Colors.black;
  setRandomColor() {
    var rnd = Random().nextInt(colors.length);
    var btnrnd = Random().nextInt(colors.length);
    setState(() {
      currentColor = colors[rnd];
      btnColor = colors[btnrnd];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: currentColor,
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: btnColor,
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
          ),
          onPressed: setRandomColor,
          child: const Text(
            "Change it!",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
