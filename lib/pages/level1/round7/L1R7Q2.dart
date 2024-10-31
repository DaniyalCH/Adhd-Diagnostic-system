// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names
import 'dart:async';
import 'package:dyslexia/pages/level1/round7/L1R7Q3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import '../../../utilities/QuestionWidget.dart';
import 'package:dyslexia/pages/data/DataModel.dart';

DataModel data = DataModel();
DataModel returndata() {
  return data;
}

class L1R7Q2 extends StatefulWidget {
  const L1R7Q2({Key? key}) : super(key: key);

  @override
  State<L1R7Q2> createState() => _L1R7Q2State();
}

class _L1R7Q2State extends State<L1R7Q2> {
  String question =
      "Can you spell the word milk. Drag the letters to write the word";
  var changeButton = false;

  late String letter1 = "";
  late String letter2 = "";
  late String letter3 = "";
  late String letter4 = "";

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
                color: Colors.cyan,
              ),
              Icon(
                letter1 == "m" &&
                        letter2 == "i" &&
                        letter3 == "l" &&
                        letter4 == "k"
                    ? TablerIcons.circle_check
                    : letter1 == "e" ||
                            letter1 == "s" ||
                            letter1 == "o" ||
                            letter1 == "q"
                        ? TablerIcons.circle_check
                        : TablerIcons.circle_dashed,
                size: 30,
                color: letter1 == "m" &&
                        letter2 == "i" &&
                        letter3 == "l" &&
                        letter4 == "k"
                    ? Colors.green
                    : letter1 == "e" ||
                            letter1 == "s" ||
                            letter1 == "o" ||
                            letter1 == "q"
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
            Container(
              padding: EdgeInsets.all(9.0),
              height: 75,
              width: 370,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  border: Border.all(
                    color: Colors.cyan,
                    width: 2,
                  )),
              child: Wrap(
                  runSpacing: 10,
                  spacing: 7,
                  alignment: WrapAlignment.center,
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
                                color: Colors.yellow,
                                child: Container(
                                  width: 60,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.cyan,
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
                                color: Colors.yellow,
                                child: Container(
                                  width: 60,
                                  height: 50,
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
                          letter1 = dragW.toString();
                          target1 = true;
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
                                color: Colors.yellow,
                                child: Container(
                                  width: 60,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.cyan,
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
                                color: Colors.yellow,
                                child: Container(
                                  width: 60,
                                  height: 50,
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
                          letter2 = dragW.toString();
                          target2 = true;
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
                                color: Colors.yellow,
                                child: Container(
                                  width: 60,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.cyan,
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
                                color: Colors.yellow,
                                child: Container(
                                  width: 60,
                                  height: 50,
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
                          letter3 = dragW.toString();
                          target3 = true;
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
                                color: Colors.yellow,
                                child: Container(
                                  width: 60,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.cyan,
                                      shape: BoxShape.circle),
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
                                color: Colors.yellow,
                                child: Container(
                                  width: 60,
                                  height: 50,
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
                          target4 = true;
                          letter4 = dragW.toString();
                        });
                      },
                    ),
                  ]),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Column(
              children: [
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
                                      "e",
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
                              data: "e",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                  child: Text(
                                    "e",
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
                                      "i",
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
                              data: "i",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "i",
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
                                      "k",
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
                              data: "k",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "k",
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
                                      "s",
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
                              data: "s",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "s",
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
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "o",
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
                                      "l",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                clicksPerpage += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;

                                draged6 = true;
                              },
                              data: "l",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "l",
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
                                      "q",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                clicksPerpage += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;

                                draged7 = true;
                              },
                              data: "q",
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
                                      "m",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                clicksPerpage += 1;
                                timeIntervalClicks.add(timer.toInt());
                                timer = 0;

                                draged8 = true;
                              },
                              data: "m",
                              feedback: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.cyan, shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "m",
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
                  if (letter1 == "m" &&
                      letter2 == "i" &&
                      letter3 == "l" &&
                      letter4 == "k") {
                    correctAns += 1;
                  } else {
                    incorrectAns += 1;
                  }
                  data.updateData(clicksPerpage, correctAns, incorrectAns,
                      timeFirstClick, countDuration(), timeIntervalClicks);
                  print(data.clicksPerpage);
                  Duration(seconds: 4);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => L1R7Q3()));
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
