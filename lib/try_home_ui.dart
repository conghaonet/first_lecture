import 'package:first_lecture/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(UiApp());

class UiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TryHomeUi(),
    );
  }
}

class TryHomeUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Header(),
//            Container(
//              height: 48,
//              decoration: BoxDecoration(
//                color: Colors.redAccent,
//                borderRadius: BorderRadius.circular(24),
//              ),
//            ),
            Placeholder(
              fallbackHeight: 150,
            ),
            Expanded(
              child: Container(
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }

}
