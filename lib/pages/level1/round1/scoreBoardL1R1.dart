// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'Q1shape.dart' as q1shape;
import 'Q2shape.dart' as q2shape;
import 'Q3shape.dart' as q3shape;
import 'Q4shape.dart' as q4shape;
import 'Q5shape.dart' as q5shape;
import 'Q6shape.dart' as q6shape;

import 'package:flutter/material.dart';

class ScoreBoardL1R1 extends StatefulWidget {
  const ScoreBoardL1R1({Key? key}) : super(key: key);

  @override
  State<ScoreBoardL1R1> createState() => _ScoreBoardL1R1State();
}

class _ScoreBoardL1R1State extends State<ScoreBoardL1R1> {
  late int clicksPerpage;
  late int correctAns;
  late int incorrectAns;

  var data1 = q1shape.returndata();
  var data2 = q2shape.returndata();
  var data3 = q3shape.returndata();
  var data4 = q4shape.returndata();
  var data5 = q5shape.returndata();
  var data6 = q6shape.returndata();

  late num duration;
  late List timeIntervalClicks;

  int timer = 0;

  bool canceltimer = false;
  double Accuracy = 0;
  var efficiency = 0;
  double Missrate = 0;
  List timeFC = [];
  List Duration = [];
  double AverageClickTime = 0;

  int checkPercent(int a) {
    if (a > 10) {
      return 100;
    }

    return 10;
  }

  bool printresult = false;
  mappdata() {
    clicksPerpage = (data1.getClicksPerPage() +
            data2.getClicksPerPage() +
            data3.getClicksPerPage() +
            data4.getClicksPerPage() +
            data5.getClicksPerPage() +
            data6.getClicksPerPage())
        .toInt();
    correctAns = (data1.getcorrectAns() +
            data2.getcorrectAns() +
            data3.getcorrectAns() +
            data4.getcorrectAns() +
            data5.getcorrectAns() +
            data6.getcorrectAns())
        .toInt();
    incorrectAns = (data1.getincorrectAns() +
            data2.getincorrectAns() +
            data3.getincorrectAns() +
            data4.getincorrectAns() +
            data5.getincorrectAns() +
            data6.getincorrectAns())
        .toInt();
    Accuracy = correctAns / 6;
    Missrate = incorrectAns / 6;
    efficiency = correctAns * clicksPerpage;
    timeFC = [
      data1.timeFirstClick,
      data2.timeFirstClick,
      data3.timeFirstClick,
      data4.timeFirstClick,
      data5.timeFirstClick,
      data6.timeFirstClick,
    ];
    Duration = [
      data1.duration,
      data2.duration,
      data3.duration,
      data4.duration,
      data5.duration,
      data6.duration
    ];

    AverageClickTime = (data1.getduration() +
            data2.getduration() +
            data3.getduration() +
            data4.getduration() +
            data5.getduration() +
            data6.getduration()) /
        clicksPerpage;
  }

  @override
  void initState() {
    super.initState();
    mappdata();
    setState(() {
      printresult = true;
    });
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
            child: (printresult)
                ? Center(
                    child: Column(children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: Material(
                          elevation: 5,
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          child: Center(
                            child: Text(
                              "ScoreBoard",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Divider(
                        thickness: 5.0,
                      ),
                      SizedBox(
                        height: 50,
                        width: 400,
                        child: Center(
                          child: LinearPercentIndicator(
                            width: 200,
                            lineHeight: 14.0,
                            percent: clicksPerpage / 100,
                            leading: Text(
                              "Clicks Per page",
                              style: TextStyle(color: Colors.black),
                            ),
                            center: Text(
                              clicksPerpage.toString(),
                              style: TextStyle(fontSize: 12.0),
                            ),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            backgroundColor: Colors.grey,
                            progressColor: Colors.purple,
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 5.0,
                      ),
                      Wrap(
                        spacing: 20,
                        children: [
                          SizedBox(
                            child: CircularPercentIndicator(
                              radius: 40.0,
                              lineWidth: 13.0,
                              animation: true,
                              percent: correctAns / 100,
                              center: Text(
                                correctAns.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                              footer: Text(
                                "Correct Answers",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.purple,
                            ),
                          ),
                          SizedBox(
                            child: CircularPercentIndicator(
                              radius: 40.0,
                              lineWidth: 13.0,
                              animation: true,
                              percent: incorrectAns / 100,
                              center: Text(
                                incorrectAns.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                              footer: Text(
                                "Incorrect Answers",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 5.0,
                      ),
                      Wrap(
                        spacing: 45,
                        children: [
                          SizedBox(
                            child: CircularPercentIndicator(
                              radius: 40.0,
                              lineWidth: 13.0,
                              animation: true,
                              percent: correctAns / 100,
                              center: Text(
                                ((Accuracy / 100) * 100).toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              footer: Text(
                                "Accuracy",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.purple,
                            ),
                          ),
                          SizedBox(
                            child: CircularPercentIndicator(
                              radius: 40.0,
                              lineWidth: 13.0,
                              animation: true,
                              percent: correctAns / 100,
                              center: Text(
                                efficiency.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              footer: Text(
                                "Effiecency",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 5.0,
                      ),
                      SizedBox(
                        child: Center(
                          child: CircularPercentIndicator(
                            radius: 40.0,
                            lineWidth: 13.0,
                            animation: true,
                            percent: correctAns / 100,
                            center: Text(
                              Missrate.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            footer: Text(
                              "Missrate",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17.0),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.purple,
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 5.0,
                      ),
                      SizedBox(
                        child: Wrap(
                          runSpacing: 5.0,
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                                "Time taken to first click for each Question: \nQ1 : "),
                            LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width - 80,
                              leading: Text("Q1"),
                              animation: true,
                              lineHeight: 20.0,
                              animationDuration: 2000,
                              percent: (timeFC[0] / checkPercent(timeFC[0])),
                              center: Text(timeFC[0].toString()),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Colors.greenAccent,
                            ),
                            LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width - 80,
                              leading: Text("Q2"),
                              animation: true,
                              lineHeight: 20.0,
                              animationDuration: 2000,
                              percent: timeFC[1] / checkPercent(timeFC[1]),
                              center: Text(timeFC[1].toString()),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Colors.greenAccent,
                            ),
                            LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width - 80,
                              leading: Text("Q3"),
                              animation: true,
                              lineHeight: 20.0,
                              animationDuration: 2000,
                              percent: timeFC[2] / checkPercent(timeFC[2]),
                              center: Text(timeFC[2].toString()),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Colors.greenAccent,
                            ),
                            LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width - 80,
                              leading: Text("Q4"),
                              animation: true,
                              lineHeight: 20.0,
                              animationDuration: 2000,
                              percent: timeFC[3] / checkPercent(timeFC[3]),
                              center: Text(timeFC[3].toString()),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Colors.greenAccent,
                            ),
                            LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width - 80,
                              leading: Text("Q5"),
                              animation: true,
                              lineHeight: 20.0,
                              animationDuration: 2000,
                              percent: timeFC[4] / checkPercent(timeFC[4]),
                              center: Text(timeFC[4].toString()),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Colors.greenAccent,
                            ),
                            LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width - 80,
                              leading: Text("Q6"),
                              animation: true,
                              lineHeight: 20.0,
                              animationDuration: 2000,
                              percent: timeFC[5] / checkPercent(timeFC[5]),
                              center: Text(timeFC[5].toString()),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Colors.greenAccent,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 5.0,
                      ),
                      SizedBox(
                        child: Row(children: [
                          Text(
                            "Duration of each Question: \nQ1 : " +
                                Duration[0].toString() +
                                "\nQ2 : " +
                                Duration[1].toString() +
                                "\nQ3 : " +
                                Duration[2].toString() +
                                "\nQ4 : " +
                                Duration[3].toString() +
                                "\nQ5 : " +
                                Duration[4].toString() +
                                "\nQ6 : " +
                                Duration[5].toString() +
                                "\n",
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                      ),
                      Divider(
                        thickness: 5.0,
                      ),
                      SizedBox(
                        height: 100,
                        width: 400,
                        child: Row(children: [
                          Text(
                            "Average Click time $AverageClickTime",
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                      ),
                    ]),
                  )
                : CircularProgressIndicator()),
      ),
    );
  }
}
