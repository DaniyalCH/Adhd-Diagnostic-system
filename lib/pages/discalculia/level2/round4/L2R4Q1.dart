import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:dyslexia/utilities/QuestionWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:dyslexia/pages/data/DataModel.dart';
import 'L2R4Q2.dart';

DataModel data = DataModel();
DataModel returndata() {
  return data;
}

class DL2R4Q1 extends StatefulWidget {
  const DL2R4Q1({Key? key}) : super(key: key);

  @override
  State<DL2R4Q1> createState() => _DL2R4Q1State();
}

class _DL2R4Q1State extends State<DL2R4Q1> {
  String question = "Select the correct time";
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

  double elev = 10;
  bool changeColor = false;
  var letter = 'b';
  bool buttonPressed1 = false;

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

  bool isPlayingMsg1 = false;

  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    starttimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Correct Time"),
        backgroundColor: Colors.deepPurple[300],
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: const EdgeInsets.all(14.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/cloud_bg.jpg"),
              fit: BoxFit.cover),
        ),
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
            const Icon(
              TablerIcons.line_dashed,
              size: 30,
            ),
            const Icon(
              TablerIcons.circle_dashed,
              size: 30,
            ),
            const Icon(
              TablerIcons.line_dashed,
              size: 30,
            ),
            const Icon(
              TablerIcons.circle_dashed,
              size: 30,
            ),
            const Icon(
              TablerIcons.line_dashed,
              size: 30,
            ),
            const Icon(
              TablerIcons.circle_dashed,
              size: 30,
            ),
            const Icon(
              TablerIcons.line_dashed,
              size: 30,
            ),
            const Icon(
              TablerIcons.circle_dashed,
              size: 30,
            ),
          ]),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          QuestionWidget(question: question),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          SizedBox(
            child: Image(
                image: const AssetImage(
                  "assets/images/2clock1.png",
                ),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.6),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Wrap(
            spacing: 10,
            runSpacing: 5,
            children: [
              Material(
                elevation: elev,
                color: changecolourW2 ? Colors.red : Colors.deepPurple[100],
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
                      alignment: Alignment.center,
                      child: const Text("12 : 40 ",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                ),
              ),
              Material(
                elevation: elev,
                color: changecolourW1 ? Colors.red : Colors.deepPurple[100],
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
                      alignment: Alignment.center,
                      child: const Text("12 : 00",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                ),
              ),
              Material(
                elevation: elev,
                color: changecolourC ? Colors.green : Colors.deepPurple[100],
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
                        changecolourC = true;
                        elev = 0;
                      });
                    }
                  },
                  child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text("08 : 00",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                ),
              ),
              Material(
                elevation: elev,
                color: changecolourW3 ? Colors.red : Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () {
                    clicksPerpage += 1;
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
                      alignment: Alignment.center,
                      child: const Text("40 : 00",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Material(
            color: const Color.fromARGB(255, 208, 99, 99),
            borderRadius: BorderRadius.circular(changeButton ? 50 : 30),
            child: InkWell(
              onTap: () {
                data.updateData(clicksPerpage, correctAns, incorrectAns,
                    timeFirstClick, countDuration(), timeIntervalClicks);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const DL2R4Q2()));
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 4),
                width: changeButton ? 50 : 150,
                height: 50,
                alignment: Alignment.center,
                child: changeButton
                    ? const Icon(
                        Icons.done,
                        color: Color.fromARGB(255, 208, 99, 99),
                      )
                    : const Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
              ),
            ),
          ),
        ])),
      ),
    );
  }
}