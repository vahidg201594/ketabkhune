import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './scoped-models/user.dart';
import './pages/login.dart';
import './pages/signup.dart';
import './pages/home.dart';
import './pages/splash_screen.dart';
import './pages/info.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppStare();
  }
}

class _MyAppStare extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    UserModel model = UserModel();
    return ScopedModel(
      model: model,
      child: MaterialApp(
        title: 'Ketabkhune',
        theme: ThemeData(
          brightness: Brightness.red,
          accentColor: Colors.greenAccent,
          primaryColor: Colors.yellowAccent,
        ),
        routes: {
          '/':(BuildContext context)=>SplashScreen(),
          '/login': (BuildContext context) => LoginPage(),
          '/signup': (BuildContext context) => SignUpPage(),
          '/home': (BuildContext context) => HomePage(model),
          '/info':(BuildContext context)=>InfoPage(),
        },
      ),
    );
  }
}
