import 'dart:async';

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timer',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController tb;
  int hour = 0;
  int min = 0;
  int sec = 0;
  bool started = true;
  bool stoped = false;
  late int timefortimer;
  final dur = const Duration(seconds: 1);
  bool canceltimer = false;

  String timetodisplay = '';
  @override
  void initState() {
    tb = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  void start() {
    setState(() {
      started = false;
      stoped = true;
    });

    timefortimer = ((hour * 3600) + (min * 60) + sec);
    // debugPrint(timefortimer.toString());
    Timer.periodic(dur, (Timer t) {
      setState(() {
        if (timefortimer < 1 || canceltimer == true) {
          t.cancel();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MyHomePage()));
        } else if (timefortimer < 3600) {
          int m = timefortimer ~/ 60;
          int s = timefortimer - (60 * m);
          timetodisplay = m.toString() + ":" + s.toString();
          timefortimer = timefortimer - 1;
        } else {
          int h = timefortimer ~/ 3600;
          int t = timefortimer - (3600 * h);
          int m = t ~/ 60;
          int s = t - (60 * m);

          timetodisplay =
              h.toString() + ':' + m.toString() + ':' + s.toString();
          timefortimer = timefortimer - 1;
        }
      });
    });
  }

  void stop() {
    setState(() {
      started = true;
      stoped = true;
      canceltimer = true;
      timetodisplay = '';
    });
  }

  Widget timer() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 6,
              child: Container(

                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text('HH',
                            style: TextStyle(fontWeight: FontWeight.w700)),
                      ),
                      NumberPicker(
                        value: hour,
                        minValue: 0,
                        maxValue: 23,
                        onChanged: (val) {
                          setState(() {
                            hour = val;
                          });
                        },
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text('MM',
                            style: TextStyle(fontWeight: FontWeight.w700)),
                      ),
                      NumberPicker(
                        value: min,
                        minValue: 0,
                        maxValue: 59,
                        onChanged: (val) {
                          setState(() {
                            min = val;
                          });
                        },
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text('SS',
                            style: TextStyle(fontWeight: FontWeight.w700)),
                      ),
                      NumberPicker(
                        value: sec,
                        minValue: 0,
                        maxValue: 59,
                        onChanged: (val) {
                          setState(() {
                            sec = val;
                          });
                        },
                      )
                    ],
                  ),
                  // numPicker(A:'MM',B: min),
                  // numPicker(A:'SS',B: sec)
                ]),
              )),
          Expanded(
              flex: 1,
              child: Text(
                timetodisplay,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
              )),
          Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                      onPressed: started ? start : null,
                      color: Colors.green,
                      padding:
                      EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                      child: Text("Start",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white))),
                  RaisedButton(
                      onPressed: stoped ? stop : null,
                      color: Colors.green,
                      padding:
                      EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                      child: Text("Stop",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)))
                ],
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WATCH',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        bottom: TabBar(
          tabs: [
            Text(
              'Timer',
              style: TextStyle(),
            ),
            Text(
              'StopWatch',
              style: TextStyle(),
            ),
          ],
          labelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18.0,
          ),
          labelPadding: EdgeInsets.only(
            bottom: 10.0,
          ),
          unselectedLabelColor: Colors.white60,
          labelColor: Colors.white,
          controller: tb,
        ),
        backgroundColor: Colors.red,
      ),
      body: TabBarView(
        children: <Widget>[
          timer(),
          Text(
            'StopWatch',
            style: TextStyle(),
          ),
        ],
        controller: tb,
      ),
    );
  }
}

