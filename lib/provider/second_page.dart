import 'package:first_lecture/provider/counter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<CounterNotifier>(
              builder: (_, counter, __) => Text(counter.counter.toString()),
            ),
//            Text('${Provider.of<CounterNotifier>(context, listen: false).counter}'),
            RaisedButton(
              child: Text('计数器 +1'),
              onPressed: () {
                Provider.of<CounterNotifier>(context, listen: false).plus();
              },
            ),
          ],
        ),
      ),
    );
  }

}