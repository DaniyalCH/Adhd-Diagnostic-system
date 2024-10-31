// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:dyslexia/pages/level2/round4/L2R4Q2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import '../../../utilities/QuestionWidget.dart';
import 'package:dyslexia/pages/data/DataModel.dart';

DataModel data = DataModel();
DataModel returndata() {
  return data;
}

class L2R4Q1 extends StatefulWidget {
  const L2R4Q1({Key? key}) : super(key: key);

  @override
  State<L2R4Q1> createState() => _L2R4Q1State();
}

class _L2R4Q1State extends State<L2R4Q1> {
  String question = "Match the Picture with correct sentence";
  var changeButton = false;

  int clicksPerpage = 0;
  int correctAns = 0;
  int incorrectAns = 0;
  int timeFirstClick = 0;
  num duration = 0;
  List timeIntervalClicks = [];

  int timer = 0;
  bool canceltimer = false;

  bool draged1 = false;
  bool draged2 = false;
  bool draged3 = false;

  bool target1 = false;
  bool target2 = false;
  bool target3 = false;

  bool score1 = false;
  bool score2 = false;
  bool score3 = false;
  bool isScore1 = false;
  bool isScore2 = false;
  bool isScore3 = false;

  Image ImageBuild(image) {
    Image Img = Image(
      image: AssetImage("assets/images/$image.png"),
      height: 80,
      width: 100,
    );
    return Img;
  }

  var image1;
  var image2;
  var image3;

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

  var pic1;
  var pic2;
  var pic3;

  var cat = "The cat is sad";
  var car = "The car is driving on the road";
  var mouse = "The cat is running after the mouse";

  String letter1 = "";
  String letter2 = "";
  String letter3 = "";

  @override
  Widget build(BuildContext context) {
    pic1 = Image(
      image: AssetImage("assets/images/$cat.png"),
      height: 90,
      width: 90,
    );
    pic2 = Image(
      image: AssetImage("assets/images/$car.png"),
      height: 100,
      width: 80,
    );
    pic3 = Image(
      image: AssetImage("assets/images/$mouse.png"),
      height: 100,
      width: 100,
    );
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
                letter1 == car && letter2 == cat && letter3 == mouse
                    ? TablerIcons.circle_check
                    : TablerIcons.circle_dashed,
                size: 30,
                color: letter1 == car && letter2 == cat && letter3 == mouse
                    ? Colors.green
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
            ]),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            QuestionWidget(
              question: question,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  border: Border.all(
                    color: Colors.cyan,
                    width: 2,
                  )),
              child: Wrap(
                  runSpacing: 50,
                  spacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    draged1
                        ? SizedBox()
                        : Draggable(
                            child: pic1,
                            onDragCompleted: () {
                              draged1 = true;
                              clicksPerpage += 1;
                              timeIntervalClicks.add(timer.toInt());
                              timer = 0;
                            },
                            data: "The cat is sad",
                            feedback: pic1,
                            childWhenDragging: SizedBox()),
                    draged2
                        ? SizedBox()
                        : Draggable(
                            child: pic2,
                            onDragCompleted: () {
                              draged2 = true;
                              clicksPerpage += 1;
                              timeIntervalClicks.add(timer.toInt());
                              timer = 0;
                            },
                            data: "The car is driving on the road",
                            feedback: pic2,
                            childWhenDragging: SizedBox()),
                    draged3
                        ? SizedBox()
                        : Draggable(
                            child: pic3,
                            onDragCompleted: () {
                              draged3 = true;
                              clicksPerpage += 1;
                              timeIntervalClicks.add(timer.toInt());
                              timer = 0;
                            },
                            data: "The cat is running after the mouse",
                            feedback: pic3,
                            childWhenDragging: SizedBox()),
                  ]),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Container(
              height: 320,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  )),
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                spacing: 15,
                runSpacing: 5,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 100,
                          width: 200,
                          child: Center(child: Text(car))),
                      DragTarget(
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return target1
                              ? image1
                              : Material(
                                  elevation: 10,
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.cyan,
                                  child: Container(
                                    width: 90,
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
                        onAcceptWithDetails: (data) {
                          setState(() {
                            letter1 = data.toString();
                            target1 = true;
                            image1 = ImageBuild(data);
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 100,
                          width: 200,
                          child: Center(child: Text(cat))),
                      DragTarget(
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return target2
                              ? image2
                              : Material(
                                  elevation: 10,
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.cyan,
                                  child: Container(
                                    width: 90,
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
                        onAcceptWithDetails: (data) {
                          setState(() {
                            letter2 = data.toString();
                            target2 = true;
                            image2 = ImageBuild(data);
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 100,
                          width: 200,
                          child: Center(child: Text(mouse))),
                      DragTarget(
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return target3
                              ? image3
                              : Material(
                                  elevation: 10,
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.cyan,
                                  child: Container(
                                    width: 90,
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
                        onAcceptWithDetails: (data) {
                          setState(() {
                            letter3 = data.toString();
                            target3 = true;
                            image3 = ImageBuild(data);
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Material(
              color: Colors.black,
              borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
              child: InkWell(
                onTap: () {
                  if (letter1 == car && letter2 == cat && letter3 == mouse) {
                    correctAns += 1;
                  } else {
                    incorrectAns += 1;
                  }
                  data.updateData(clicksPerpage, correctAns, incorrectAns,
                      timeFirstClick, countDuration(), timeIntervalClicks);
                  Duration(seconds: 4);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => L2R4Q2()));
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
