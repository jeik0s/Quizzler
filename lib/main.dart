import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizBrain.dart';

QuizBrain quizBrain = QuizBrain();

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
  
  List<Widget> scoreKeeper = [
    SizedBox(height: 30.0,)
  ];

  void checkAnswer(bool userPickedAnser){
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if(quizBrain.isFinished()){
        Alert(context: context, title: "THE END", desc: "Congrats, you get to the end!").show();
        scoreKeeper.clear();
        scoreKeeper.add(SizedBox(height: 30.0,));
      } else {
        if (userPickedAnser == correctAnswer)
          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
        else
          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
        quizBrain.nextQuestion();
      }
    });
  }

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
                quizBrain.getQuestionText(),
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
                      checkAnswer(true);
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
                      checkAnswer(false);
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
