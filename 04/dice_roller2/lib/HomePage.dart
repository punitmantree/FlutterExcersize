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
  late AssetImage diceImage2;
  @override
  void initState() {
    super.initState();

    setState(() {
      diceImage = one;
      diceImage2 = two;
    });
  }

  void rollDice() {
    int random1 = (1 + Random().nextInt(6));
    int random2 = (1 + Random().nextInt(6));

    late AssetImage newImage1;
    late AssetImage newImage2;

    switch (random1) {
      case 1:
        newImage1 = one;
        break;
      case 2:
        newImage1 = two;
        break;
      case 3:
        newImage1 = three;
        break;
      case 4:
        newImage1 = four;
        break;
      case 5:
        newImage1 = five;
        break;
      case 6:
        newImage1 = six;
        break;
    }
    switch (random2) {
      case 1:
        newImage2 = one;
        break;
      case 2:
        newImage2 = two;
        break;
      case 3:
        newImage2 = three;
        break;
      case 4:
        newImage2 = four;
        break;
      case 5:
        newImage2 = five;
        break;
      case 6:
        newImage2 = six;
        break;
    }

    setState(() {
      diceImage = newImage1;
      diceImage2 = newImage2;
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Image(
                  image: diceImage,
                  width: 150.0,
                  height: 150.0,
                ),
                Image(
                  image: diceImage2,
                  width: 150.0,
                  height: 150.0,
                )
              ]),
              Container(
                margin: const EdgeInsets.only(top: 50.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF000000),
                    foregroundColor: const Color(0XFFFFFFFF),
                    padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  onPressed: rollDice,
                  child: const Text("Roll the Dice!",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
