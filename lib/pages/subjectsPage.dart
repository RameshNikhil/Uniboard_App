import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../pages/unitPage.dart';
import '../routing/scale_transition.dart';
import '../components/cards.dart';
import 'package:intl/intl.dart';

class SubjectsPage extends StatefulWidget {
  @override
  _SubjectsPageState createState() => new _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    //Shader is for gradient text
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xffc39cf4), Color(0xff9D78F3)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM').format(now);

    return Scaffold(
      appBar: AppBar(
        elevation: 0 
      ),
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hello, ',
                style: new TextStyle(
                    fontSize: 28.0,
                    foreground: Paint()..shader = linearGradient),
              ),
              Text(
                'Nikhil Ramesh',
                style: new TextStyle(
                    fontSize: 30.0,
                    foreground: Paint()..shader = linearGradient,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(22.0, 3.0, 0.0, 0.0),
          child: Text(
            formattedDate,
            style: new TextStyle(
              fontSize: 16.0,
              foreground: Paint()..shader = linearGradient,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Content(),
          ),
        ),
      ],
    ),
    );
    
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var unit = ["One", "2", "3", "4"];

    return Padding(
      padding: EdgeInsets.all(0.0),
      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.fromLTRB(16.0, 28.0, 16.0, 16.0),
        childAspectRatio: 8.0 / 9.5,
        mainAxisSpacing: 32.0,
        crossAxisSpacing: 16.0,
        children: <Widget>[
          for (String i in unit)
            Cards(
              title: i,
              page: UnitPage(),
              curve: 15.0,
            )
        ],
      ),
    );
  }
}
