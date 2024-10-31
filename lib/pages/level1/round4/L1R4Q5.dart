// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names, unnecessary_string_escapes

import 'dart:async';
import 'package:dyslexia/pages/level1/round5/L1R5Q1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import 'package:audioplayers/audioplayers.dart';

import '../../../utilities/QuestionWidget.dart';
import 'package:dyslexia/pages/data/DataModel.dart';

DataModel data = DataModel();
DataModel returndata() {
  return data;
}

class L1R4Q5 extends StatefulWidget {
  const L1R4Q5({Key? key}) : super(key: key);

  @override
  State<L1R4Q5> createState() => _L1R4Q5State();
}

class _L1R4Q5State extends State<L1R4Q5> {
  String question =
      "Listen to this letter sound and then choose the letter whose sound you hear";

  var changeButton = false;

  bool changecolourC = false;
  bool changecolourW1 = false;
  bool changecolourW2 = false;
  bool changecolourW3 = false;
  bool changecolourW4 = false;
  bool changecolourW5 = false;
  bool changecolourW6 = false;
  bool changecolourW7 = false;

  double elev = 10;
  bool changeColor = false;
  String letter = "z";
  bool buttonPressed1 = false;
  bool isPlayingMsg = false;
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

  @override
  void initState() {
    starttimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isPlayingMsg = false;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.cyan,
        title: Text("AD&DY"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              TablerIcons.circle_check,
              size: 30,
            ),
            Icon(
              TablerIcons.line_dashed,
              size: 30,
              color: Colors.black,
            ),
            Icon(
              TablerIcons.circle_check,
              size: 30,
            ),
            Icon(
              TablerIcons.line_dashed,
              size: 30,
              color: Colors.black,
            ),
            Icon(
              TablerIcons.circle_check,
              size: 30,
            ),
            Icon(
              TablerIcons.line_dashed,
              size: 30,
              color: Colors.black,
            ),
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
              changecolourC
                  ? TablerIcons.circle_check
                  : changecolourW1
                      ? TablerIcons.circle_check
                      : changecolourW2
                          ? TablerIcons.circle_check
                          : changecolourW3
                              ? TablerIcons.circle_check
                              : changecolourW4
                                  ? TablerIcons.circle_check
                                  : changecolourW5
                                      ? TablerIcons.circle_check
                                      : changecolourW6
                                          ? TablerIcons.circle_check
                                          : changecolourW7
                                              ? TablerIcons.circle_check
                                              : TablerIcons.circle_dashed,
              size: 30,
              color: changecolourC
                  ? Colors.green
                  : changecolourW1
                      ? Colors.red
                      : changecolourW2
                          ? Colors.red
                          : changecolourW3
                              ? Colors.red
                              : changecolourW4
                                  ? Colors.red
                                  : changecolourW5
                                      ? Colors.red
                                      : changecolourW6
                                          ? Colors.red
                                          : changecolourW7
                                              ? Colors.red
                                              : Colors.black,
            ),
          ]),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          QuestionWidget(question: question),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),

          //audio button

          Material(
            elevation: 5,
            color: Colors.cyan[50],
            child: ListTile(
              onTap: () async {
                isPlayingMsg = true;

                player.setVolume(200);
                player.play(AssetSource("sound/A.mp3"));
                clicksPerpage += 1;
                timeFirstClick = timer.toInt();
                timeIntervalClicks.add(timer.toInt());
                if (mounted) {
                  setState(() {
                    timer = 0;
                  });
                }
              },
              leading: Icon(isPlayingMsg ? Icons.stop : Icons.play_arrow),
              title: Text(isPlayingMsg ? "Stop" : "Play",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ),
          ),

          Divider(
            thickness: 1.0,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Wrap(
            spacing: 10,
            runSpacing: 5,
            children: [
              Material(
                elevation: elev,
                shadowColor: Colors.grey,
                color: changecolourC ? Colors.green : Colors.cyan,
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () {
                    clicksPerpage += 1;
                    correctAns += 1;

                    timeIntervalClicks.add(timer.toInt());
                    if (mounted) {
                      setState(() {
                        changecolourC = true;
                        elev = 0;
                        timer = 0;
                      });
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("r",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                ),
              ),
              Material(
                elevation: elev,
                shadowColor: Colors.grey,
                color: changecolourW1 ? Colors.red : Colors.cyan,
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () {
                    clicksPerpage += 1;
                    incorrectAns += 1;
                    timeIntervalClicks.add(timer.toInt());
                    if (mounted) {
                      setState(() {
                        changecolourW1 = true;
                        elev = 0;
                        timer = 0;
                      });
                    }
                    istap = true;
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("b",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                ),
              ),
              Material(
                elevation: elev,
                shadowColor: Colors.grey,
                color: changecolourW2 ? Colors.red : Colors.cyan,
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () {
                    clicksPerpage += 1;
                    incorrectAns += 1;
                    timeIntervalClicks.add(timer.toInt());
                    if (mounted) {
                      setState(() {
                        changecolourW2 = true;
                        elev = 0;
                        timer = 0;
                      });
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("s",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                ),
              ),
              Material(
                elevation: elev,
                shadowColor: Colors.grey,
                color: changecolourC ? Colors.green : Colors.cyan,
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () {
                    clicksPerpage += 1;
                    correctAns += 1;
                    timeIntervalClicks.add(timer.toInt());
                    if (mounted) {
                      setState(() {
                        changecolourC = true;
                        elev = 0;
                        timer = 0;
                      });
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("r",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                ),
              ),
              Material(
                elevation: elev,
                shadowColor: Colors.grey,
                color: changecolourW3 ? Colors.red : Colors.cyan,
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () {
                    clicksPerpage += 1;
                    incorrectAns += 1;
                    timeIntervalClicks.add(timer.toInt());
                    if (mounted) {
                      setState(() {
                        changecolourW3 = true;
                        elev = 0;
                        timer = 0;
                      });
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("t",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                ),
              ),
              Material(
                elevation: elev,
                shadowColor: Colors.grey,
                color: changecolourW4 ? Colors.red : Colors.cyan,
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () {
                    clicksPerpage += 1;
                    incorrectAns += 1;
                    timeIntervalClicks.add(timer.toInt());

                    if (mounted) {
                      setState(() {
                        changecolourW4 = true;
                        elev = 0;
                        timer = 0;
                      });
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("f",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                ),
              ),
              Material(
                elevation: elev,
                shadowColor: Colors.grey,
                color: changecolourW6 ? Colors.red : Colors.cyan,
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () {
                    clicksPerpage += 1;
                    incorrectAns += 1;
                    timeIntervalClicks.add(timer.toInt());

                    if (mounted) {
                      setState(() {
                        changecolourW6 = true;
                        elev = 0;
                        timer = 0;
                      });
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("b",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                ),
              ),
              Material(
                elevation: elev,
                shadowColor: Colors.grey,
                color: changecolourW7 ? Colors.red : Colors.cyan,
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () {
                    clicksPerpage += 1;
                    incorrectAns += 1;
                    timeIntervalClicks.add(timer.toInt());

                    if (mounted) {
                      setState(() {
                        changecolourW7 = true;
                        elev = 0;
                        timer = 0;
                      });
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("m",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Colors.black,
                          ))),
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
                    MaterialPageRoute(builder: (context) => Q1L1R5()));
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
    );
  }
}
