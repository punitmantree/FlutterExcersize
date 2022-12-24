import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // todo: Link up Images
  AssetImage cross = const AssetImage("images/cross.png");
  AssetImage circle = const AssetImage("images/circle.png");
  AssetImage edit = const AssetImage("images/edit.png");

  bool isCross = true;
  late String message;
  late List<String> gameState;

  //Todo: initialize the state of box with empty
  @override
  void initState() {
    super.initState();
    setState(() {
      gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      message = "";
    });
  }

  // todo: Play game method
  playGame(int index) {
    if (gameState[index] == "empty") {
      setState(() {
        if (isCross) {
          gameState[index] = "cross";
        } else {
          gameState[index] = "circle";
        }
        isCross = !isCross;
        checkWin();
      });
    }
  }

  //todo: Reset gamevmethod
  resetGame() {
    setState(() {
      gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      message = '';
      isCross = true;
    });
  }

  //todo: get image method
  getImage(String value) {
    switch (value) {
      case ('empty'):
        return edit;
      case ('cross'):
        return cross;
      case ('circle'):
        return circle;
    }
  }

  //todo: Check for winning logic
  checkWin() {
    if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        message = '${gameState[0]} Wins';
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            resetGame();
          });
        });
      });
    } else if ((gameState[3] != "empty") &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        message = '${gameState[3]} Wins';
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            resetGame();
          });
        });
      });
    } else if ((gameState[6] != "empty") &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        message = '${gameState[6]} Wins';
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            resetGame();
          });
        });
      });
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        message = '${gameState[0]} Wins';
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            resetGame();
          });
        });
      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        message = '${gameState[1]} wins';
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            resetGame();
          });
        });
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        message = '${gameState[2]} wins';
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            resetGame();
          });
        });
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        message = '${gameState[0]} wins';
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            resetGame();
          });
        });
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        message = '${gameState[2]} wins';
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            resetGame();
          });
        });
      });
    } else if (!gameState.contains('empty')) {
      setState(() {
        message = 'Game Draw';
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            resetGame();
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TicTacToe",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0),
              itemCount: gameState.length,
              itemBuilder: (BuildContext context, int i) => SizedBox(
                width: 100.0,
                height: 100.0,
                child: MaterialButton(
                  onPressed: () {
                    playGame(i);
                  },
                  child: Image(
                    image: getImage(gameState[i]),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MaterialButton(
            shape: const StadiumBorder(),
            color: Colors.orange,
            minWidth: 300.0,
            height: 50.0,
            child: const Text(
              "Reset Game",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            onPressed: () {
              resetGame();
            },
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              "LearnCodeOnline.in",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(bottom: 20.0),
            child: const Text(
              "Designed By: Punit Maheshwari",
              style: TextStyle(fontSize: 18.0),
            ),
          )
        ],
      ),
    );
  }
}
