import 'package:first_lecture/bak/list_footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(ListApp());

class ListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List demo',
      home: ListDemo(),
    );
  }
}

class ListDemo extends StatefulWidget {
  final int pageSize = 10;
  final int initId = 500;

  @override
  _ListDemoState createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  int _pageNo = 1;
  Future _refreshData() {
    return Future.delayed(Duration(seconds: 3)).then((value) {
      setState(() {
        this._pageNo = 1;
      });
      Fluttertoast.showToast(msg: '刷新完成');
    });
  }

  _loadMore() {
    Future.delayed(Duration(seconds: 3)).then((_) {
      setState(() {
        this._pageNo++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: ListView.separated(
            itemCount: this._pageNo * widget.pageSize,
            itemBuilder: (BuildContext context, int index) {
              if(index + 1 == this._pageNo * widget.pageSize) {
                _loadMore();
                return ListFooter('加载更多');
              } else {
                return _buildItem(index);

              }
            },
            separatorBuilder: (context, index) {
              return Container(
                height: 8,
                color: Colors.green,
              );
            },
          ),
        ),
      ),
    );
  }

  /// build item view
  Container _buildItem(int index) {
    return Container(
      color: Colors.green[300],
      child: Column(
        children: <Widget>[
          Text(
            'ID: ${widget.initId + index}',
            style: TextStyle(color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://picsum.photos/id/${widget.initId + index}/300/100',
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
