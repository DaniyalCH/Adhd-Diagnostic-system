// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names

import 'dart:async';
import 'package:dyslexia/pages/level1/round1/scoreBoardL1R1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import '../../../utilities/QuestionWidget.dart';
import 'package:dyslexia/pages/data/DataModel.dart';

DataModel data = DataModel();
DataModel returndata() {
  return data;
}

class Q6Shape extends StatefulWidget {
  const Q6Shape({Key? key}) : super(key: key);

  @override
  State<Q6Shape> createState() => _Q6ShapeState();
}

class _Q6ShapeState extends State<Q6Shape> {
  String question = "Match the shape that you can see with the given options";
  var changeButton = false;

  var tap_count = 0;

  int clicksPerpage = 0;
  int correctAns = 0;
  int incorrectAns = 0;
  int timeFirstClick = 0;
  num duration = 0;
  List timeIntervalClicks = [];
  int timer = 0;
  bool canceltimer = false;
  String showtimer = "30";

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

  @override
  void initState() {
    starttimer();
    super.initState();
  }

  bool showImage = false;
  double elev = 12;
  bool showoptions = false;
  bool changecolourC = false;
  bool changecolourW1 = false;
  bool changecolourW2 = false;
  bool changecolourW3 = false;
  bool showquestion = true;

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
                                clicksPerpage += 1;
                                timeFirstClick = timer.toInt();
                                incorrectAns += 1;
                                timeIntervalClicks.add(timer.toInt());
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
                                clicksPerpage += 1;
                                timeFirstClick = timer.toInt();
                                correctAns += 1;
                                timeIntervalClicks.add(timer.toInt());
                                if (mounted) {
                                  setState(() {
                                    timer = 0;
                                  });
                                }
                                changecolourC = true;

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
                                clicksPerpage += 1;
                                timeFirstClick = timer.toInt();
                                incorrectAns += 1;
                                timeIntervalClicks.add(timer.toInt());
                                if (mounted) {
                                  setState(() {
                                    timer = 0;
                                  });
                                }
                                changecolourW2 = true;

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
                                clicksPerpage += 1;
                                timeFirstClick = timer.toInt();
                                incorrectAns += 1;
                                timeIntervalClicks.add(timer.toInt());
                                if (mounted) {
                                  setState(() {
                                    timer = 0;
                                  });
                                }
                                changecolourW3 = true;

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
                                    builder: (context) => ScoreBoardL1R1()));
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
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.2487500, size.height * 0.3000000);
    path0.lineTo(size.width * 0.2475000, size.height * 0.6040000);
    path0.lineTo(size.width * 0.6262500, size.height * 0.6000000);
    path0.lineTo(size.width * 0.6250000, size.height * 0.4460000);
    path0.lineTo(size.width * 0.5012500, size.height * 0.4400000);
    path0.lineTo(size.width * 0.5025000, size.height * 0.4000000);

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
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.3750000, size.height * 0.4480000);
    path0.lineTo(size.width * 0.3750000, size.height * 0.6040000);
    path0.lineTo(size.width * 0.7537500, size.height * 0.6020000);
    path0.lineTo(size.width * 0.7500000, size.height * 0.2980000);
    path0.lineTo(size.width * 0.4987500, size.height * 0.3940000);
    path0.lineTo(size.width * 0.4987500, size.height * 0.4480000);
    path0.lineTo(size.width * 0.3750000, size.height * 0.4480000);
    path0.close();

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
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.5625000, size.height * 0.2000000);
    path0.lineTo(size.width * 0.4675000, size.height * 0.2000000);
    path0.lineTo(size.width * 0.4662500, size.height * 0.3960000);
    path0.lineTo(size.width * 0.4375000, size.height * 0.4000000);
    path0.lineTo(size.width * 0.3725000, size.height * 0.8040000);
    path0.lineTo(size.width * 0.5637500, size.height * 0.8020000);
    path0.lineTo(size.width * 0.5625000, size.height * 0.2000000);
    path0.close();

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
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.4375000, size.height * 0.2000000);
    path0.lineTo(size.width * 0.5337500, size.height * 0.2020000);
    path0.lineTo(size.width * 0.5350000, size.height * 0.4000000);
    path0.lineTo(size.width * 0.5650000, size.height * 0.4020000);
    path0.lineTo(size.width * 0.6250000, size.height * 0.8040000);
    path0.lineTo(size.width * 0.4375000, size.height * 0.8020000);
    path0.lineTo(size.width * 0.4375000, size.height * 0.2000000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
