import 'package:flutter/material.dart';
import 'package:flutter_udemy_demo_quiz/Question.dart';
import 'package:flutter_udemy_demo_quiz/Answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function selectHandler;
  final int questionIndex;

  Quiz(
      {@required this.selectHandler,
      @required this.questions,
      @required this.questionIndex
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(() => selectHandler(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
