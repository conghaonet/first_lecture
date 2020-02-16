import 'package:first_lecture/provider/counter_notifier.dart';
import 'package:first_lecture/provider/second_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterNotifier(),),
      ],
      child: ProviderApp(),
    )
  );
}

class ProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }

}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(Provider.of<CounterNotifier>(context).counter.toString()),
              RaisedButton(
                child: Text('下一页'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return SecondPage();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}