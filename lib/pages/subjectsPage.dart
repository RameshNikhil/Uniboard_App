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
   
        return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Padding(
                   padding: EdgeInsets.fromLTRB(16.0, 120.0, 0.0, 16.0),
                   child:   Text("Hello,",
                    style: TextStyle(
                      fontSize: 31.0,
                      color: Colors.black,
                    )),
                ), 

                Padding(
                   padding: EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 16.0),
                  child: Text("Nikhil Ramesh",
                    style: TextStyle(
                        fontSize: 32.0,
                        //fontFamily: "Montserrat",
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
                ), 

Expanded(
  child:  Center(
  child: Content(),
),
),

             


          
             
         
                


              ],
      );
  }
}

class Content extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     var unit = ["One", "2", "3", "4"]; 

    return Padding(
      padding: EdgeInsets.all(10.0),
      child:  GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.fromLTRB(16.0, 128.0, 16.0, 16.0),
                childAspectRatio: 8.0 / 9.5,
                mainAxisSpacing: 32.0,
                crossAxisSpacing: 16.0,
                children: <Widget>[
                  
                  for(String i in unit) Cards(title:i, page: UnitPage(), curve: 15.0,)

            ],
          ),

      );  
     
  }
}