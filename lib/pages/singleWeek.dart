import 'package:flutter/material.dart';
import '../components/cards.dart';

class singleWeek extends StatefulWidget {
  @override
  _singleWeekState createState() => new _singleWeekState();
}

class _singleWeekState extends State<singleWeek> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: new Text(
          "Display the details of a single week in this",
          textAlign: TextAlign.center,
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        //iconTheme: IconThemeData(),
      ),
    );
  }
}
