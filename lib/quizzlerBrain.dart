import 'package:flutter/material.dart';

class QuestionData {
  String question = "";
  bool answer = false;
  QuestionData(this.question, this.answer);
}

class QuizzlerBrain {
  int _questionNumber = 0;
  List<Widget> _scores = [];
  List<QuestionData> _questions = [
    QuestionData("You can lead a cow down stairs but not up stairs", true),
    QuestionData(
        "Approximately one quarter of human bones are in the feet", false),
    QuestionData("A slug\'s blood is green.", false),
  ];

  getQuestion() {
    return _questions[_questionNumber].question;
  }

  checkAnswer(userChoice) {
    if (userChoice == _questions[_questionNumber].answer) {
      _scores.add(CorrectAnswer());
    } else {
      _scores.add(WrongAnswer());
    }
  }

  getScores() {
    return _scores;
  }

  nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }
}

class WrongAnswer extends StatelessWidget {
  const WrongAnswer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.close,
      color: Colors.red,
    );
  }
}

class CorrectAnswer extends StatelessWidget {
  const CorrectAnswer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.check,
      color: Colors.green,
    );
  }
}
