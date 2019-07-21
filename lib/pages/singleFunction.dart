import 'package:flutter/material.dart';
import '../components/cards.dart';

class SingleFunction extends StatefulWidget {
  @override
  _singleFunctionState createState() => new _singleFunctionState();
}

class _singleFunctionState extends State<SingleFunction> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: new Text(
          "Display the details of a single function in this",
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
