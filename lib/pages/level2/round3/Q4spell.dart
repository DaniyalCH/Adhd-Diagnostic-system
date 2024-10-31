// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:dyslexia/pages/level2/round3/Q5spell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import '../../../utilities/QuestionWidget.dart';

import 'package:dyslexia/pages/data/DataModel.dart';

DataModel data = DataModel();
DataModel returndata() {
  return data;
}

class Q4spell extends StatefulWidget {
  const Q4spell({Key? key}) : super(key: key);

  @override
  State<Q4spell> createState() => _Q4spellState();
}

class _Q4spellState extends State<Q4spell> {
  String question = "Can you spell cake?";
  var changeButton = false;
  bool isPlayingMsg1 = false;
  bool isPlayingMsg2 = false;
  bool isPlayingMsg3 = false;
  bool isPlayingMsg4 = false;
  bool isPlayingMsg5 = false;

  int clicksPerpage = 0;
  int correctAns = 0;
  int incorrectAns = 0;
  int timeFirstClick = 0;
  num duration = 0;
  List timeIntervalClicks = [];

  int timer = 0;
  bool canceltimer = false;

  bool draged1 = false;
  bool draged2 = false;
  bool draged3 = false;
  bool draged4 = false;
  bool draged5 = false;
  bool draged6 = false;
  bool draged7 = false;
  bool draged8 = false;

  bool target1 = false;
  bool target2 = false;
  bool target3 = false;
  bool target4 = false;

  String letter1 = "";
  String letter2 = "";
  String letter3 = "";
  String letter4 = "";

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

  @override
  void initState() {
    starttimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.cyan,
        title: Text("AD&DY"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                TablerIcons.circle_check,
                size: 30,
              ),
              Icon(
                TablerIcons.line_dashed,
                size: 30,
              ),
              Icon(
                TablerIcons.circle_check,
                size: 30,
              ),
              Icon(
                TablerIcons.line_dashed,
                size: 30,
              ),
              Icon(
                TablerIcons.circle_check,
                size: 30,
              ),
              Icon(
                TablerIcons.line_dashed,
                size: 30,
              ),
              Icon(
                letter1 == "c" &&
                        letter2 == "a" &&
                        letter3 == "k" &&
                        letter4 == "e"
                    ? TablerIcons.circle_check
                    : letter1 == "r" ||
                            letter1 == "s" ||
                            letter1 == "y" ||
                            letter1 == "o"
                        ? TablerIcons.circle_check
                        : TablerIcons.circle_dashed,
                size: 30,
                color: letter1 == "c" &&
                        letter2 == "a" &&
                        letter3 == "k" &&
                        letter4 == "e"
                    ? Colors.green
                    : letter1 == "r" ||
                            letter1 == "s" ||
                            letter1 == "y" ||
                            letter1 == "o"
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
            ]),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            QuestionWidget(
              question: question,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Container(
              padding: EdgeInsets.all(9.0),
              height: 110,
              width: 280,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  border: Border.all(
                    color: Colors.cyan,
                    width: 2,
                  )),
              child: Wrap(
                  runSpacing: 50,
                  spacing: 10,
                  alignment: WrapAlignment.center,
                  children: [
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.yellow, shape: BoxShape.circle),
                        child: InkWell(
                          onTap: (() {
                            player.play(AssetSource("sound/cake.mp3"));
                            Timer(Duration(seconds: 4), () {
                              if (mounted) {
                                setState(() {
                                  isPlayingMsg1 = false;
                                });
                              }
                            });
                            clicksPerpage += 1;
                            timeFirstClick = timer.toInt();
                            timeIntervalClicks.add(timer.toInt());
                            if (mounted) {
                              setState(() {
                                isPlayingMsg1 = true;
                                timer = 0;
                              });
                            }
                          }),
                          child: Center(
                              child: Icon(isPlayingMsg1
                                  ? TablerIcons.player_pause
                                  : TablerIcons.player_play)),
                        ),
                      ),
                    ),
                    Image(
                      image: AssetImage(
                        "assets/images/hat.jpg",
                      ),
                      height: 90,
                      width: 90,
                    ),
                  ]),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Container(
              height: 80,
              width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple[200]),
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                spacing: 10,
                children: [
                  DragTarget(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return target1
                          ? Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.cyan,
                              child: Container(
                                width: 60,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  letter1,
                                  style: TextStyle(fontSize: 20),
                                )),
                              ),
                            )
                          : Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.cyan,
                              child: Container(
                                width: 60,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                    child: Icon(
                                  TablerIcons.bucket,
                                  size: 30,
                                )),
                              ),
                            );
                    },
                    onWillAcceptWithDetails: ((data) {
                      return true;
                    }),
                    onAcceptWithDetails: (dragW) {
                      setState(() {
                        target1 = true;
                        letter1 = dragW.toString();
                      });
                    },
                  ),
                  DragTarget(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return target2
                          ? Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.cyan,
                              child: Container(
                                width: 60,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  letter2,
                                  style: TextStyle(fontSize: 20),
                                )),
                              ),
                            )
                          : Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.cyan,
                              child: Container(
                                width: 60,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                    child: Icon(
                                  TablerIcons.bucket,
                                  size: 30,
                                )),
                              ),
                            );
                    },
                    onWillAcceptWithDetails: ((data) {
                      return true;
                    }),
                    onAcceptWithDetails: (dragW) {
                      setState(() {
                        target2 = true;
                        letter2 = dragW.toString();
                      });
                    },
                  ),
                  DragTarget(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return target3
                          ? Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.cyan,
                              child: Container(
                                width: 60,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  letter3,
                                  style: TextStyle(fontSize: 20),
                                )),
                              ),
                            )
                          : Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.cyan,
                              child: Container(
                                width: 60,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                    child: Icon(
                                  TablerIcons.bucket,
                                  size: 30,
                                )),
                              ),
                            );
                    },
                    onWillAcceptWithDetails: ((data) {
                      return true;
                    }),
                    onAcceptWithDetails: (dragW) {
                      setState(() {
                        target3 = true;
                        letter3 = dragW.toString();
                      });
                    },
                  ),
                  DragTarget(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return target4
                          ? Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.cyan,
                              child: Container(
                                width: 60,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  letter4,
                                  style: TextStyle(fontSize: 20),
                                )),
                              ),
                            )
                          : Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.cyan,
                              child: Container(
                                width: 60,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                    child: Icon(
                                  TablerIcons.bucket,
                                  size: 30,
                                )),
                              ),
                            );
                    },
                    onWillAcceptWithDetails: ((data) {
                      return true;
                    }),
                    onAcceptWithDetails: (dragW) {
                      setState(() {
                        target4 = true;
                        letter4 = dragW.toString();
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  height: 180,
                  width: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.cyan,
                  ),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 15,
                    runSpacing: 10,
                    children: [
                      draged1
                          ? SizedBox()
                          : Draggable(
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(410),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[200],
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "r",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                draged1 = true;
                                clicksPerpage += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                              },
                              data: "r",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[200],
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Text(
                                    "r",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              childWhenDragging: SizedBox()),
                      draged2
                          ? SizedBox(
                              height: 50,
                              width: 70,
                            )
                          : Draggable(
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(200),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[200],
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "a",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                draged2 = true;

                                clicksPerpage += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                              },
                              data: "a",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[200],
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "a",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                              ),
                              childWhenDragging: SizedBox()),
                      draged3
                          ? SizedBox(
                              height: 50,
                              width: 70,
                            )
                          : Draggable(
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(200),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[200],
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "s",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                draged3 = true;
                                clicksPerpage += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                              },
                              data: "s",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[200],
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "s",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                              ),
                              childWhenDragging: SizedBox()),
                      draged4
                          ? SizedBox(
                              height: 50,
                              width: 70,
                            )
                          : Draggable(
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(120),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[200],
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "k",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                draged4 = true;
                                clicksPerpage += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                              },
                              data: "k",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[200],
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "k",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                              ),
                              childWhenDragging: SizedBox()),
                      draged5
                          ? SizedBox(
                              height: 50,
                              width: 70,
                            )
                          : Draggable(
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(200),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[200],
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "y",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                draged5 = true;
                                clicksPerpage += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                              },
                              data: "y",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[200],
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "y",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                              ),
                              childWhenDragging: SizedBox()),
                      draged6
                          ? SizedBox(
                              height: 50,
                              width: 70,
                            )
                          : Draggable(
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(200),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[200],
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "c",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                draged5 = true;
                                clicksPerpage += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                              },
                              data: "c",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[200],
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "c",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                              ),
                              childWhenDragging: SizedBox()),
                      draged7
                          ? SizedBox(
                              height: 50,
                              width: 70,
                            )
                          : Draggable(
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(200),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[200],
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "o",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                draged5 = true;
                                clicksPerpage += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                              },
                              data: "o",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[200],
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "o",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                              ),
                              childWhenDragging: SizedBox()),
                      draged8
                          ? SizedBox(
                              height: 50,
                              width: 70,
                            )
                          : Draggable(
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(200),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[200],
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "e",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                draged5 = true;
                                clicksPerpage += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                              },
                              data: "e",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[200],
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "e",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                              ),
                              childWhenDragging: SizedBox()),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Material(
              color: Colors.black,
              borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
              child: InkWell(
                onTap: () {
                  if (letter1 == "c" &&
                      letter2 == "a" &&
                      letter3 == "k" &&
                      letter4 == "e") {
                    correctAns += 1;
                  } else {
                    incorrectAns += 1;
                  }
                  data.updateData(clicksPerpage, correctAns, incorrectAns,
                      timeFirstClick, countDuration(), timeIntervalClicks);
                  Duration(seconds: 1);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Q5spell()));
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
            ),
          ]),
        ),
      ),
    );
  }
}
