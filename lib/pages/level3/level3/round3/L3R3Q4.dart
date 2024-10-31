// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:dyslexia/utilities/QuestionWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'L3R3Q5.dart';
import 'package:dyslexia/pages/data/DataModel.dart';

DataModel data = DataModel();
DataModel returndata() {
  return data;
}

class L3R3Q4 extends StatefulWidget {
  const L3R3Q4({Key? key}) : super(key: key);

  @override
  State<L3R3Q4> createState() => _L3R3Q4State();
}

class _L3R3Q4State extends State<L3R3Q4> {
  String question = "Can you spell Penguin?";
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
  bool draged9 = false;
  bool draged10 = false;

  bool target1 = false;
  bool target2 = false;
  bool target3 = false;
  bool target4 = false;
  bool target5 = false;
  bool target6 = false;
  bool target7 = false;

  String letter1 = "";
  String letter2 = "";
  String letter3 = "";
  String letter4 = "";
  String letter5 = "";
  String letter6 = "";
  String letter7 = "";

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
        title: const Text("Spell the word"),
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
                letter1 == "p" &&
                        letter2 == "e" &&
                        letter3 == "n" &&
                        letter4 == "g" &&
                        letter5 == "u" &&
                        letter6 == "i" &&
                        letter7 == "n"
                    ? TablerIcons.circle_check
                    : TablerIcons.circle_dashed,
                size: 30,
                color: letter1 == "p" &&
                        letter2 == "e" &&
                        letter3 == "n" &&
                        letter4 == "g" &&
                        letter5 == "u" &&
                        letter6 == "i" &&
                        letter7 == "n"
                    ? Colors.green
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
              ),
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
                            player.play(AssetSource("sound/penguin.mp3"));
                            Timer(Duration(seconds: 3), () {
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
                        "assets/images/penguin.png",
                      ),
                      height: 90,
                      width: 90,
                    ),
                  ]),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Container(
              padding:
                  EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple[200]),
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                spacing: 5,
                runSpacing: 8,
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
                              child: Container(
                                width: 60,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.deepPurple[200],
                                ),
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
                              child: SizedBox(
                                width: 60,
                                height: 50,
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
                              child: Container(
                                width: 60,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
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
                              child: SizedBox(
                                width: 60,
                                height: 50,
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
                              child: Container(
                                width: 60,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
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
                              child: SizedBox(
                                width: 60,
                                height: 50,
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
                              child: Container(
                                width: 60,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
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
                              child: SizedBox(
                                width: 60,
                                height: 50,
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
                  DragTarget(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return target5
                          ? Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: 60,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.deepPurple[200]),
                                child: Center(
                                    child: Text(
                                  letter5,
                                  style: TextStyle(fontSize: 20),
                                )),
                              ),
                            )
                          : Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                width: 60,
                                height: 50,
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
                        target5 = true;
                        letter5 = dragW.toString();
                      });
                    },
                  ),
                  DragTarget(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return target6
                          ? Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: 60,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.deepPurple[200]),
                                child: Center(
                                    child: Text(
                                  letter6,
                                  style: TextStyle(fontSize: 20),
                                )),
                              ),
                            )
                          : Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                width: 60,
                                height: 50,
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
                        target6 = true;
                        letter6 = dragW.toString();
                      });
                    },
                  ),
                  DragTarget(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return target7
                          ? Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: 60,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.deepPurple[200],
                                ),
                                child: Center(
                                    child: Text(
                                  letter7,
                                  style: TextStyle(fontSize: 20),
                                )),
                              ),
                            )
                          : Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                width: 60,
                                height: 50,
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
                        target7 = true;
                        letter7 = dragW.toString();
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.deepPurple[200],
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
                                      color: Colors.deepPurple[50],
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "n",
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
                              data: "n",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[50],
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Text(
                                    "n",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              childWhenDragging: SizedBox()),
                      draged2
                          ? SizedBox()
                          : Draggable(
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(200),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[50],
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "z",
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
                              data: "z",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[50],
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "z",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                              ),
                              childWhenDragging: SizedBox()),
                      draged3
                          ? SizedBox()
                          : Draggable(
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(200),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[50],
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "p",
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
                              data: "p",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[50],
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "p",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                              ),
                              childWhenDragging: SizedBox()),
                      draged4
                          ? SizedBox()
                          : Draggable(
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(120),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[50],
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "d",
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
                              data: "d",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[50],
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "d",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                              ),
                              childWhenDragging: SizedBox()),
                      draged5
                          ? SizedBox()
                          : Draggable(
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(200),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[50],
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "g",
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
                              data: "g",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[50],
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "g",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                              ),
                              childWhenDragging: SizedBox()),
                      draged6
                          ? SizedBox()
                          : Draggable(
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(200),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[50],
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "i",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                draged6 = true;
                                clicksPerpage += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                              },
                              data: "i",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[50],
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "i",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                              ),
                              childWhenDragging: SizedBox()),
                      draged7
                          ? SizedBox()
                          : Draggable(
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(200),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[50],
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
                                draged7 = true;
                                clicksPerpage += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                              },
                              data: "e",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[50],
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
                      draged8
                          ? SizedBox()
                          : Draggable(
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(200),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[50],
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "u",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                draged8 = true;
                                clicksPerpage += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                              },
                              data: "u",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[50],
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "u",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                              ),
                              childWhenDragging: SizedBox()),
                      draged9
                          ? SizedBox()
                          : Draggable(
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(200),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[50],
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "n",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                draged9 = true;
                                clicksPerpage += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                              },
                              data: "n",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[50],
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "n",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                              ),
                              childWhenDragging: SizedBox()),
                      draged10
                          ? SizedBox()
                          : Draggable(
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(200),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[50],
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
                                draged10 = true;
                                clicksPerpage += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                              },
                              data: "a",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[50],
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
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Material(
              color: const Color.fromARGB(255, 208, 99, 99),
              borderRadius: BorderRadius.circular(changeButton ? 50 : 30),
              child: InkWell(
                onTap: () {
                  if (letter1 == "p" &&
                      letter2 == "e" &&
                      letter3 == "n" &&
                      letter4 == "g" &&
                      letter5 == "u" &&
                      letter6 == "i" &&
                      letter7 == "n") {
                    correctAns += 1;
                  } else {
                    incorrectAns += 1;
                  }
                  data.updateData(clicksPerpage, correctAns, incorrectAns,
                      timeFirstClick, countDuration(), timeIntervalClicks);
                  print(data.duration);
                  Duration(seconds: 4);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => L3R3Q5()));
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
