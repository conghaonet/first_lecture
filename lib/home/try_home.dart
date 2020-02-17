import 'package:first_lecture/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(HomeApp());

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TryHome(),
    );
  }

}
class TryHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Header(),
            Placeholder(
              fallbackHeight: 150,
            ),
          ],
        ),
      ),
    );
  }

}