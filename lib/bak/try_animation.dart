import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(AnimationApp());

class AnimationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TyrAnimation(),
    );
  }

}
class TyrAnimation extends StatefulWidget {
  @override
  _TyrAnimationState createState() => _TyrAnimationState();
}

class _TyrAnimationState extends State<TyrAnimation> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation<double> rotateAnimation;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    //math.pi = 180度
    Tween<double> tween = Tween(begin: 0, end: math.pi);
    rotateAnimation = tween.animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 1, curve: Curves.linear),
      ),
    );
    rotateAnimation.addListener(() {
      setState(() {

      });
    });

    scaleAnimation = Tween<double>(begin: 0.6, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0, 1, curve: Curves.linear),),
    );
    scaleAnimation.addListener((){
      setState(() {

      });
    });
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ScaleTransition(
              scale: scaleAnimation,
              child: Transform.rotate(
                angle: rotateAnimation.value,
                child: Image.asset('images/ic_home.png', width: 256/3, height: 256/3,),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}