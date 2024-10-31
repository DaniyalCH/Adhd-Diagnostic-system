// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names

import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../../utilities/QuestionWidget.dart';
import 'Q11sound.dart';
import 'package:dyslexia/pages/data/DataModel.dart';

DataModel data = DataModel();
DataModel returndata() {
  return data;
}

class Q10sound extends StatefulWidget {
  const Q10sound({Key? key}) : super(key: key);

  @override
  State<Q10sound> createState() => _Q10soundState();
}

class _Q10soundState extends State<Q10sound> {
  String question =
      "Listen to this letter sound and then choose the letter whose sound you hear";
  var changeButton = false;
  var score = 0;
  final FlutterTts flutterTts = FlutterTts();

  speak(word) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.setVolume(1.0);
    await flutterTts.speak(word);
  }

  var tap_count = 0;
  bool changeColor = false;
  var letter = 'u';
  bool buttonPressed1 = false;
  bool changecolourC = false;
  bool changecolourW1 = false;
  bool changecolourW2 = false;
  bool changecolourW3 = false;
  bool changecolourW4 = false;
  bool changecolourW5 = false;

  int clicksPerpage = 0;
  int correctAns = 0;
  int incorrectAns = 0;
  int timeFirstClick = 0;
  num duration = 0;
  List timeIntervalClicks = [];
  AudioPlayer player = AudioPlayer();
  bool isPlayingMsg = false;

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

  void mappData() {
    data.clicksPerpage = clicksPerpage;
    data.correctAns = correctAns;
    data.incorrectAns = incorrectAns;
    data.timeFirstClick = timeFirstClick;
    data.timeIntervalClicks = timeIntervalClicks;
    data.duration = countDuration();
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
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              TablerIcons.circle_check,
              color: Colors.black,
              size: 30,
            ),
            Icon(
              TablerIcons.line_dashed,
              color: Colors.black,
              size: 30,
            ),
            Icon(
              TablerIcons.circle_check,
              color: Colors.black,
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
          ]),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          QuestionWidget(question: question),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Material(
            elevation: 5,
            color: Colors.cyan[50],
            child: ListTile(
              onTap: () async {
                player.setVolume(200);
                player.play(AssetSource("/sound/u.mp3"));
                isPlayingMsg = true;
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Wrap(
            spacing: 10,
            runSpacing: 5,
            children: [
              Material(
                elevation: 12,
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
                        timer = 0;
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
                elevation: 12,
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
                        timer = 0;
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
                elevation: 12,
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
                        timer = 0;
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
                elevation: 12,
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
                        timer = 0;
                      });
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("V",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                ),
              ),
              Material(
                elevation: 12,
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
                        timer = 0;
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
                elevation: 12,
                shadowColor: Colors.grey,
                color: changecolourW5 ? Colors.red : Colors.cyan,
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () {
                    clicksPerpage += 1;
                    incorrectAns += 1;
                    timeIntervalClicks.add(timer.toInt());
                    if (mounted) {
                      setState(() {
                        changecolourW5 = true;
                        timer = 0;
                      });
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("R",
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
                    MaterialPageRoute(builder: (context) => Q11sound()));
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
