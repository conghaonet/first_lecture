import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ListApp());

class ListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListA',
      home: Scaffold(
        appBar: AppBar(
          title: Text('List Title'),
        ),
        body: MyList(),
      ),

    );
  }
}

class MyList extends StatefulWidget {
  final initId = 500;
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  int _pageNo = 1;
  int _pageSize = 10;

  Future _loadData() async {
    print('time 1 ====> ${DateTime.now()}');
    Future.delayed(Duration(seconds: 3)).then((_){
      setState(() {
        ++_pageNo;
      });
    });
    print('time 3 ====> ${DateTime.now()}');

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if(index == _pageSize * _pageNo) {
            _loadData();
            return LoadMoreFooter();

          } else {
            return Image.network('https://picsum.photos/id/${widget.initId + index}/300/100',);
          }
        },
        itemCount: _pageNo * _pageSize + 1,
      ),

    );
  }
}

class LoadMoreFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircularProgressIndicator(),
          Text('loading...'),
        ],
      ),
    );
  }

}