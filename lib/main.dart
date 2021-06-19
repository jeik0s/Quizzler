import 'package:flutter/material.dart';
import 'question.dart';

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
  
  List<Widget> scoreKeeper = [];

  List<Question> questionsBank = [
    Question(question: "You can lead a cow down stairs but not up stairs.", answer: false),
    Question(question: "Approximately one quarter of human bones are in the feet.", answer: true),
    Question(question: "A slug\'s blood is green.", answer: true)
  ];

  int questionNo = 0;

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
                questionsBank[questionNo].questionText,
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
                    onPressed: () {
                      setState(() {

                        // TODO: fix problem with getting out of List
                        bool correctAnswer = questionsBank[questionNo].questionAnswer;
                        if(correctAnswer)
                          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                        else
                          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                        questionNo++;
                      });
                    },
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
                    onPressed: () {
                      setState(() {
                        bool correctAnswer = questionsBank[questionNo].questionAnswer;
                        if(!correctAnswer)
                          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                        else
                          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                        questionNo++;
                      });
                      },
                    child: Container(
                      child: Text(
                        "False",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    )),
              ),
            )),
        Row(
        
          children: scoreKeeper,
        )
      ],
    );
  }
}
