// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names
import 'dart:async';

import 'package:dyslexia/pages/level1/round3/Q3ddL1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import '../../../utilities/QuestionWidget.dart';
import 'package:dyslexia/pages/data/DataModel.dart';

DataModel data = DataModel();
DataModel returndata() {
  return data;
}

class Q2L1R3 extends StatefulWidget {
  const Q2L1R3({Key? key}) : super(key: key);

  @override
  State<Q2L1R3> createState() => _Q2L1R3State();
}

class _Q2L1R3State extends State<Q2L1R3> {
  String question = "Drag the letters matching the given letter in the bucket";
  var changeButton = false;
  var score = 0;

  bool isPlayingMsg = false;
  bool draged1 = false;
  bool draged2 = false;
  bool draged3 = false;
  bool draged4 = false;
  bool draged5 = false;
  bool draged6 = false;
  bool draged7 = false;
  bool draged8 = false;
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

  @override
  Widget build(BuildContext context) {
    bool isPlayingMsg = false;
    checktext() {
      if (draged1 == true) {
        return "q";
      } else if (draged2 == true) {
        return "d";
      } else if (draged3 == true) {
        return "b";
      } else if (draged4 == true) {
        return "p";
      } else if (draged5 == true) {
        return "d";
      } else if (draged6 == true) {
        return "p";
      } else if (draged7 == true) {
        return "b";
      } else if (draged8 == true) {
        return "p";
      } else {
        return "ss";
      }
    }

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
                color: Colors.black,
              ),
              Icon(
                TablerIcons.line_dashed,
                size: 30,
                color: Colors.cyan,
              ),
              Icon(
                draged3 && draged7
                    ? TablerIcons.circle_check
                    : draged2
                        ? TablerIcons.circle_check
                        : draged1
                            ? TablerIcons.circle_check
                            : draged4
                                ? TablerIcons.circle_check
                                : draged5
                                    ? TablerIcons.circle_check
                                    : draged6
                                        ? TablerIcons.circle_check
                                        : draged8
                                            ? TablerIcons.circle_check
                                            : TablerIcons.circle_dashed,
                size: 30,
                color: draged3 && draged7
                    ? Colors.green
                    : draged2
                        ? Colors.red
                        : draged1
                            ? Colors.red
                            : draged4
                                ? Colors.red
                                : draged5
                                    ? Colors.red
                                    : draged6
                                        ? Colors.red
                                        : draged8
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
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(9.0),
                  height: 120,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      border: Border.all(
                        color: Colors.cyan,
                        width: 2,
                      )),
                  child: Wrap(
                      runSpacing: 50,
                      spacing: 100,
                      alignment: WrapAlignment.center,
                      children: [
                        Material(
                          elevation: 5,
                          color: Colors.cyan[50],
                          borderRadius: BorderRadius.circular(40),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Center(
                                child: Text(
                              "b",
                              style: TextStyle(fontSize: 35),
                            )),
                          ),
                        ),
                        DragTarget(
                          builder: (
                            BuildContext context,
                            List<dynamic> accepted,
                            List<dynamic> rejected,
                          ) {
                            return isdraged
                                ? Material(
                                    elevation: 5,
                                    borderRadius: BorderRadius.circular(250),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.cyan,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Text(
                                          checktext(),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  )
                                : Material(
                                    elevation: 10,
                                    borderRadius: BorderRadius.circular(80),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.cyan,
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
                              isdraged = true;
                            });
                          },
                        ),
                      ]),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                Container(
                  padding: EdgeInsets.all(10.0),
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      )),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 15,
                    runSpacing: 10,
                    children: [
                      draged1
                          ? SizedBox(
                              height: 50,
                              width: 70,
                            )
                          : Draggable(
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(410),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.cyan,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "q",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                draged1 = true;
                                isdraged = true;
                                clicksPerpage += 1;
                                incorrectAns += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                              },
                              data: 1,
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                  child: Text(
                                    "q",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              childWhenDragging: Material(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 50.0,
                                  width: 70.0,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
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
                                      color: Colors.cyan,
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
                                draged2 = true;

                                clicksPerpage += 1;
                                incorrectAns += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;

                                isdraged = true;
                              },
                              data: 1,
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "d",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                              ),
                              childWhenDragging: Material(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 50.0,
                                  width: 70.0,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
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
                                      color: Colors.cyan,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "b",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                isdraged = true;
                                draged3 = true;
                                clicksPerpage += 1;
                                correctAns += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                              },
                              data: 1,
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "b",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                              ),
                              childWhenDragging: Material(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 50.0,
                                  width: 70.0,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
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
                                      color: Colors.cyan,
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
                                isdraged = true;
                                draged4 = true;
                                clicksPerpage += 1;
                                incorrectAns += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                              },
                              data: 1,
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "p",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                              ),
                              childWhenDragging: Material(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 50.0,
                                  width: 70.0,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
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
                                      color: Colors.cyan,
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
                                isdraged = true;
                                draged5 = true;
                                clicksPerpage += 1;
                                incorrectAns += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                              },
                              data: 1,
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "d",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                              ),
                              childWhenDragging: Material(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 50.0,
                                  width: 70.0,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
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
                                      color: Colors.cyan,
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
                                clicksPerpage += 1;
                                incorrectAns += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                                isdraged = true;
                                draged6 = true;
                              },
                              data: 1,
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "p",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                              ),
                              childWhenDragging: Material(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 50.0,
                                  width: 70.0,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
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
                                      color: Colors.cyan,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "b",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                clicksPerpage += 1;
                                correctAns += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                                isdraged = true;
                                draged7 = true;
                              },
                              data: 1,
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "b",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                              ),
                              childWhenDragging: Material(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 50.0,
                                  width: 70.0,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
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
                                      color: Colors.cyan,
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
                                clicksPerpage += 1;
                                incorrectAns += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;
                                isdraged = true;
                                draged8 = true;
                              },
                              data: 1,
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "p",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                              ),
                              childWhenDragging: Material(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 50.0,
                                  width: 70.0,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            )
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
                  data.updateData(clicksPerpage, correctAns, incorrectAns,
                      timeFirstClick, countDuration(), timeIntervalClicks);
                  print(data.clicksPerpage);
                  Duration(seconds: 4);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Q3L1R3()));
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
