import 'package:clockapp/alarm.dart';
import 'package:clockapp/clockPage.dart';
import 'package:clockapp/homepage.dart';
import 'package:clockapp/timerPage.dart';
import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2D2F41),

        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      },
                      child: Icon(
                    Icons.home_filled,
                    color: Colors.white,
                    size: 52.0,
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Welcome To Alarm Clock Timer App",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20.0,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ClockPage()),
                        );
                      },
                      child: SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: Card(
                          color: Color(0xFF444974),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.access_time_rounded,
                                    size: 64.0, color: Colors.white),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "CLOCK",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TimerPage()),
                        );
                      },
                      child: SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: Card(
                          color: Color(0xFF444974),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.timer_rounded,
                                    size: 64.0, color: Colors.white),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Timer",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Alarm()),
                        );
                      },
                      child: SizedBox(
                        width: 350.0,
                        height: 160.0,
                        child: Card(
                            color: Color(0xFF444974),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.access_time_rounded,
                                    size: 64.0, color: Colors.white),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "ALARM",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      },
                      child: SizedBox(
                        width: 350.0,
                        height: 160.0,
                        child: Card(
                            color: Colors.red,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[

                                    SizedBox(
                                      width: 100.0,
                                    ),
                                    Text(
                                      "NEXT",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                    Icon(Icons.navigate_next_rounded,
                                        size: 64.0, color: Colors.white),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ),
                  ],

                ),
              ),
            )
          ],
        )));
  }
}
