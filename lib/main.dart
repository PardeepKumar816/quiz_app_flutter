import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'data.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: MyApp(),
        backgroundColor: Colors.grey[900],
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  List<Icon> scoreKeeper = [];
  final data = Data();

  void checkAnswer(bool userPickedAnswer) {
    bool ans = data.getAnswer(index);
    setState(() {
      if (index == 0) scoreKeeper.clear();
      if (ans == userPickedAnswer)
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      else
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );

      if (index < data.length() - 1) {
        index++;
      } else {
        Alert(context: context, title: 'Alert', desc: 'Out of Questions')
            .show();
        index = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  data.getQuestion(index),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 30, bottom: 10),
                child: TextButton(
                  onPressed: () {
                    checkAnswer(true);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  child: Text(
                    'TRUE',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 30, top: 10),
                child: TextButton(
                  onPressed: () {
                    checkAnswer(false);
                  },
                  child: Text(
                    "FALSE",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: scoreKeeper,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
