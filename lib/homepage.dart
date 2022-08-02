import 'package:clockapp/alarm.dart';
import 'package:clockapp/clockPage.dart';
import 'package:clockapp/data.dart';
import 'package:clockapp/enums.dart';
import 'package:clockapp/model/menuInfo.dart';
import 'package:clockapp/timerPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xFF2D2F41),
        body: TabBarView(
          children: <Widget>[
            ClockPage(),
            Alarm(),
            TimerPage(),
          ],
        ),
        bottomNavigationBar: Container(
          color: Color(0xFF2D2F41),
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.grey,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.access_time_rounded),
                child: new Text(
                  "Jam",
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
              Tab(
                icon: Icon(Icons.alarm),
                child: new Text(
                  "Alarm",
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
              Tab(
                icon: Icon(Icons.timer_rounded),
                child: new Text(
                  "Stopwatch",
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuMethod(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget child) {
        return FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(32))),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            color: currentMenuInfo.menuType == value.menuType
                ? Colors.grey
                : Colors.transparent,
            onPressed: () {
              var menuInfo = Provider.of<MenuInfo>(context, listen: false);
              menuInfo.updateMenu(currentMenuInfo);
            },
            child: Column(
              children: [
                Image.asset(
                  currentMenuInfo.imageSource,
                  scale: 1.5,
                ),
                Text(
                  currentMenuInfo.title ?? '',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            ));
      },
    );
  }
}
