// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names
import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:dyslexia/pages/level2/round2/Q2DADint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../../utilities/QuestionWidget.dart';
import 'package:dyslexia/pages/data/DataModel.dart';

DataModel data = DataModel();
DataModel returndata() {
  return data;
}

class Q1DADint extends StatefulWidget {
  const Q1DADint({Key? key}) : super(key: key);

  @override
  State<Q1DADint> createState() => _Q1DADintState();
}

class _Q1DADintState extends State<Q1DADint> {
  String question =
      "Listen to this letter sound and then drag all  the letter whose sound you hear into the bucket.";
  var changeButton = false;
  var score = 0;
  final FlutterTts flutterTts = FlutterTts();
  speak(word) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.setVolume(10.0);
    await flutterTts.speak(word);
  }

  var letter = "a";

  bool isPlayingMsg = false;
  bool draged1 = false;
  bool draged2 = false;
  bool draged3 = false;
  bool draged4 = false;
  bool draged5 = false;
  bool draged6 = false;
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
    bool isPlayingMsg = false;
    checktext() {
      if (draged1 == true) {
        return "a";
      } else if (draged2 == true) {
        return "e";
      } else if (draged3 == true) {
        return "i";
      } else if (draged4 == true) {
        return "s";
      } else if (draged5 == true) {
        return "o";
      } else if (draged6 == true) {
        return "u";
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
                draged1
                    ? TablerIcons.circle_check
                    : draged2
                        ? TablerIcons.circle_check
                        : draged3
                            ? TablerIcons.circle_check
                            : draged4
                                ? TablerIcons.circle_check
                                : draged5
                                    ? TablerIcons.circle_check
                                    : draged6
                                        ? TablerIcons.circle_check
                                        : TablerIcons.circle_dashed,
                size: 30,
                color: draged1
                    ? Colors.green
                    : draged2
                        ? Colors.red
                        : draged3
                            ? Colors.red
                            : draged4
                                ? Colors.red
                                : draged5
                                    ? Colors.red
                                    : draged6
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
            Divider(
              thickness: 1.0,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(9.0),
                  height: 110,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      border: Border.all(
                        color: Colors.cyan,
                        width: 2,
                      )),
                  child: Wrap(
                      spacing: 20,
                      alignment: WrapAlignment.center,
                      children: [
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                                color: Colors.yellow, shape: BoxShape.circle),
                            child: InkWell(
                              onTap: (() {
                                player.play(AssetSource("sound/A.mp3"));
                                Timer(const Duration(seconds: 4), () {
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
                                      width: 80,
                                      height: 80,
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
                                      width: 80,
                                      height: 80,
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
                                      "a",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                draged1 = true;
                                isdraged = true;
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
                                    "a",
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
                                      "e",
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
                                  "e",
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
                                      "i",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              onDragCompleted: () {
                                isdraged = true;
                                draged3 = true;
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
                                      "u",
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
                                  "u",
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
                  Duration(seconds: 4);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Q2DADint()));
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