import 'package:flutter/material.dart';
import 'package:quizzler_app/constants.dart';
import 'package:quizzler_app/quizzlerBrain.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizzlerBrain quizBrain = QuizzlerBrain();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          children: [
            Expanded(
              flex: 6,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(defaultPadding),
                  child: Text(
                    quizBrain.getQuestion(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(
                  bottom: defaultPadding,
                  left: defaultPadding,
                  right: defaultPadding),
              width: double.infinity,
              color: Colors.green,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    quizBrain.checkAnswer(true);
                    quizBrain.nextQuestion();
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: defaultPadding, vertical: defaultPadding),
                  child: Text(
                    "TRUE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(
                  bottom: defaultPadding,
                  left: defaultPadding,
                  right: defaultPadding),
              width: double.infinity,
              color: Colors.red,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    quizBrain.checkAnswer(false);
                    quizBrain.nextQuestion();
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: defaultPadding, vertical: defaultPadding),
                  child: Text(
                    "FALSE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )),
            Container(
              margin: EdgeInsets.all(defaultPadding / 2),
              child: Row(children: quizBrain.getScores()),
            )
          ],
        ));
  }
}
