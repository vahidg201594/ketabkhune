import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INFO'),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('vahid ganji',style: TextStyle(fontSize: 30.0),),
          Text('9621003325453',style: TextStyle(fontSize: 30.0),)
        ],
      ),),
    );
  }
}