import 'package:flutter/material.dart';
import '../components/cards.dart';
import '../pages/singleWeek.dart';

class UnitPage extends StatefulWidget {
  @override
  _UnitPageState createState() => new _UnitPageState();
}

class _UnitPageState extends State<UnitPage> {
  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xffc8afe0), Color(0xffbcc1e1)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'UnitName',
                  style: new TextStyle(
                      fontSize: 30.0,
                      foreground: Paint()..shader = linearGradient,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.fromLTRB(22.0, 3.0, 0.0, 0.0),
          //   child: Text(
          //     "Currently: w1"
          //     style: new TextStyle(
          //       fontSize: 16.0,
          //       foreground: Paint()..shader = linearGradient,
          //     ),
          //   ),
          // ),
          Expanded(
            child: Center(
              child: UnitContent(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.search,
          size: 25,
        ),
        onPressed: () {},
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
      ),
    );
  }
}

class UnitContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var unit = [
      "Week 1",
      "Week 2",
      "Week 3",
      "Week 4",
      "Week 5",
      "Week 6",
      "Week 7",
      "Week 8",
      "Week 9",
      "Week 10",
      "Week 11",
      "Week 12",
      "Revision",
    ];

    return Padding(
      padding: EdgeInsets.all(0.0),
      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.fromLTRB(16.0, 28.0, 16.0, 16.0),
        childAspectRatio: 8.0 / 10.5,
        mainAxisSpacing: 32.0,
        crossAxisSpacing: 16.0,
        children: <Widget>[
          for (String i in unit)
            Cards(
              title: i,
              page: singleWeek(),
              curve: 8.0,
            )
        ],
      ),
    );
  }
}
