import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(AsyncApp());

class AsyncApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoApp(
      title: 'AsyncDemo',
      home: AsyncDemo(),
    );
  }
}

class AsyncDemo extends StatefulWidget {
  @override
  _AsyncDemoState createState() => _AsyncDemoState();
}

class _AsyncDemoState extends State<AsyncDemo> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                FlatButton(
                  child: Text('$_count'),
                  onPressed: () async {
                    this._count = await compute(countEven, 1000000000);
                    Fluttertoast.showToast(msg: this._count.toString());
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future<int> countEven(int num) async {
    int count = 0;
    while (num > 0) {
      if (num % 2 == 0) ++count;
      num--;
    }
    return count;
  }

}

