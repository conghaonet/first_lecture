import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListDemo(),
    );
  }

}

class ListDemo extends StatefulWidget {
  @override
  _ListDemoState createState() => _ListDemoState();
}

/// 'https://picsum.photos/id/${widget.initId + index}/300/100',
class _ListDemoState extends State<ListDemo> {
  int _pageNo = 1;
  int _pageSize = 10;
  static const _initId = 500;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

  }

  Future _loadData() async {
    if(_isLoading) return;
    _isLoading = true;
    await Future.delayed(Duration(seconds: 3), (){
      setState(() {
        _isLoading = false;
        ++_pageNo;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView.separated(
            itemCount: _pageNo * _pageSize,
            itemBuilder: (BuildContext context, int index) {
              if(index + 1 == _pageNo * _pageSize) {
                _loadData();
                return LoadMoreFooter();
              } else {
                return _buildItem(index);
              }
            },
            separatorBuilder: (context, index) {
              return Container(
                height: 4,
                color: Colors.white,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildItem(int index) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.green,
        shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 20,
            child: Center(child: Text('index = ${_initId + index}')),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              'https://picsum.photos/id/${_initId + index}/300/100',
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class LoadMoreFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text('loading...'),
      ],
    );
  }

}