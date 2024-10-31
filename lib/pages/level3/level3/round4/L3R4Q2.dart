// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:dyslexia/pages/level3/level3/round4/L3R4Q3.dart';
import 'package:dyslexia/utilities/QuestionWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:dyslexia/pages/data/DataModel.dart';

DataModel data = DataModel();
DataModel returndata() {
  return data;
}

class L3R4Q2 extends StatefulWidget {
  const L3R4Q2({Key? key}) : super(key: key);

  @override
  State<L3R4Q2> createState() => _L3R4Q2State();
}

class _L3R4Q2State extends State<L3R4Q2> {
  String question =
      "Drag and Re arrange the following months in correct order.";
  var changeButton = false;

  String letter1 = "";
  String letter2 = "";
  String letter3 = "";
  bool target1 = false;
  bool target2 = false;
  bool target3 = false;

  bool isPlayingMsg = false;
  bool draged1 = false;
  bool draged2 = false;
  bool draged3 = false;
  bool isdraged = false;

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

  bool isPlayingMsg1 = false;

  AudioPlayer player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ordering"),
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
                letter1 == "September" &&
                        letter2 == "Octuber" &&
                        letter3 == "November"
                    ? TablerIcons.circle_check
                    : TablerIcons.circle_dashed,
                size: 30,
                color: letter1 == "September" &&
                        letter2 == "Octuber" &&
                        letter3 == "November"
                    ? Colors.green
                    : letter1 == "Octuber" || letter1 == "November"
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
            ]),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            QuestionWidget(question: question),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: 40, bottom: 40, left: 20, right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 38, 47, 40),
                      border: Border.all(color: Colors.brown, width: 8)),
                  child: Wrap(
                    runSpacing: 5,
                    spacing: 2,
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
                                  color: Colors.deepPurple[100],
                                  child: Container(
                                    width: 100,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.deepPurple[100],
                                        shape: BoxShape.circle),
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
                                  color: Colors.deepPurple[100],
                                  child: Container(
                                    width: 100,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.deepPurple[100],
                                        shape: BoxShape.circle),
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
                      SizedBox(
                        height: 5,
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
                                  color: Colors.deepPurple[100],
                                  child: Container(
                                    width: 100,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.deepPurple[100],
                                        shape: BoxShape.circle),
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
                                  color: Colors.deepPurple[100],
                                  child: Container(
                                    width: 100,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.deepPurple[100],
                                        shape: BoxShape.circle),
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
                      SizedBox(
                        height: 5,
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
                                  color: Colors.deepPurple[100],
                                  child: Container(
                                    width: 100,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.deepPurple[100],
                                        shape: BoxShape.circle),
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
                                  color: Colors.deepPurple[100],
                                  child: Container(
                                    width: 100,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.deepPurple[100],
                                        shape: BoxShape.circle),
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
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
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
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: 100,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[100],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      "November",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                draged1 = true;
                                isdraged = true;
                                clicksPerpage += 1;
                                timeFirstClick = timer.toInt();
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                              },
                              data: "November",
                              feedback: Container(
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[100],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "November",
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
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: 100,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[100],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      "Octuber",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                draged2 = true;
                                isdraged = true;
                                clicksPerpage += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                              },
                              data: "Octuber",
                              feedback: Container(
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[100],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "Octuber",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              childWhenDragging: SizedBox()),
                      draged3
                          ? SizedBox()
                          : Draggable(
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: 100,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[100],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      "September",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                draged3 = true;
                                isdraged = true;
                                clicksPerpage += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                              },
                              data: "September",
                              feedback: Container(
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[100],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "September",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                ),
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
                  if (letter1 == "September" &&
                      letter2 == "Octuber" &&
                      letter3 == "November") {
                    correctAns += 1;
                  } else {
                    incorrectAns += 1;
                  }
                  data.updateData(clicksPerpage, correctAns, incorrectAns,
                      timeFirstClick, countDuration(), timeIntervalClicks);
                  Duration(seconds: 4);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => L3R4Q3()));
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
