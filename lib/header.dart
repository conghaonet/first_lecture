import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        children: <Widget>[
          Icon(Icons.menu),
          Expanded(
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('188体育'),
                  SizedBox(
                    width: 16,
                  ),
                  Text('IM体育')
                ],
              ),
            ),
          ),
          Icon(Icons.add_a_photo),
        ],
      ),
    );
  }

}