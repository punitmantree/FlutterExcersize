// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // todo:Import Images
  AssetImage circle = const AssetImage("images/circle.png");
  AssetImage lucky = const AssetImage("images/rupee.png");
  AssetImage unlucky = const AssetImage("images/sadFace.png");

  // todo:Get an Array
  late List<String> itemArray;
  late int luckyNumber;

  // todo:init array with 25 elements
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    itemArray = List<String>.generate(25, (index) => "empty");
    generateRandomNumber();
  }

  generateRandomNumber() {
    int randow = Random().nextInt(25);
    setState(() {
      luckyNumber = randow;
    });
  }

  // todo: define a getImage method
  getImage(int index) {
    String currentState = itemArray[index];
    switch (currentState) {
      case "lucky":
        return lucky;
      case "unlucky":
        return unlucky;
    }
    return circle;
  }

  // todo: play game method
  playGame(int index) {
    if (luckyNumber == index) {
      setState(() {
        itemArray[index] = "lucky";
      });
    } else {
      setState(() {
        itemArray[index] = "unlucky";
      });
    }
  }

  // todo: showAll
  showAll() {
    setState(() {
      itemArray = List<String>.filled(25, "unlucky");
      itemArray[luckyNumber] = "lucky";
    });
  }

  // todo: Reset All
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
        title: const Text("Scratch And Win"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0),
              itemCount: itemArray.length,
              itemBuilder: (BuildContext context, int index) => SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: MaterialButton(
                    onPressed: () {
                      playGame(index);
                    },
                    child: Image(
                      image: getImage(index),
                    ),
                  )),
            ),
          ),
          Container(
              margin: const EdgeInsets.all(15.0),
              child: MaterialButton(
                onPressed: () {
                  showAll();
                },
                color: Colors.orange,
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  "Show All",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              )),
          Container(
              margin: const EdgeInsets.all(15.0),
              child: MaterialButton(
                onPressed: () {
                  resetGame();
                },
                color: Colors.orange,
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  "Reset",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              )),
          // Container(
          //   color: Colors.black,
          //   margin: const EdgeInsets.fromLTRB(5, 5, 5, 10),
          //   padding: const EdgeInsets.all(10.0),
          //   child: const Align(
          //     alignment: Alignment.center,
          //     child: Text(
          //       "LearnCodeOnline.in",
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 14.0,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
