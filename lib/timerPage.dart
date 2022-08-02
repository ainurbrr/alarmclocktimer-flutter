import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerPage extends StatefulWidget{
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage>{
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;
  final _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Stopwatch Timer',
              style: TextStyle(
                  fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            StreamBuilder(
                stream: _stopWatchTimer.rawTime,
                initialData: _stopWatchTimer.rawTime.value,
                builder: (context, snapshot) {
              final value = snapshot.data;
              final displayTime = StopWatchTimer.getDisplayTime(value, hours: _isHours);
              return Text(displayTime, style: TextStyle(
                  fontSize: 64,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),);
            }),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(color: CupertinoColors.activeGreen, label: 'Start', onPress: (){
                  _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                },),
                SizedBox(
                  width: 40.0,
                ),
                CustomButton(color: CupertinoColors.destructiveRed, label: 'Stop', onPress: (){
                  _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                },),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            CustomButton(color: CupertinoColors.activeBlue, label: 'Lap Timestamps', onPress: (){
              _stopWatchTimer.onExecute.add(StopWatchExecute.lap);
            },),
            SizedBox(
              height: 20.0,
            ),
            CustomButton(color: CupertinoColors.darkBackgroundGray, label: 'Reset', onPress: (){
              _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
            },),
            Container(
              height: 120,
              margin: const EdgeInsets.all(0),
              child: StreamBuilder<List<StopWatchRecord>>(
                stream: _stopWatchTimer.records,
                initialData: _stopWatchTimer.records.value,
                builder: (context, snapshot){
                  final value = snapshot.data;
                  if(value.isEmpty){
                    return Container();
                  }
                  Future.delayed(const Duration(milliseconds:100),(){
                    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
                        duration: const Duration(microseconds: 500), curve: Curves.easeOut);
                  });
                  return ListView.builder(
                      controller: _scrollController,
                      itemBuilder: (context, index){
                        final data = value[index];
                        return Column(
                          children:[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${index+1}. ${data.displayTime}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Divider(height: 1.0)
                          ]
                        );
                      },
                    itemCount: value.length,
                  );
                },
              )

            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget{
  final Color color;
  final Function onPress;
  final String label;
  CustomButton({this.color, this.onPress, this.label});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      shape: const StadiumBorder(),
      onPressed: onPress,
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}