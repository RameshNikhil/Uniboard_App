import 'package:flutter/material.dart';
import '../components/cards.dart';
import '../routing/fade_transition.dart';
import '../pages/homescreen.dart';
import '../pages/singleFunction.dart';

class FunctionsPage extends StatefulWidget {
  @override
  _FunctionsPageState createState() => new _FunctionsPageState();
}

class _FunctionsPageState extends State<FunctionsPage> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    var functions = ["function1", ];

    return new Material(

       child: new Container(
            child: new Center(
              child: GridView.count(
                crossAxisCount: 1,
                padding: EdgeInsets.fromLTRB(16.0, 128.0, 16.0, 16.0),
                childAspectRatio: 2 / 1,
                mainAxisSpacing: 32.0,
                crossAxisSpacing: 16.0,
                children: <Widget>[
                  for(String i in functions) Cards(title:i, page: SingleFunction(), curve: 15.0,),

                  Row(
                    children: <Widget>[
                      
                    ],
                  ), 
                  

            ],
          ), 
        ),
      ),

      
    );
  }
}

