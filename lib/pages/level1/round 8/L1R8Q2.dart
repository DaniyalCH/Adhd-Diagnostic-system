// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:dyslexia/pages/level1/round%208/L1R8Q3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import '../../../utilities/QuestionWidget.dart';
import 'package:dyslexia/pages/data/DataModel.dart';

DataModel data = DataModel();
DataModel returndata() {
  return data;
}

class L1R8Q2 extends StatefulWidget {
  const L1R8Q2({Key? key}) : super(key: key);

  @override
  State<L1R8Q2> createState() => _L1R8Q2State();
}

class _L1R8Q2State extends State<L1R8Q2> {
  String question = "What sounds make up the word";

  var changeButton = false;

  bool changecolourC = false;
  bool changecolourW1 = false;
  bool changecolourW2 = false;
  bool changecolourW3 = false;

  String letter1 = "";
  String letter2 = "";
  String letter3 = "";
  String letter4 = "";

  bool target1 = false;
  bool target2 = false;
  bool target3 = false;
  bool target4 = false;

  bool dragged1 = false;
  bool dragged2 = false;
  bool dragged3 = false;
  bool dragged4 = false;
  bool dragged5 = false;
  bool dragged6 = false;

  double elev = 10;
  bool changeColor = false;
  bool buttonPressed1 = false;
  bool isPlayingMsg1 = false;
  bool option1 = false;
  bool option2 = false;
  bool option3 = false;
  bool option4 = false;
  bool option5 = false;
  bool option6 = false;

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

  late AudioCache audioCache;

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
                letter1 == "t" &&
                        letter2 == "r" &&
                        letter3 == "e" &&
                        letter4 == "e"
                    ? TablerIcons.circle_check
                    : letter1 == "a" || letter1 == "d"
                        ? TablerIcons.circle_check
                        : TablerIcons.circle_dashed,
                size: 30,
                color: letter1 == "t" &&
                        letter2 == "r" &&
                        letter3 == "e" &&
                        letter4 == "e"
                    ? Colors.green
                    : letter1 == "a" || letter1 == "d"
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
                        decoration: BoxDecoration(
                            color: Colors.yellow, shape: BoxShape.circle),
                        child: InkWell(
                          onTap: (() {
                            player.play(AssetSource("sound/tree.mp3"));
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
              height: 80,
              width: 300,
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
                      Draggable(
                        data: "r",
                        feedback: Container(
                          height: 50,
                          width: 50,
                          color: Colors.deepPurple[200],
                          child: Center(
                            child: Text(
                              "r",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                        onDragCompleted: (() {
                          dragged1 = true;
                          clicksPerpage += 1;
                          timeIntervalClicks.add(timer.toInt());
                          timer = 0;
                        }),
                        childWhenDragging: Material(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 50.0,
                            width: 70.0,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        child: dragged1
                            ? SizedBox()
                            : Material(
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
                                      player.play(AssetSource("sound/r.mp3"));
                                      clicksPerpage += 1;
                                      timeIntervalClicks.add(timer.toInt());
                                      Timer(Duration(seconds: 4), () {
                                        if (mounted) {
                                          setState(() {
                                            option1 = false;
                                          });
                                        }
                                      });
                                      if (mounted) {
                                        setState(() {
                                          clicksPerpage += 1;
                                          timeIntervalClicks.add(timer.toInt());
                                          option1 = true;
                                          timer = 0;
                                        });
                                      }
                                    }),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          option1
                                              ? TablerIcons.player_pause
                                              : TablerIcons.player_play,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "r",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      Draggable(
                        data: "t",
                        onDragCompleted: () {
                          dragged2 = true;
                          clicksPerpage += 1;
                          timeIntervalClicks.add(timer.toInt());
                          timer = 0;
                        },
                        childWhenDragging: SizedBox(),
                        feedback: Container(
                          height: 50,
                          width: 50,
                          color: Colors.deepPurple[200],
                          child: Center(
                            child: Text(
                              "t",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                        child: dragged2
                            ? SizedBox()
                            : Material(
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
                                      player.play(AssetSource("sound/t.mp3"));
                                      clicksPerpage += 1;
                                      timeIntervalClicks.add(timer.toInt());
                                      Timer(Duration(seconds: 4), () {
                                        if (mounted) {
                                          setState(() {
                                            option2 = false;
                                          });
                                        }
                                      });
                                      if (mounted) {
                                        setState(() {
                                          clicksPerpage += 1;
                                          timeIntervalClicks.add(timer.toInt());
                                          option2 = true;
                                          timer = 0;
                                        });
                                      }
                                    }),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          option2
                                              ? TablerIcons.player_pause
                                              : TablerIcons.player_play,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "t",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      Draggable(
                        data: "a",
                        onDragCompleted: () {
                          dragged3 = true;
                          clicksPerpage += 1;
                          timeIntervalClicks.add(timer.toInt());
                          timer = 0;
                        },
                        childWhenDragging: SizedBox(),
                        feedback: Container(
                          height: 50,
                          width: 50,
                          color: Colors.deepPurple[200],
                          child: Center(
                            child: Text(
                              "a",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                        child: dragged3
                            ? SizedBox()
                            : Material(
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
                                      player.play(AssetSource("sound/A.mp3"));
                                      clicksPerpage += 1;
                                      timeIntervalClicks.add(timer.toInt());
                                      Timer(Duration(seconds: 4), () {
                                        if (mounted) {
                                          setState(() {
                                            option3 = false;
                                          });
                                        }
                                      });
                                      if (mounted) {
                                        setState(() {
                                          clicksPerpage += 1;
                                          timeIntervalClicks.add(timer.toInt());
                                          option3 = true;
                                          timer = 0;
                                        });
                                      }
                                    }),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          option3
                                              ? TablerIcons.player_pause
                                              : TablerIcons.player_play,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "a",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Draggable(
                        onDragCompleted: () {
                          dragged4 = true;
                          clicksPerpage += 1;
                          timeIntervalClicks.add(timer.toInt());
                          timer = 0;
                        },
                        data: "e",
                        feedback: Container(
                          height: 50,
                          width: 50,
                          color: Colors.deepPurple[200],
                          child: Center(
                            child: Text(
                              "e",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                        childWhenDragging: SizedBox(),
                        child: dragged4
                            ? SizedBox()
                            : Material(
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
                                      player.play(AssetSource("sound/e.mp3"));
                                      clicksPerpage += 1;
                                      timeIntervalClicks.add(timer.toInt());
                                      Timer(Duration(seconds: 4), () {
                                        if (mounted) {
                                          setState(() {
                                            option4 = false;
                                          });
                                        }
                                      });
                                      if (mounted) {
                                        setState(() {
                                          clicksPerpage += 1;
                                          timeIntervalClicks.add(timer.toInt());
                                          option4 = true;
                                          timer = 0;
                                        });
                                      }
                                    }),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          option4
                                              ? TablerIcons.player_pause
                                              : TablerIcons.player_play,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "e",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      Draggable(
                        onDragCompleted: () {
                          dragged5 = true;
                          clicksPerpage += 1;
                          timeIntervalClicks.add(timer.toInt());
                          timer = 0;
                        },
                        data: "d",
                        feedback: Container(
                          height: 50,
                          width: 50,
                          color: Colors.deepPurple[200],
                          child: Center(
                            child: Text(
                              "d",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                        childWhenDragging: SizedBox(),
                        child: dragged5
                            ? SizedBox()
                            : Material(
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
                                      player.play(AssetSource("sound/d.mp3"));
                                      clicksPerpage += 1;
                                      timeIntervalClicks.add(timer.toInt());
                                      Timer(Duration(seconds: 4), () {
                                        if (mounted) {
                                          setState(() {
                                            option5 = false;
                                          });
                                        }
                                      });
                                      if (mounted) {
                                        setState(() {
                                          clicksPerpage += 1;
                                          timeIntervalClicks.add(timer.toInt());
                                          option5 = true;
                                          timer = 0;
                                        });
                                      }
                                    }),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          option5
                                              ? TablerIcons.player_pause
                                              : TablerIcons.player_play,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "d",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      Draggable(
                        data: "e",
                        onDragCompleted: () {
                          dragged6 = true;
                          clicksPerpage += 1;
                          timeIntervalClicks.add(timer.toInt());
                          timer = 0;
                        },
                        feedback: Container(
                          height: 50,
                          width: 50,
                          color: Colors.deepPurple[200],
                          child: Center(
                            child: Text(
                              "e",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                        childWhenDragging: SizedBox(),
                        child: dragged6
                            ? SizedBox()
                            : Material(
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
                                      player.play(AssetSource("sound/e.mp3"));
                                      clicksPerpage += 1;
                                      timeIntervalClicks.add(timer.toInt());
                                      Timer(Duration(seconds: 4), () {
                                        if (mounted) {
                                          setState(() {
                                            option6 = false;
                                          });
                                        }
                                      });
                                      if (mounted) {
                                        setState(() {
                                          clicksPerpage += 1;
                                          timeIntervalClicks.add(timer.toInt());
                                          option6 = true;
                                          timer = 0;
                                        });
                                      }
                                    }),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          option6
                                              ? TablerIcons.player_pause
                                              : TablerIcons.player_play,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "e",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
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
                  if (letter1 == "t" &&
                      letter2 == "r" &&
                      letter3 == "e" &&
                      letter4 == "e") {
                    correctAns += 1;
                  } else {
                    incorrectAns += 1;
                  }
                  data.updateData(clicksPerpage, correctAns, incorrectAns,
                      timeFirstClick, countDuration(), timeIntervalClicks);

                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => L1R8Q3()));
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
