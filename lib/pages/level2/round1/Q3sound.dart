// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:dyslexia/pages/level2/round1/Q4sound.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../../utilities/QuestionWidget.dart';
import 'package:dyslexia/pages/data/DataModel.dart';

DataModel data = DataModel();
DataModel returndata() {
  return data;
}

class Q3Sint extends StatefulWidget {
  const Q3Sint({Key? key}) : super(key: key);

  @override
  State<Q3Sint> createState() => _Q3SintState();
}

class _Q3SintState extends State<Q3Sint> {
  String question =
      "Listen to this letter sound and then choose the letter whose sound you hear";
  var changeButton = false;
  var score = 0;
  final FlutterTts flutterTts = FlutterTts();

  speak(word) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.setVolume(10.0);
    await flutterTts.speak(word);
  }

  bool changecolourC = false;
  bool changecolourW1 = false;
  bool changecolourW2 = false;
  bool changecolourW3 = false;
  bool changecolourW4 = false;
  bool changecolourW5 = false;

  var word = "hello";

  double elev = 10;
  bool changeColor = false;
  var letter = 'm';
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

  bool isPlayingMsg1 = false;

  AudioPlayer player = AudioPlayer();

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
            ),
            Icon(
              TablerIcons.circle_check,
              size: 30,
            ),
            Icon(
              TablerIcons.line_dashed,
              color: Colors.cyan,
              size: 30,
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Container(
            padding: EdgeInsets.all(9.0),
            height: 110,
            width: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                border: Border.all(
                  color: Colors.cyan,
                  width: 2,
                )),
            child: Wrap(
                runSpacing: 10,
                spacing: 5,
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
                          player.play(AssetSource("sound/b.mp3"));
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
                ]),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.07),
          Wrap(
            spacing: 10,
            runSpacing: 5,
            children: [
              Material(
                elevation: elev,
                shadowColor: Colors.grey,
                color: changecolourW1 ? Colors.red : Colors.cyan,
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () {
                    clicksPerpage += 1;
                    timeFirstClick = timer.toInt();
                    incorrectAns += 1;
                    timeIntervalClicks.add(timer.toInt());
                    if (mounted) {
                      setState(() {
                        timer = 0;
                        changecolourW1 = true;
                        elev = 0;
                      });
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("W",
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
                    timeFirstClick = timer.toInt();
                    incorrectAns += 1;
                    timeIntervalClicks.add(timer.toInt());
                    if (mounted) {
                      setState(() {
                        timer = 0;
                        changecolourW2 = true;
                        elev = 0;
                      });
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("N",
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
                    istap = true;
                    clicksPerpage += 1;
                    timeFirstClick = timer.toInt();
                    incorrectAns += 1;
                    timeIntervalClicks.add(timer.toInt());
                    if (mounted) {
                      setState(() {
                        timer = 0;
                        changecolourW3 = true;
                        elev = 0;
                      });
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("U",
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
                    timeFirstClick = timer.toInt();
                    correctAns += 1;

                    timeIntervalClicks.add(timer.toInt());
                    if (mounted) {
                      setState(() {
                        timer = 0;
                        changecolourW1 = true;
                        elev = 0;
                      });
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("M",
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
                    timeFirstClick = timer.toInt();
                    incorrectAns += 1;
                    timeIntervalClicks.add(timer.toInt());
                    if (mounted) {
                      setState(() {
                        timer = 0;
                        changecolourW4 = true;
                        elev = 0;
                      });
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("W",
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
                    timeFirstClick = timer.toInt();
                    incorrectAns += 1;
                    timeIntervalClicks.add(timer.toInt());
                    if (mounted) {
                      setState(() {
                        timer = 0;
                        changecolourC = true;
                        elev = 0;
                      });
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("M",
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
                    MaterialPageRoute(builder: (context) => Q4Sint()));
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
