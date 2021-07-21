import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_quiz_app/AllQues.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizQues quizQues = QuizQues();

void main(){
  runApp(
      MaterialApp(
        home: Scaffold(
        backgroundColor: Colors.black87,
        body: Quiz(),
        ),
      ),
  );
}

class Quiz extends StatelessWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper =[];

  void checkAnswer (bool userPickedAnswer){
    bool correctAnswer = quizQues.getCorrectAnswer();
    setState(() {
      if (quizQues.isFinished()) {
        Alert(
            context: context,
            title: 'Quiz Completed',
            desc: 'Thank you for attempting the quiz.')
            .show();
        quizQues.reset();
        scoreKeeper.clear();
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            Icon(
                Icons.close,
                color: Colors.red,
            ),
          );
        }
        quizQues.getNextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                quizQues.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 60.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: FlatButton(
              textColor:Colors.white,
              color: Colors.red,
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45.0,
                ),
              ),
            ),
          ),
        ),
        Row(
          children:scoreKeeper,
        )
      ],
    );
  }
}


