// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names

import 'dart:async';

import 'package:dyslexia/pages/level1/round1/Q2shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import '../../../utilities/QuestionWidget.dart';
import 'package:dyslexia/pages/data/DataModel.dart';

DataModel data = DataModel();
DataModel returndata() {
  return data;
}

class Q1Shape extends StatefulWidget {
  const Q1Shape({Key? key}) : super(key: key);

  @override
  State<Q1Shape> createState() => _Q1ShapeState();
}

class _Q1ShapeState extends State<Q1Shape> {
  String question = "Match the shape that you can see with the given options";
  var changeButton = false;
  bool changecolourC = false;
  bool changecolourW1 = false;
  bool changecolourW2 = false;
  bool changecolourW3 = false;

  bool showImage = false;
  double elev = 12;
  bool showoptions = false;
  bool showquestion = true;

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
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.cyan,
        title: Text("AD&DY"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(14.0),
          // ignore: prefer_const_literals_to_create_immutables
          child: SingleChildScrollView(
              child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                changecolourC
                    ? TablerIcons.circle_check
                    : changecolourW1
                        ? TablerIcons.circle_check
                        : changecolourW2
                            ? TablerIcons.circle_check
                            : changecolourW3
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
            showquestion
                ? Column(
                    children: [
                      QuestionWidget(question: question),
                      const SizedBox(
                        height: 20,
                      ),
                      showImage
                          ? Column(
                              children: [
                                CustomPaint(
                                  size: Size(200, 150),
                                  painter: RPSCustomPainterQ(),
                                ),
                              ],
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      ElevatedButton(
                          onPressed: () {
                            clicksPerpage += 1;
                            timeFirstClick = timer.toInt();

                            timeIntervalClicks.add(timer.toInt());
                            if (mounted) {
                              setState(() {
                                timer = 0;
                              });
                            }

                            Timer(Duration(seconds: 0), () {
                              if (mounted) {
                                setState(() {
                                  showImage = true;
                                });
                              }
                            });
                            Timer(Duration(seconds: 5), () {
                              if (mounted) {
                                setState(() {
                                  showImage = false;
                                  showquestion = false;
                                  showoptions = true;
                                });
                              }
                            });
                          },
                          child: Text('show image')),
                    ],
                  )
                : SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            showoptions
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Material(
                            elevation: elev,
                            shadowColor: Colors.grey,
                            color:
                                changecolourW1 ? Colors.red[100] : Colors.cyan,
                            borderRadius:
                                BorderRadius.circular(changeButton ? 50 : 8),
                            child: InkWell(
                              onTap: () {
                                changecolourW1 = true;
                                timeIntervalClicks.add(timer.toInt());
                                clicksPerpage += 1;
                                incorrectAns += 1;
                                elev = 0;
                                if (mounted) {
                                  setState(() {
                                    timer = 0;
                                  });
                                }
                              },
                              child: Container(
                                height: 120,
                                width: 180,
                                alignment: Alignment.topLeft,
                                child: CustomPaint(
                                  size: Size(size.width, size.height),
                                  painter: RPSCustomPainterO1(),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            elevation: elev,
                            shadowColor: Colors.grey,
                            color:
                                changecolourC ? Colors.green[200] : Colors.cyan,
                            borderRadius:
                                BorderRadius.circular(changeButton ? 50 : 8),
                            child: InkWell(
                              onTap: () {
                                changecolourC = true;
                                timeIntervalClicks.add(timer.toInt());
                                clicksPerpage += 1;
                                correctAns += 1;
                                changecolourC = true;
                                if (mounted) {
                                  setState(() {
                                    timer = 0;
                                  });
                                }

                                elev = 0;
                              },
                              child: Container(
                                height: 120,
                                width: 180,
                                alignment: Alignment.topLeft,
                                child: CustomPaint(
                                  size: Size(size.width, size.height),
                                  painter: RPSCustomPainterQ(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Material(
                            elevation: elev,
                            shadowColor: Colors.grey,
                            color:
                                changecolourW2 ? Colors.red[100] : Colors.cyan,
                            borderRadius:
                                BorderRadius.circular(changeButton ? 50 : 8),
                            child: InkWell(
                              onTap: () {
                                changecolourW1 = true;
                                timeIntervalClicks.add(timer.toInt());
                                clicksPerpage += 1;
                                incorrectAns += 1;
                                changecolourW2 = true;
                                if (mounted) {
                                  setState(() {
                                    timer = 0;
                                  });
                                }

                                elev = 0;
                              },
                              child: Container(
                                height: 120,
                                width: 180,
                                alignment: Alignment.topLeft,
                                child: CustomPaint(
                                  size: Size(size.width, size.height),
                                  painter: RPSCustomPainterO2(),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            elevation: elev,
                            shadowColor: Colors.grey,
                            color:
                                changecolourW3 ? Colors.red[100] : Colors.cyan,
                            borderRadius:
                                BorderRadius.circular(changeButton ? 50 : 8),
                            child: InkWell(
                              onTap: () {
                                changecolourW1 = true;
                                timeIntervalClicks.add(timer.toInt());
                                clicksPerpage += 1;
                                incorrectAns += 1;
                                changecolourW3 = true;
                                if (mounted) {
                                  setState(() {
                                    timer = 0;
                                  });
                                }

                                elev = 0;
                              },
                              child: Container(
                                height: 120,
                                width: 180,
                                alignment: Alignment.topLeft,
                                child: CustomPaint(
                                  size: Size(size.width, size.height),
                                  painter: RPSCustomPainterO3(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      Material(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        child: InkWell(
                          onTap: () {
                            data.updateData(
                                clicksPerpage,
                                correctAns,
                                incorrectAns,
                                timeFirstClick,
                                countDuration(),
                                timeIntervalClicks);

                            Duration(seconds: 4);
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Q2Shape()));
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
                    ],
                  )
                : SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ]))),
    );
  }
}

class RPSCustomPainterQ extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.5000000, size.height * 0.4000000);
    path0.lineTo(size.width * 0.4490000, size.height * 0.6000000);
    path0.lineTo(size.width * 0.5500000, size.height * 0.6000000);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainterO1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.5000500, size.height * 0.6010200);
    path0.lineTo(size.width * 0.4492900, size.height * 0.3992400);
    path0.lineTo(size.width * 0.5496900, size.height * 0.4000600);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainterO2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.5505300, size.height * 0.4996600);
    path0.lineTo(size.width * 0.4498900, size.height * 0.6004400);
    path0.lineTo(size.width * 0.4498900, size.height * 0.3984600);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainterO3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.4498100, size.height * 0.4993200);
    path0.lineTo(size.width * 0.5499600, size.height * 0.5998800);
    path0.lineTo(size.width * 0.5499300, size.height * 0.3991600);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
