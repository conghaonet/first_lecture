import 'package:flutter/material.dart';

class ListFooter extends StatelessWidget {
  final String str;
  ListFooter(this.str, {Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Text('${this.str} ....'),
        ],
      ),
    );
  }

}