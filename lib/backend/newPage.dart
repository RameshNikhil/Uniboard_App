import 'package:flutter/material.dart';

 class newPage extends StatelessWidget {
  dynamic selectedReportList;
  newPage({Key key, @required this.selectedReportList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return new Material(
          child: Center (
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 350, 8, 8) ,
              child: new Column(
            children: <Widget>[              
              Text (selectedReportList[1].toString(), textAlign: TextAlign.center,), 
              new RaisedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ],
          ),
            ),
          ),
     );
     }
}