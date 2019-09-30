import 'package:flutter/material.dart';

class StandardAlert extends StatefulWidget {
  _StandardAlertState createState() => _StandardAlertState();

  StandardAlert({Key key, @required this.title, @required this.body})
      : super(key: key);

  var title;
  var body;
}

class _StandardAlertState extends State<StandardAlert> {
  @override
  Widget build(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            titlePadding: EdgeInsets.fromLTRB(28, 18, 0, 0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: widget.title,
            content: widget.body,
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
