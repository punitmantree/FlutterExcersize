import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'NumberAudio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // AudioCache audioPlayer = AudioCache();
  final player = AudioPlayer();
  List<NumberAudio> numberList = [
    NumberAudio("one.wav", Colors.red, "One"),
    NumberAudio("two.wav", Colors.blue, "Two"),
    NumberAudio("three.wav", Colors.yellow, "Three"),
    NumberAudio("four.wav", Colors.lightGreen, "Four"),
    NumberAudio("five.wav", Colors.pink, "Five"),
    NumberAudio("six.wav", Colors.purple, "Six"),
    NumberAudio("seven.wav", Colors.grey, "Seven"),
    NumberAudio("eight.wav", Colors.orange, "Eight"),
    NumberAudio("nine.wav", Colors.lime, "Nine"),
    NumberAudio("ten.wav", Colors.deepOrange, "Ten"),
  ];

  play(String audioUri) async {
    await player.play(DeviceFileSource(audioUri));
    // player.resume();
    // audioPlayer.load(audioUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spanish Audio Player"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Image(image: AssetImage("images/logo.png")),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.0,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 10.0),
                itemCount: numberList.length,
                itemBuilder: (BuildContext context, int i) => SizedBox(
                  width: 100.0,
                  height: 50.0,
                  child: MaterialButton(
                    onPressed: play(numberList[i].audioUri),
                    color: numberList[i].buttonColor,
                    child: Text(
                      numberList[i].buttonText,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
