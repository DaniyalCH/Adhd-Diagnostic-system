// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class nextButton extends StatelessWidget {
  const nextButton({
    Key? key,
    required this.changeButton,
    required this.Location,
  }) : super(key: key);

  final bool changeButton;
  final Widget Location;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
      child: InkWell(
        onTap: () {
          Duration(seconds: 4);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Location));
        },
        child: AnimatedContainer(
          duration: Duration(seconds: 4),
          width: changeButton ? 50 : 150,
          height: 50,
          alignment: Alignment.center,
          child: changeButton
              ? Icon(
                  Icons.done,
                  color: Colors.black,
                )
              : Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
        ),
      ),
    );
  }
}
