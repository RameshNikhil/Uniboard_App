import 'package:flutter/material.dart';
import '../components/cards.dart';
import '../pages/singleWeek.dart';

class UnitPage extends StatefulWidget {
  @override
  _UnitPageState createState() => new _UnitPageState();
}

class _UnitPageState extends State<UnitPage>  {
  // @override
  // Widget build(BuildContext context) {
  //    return Scaffold(
  //      backgroundColor: Colors.blueGrey,
  //     body: Center(
  //       child: RaisedButton(
  //         onPressed: () {
  //           Navigator.pop(context);
  //         },
  //         child: Text('Go back!'),
  //       ),
  //     ),
  //   );
  // }



    
  @override
  Widget build(BuildContext context) {
    var unit = ["Week 1", "Week 2", "Week 3", "Week 4", "Week 5", "Week 6", "Week 7", "Week 8", "Week 9", "Week 10", "Week 11", "Week 12", "Revision", ];

        return new Scaffold(
          body: new Container(
            child: new Center(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.fromLTRB(16.0, 28.0, 16.0, 16.0),
                childAspectRatio: 2 / 1,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: <Widget>[
                  
                  for(String i in unit) Cards(title:i, page: singleWeek(),)

            ],
          ), 
        ),
      ),

      appBar: AppBar(
        elevation: 0,
        //iconTheme: IconThemeData(),
      ),

      floatingActionButton: FloatingActionButton(
      child: Icon(Icons.search, size: 25,),
      onPressed: (){},
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
    ),




    );
  }

  





}
