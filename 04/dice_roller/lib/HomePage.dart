import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage one = const AssetImage("images/one.png");
  AssetImage two = const AssetImage("images/two.png");
  AssetImage three = const AssetImage("images/three.png");
  AssetImage four = const AssetImage("images/four.png");
  AssetImage five = const AssetImage("images/five.png");
  AssetImage six = const AssetImage("images/six.png");

  late AssetImage diceImage;

  @override
  void initState() {
    super.initState();

    setState(() {
      diceImage = one;
    });
  }

  void rollDice() {
    int random = (1 + Random().nextInt(6));

    late AssetImage newImage;

    switch (random) {
      case 1:
        newImage = one;
        break;
      case 2:
        newImage = two;
        break;
      case 3:
        newImage = three;
        break;
      case 4:
        newImage = four;
        break;
      case 5:
        newImage = five;
        break;
      case 6:
        newImage = six;
        break;
    }

    setState(() {
      diceImage = newImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dice Roller"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: diceImage,
                width: 200.0,
                height: 200.0,
              ),
              Container(
                margin: const EdgeInsets.only(top: 100.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                  ),
                  onPressed: rollDice,
                  child: const Text(
                    "Roll the dice!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
