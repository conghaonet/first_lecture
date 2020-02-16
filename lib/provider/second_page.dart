import 'package:first_lecture/provider/counter_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
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

}