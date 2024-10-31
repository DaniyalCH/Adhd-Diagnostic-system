// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import '../../../utilities/QuestionWidget.dart';
import 'Q5shape.dart';
import 'package:dyslexia/pages/data/DataModel.dart';

DataModel data = DataModel();
DataModel returndata() {
  return data;
}

class Q4Shape extends StatefulWidget {
  const Q4Shape({Key? key}) : super(key: key);

  @override
  State<Q4Shape> createState() => _Q4ShapeState();
}

class _Q4ShapeState extends State<Q4Shape> {
  String question = "Match the shape that you can see with the given options";
  var changeButton = false;
  bool changecolourC = false;
  bool changecolourW1 = false;
  bool changecolourW2 = false;
  bool changecolourW3 = false;
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
                                    builder: (context) => Q5Shape()));
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
    path0.moveTo(size.width * 0.5000000, size.height * 0.4000000);
    path0.cubicTo(
        size.width * 0.5003125,
        size.height * 0.1960000,
        size.width * 0.6515625,
        size.height * 0.3020000,
        size.width * 0.6250000,
        size.height * 0.3960000);
    path0.quadraticBezierTo(size.width * 0.5665625, size.height * 0.5790000,
        size.width * 0.5000000, size.height * 0.7000000);
    path0.quadraticBezierTo(size.width * 0.4340625, size.height * 0.5785000,
        size.width * 0.3750000, size.height * 0.3980000);
    path0.cubicTo(
        size.width * 0.3503125,
        size.height * 0.2975000,
        size.width * 0.5015625,
        size.height * 0.1955000,
        size.width * 0.5000000,
        size.height * 0.4000000);
    path0.close();

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
    path0.moveTo(size.width * 0.3699625, size.height * 0.5014200);
    path0.cubicTo(
        size.width * 0.2310250,
        size.height * 0.4983200,
        size.width * 0.3066625,
        size.height * 0.2602600,
        size.width * 0.3783375,
        size.height * 0.2999200);
    path0.quadraticBezierTo(size.width * 0.5285750, size.height * 0.3392800,
        size.width * 0.6251000, size.height * 0.4991400);
    path0.quadraticBezierTo(size.width * 0.5265625, size.height * 0.6606600,
        size.width * 0.3765625, size.height * 0.6977000);
    path0.cubicTo(
        size.width * 0.3014500,
        size.height * 0.7452800,
        size.width * 0.2341500,
        size.height * 0.4990600,
        size.width * 0.3699625,
        size.height * 0.5014200);
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
    path0.moveTo(size.width * 0.3737500, size.height * 0.6020000);
    path0.quadraticBezierTo(size.width * 0.3921875, size.height * 0.4400000,
        size.width * 0.5000000, size.height * 0.2980000);
    path0.quadraticBezierTo(size.width * 0.6112500, size.height * 0.4425000,
        size.width * 0.6250000, size.height * 0.6000000);
    path0.cubicTo(
        size.width * 0.6237500,
        size.height * 0.7020000,
        size.width * 0.5625000,
        size.height * 0.8000000,
        size.width * 0.5000000,
        size.height * 0.6000000);
    path0.cubicTo(
        size.width * 0.4384375,
        size.height * 0.7985000,
        size.width * 0.3746875,
        size.height * 0.6985000,
        size.width * 0.3737500,
        size.height * 0.6020000);
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
    path0.moveTo(size.width * 0.5637500, size.height * 0.5040000);
    path0.cubicTo(
        size.width * 0.6869125,
        size.height * 0.4029200,
        size.width * 0.6254625,
        size.height * 0.2847000,
        size.width * 0.5626500,
        size.height * 0.3004000);
    path0.quadraticBezierTo(size.width * 0.4591250, size.height * 0.3239000,
        size.width * 0.3736000, size.height * 0.5002600);
    path0.quadraticBezierTo(size.width * 0.4556875, size.height * 0.6754400,
        size.width * 0.5647375, size.height * 0.7029000);
    path0.cubicTo(
        size.width * 0.6249125,
        size.height * 0.7096600,
        size.width * 0.6832000,
        size.height * 0.6033600,
        size.width * 0.5637500,
        size.height * 0.5040000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
