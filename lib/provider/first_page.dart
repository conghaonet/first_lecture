import 'package:first_lecture/provider/counter_notifier.dart';
import 'package:first_lecture/provider/second_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${Provider.of<CounterNotifier>(context).counter}'),
            FlatButton(
              child: Text('进入下一页', style: TextStyle(fontSize: 20),),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SecondPage();
                  },
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}