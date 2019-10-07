import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uniboard_app/backend/RunJSInWebView.dart';
import 'package:uniboard_app/routing/fade_transition.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,

    theme: ThemeData(
      canvasColor: Colors.white,
      primaryColor: Colors.white,
      fontFamily: 'SFPro',
      appBarTheme: AppBarTheme(
        color: Colors.white,
      ),
    ),

    home: new SplashScreen(),
    // routes: <String, WidgetBuilder>{
    //   '/HomeScreen': (BuildContext context) => new HomeScreen()
    // },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);

    return new Timer(_duration, navigationPage);
  }

  // If user has not logged in yet then show this

  // void navigationPage() {
  //   Navigator.pushReplacement(context, FadeRouteBuilder(page: HomeScreen()));
  // }

  void navigationPage() {
    Navigator.pushReplacement(
        context,
        FadeRouteBuilder(
            page: RunJSInWebView())); //method is in run_javascrip.dart
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1.0, 1.0),
          end: Alignment(-1.0, -1.0),
          stops: [0.1, 0.9],
          colors: [
            Color(0xffB993D6),
            Color(0xff8CA6DB),
          ],
        ),
      ),
      child: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset(
              'lib/images/uniboardFullWhite.png',
              height: 350,
            ),
          ),
        ],
      ),
    ));
  }
}
