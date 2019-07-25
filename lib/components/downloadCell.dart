import 'package:flutter/material.dart';
import '../routing/fade_transition.dart';
import '../pages/singleDownload.dart';

class DownloadCell extends StatefulWidget {
  var title;
  var detail; 

  DownloadCell({Key key, @required this.title, @required this.detail,}) : super(key: key);

  @override
  _DownloadCellState createState() => new _DownloadCellState();
}

class _DownloadCellState extends State<DownloadCell> {

  @override
  Widget build(BuildContext context) { 

    return new InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        decoration: new BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(1.0, 1.0),
            end: Alignment(-1.0, -1.0),
            stops: [0.1, 0.9],
            colors: [
              Color(0xffc39cf4).withOpacity(0.6),
              Color(0xff9D78F3).withOpacity(0.6),
            ],
          ),
          //color: Colors.grey.shade200.withOpacity(0.3),
          borderRadius: new BorderRadius.circular(5.0),
          // boxShadow: [
          // new BoxShadow(
          //   color: Colors.grey[400],
          //   blurRadius: 15.0,
          //   offset: new Offset(0.0, 10.0),
          // )],
        ),
        child: new IntrinsicHeight(
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Expanded(
                child: new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(widget.title,
                          style: Theme.of(context).textTheme.subhead.merge(
                              TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                      new Text(widget.detail,
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .merge(TextStyle(color: Colors.white))),
                    ],
                  ),
                ),
              ),
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 5.0),
                child: new InkWell(
                  child: new Icon(
                    Icons.chevron_right,
                    size: 15.0,
                    color: Colors.white,
                  ),
                  // onTap: () {
                  //   //open pdf -- assuming pdf reader has functions to send, markup...
                  // },
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context, FadeRouteBuilder(page: SingleDownload()));
      },
      onLongPress: () {
        //longpress

        //MAKE THIS A COMPONENT IF POSSIBLE
        //DeleteDialog(title: "Do you want to delete this?", body: "Something", btn:"Button or something");

        showDialog(
            context: context,
            builder: (BuildContext context) {
              // return object of type Dialog
              return AlertDialog(
                titlePadding: EdgeInsets.fromLTRB(28, 18, 0, 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                title: new Text(
                  "Delete?",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,  
                  ),
                ),
                //content: new Text("Alert Dialog body"),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog

                  new FlatButton(
                    child: new Text("Delete"),
                    onPressed: () {
                      //delete function
                    },
                  ),
                  new FlatButton(
                    child: new Text(
                      "Cancel",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      },
    );


  }
}