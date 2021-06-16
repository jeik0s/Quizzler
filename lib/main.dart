import 'package:flutter/material.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "You can lead a cow down stairs but not up stairs.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,
                fontSize: 20,
                wordSpacing: 3,
                ),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                color: Colors.green[400],
                child: TextButton(
                    onPressed: () {},
                    child: Container(
                      child: Text(
                        "True",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    )),
              ),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                color: Colors.red[400],
                child: TextButton(
                    onPressed: () {},
                    child: Container(
                      child: Text(
                        "False",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    )),
              ),
            ))
      ],
    );
  }
}
