import 'package:flutter/material.dart';
import 'package:flutter_udemy_demo_quiz/quiz.dart';
import 'package:flutter_udemy_demo_quiz/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'Qual\'è il tuo colore preferito?',
      'answers': [
        {'text': 'rosso', 'score': 20}, 
        {'text': 'giallo' , 'score': 1},
        {'text': 'blu', 'score': 222}
        ]
    },
    {
      'questionText': 'Qual è il tuo animale preferito?',
      'answers': [
        {'text': 'cane', 'score': 30},
        {'text': 'gatto', 'score': 60}, 
        {'text': 'procione', 'score': 0}
        ]
    },
    {
      'questionText': 'Qual è il tuo cibo preferito',
      'answers': [
        {'text': 'pizza', 'score': 1}, 
        {'text': 'pizza', 'score': 1}, 
        {'text': 'due pizze', 'score': 0}
        ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My First App')),
        body: _questionIndex < _questions.length
            ? Quiz(
                questionIndex: _questionIndex,
                questions: _questions,
                selectHandler: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }

  void _answerQuestion(int score) {
    print('>> MyApp: execute method - answerQuestion');

    _totalScore += score;

    setState(() {
      _questionIndex++;
    });

    print('>> MyApp: index of question is - $_questionIndex');

    if (_questionIndex < _questions.length) {
      print('>> MyApp: we have more questions');
    } else {
      print('>> MyApp: no more questins');
    }
  }

  void _resetQuiz()
  {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }
}
