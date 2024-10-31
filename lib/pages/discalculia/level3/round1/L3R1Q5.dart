// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:dyslexia/pages/discalculia/level3/round2/L3R2Q1.dart';
import 'package:dyslexia/utilities/QuestionWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:dyslexia/pages/data/DataModel.dart';

DataModel data = DataModel();
DataModel returndata() {
  return data;
}

class DL3R1Q5 extends StatefulWidget {
  const DL3R1Q5({Key? key}) : super(key: key);

  @override
  State<DL3R1Q5> createState() => _DL3R1Q5State();
}

class _DL3R1Q5State extends State<DL3R1Q5> {
  String question = "Click on the largest number";
  var changeButton = false;

  int clicksPerpage = 0;
  int correctAns = 0;
  int incorrectAns = 0;
  int timeFirstClick = 0;
  num duration = 0;
  List timeIntervalClicks = [];

  int timer = 0;
  bool canceltimer = false;
  bool iscorect1 = false;
  bool iscorect2 = false;
  bool iscorect3 = false;
  bool iscorect4 = false;

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Match The Sentence"),
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
              ),
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
              ),
              Icon(
                iscorect4
                    ? TablerIcons.circle_check
                    : iscorect3
                        ? TablerIcons.circle_check
                        : iscorect2
                            ? TablerIcons.circle_check
                            : iscorect1
                                ? TablerIcons.circle_check
                                : TablerIcons.circle_dashed,
                size: 30,
                color: iscorect1
                    ? Colors.red
                    : iscorect4
                        ? Colors.red
                        : iscorect2
                            ? Colors.red
                            : iscorect3
                                ? Colors.green
                                : Colors.black,
              ),
            ]),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            QuestionWidget(
              question: question,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Container(
              padding:
                  EdgeInsets.only(top: 40, bottom: 40, left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 38, 47, 40),
                  border: Border.all(color: Colors.brown, width: 8)),
              child: Wrap(runSpacing: 30, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(TablerIcons.list_numbers),
                    ElevatedButton(
                        onPressed: (() {
                          clicksPerpage += 1;
                          incorrectAns += 1;
                          iscorect1 = true;
                          timeFirstClick = timer.toInt();
                          timeIntervalClicks.add(timer);
                          timer = 0;
                        }),
                        child: SizedBox(child: Text("88*88"))),
                    SizedBox(
                      width: 40,
                    ),
                    Icon(TablerIcons.list_numbers),
                    ElevatedButton(
                        onPressed: (() {
                          clicksPerpage += 1;
                          incorrectAns += 1;
                          iscorect2 = true;
                          timeFirstClick = timer.toInt();
                          timeIntervalClicks.add(timer);
                          timer = 0;
                        }),
                        child: SizedBox(child: Text("56*56"))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(TablerIcons.list_numbers),
                    ElevatedButton(
                        onPressed: (() {
                          clicksPerpage += 1;
                          correctAns += 1;
                          iscorect3 = true;
                          timeFirstClick = timer.toInt();
                          timeIntervalClicks.add(timer);
                          timer = 0;
                        }),
                        child: SizedBox(child: Text("89*98"))),
                    SizedBox(
                      width: 40,
                    ),
                    Icon(TablerIcons.list_numbers),
                    ElevatedButton(
                        onPressed: (() {
                          clicksPerpage += 1;
                          incorrectAns += 1;
                          iscorect4 = true;
                          timeFirstClick = timer.toInt();
                          timeIntervalClicks.add(timer);
                          timer = 0;
                        }),
                        child: SizedBox(child: Text("21*101"))),
                  ],
                )
              ]),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Material(
              color: const Color.fromARGB(255, 208, 99, 99),
              borderRadius: BorderRadius.circular(changeButton ? 50 : 30),
              child: InkWell(
                onTap: () {
                  data.updateData(clicksPerpage, correctAns, incorrectAns,
                      timeFirstClick, countDuration(), timeIntervalClicks);
                  Duration(seconds: 4);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => DL3R2Q1()));
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 4),
                  width: changeButton ? 50 : 150,
                  height: 50,
                  alignment: Alignment.center,
                  child: changeButton
                      ? Icon(
                          Icons.done,
                          color: const Color.fromARGB(255, 208, 99, 99),
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
