import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({Key? key, required this.question}) : super(key: key);

  final String question;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: Colors.deepPurple[300],
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: Text(question,
            textAlign: TextAlign.center,
            textScaleFactor: 1.2,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
