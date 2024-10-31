// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:dyslexia/pages/discalculia/level3/round1/L3R1Q1.dart' as q1;
import 'package:dyslexia/pages/discalculia/level3/round1/L3R1Q2.dart' as q2;
import 'package:dyslexia/pages/discalculia/level3/round1/L3R1Q3.dart' as q3;
import 'package:dyslexia/pages/discalculia/level3/round1/L3R1Q4.dart' as q4;
import 'package:dyslexia/pages/discalculia/level3/round1/L3R1Q5.dart' as q5;
import 'package:dyslexia/pages/discalculia/level3/round2/L3R2Q1.dart' as q6;
import 'package:dyslexia/pages/discalculia/level3/round2/L3R2Q2.dart' as q7;
import 'package:dyslexia/pages/discalculia/level3/round2/L3R2Q3.dart' as q8;
import 'package:dyslexia/pages/discalculia/level3/round2/L3R2Q4.dart' as q9;
import 'package:dyslexia/pages/discalculia/level3/round2/L3R2Q5.dart' as q10;
import 'package:dyslexia/pages/discalculia/level3/round3/L3R3Q1.dart' as q11;
import 'package:dyslexia/pages/discalculia/level3/round3/L3R3Q2.dart' as q12;
import 'package:dyslexia/pages/discalculia/level3/round3/L3R3Q3.dart' as q13;
import 'package:dyslexia/pages/discalculia/level3/round3/L3R3Q4.dart' as q14;
import 'package:dyslexia/pages/discalculia/level3/round3/L3R3Q5.dart' as q15;
import 'package:dyslexia/pages/discalculia/level3/round4/L3R4Q1.dart' as q16;
import 'package:dyslexia/pages/discalculia/level3/round4/L3R4Q2.dart' as q17;
import 'package:dyslexia/pages/discalculia/level3/round4/L3R4Q3.dart' as q18;
import 'package:dyslexia/pages/discalculia/level3/round4/L3R4Q4.dart' as q19;
import 'package:dyslexia/pages/discalculia/level3/round4/L3R4Q5.dart' as q20;
import 'package:dyslexia/pages/discalculia/level3/round5/L3R5Q1.dart' as q21;
import 'package:dyslexia/pages/discalculia/level3/round5/L3R5Q2.dart' as q22;
import 'package:dyslexia/pages/discalculia/level3/round5/L3R5Q3.dart' as q23;
import 'package:dyslexia/pages/discalculia/level3/round5/L3R5Q4.dart' as q24;
import 'package:dyslexia/pages/discalculia/level3/round5/L3R5Q5.dart' as q25;

import 'package:flutter/material.dart';

class ScoreBoardDisL2 extends StatefulWidget {
  const ScoreBoardDisL2({Key? key}) : super(key: key);

  @override
  State<ScoreBoardDisL2> createState() => _ScoreBoardDisL2State();
}

class _ScoreBoardDisL2State extends State<ScoreBoardDisL2> {
  late int clicksPerpage;
  late int correctAns;
  late int incorrectAns;

  var data1 = q1.returndata();
  var data2 = q2.returndata();
  var data3 = q3.returndata();
  var data4 = q4.returndata();
  var data5 = q5.returndata();
  var data6 = q6.returndata();
  var data7 = q7.returndata();
  var data8 = q8.returndata();
  var data9 = q9.returndata();
  var data10 = q10.returndata();
  var data11 = q11.returndata();
  var data12 = q12.returndata();
  var data13 = q13.returndata();
  var data14 = q14.returndata();
  var data15 = q15.returndata();
  var data16 = q16.returndata();
  var data17 = q17.returndata();
  var data18 = q18.returndata();
  var data19 = q19.returndata();
  var data20 = q20.returndata();
  var data21 = q21.returndata();
  var data22 = q22.returndata();
  var data23 = q23.returndata();
  var data24 = q24.returndata();
  var data25 = q25.returndata();

  late num duration;
  late List timeIntervalClicks;

  int timer = 0;

  bool canceltimer = false;
  double Accuracy = 0;
  var efficiency = 0;
  double Missrate = 0;
  var timeFC = [];
  var Duration = [];
  double AverageClickTime = 0;
  var dropdownvaluetimeFC = "";
  var dropdownvalueDuration = "";

  int checkPercent(int a) {
    if (a > 10) {
      return 100;
    }

    return 10;
  }

  int normalization(int a) {
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
            data6.getClicksPerPage() +
            data7.getClicksPerPage() +
            data8.getClicksPerPage() +
            data9.getClicksPerPage() +
            data10.getClicksPerPage() +
            data11.getClicksPerPage() +
            data12.getClicksPerPage() +
            data13.getClicksPerPage() +
            data14.getClicksPerPage() +
            data15.getClicksPerPage() +
            data16.getClicksPerPage() +
            data17.getClicksPerPage() +
            data18.getClicksPerPage() +
            data19.getClicksPerPage() +
            data20.getClicksPerPage() +
            data21.getClicksPerPage() +
            data22.getClicksPerPage() +
            data23.getClicksPerPage() +
            data24.getClicksPerPage() +
            data25.getClicksPerPage())
        .toInt();
    correctAns = (data1.getcorrectAns() +
            data2.getcorrectAns() +
            data3.getcorrectAns() +
            data4.getcorrectAns() +
            data5.getcorrectAns() +
            data6.getcorrectAns() +
            data7.getcorrectAns() +
            data8.getcorrectAns() +
            data9.getcorrectAns() +
            data10.getcorrectAns() +
            data11.getcorrectAns() +
            data12.getcorrectAns() +
            data13.getcorrectAns() +
            data14.getcorrectAns() +
            data15.getcorrectAns() +
            data16.getcorrectAns() +
            data17.getcorrectAns() +
            data18.getcorrectAns() +
            data19.getcorrectAns() +
            data20.getcorrectAns() +
            data21.getcorrectAns() +
            data22.getcorrectAns() +
            data23.getcorrectAns() +
            data24.getcorrectAns() +
            data25.getcorrectAns())
        .toInt();
    incorrectAns = (data1.getincorrectAns() +
            data2.getincorrectAns() +
            data3.getincorrectAns() +
            data4.getincorrectAns() +
            data5.getincorrectAns() +
            data6.getincorrectAns() +
            data7.getincorrectAns() +
            data8.getincorrectAns() +
            data9.getincorrectAns() +
            data10.getincorrectAns() +
            data11.getincorrectAns() +
            data12.getincorrectAns() +
            data13.getincorrectAns() +
            data14.getincorrectAns() +
            data15.getincorrectAns() +
            data16.getincorrectAns() +
            data17.getincorrectAns() +
            data18.getincorrectAns() +
            data19.getincorrectAns() +
            data20.getincorrectAns() +
            data21.getincorrectAns() +
            data22.getincorrectAns() +
            data23.getincorrectAns() +
            data24.getincorrectAns() +
            data25.getincorrectAns())
        .toInt();
    Accuracy = (((correctAns / (incorrectAns > 0 ? incorrectAns : 1))));
    Missrate = incorrectAns / 40;
    efficiency = correctAns * clicksPerpage;
    timeFC = [
      data1.timeFirstClick,
      data2.timeFirstClick,
      data3.timeFirstClick,
      data4.timeFirstClick,
      data5.timeFirstClick,
      data6.timeFirstClick,
      data7.timeFirstClick,
      data8.timeFirstClick,
      data9.timeFirstClick,
      data10.timeFirstClick,
      data11.timeFirstClick,
      data12.timeFirstClick,
      data13.timeFirstClick,
      data14.timeFirstClick,
      data15.timeFirstClick,
      data16.timeFirstClick,
      data17.timeFirstClick,
      data18.timeFirstClick,
      data19.timeFirstClick,
      data20.timeFirstClick,
      data21.timeFirstClick,
      data22.timeFirstClick,
      data23.timeFirstClick,
      data24.timeFirstClick,
      data25.timeFirstClick,
    ];
    Duration = [
      data1.duration,
      data2.duration,
      data3.duration,
      data4.duration,
      data5.duration,
      data6.duration,
      data7.duration,
      data8.duration,
      data9.duration,
      data10.duration,
      data11.duration,
      data12.duration,
      data13.duration,
      data14.duration,
      data15.duration,
      data16.duration,
      data17.duration,
      data18.duration,
      data19.duration,
      data20.duration,
      data21.duration,
      data22.duration,
      data23.duration,
      data24.duration,
      data25.duration,
    ];

    AverageClickTime = (data1.getduration() +
            data2.getduration() +
            data3.getduration() +
            data4.getduration() +
            data5.getduration() +
            data6.getduration() +
            data7.getduration() +
            data8.getduration() +
            data9.getduration() +
            data10.getduration() +
            data11.getduration() +
            data12.getduration() +
            data13.getduration() +
            data14.getduration() +
            data15.getduration() +
            data16.getduration() +
            data17.getduration() +
            data18.getduration() +
            data19.getduration() +
            data20.getduration() +
            data21.getduration() +
            data22.getduration() +
            data23.getduration() +
            data24.getduration() +
            data25.getduration()) /
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
    dropdownvaluetimeFC = timeFC[0].toString();
    dropdownvalueDuration = Duration[0].toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text("ScoreBoard"),
        backgroundColor: Colors.deepPurple[300],
        centerTitle: true,
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
                        width: 400,
                        child: Center(
                          child: LinearPercentIndicator(
                            width: 200,
                            lineHeight: 14.0,
                            percent: 1.0,
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
                            progressColor: Colors.deepPurple[300],
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
                              percent: correctAns / 35,
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
                              percent: incorrectAns / 35,
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
                              percent: Accuracy / 35,
                              center: Text(
                                ((Accuracy)).toString(),
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
                              percent: (efficiency) / 12000,
                              center: Text(
                                ((efficiency.toString())),
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
                            percent: Missrate,
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
