import 'dart:async';

import 'package:first_lecture/provider/counter_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Timer _timer;
  int _timerNum = 0;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }
  void _startTimer() async {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(timer.tick < 10) {
        setState(() {
          ++_timerNum;
        });
      } else {
        timer.cancel();
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text('${_timerNum}'),
            Text('${DateTime.now().toString()}'),
            Consumer<CounterNotifier>(
              builder: (context, counter, __,) {
                return Text('${counter.counter}');
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('计数器+1'),
              onPressed: () {
                Provider.of<CounterNotifier>(context, listen: false).add();
              },
            ),
            InkWell(
              child: Text('返回'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}