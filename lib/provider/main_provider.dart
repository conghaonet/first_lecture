import 'package:first_lecture/provider/first_page.dart';
import 'package:first_lecture/provider/counter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<CounterNotifier>(create: (_) => CounterNotifier()),
        ],
        child: ProviderApp(),
      )
  );
}
class ProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TryProviderApp',
      home: FirstPage(),
    );
  }

}

