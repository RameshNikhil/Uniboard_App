import 'package:flutter/material.dart';

class DeleteDialog extends StatefulWidget {
  _DeleteDialogState createState() => _DeleteDialogState();

  String title; 
  String body; 
  String btn; 

  //DeleteDialog({Key key, this.title, this.body, this.btn}) : super(key: key);
}

class _DeleteDialogState extends State<DeleteDialog> {
  @override
  Widget build(BuildContext context) {

    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
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
      }
      );
    
  }
  

  }

