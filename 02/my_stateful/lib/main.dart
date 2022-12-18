import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyButton(),
  ));
}

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  MyButtonState createState() {
    return MyButtonState();
  }
}

class MyButtonState extends State<MyButton> {
  int counter = 0;
  int displayCounter = 0;
  List<String> spanishNumbers = [
    "uno",
    "dos",
    "tres",
    "cuatro",
    "cinco",
    "seis",
    "seite",
    "ocho",
    "nueve",
    "dietz"
  ];
  String defaultText = 'Spanish Numbers';

  void displaySNumbers() {
    setState(() {
      displayCounter = counter;
      defaultText = "${displayCounter + 1}:${spanishNumbers[counter]}";

      if (counter < 9) {
        counter = counter + 1;
      } else {
        counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Statefull App'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(defaultText, style: const TextStyle(fontSize: 30.0)),
              const Padding(
                padding: EdgeInsets.all(10.0),
              ),
              ElevatedButton(
                onPressed: displaySNumbers,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text("Call Numbers",
                    style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
