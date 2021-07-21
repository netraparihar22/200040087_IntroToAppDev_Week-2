import 'package:my_quiz_app/QuesAns.dart';

class QuizQues {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(question: 'Next semester will be an online semester.' , answer: false),
    //Question(question: 'AAKAAR is Asia\'s largest Civil fest.' , answer: true),
    Question(question: 'MA108 grading was the best.' , answer: false),
    Question(question: 'SAFE App is not so safe for students.' , answer: true),
    //Question(question: 'IIT Bombay administration actually cares for students.' , answer: false),
    Question(question: 'There are 11 planets in our solar system.' , answer: false),
    Question(question: 'PV Sindhu won silver medal in 2016 Olympics.' , answer: true),
    Question(question: '26th January is celebrated as Republic Day.' , answer: true),
    Question(question: 'Sun rises in the west.' , answer: false),
    //Question(question: 'Song \'Dil kyun ye mera\' was sung by KK.' , answer: true),
  ];

  void getNextQuestion() {
    if(_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestion() {
    return _questionBank [_questionNumber].question;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].answer;
  }

  bool isFinished(){
    if (_questionNumber >= _questionBank.length - 1)
      return true;
    else
      return false;
  }

  void reset() {
    _questionNumber = 0;
  }

}