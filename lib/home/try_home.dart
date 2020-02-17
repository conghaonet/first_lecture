import 'package:first_lecture/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() => runApp(HomeApp());

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TryHome(),
    );
  }
}

class TryHome extends StatefulWidget {
  @override
  _TryHomeState createState() => _TryHomeState();
}

class _TryHomeState extends State<TryHome> {
  PageController _controller = PageController();
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
//      print('_controller.position.pixels = ${_controller.position.pixels}');
    });
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
//          enablePullUp: true,
          header: WaterDropHeader(),
//          footer: ClassicFooter(),
          onRefresh: _onRefresh,
          child: Column(
            children: <Widget>[
              Header(),
              Placeholder(
                fallbackHeight: 150,
              ),
              Placeholder(
                fallbackHeight: 48,
                color: Colors.red,
              ),
              Placeholder(
                fallbackHeight: 100,
                color: Colors.green,
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('AA'),
                        Text('BB'),
                        Text('CC'),
                        Text('DD'),
                      ],
                    ),
                    Expanded(
                      child: Listener(
                        behavior: HitTestBehavior.translucent,
                        onPointerMove: (PointerMoveEvent event) {
                          if (_controller.position.pixels == 0 && event.localDelta.dy > 0) {
                            _refreshController.requestRefresh();
                            debugPrint('event.localDelta.dy = ${event.localDelta.dy}');
                          }
                        },
                        child: _buildPageView(),
                      ),
                    ),
/*
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onLongPressMoveUpdate: (details) {
                          print('onLongPressMoveUpdate>>>>>>>');
                          debugPrint('details.offsetFromOrigin.dy = ${details.offsetFromOrigin.dy}');
                        },
                        onLongPressStart: (details) {
                          print('onLongPressStart>>>>>>>');
                          debugPrint('details.globalPosition.dy = ${details.globalPosition.dy}');
                        },
                        onLongPressEnd: (details) {
                          print('onLongPressEnd>>>>>>>');
                          debugPrint('details.globalPosition.dy = ${details.globalPosition.dy}');
                        },
                        onVerticalDragStart: (details) {
                          if (_controller.position.pixels == 0) {
                            print('onVerticalDragStart>>>>>>>');
                            debugPrint('details.globalPosition.distance = ${details.globalPosition.distance}');
                            debugPrint('details.localPosition.distance = ${details.localPosition.distance}');
                          }
                        },
                        onVerticalDragDown: (details) {
                          if (_controller.position.pixels == 0) {
                            print('onVerticalDragDown###########');
                            debugPrint('details.globalPosition.distance = ${details.globalPosition.distance}');
                            debugPrint('details.localPosition.distance = ${details.localPosition.distance}');
                          }
                        },
                        onVerticalDragUpdate: (details) {
                          print('onVerticalDragUpdate=====');
                          debugPrint('details.delta.dy = ${details.delta.dy}');
                          if (_controller.position.pixels == 0) {}
                        },
                        onVerticalDragEnd: (details) {
                          print('GestureDetector=====aaaaaaaa');
                          debugPrint('details.velocity.pixelsPerSecond.dy = ${details.velocity.pixelsPerSecond.dy}');
                          if (_controller.position.pixels == 0) {}
                        },
                        child: _buildPageView(),
                      ),
                    ),
*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PageView _buildPageView() {
    return PageView.builder(
      itemCount: 4,
      scrollDirection: Axis.vertical,
      controller: _controller,
      itemBuilder: (context, index) {
        return Container(
          color: [Colors.green, Colors.red, Colors.blue, Colors.yellow][index],
        );
      },
      onPageChanged: (int index) {
        if (index == 0) {
//          _refreshController.requestRefresh();
        }
      },
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    _refreshController?.dispose();
    super.dispose();
  }
}
