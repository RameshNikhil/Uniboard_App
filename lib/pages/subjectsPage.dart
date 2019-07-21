import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../pages/unitPage.dart';
import '../routing/scale_transition.dart';
import '../components/cards.dart';

class SubjectsPage extends StatefulWidget {

  @override
  _SubjectsPageState createState() => new _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> with TickerProviderStateMixin {
      
  @override
  Widget build(BuildContext context) {
    var unit = ["One", ];   //title of the units are to be passed into this. Assumes all data is fetched in the homescreen or main.dart file
                            //best if data fetched then passed into to homescreen. Can also store all data in local storage then populate from there 

        return new Material(
          // child: new Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: <Widget>[
          // new Container(
          //   padding: EdgeInsets.fromLTRB(16.0, 64.0, 16.0, 16.0),
          //   child: new Text(
          //     "Home",
          //     style: new TextStyle(
          //       fontSize: 40.0,
          //       color: Colors.pink,
          //       fontWeight: FontWeight.w900,
          //     ),
          //   ),
          // ),
          // ])
    
          child: new Container(
            child: new Center(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.fromLTRB(16.0, 128.0, 16.0, 16.0),
                childAspectRatio: 8.0 / 9.5,
                mainAxisSpacing: 32.0,
                crossAxisSpacing: 16.0,
                children: <Widget>[
                  
                  for(String i in unit) Cards(title:i, page: UnitPage(),)

            ],
          ), 
        ),
      ),

    );
  }
}

//This creates the individual subject card which fits into the subjectsPage which is a grid view
//the subjects page is then pushed into a container on the home page


// Have to collect subbject info and for each, create a card
