import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
        _controller.forward();
    _gotoLoginPage();
    super.initState();
  }

  void _gotoLoginPage() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor
              ], end: Alignment.centerLeft, begin: Alignment.centerRight),
            ),
          ),
          Center(
            child: ScaleTransition(
              scale: CurvedAnimation(
                  parent: _controller, curve: Interval(0.0, 1.0,curve: Curves.easeOut),),
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 60.0,
                child: Text(
                  'K',
                  style: TextStyle(fontSize: 60.0, color: Colors.greenAccent),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
