// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names, unnecessary_string_escapes
import 'dart:async';

import 'package:dyslexia/pages/level1/round6/L1R6Q4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import 'package:audioplayers/audioplayers.dart';

import '../../../utilities/QuestionWidget.dart';
import 'package:dyslexia/pages/data/DataModel.dart';

DataModel data = DataModel();
DataModel returndata() {
  return data;
}

class L1R6Q3 extends StatefulWidget {
  const L1R6Q3({Key? key}) : super(key: key);

  @override
  State<L1R6Q3> createState() => _L1R6Q3State();
}

class _L1R6Q3State extends State<L1R6Q3> {
  String question =
      "Listen to this word pen. Now listen to the four words and click on the word that has the same starting sound as cat. ";

  var changeButton = false;

  double elev = 10;
  bool changeColor = false;
  bool buttonPressed1 = false;
  bool isPlayingMsg1 = false;
  bool isPlayingMsg2 = false;
  bool isPlayingMsg3 = false;
  bool isPlayingMsg4 = false;
  bool isPlayingMsg5 = false;

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
                color: Colors.cyan,
              ),
              Icon(
                isChecked2
                    ? TablerIcons.circle_check
                    : isChecked1 || isChecked4 || isChecked3
                        ? TablerIcons.circle_check
                        : TablerIcons.circle_dashed,
                size: 30,
                color: isChecked2
                    ? Colors.green
                    : isChecked1 || isChecked4 || isChecked3
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),

            //audio button

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
                            player.play(AssetSource("sound/pen.mp3"));
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
                  ]),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.07),
            Container(
              padding: EdgeInsets.all(9.0),
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.cyan,
                    width: 2,
                  )),
              child: Wrap(
                spacing: 80,
                runSpacing: 5,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple[200],
                              borderRadius: BorderRadius.circular(30)),
                          child: InkWell(
                            onTap: (() {
                              player.play(AssetSource("sound/dog.mp3"));
                              clicksPerpage += 1;

                              timeIntervalClicks.add(timer.toInt());
                              Timer(Duration(seconds: 4), () {
                                if (mounted) {
                                  setState(() {
                                    isPlayingMsg2 = false;
                                  });
                                }
                              });
                              if (mounted) {
                                setState(() {
                                  isPlayingMsg2 = true;
                                  timer = 0;
                                });
                              }
                            }),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  isPlayingMsg2
                                      ? TablerIcons.player_pause
                                      : TablerIcons.player_play,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "dog",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: WidgetStateProperty.resolveWith(getColor),
                        value: isChecked1,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked1 = value!;
                          });
                        },
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple[200],
                              borderRadius: BorderRadius.circular(30)),
                          child: InkWell(
                            onTap: (() {
                              player.play(AssetSource("sound/hen.mp3"));
                              clicksPerpage += 1;
                              timeIntervalClicks.add(timer.toInt());
                              Timer(Duration(seconds: 4), () {
                                if (mounted) {
                                  setState(() {
                                    isPlayingMsg3 = false;
                                  });
                                }
                              });
                              if (mounted) {
                                setState(() {
                                  isPlayingMsg3 = true;
                                  timer = 0;
                                });
                              }
                            }),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  isPlayingMsg3
                                      ? TablerIcons.player_pause
                                      : TablerIcons.player_play,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "hen",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: WidgetStateProperty.resolveWith(getColor),
                        value: isChecked2,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked2 = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple[200],
                              borderRadius: BorderRadius.circular(30)),
                          child: InkWell(
                            onTap: (() {
                              player.play(AssetSource("sound/bot.mp3"));
                              clicksPerpage += 1;
                              timeIntervalClicks.add(timer.toInt());
                              Timer(Duration(seconds: 4), () {
                                if (mounted) {
                                  setState(() {
                                    isPlayingMsg4 = false;
                                  });
                                }
                              });
                              if (mounted) {
                                setState(() {
                                  isPlayingMsg4 = true;
                                  timer = 0;
                                });
                              }
                            }),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  isPlayingMsg4
                                      ? TablerIcons.player_pause
                                      : TablerIcons.player_play,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "bot",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: WidgetStateProperty.resolveWith(getColor),
                        value: isChecked3,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked3 = value!;
                          });
                        },
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple[200],
                              borderRadius: BorderRadius.circular(30)),
                          child: InkWell(
                            onTap: (() {
                              player.play(AssetSource("sound/car.mp3"));
                              clicksPerpage += 1;
                              timeIntervalClicks.add(timer.toInt());
                              Timer(Duration(seconds: 4), () {
                                if (mounted) {
                                  setState(() {
                                    isPlayingMsg5 = false;
                                  });
                                }
                              });
                              if (mounted) {
                                setState(() {
                                  isPlayingMsg5 = true;
                                  timer = 0;
                                });
                              }
                            }),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  isPlayingMsg5
                                      ? TablerIcons.player_pause
                                      : TablerIcons.player_play,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "car",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: WidgetStateProperty.resolveWith(getColor),
                        value: isChecked4,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked4 = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Material(
              color: Colors.black,
              borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
              child: InkWell(
                onTap: () {
                  if (isChecked1) {
                    incorrectAns += 1;
                  }
                  if (isChecked2) {
                    correctAns += 1;
                  }
                  if (isChecked3) {
                    incorrectAns += 1;
                  }
                  if (isChecked4) {
                    incorrectAns += 1;
                  }

                  data.updateData(clicksPerpage, correctAns, incorrectAns,
                      timeFirstClick, countDuration(), timeIntervalClicks);

                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => L1R6Q4()));
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
