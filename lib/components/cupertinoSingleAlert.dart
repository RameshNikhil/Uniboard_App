import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoSingleAlert extends StatefulWidget {
  CupertinoSingleAlert({this.title, this.body}); 

  var title; 
  var body; 

  _CupertinoSingleAlertState createState() => _CupertinoSingleAlertState();
}

class _CupertinoSingleAlertState extends State<CupertinoSingleAlert> {
  @override
  Widget build(BuildContext context) {

    void _showCupertinoDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(widget.title),
            content: Text(widget.body),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close')),
              
            ],
          );
        });
  }


  }
}