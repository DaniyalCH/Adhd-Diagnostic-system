// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names, unnecessary_string_escapes
import 'dart:async';
import 'package:dyslexia/pages/level2/round5/L2R5Q2.dart';
import 'package:dyslexia/utilities/QuestionWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dyslexia/pages/data/DataModel.dart';

DataModel data = DataModel();
DataModel returndata() {
  return data;
}

class L3R1Q1 extends StatefulWidget {
  const L3R1Q1({Key? key}) : super(key: key);

  @override
  State<L3R1Q1> createState() => _L3R1Q1State();
}

class _L3R1Q1State extends State<L3R1Q1> {
  String question = "Read the passage and answer the questions at the end ";

  var changeButton = false;

  double elev = 10;
  bool changeColor = false;
  bool buttonPressed1 = false;
  bool isPlayingMsg1 = false;
  bool isPlayingMsg2 = false;
  bool isPlayingMsg3 = false;
  bool isPlayingMsg4 = false;
  bool isPlayingMsg5 = false;

  String answer1 = "";
  String answer2 = "";
  String answer3 = "";
  String answer4 = "";

  var istap = false;

  int clicksPerpage = 0;
  int correctAns = 0;
  int incorrectAns = 0;
  int timeFirstClick = 0;
  num duration = 0;
  List timeIntervalClicks = [];

  int timer = 0;
  bool canceltimer = false;

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      if (mounted) {
        setState(() {
          timer = timer + 1;
        });
      }
    });
  }

  AudioPlayer player = AudioPlayer();

  num countDuration() {
    for (int i = 0; i < timeIntervalClicks.length; i++) {
      duration = duration + timeIntervalClicks[i];
    }
    return duration;
  }

  late AudioCache audioCache;

  @override
  void initState() {
    starttimer();

    super.initState();
  }

  Color getColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.cyan;
  }

  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comprehension"),
        backgroundColor: Colors.deepPurple[300],
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: const EdgeInsets.all(14.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/cloud_bg.jpg"),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                isChecked1 && isChecked3
                    ? TablerIcons.circle_check
                    : isChecked2 && isChecked4
                        ? TablerIcons.circle_check
                        : TablerIcons.circle_dashed,
                size: 30,
                color: isChecked1 && isChecked3
                    ? Colors.green
                    : isChecked2 && isChecked4
                        ? Colors.red
                        : Colors.black,
              ),
              Icon(
                TablerIcons.line_dashed,
                size: 30,
              ),
              Icon(
                TablerIcons.circle_dashed,
                size: 30,
              ),
              Icon(
                TablerIcons.line_dashed,
                size: 30,
              ),
              Icon(
                TablerIcons.circle_dashed,
                size: 30,
              ),
              Icon(
                TablerIcons.line_dashed,
                size: 30,
              ),
              Icon(
                TablerIcons.circle_dashed,
                size: 30,
              ),
            ]),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            QuestionWidget(question: question),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Material(
              elevation: 5,
              color: Colors.deepPurple[300],
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: Text(
                    "My name is pudsey, have no fear \nHere's my bandana, here's my ear.\nWhen it is november, hear my yelp, \n\"Children of the world, they need your help!\"\nMy name is Pudsey, I'm yellow as the sun, \nI want to care for everyone.\nWhen it is november, hear me plead, \"\nRaise cash for BBC children in Need!\"\nMy name is puddey, I'm good at giving hugs,\nIt's time to give back and show some love.\nGet out there and try, it isn't that hard, \n\"Sell some cakes in your school yard!\"",
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.2,
                    style: const TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Material(
              elevation: 5,
              color: Colors.deepPurple[300],
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Center(
                    child: Text(
                      "1. In which month does Pudsey yelp?",
                      textScaleFactor: 1.2,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.white),
                      ),
                    ),
                    onChanged: (value) {
                      answer1 = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      "2. What do you think the word 'plead' might mean?",
                      textScaleFactor: 1.2,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.white),
                      ),
                    ),
                    onChanged: (value) {
                      answer2 = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      " 3. Can you order the words from the poem by putting the numbers 1-4 in the boxes?",
                      textScaleFactor: 1.2,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Wrap(
                    spacing: 15,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SizedBox(
                        width: 30,
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white),
                                borderRadius: BorderRadius.circular(5)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white),
                            ),
                          ),
                          onChanged: (value) {
                            answer2 = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 40,
                        child: Text(
                          "cash",
                          textScaleFactor: 1.2,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Wrap(
                    spacing: 15,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SizedBox(
                        width: 30,
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white),
                                borderRadius: BorderRadius.circular(5)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white),
                            ),
                          ),
                          onChanged: (value) {
                            answer2 = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 40,
                        child: Text(
                          "ear",
                          textScaleFactor: 1.2,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Wrap(
                    spacing: 15,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SizedBox(
                        width: 30,
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white),
                                borderRadius: BorderRadius.circular(5)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white),
                            ),
                          ),
                          onChanged: (value) {
                            answer2 = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 40,
                        child: Text(
                          "cack",
                          textScaleFactor: 1.2,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Wrap(
                    spacing: 15,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SizedBox(
                        width: 30,
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white),
                                borderRadius: BorderRadius.circular(5)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white),
                            ),
                          ),
                          onChanged: (value) {
                            answer2 = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 40,
                        child: Text(
                          "hugs",
                          textScaleFactor: 1.2,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Material(
              color: const Color.fromARGB(255, 208, 99, 99),
              borderRadius: BorderRadius.circular(changeButton ? 50 : 30),
              child: InkWell(
                onTap: () {
                  if (isChecked1) {
                    correctAns += 1;
                  }
                  if (isChecked2) {
                    incorrectAns += 1;
                  }
                  if (isChecked3) {
                    correctAns += 1;
                  }
                  if (isChecked4) {
                    incorrectAns += 1;
                  }
                  data.updateData(clicksPerpage, correctAns, incorrectAns,
                      timeFirstClick, countDuration(), timeIntervalClicks);

                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => L2R5Q2()));
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 4),
                  width: changeButton ? 50 : 150,
                  height: 50,
                  alignment: Alignment.center,
                  child: changeButton
                      ? Icon(
                          Icons.done,
                          color: const Color.fromARGB(255, 208, 99, 99),
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
            ),
          ]),
        ),
      ),
    );
  }
}
