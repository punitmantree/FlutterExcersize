import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

void onPressed() {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Flutter'),
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("I am at line one"),
            const Text("I am at line number 2"),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shadowColor: Colors.orangeAccent),
              child: const Text("Sign Up"),
            )
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add_a_photo,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
