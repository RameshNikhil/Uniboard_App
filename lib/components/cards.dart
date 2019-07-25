import 'package:flutter/material.dart';
import 'package:uniboard_app/routing/fade_transition.dart';
import '../routing/scale_transition.dart';
import '../pages/unitPage.dart';

class Cards extends StatefulWidget {
  var title;
  var page; 
  double curve; 

  Cards({Key key, @required this.title, @required this.page, @required this.curve}) : super(key: key);

  @override
  _CardsState createState() => new _CardsState();
}

class _CardsState extends State<Cards> {

  @override
  Widget build(BuildContext context) { 
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, FadeRouteBuilder(page: widget.page));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.curve),
          ),
          clipBehavior: Clip.antiAlias,
          child: new Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(1.0, 1.0),
                end: Alignment(-1.0, -1.0),
                stops: [0.1, 0.9],
                colors: [
                  Color(0xffe8c6c2).withOpacity(0.6),
                  Color(0xff906bf0).withOpacity(0.6),
                ],
              ),
            ),
            child: new Align(
              alignment: FractionalOffset(0.1, 0.9),
              child: new Text(
                widget.title,
                style: new TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              
            ),
          ),
        ),
      ),
      decoration: new BoxDecoration(boxShadow: [
        new BoxShadow(
          color: Colors.grey[400],
          
          blurRadius: 15.0,
          offset: new Offset(0.0, 10.0),
          ),
        ]
      ),
    );
  }
}



