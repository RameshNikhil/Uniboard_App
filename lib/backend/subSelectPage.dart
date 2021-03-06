import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:uniboard_app/pages/homescreen.dart';
import 'package:uniboard_app/routing/fade_transition.dart';

class SubSelectPage extends StatelessWidget {
  String result;
  SubSelectPage({Key key, @required this.result}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SubjectText(result),
      ),
    );
  }

  void getCal() async {
    // var result = await get('https://jsonplaceholder.typicode.com/photos');
    //   print(result.body);
    // print(result.substring(0, 10) +result.substring(13));
    var resultSplit = result.split("***");
    var url = 'https://lms.monash.edu/lib/ajax/service.php?sesskey=' +
        resultSplit[0] +
        '&info=core_calendar_get_action_events_by_timesort';
    http
        .post(url,
            headers: {"cookie": 'MoodleSession=' + resultSplit[1] + ';'},
            body:
                "[{\"index\":0,\"methodname\":\"core_calendar_get_action_events_by_timesort\",\"args\":{\"limitnum\":5,\"timesortfrom\":1558603389,\"timesortto\":1575019389}}]")
        .then((response) {
      // debugPrint("Response status: ${response.statusCode}");
      // debugPrint("Response body: ${response.body}");
    });
  }

  void getBranches(subjectID) async {
    // print(result.body);
    // print(result.substring(0, 10) +result.substring(13));
    var resultSplit = result.split("***");
    var url = 'https://lms.monash.edu/lib/ajax/getnavbranch.php';
    http
        .post(url,
            headers: {"cookie": 'MoodleSession=' + resultSplit[1] + ';'},
            body: "'[{elementid=expandable_branch_20_" +
                subjectID +
                "&id=" +
                subjectID +
                "&type=30&sesskey=" +
                resultSplit[0] +
                "','method':'POST','mode':'cors'}]")
        .then((response) {
      print({response.body});
      // debugPrint("Response status: ${response.statusCode}");
      // debugPrint("Response body: ${response.body}");
    });
  }
}

// ! BELOW IS FROM WHAT USED TO BE SUBJECT_TEXT


class SubjectText extends StatefulWidget {
  String result;
  Function(String) callback;

  SubjectText(this.result);

  @override
  _SubjectTextState createState() => _SubjectTextState();
}

class _SubjectTextState extends State<SubjectText> {

  var selectedReportList = List<String>();
  //List<dynamic> selectedReportList = List();

  dynamic newPageData = [];
  var selectedList = [];

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xffc39cf4), Color(0xff9D78F3)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    double height = (MediaQuery.of(context).size.height) - 200.0;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(elevation: 0),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                child: Text(
                  'Select your units:',
                  style: new TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient),
                ),
              ),

              //Widget futureWidget() {

              FutureBuilder<dynamic>(
                future: getUnitData(widget.result),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {

                    var reportList = [];
                    for (var item in snapshot.data[2]) {
                      reportList.add(item[1]);
                    }
                  
                    return Container(
                      height: height,
                      //child: Text("Test", style: TextStyle(fontSize: 30)),
                      child: ListView(
                        children: <Widget>[
                          //put the container breakthrough here

                          for (var i in reportList)
                            unitSelection(
                              unitTitle: i,
                              selectedList: selectedList,
                            )

                        ],
                      ),
                    );

                  } else if (snapshot.hasError) {
                    return new Text("${snapshot.error}");
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.grey,
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
              //}
              // Padding(
              //   padding: EdgeInsets.only(top: 20),
              //   child:  unitSelection(unitTitle: "Done",),
              // )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text(
            "DONE",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: Icon(Icons.check),
          onPressed: () {
            print("FAB pressed");
            

            // if (newPageData == "") {
            //   //? IDK if this will work - depends on the data type of newPageData

            //   showDialog(
            //       context: context,
            //       builder: (BuildContext context) {
            //         // return object of type Dialog
            //         return AlertDialog(
            //           titlePadding: EdgeInsets.fromLTRB(28, 18, 0, 0),
            //           shape: RoundedRectangleBorder(
            //               borderRadius:
            //                   BorderRadius.all(Radius.circular(20.0))),
            //           title: Text("Select at least 1 unit"),
            //           // content: Text(alertBody),
            //           actions: <Widget>[
            //             // usually buttons at the bottom of the dialog
            //             new FlatButton(
            //               child: new Text("Close"),
            //               onPressed: () {
            //                 Navigator.of(context).pop();
            //               },
            //             ),
            //           ],
            //         );
            //       });
            // } else {
            //   // ! NOW PUSH THE NEWPAGEDATA TO A NEW CLASS TO SEND TO FIREBASE AND CALL FROM FIREBASE IN HOMESCREEN
            //   // Navigator.pushReplacement(context,FadeRouteBuilder(page: HomeScreen(newPageData: newPageData)));

              Navigator.pushReplacement(context,
                  FadeRouteBuilder(page: HomeScreen(newPageData: selectedList)));
            // }

          },
          foregroundColor: Colors.black,
          backgroundColor: Colors.grey[100],
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
        ),
      ),
    );
  }
}

class unitSelection extends StatefulWidget {
  var unitTitle;
  var selectedList;
  unitSelection({Key key, @required this.unitTitle, @required this.selectedList}) : super(key: key);

  _unitSelectionState createState() => _unitSelectionState();
}

class _unitSelectionState extends State<unitSelection> {
  // var _begin = Alignment(1.0, 1.0);
  // var _end = Alignment(-1.0, -1.0);
  // var _cellColor = [
  //   Color(0xffc39cf4).withOpacity(0.6),
  //   Color(0xff9D78F3).withOpacity(0.6),
  // ];

  Color solidColor = Color(0xffdddddd);

  void _cellChange() {
    if (solidColor == Color(0xffdddddd)) {
      //grey: deselected
      setState(() {
        solidColor = Color(0xffaf7cf4); //purple: selected
        // selectedRepo
      });

      widget.selectedList.add(widget.unitTitle); //push the title of the selected unit into the array 

    } else if (solidColor == Color(0xffaf7cf4)) {
      //purple: selected
      setState(() {
        solidColor = Color(0xffdddddd); //grey: deselct
      });

      widget.selectedList.remove(widget.unitTitle);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: 70.0,
          margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          decoration: new BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment(1.0, 1.0),
            //   end: Alignment(-1.0, -1.0),
            //   stops: [0.1, 0.9],
            //   colors: _cellColor,
            // ),
            color: solidColor,
            borderRadius: new BorderRadius.circular(5.0),
          ),
          child: new IntrinsicHeight(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Expanded(
                  child: new Container(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(widget.unitTitle,
                            style: Theme.of(context).textTheme.subhead.merge(
                                TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          //print("there was a tap");

          _cellChange();
        },
      ),
    );
  }
}

Future<dynamic> getUnitData(result) async {
  var resultSplit = result.split("***");
  var subjectsList;
  var url = 'https://lms.monash.edu/lib/ajax/service.php?sesskey=' +
      resultSplit[0] +
      '&info=theme_monash_get_enrolled_courses_by_timeline_classification';
  http.Response response = await http.post(url,
      headers: {"cookie": 'MoodleSession=' + resultSplit[1] + ';'},
      body:
          "[{\"index\":0,\"methodname\":\"theme_monash_get_enrolled_courses_by_timeline_classification\",\"args\":{\"classification\":\"courses\",\"limit\":999,\"offset\":0,\"sort\":\"en.timecreated desc\",\"search\":null}}]");
  List data = json.decode(response.body);
  // print(data[0]);
  List<dynamic> subjects = data[0]['data']['courses'];
  subjectsList = subjects
      .map((subjectID) => [subjectID['id'], subjectID['fullname']])
      .toList();

  List<String> subjectIDArray = [];
  for (var item in subjectsList) {
    subjectIDArray.add(item[1]);
  }
  List<dynamic> subjectIDNumArray = [];
  for (var item in subjectsList) {
    subjectIDNumArray.add(item[0]);
  }
  // var uriResponse = await client.post("https://us-central1-synopsis-465b0.cloudfunctions.net/getSubjectDataFromMoodle?subjects="+ subjectIDNumArray[0] + '&cookie=' + resultSplit[1]);

  var url2 =
      "https://us-central1-synopsis-465b0.cloudfunctions.net/getSubjectDataFromMoodle?subjects=" +
          subjectIDNumArray.toString() +
          '&cookie=' +
          resultSplit[1].toString();
  String cookieString = resultSplit[1].toString();

  Future<String> getJSONData(url2) async {
    var response = await http.get(Uri.encodeFull(url2));
    // print(response.body);
  }

  getJSONData(url2);

  return ([subjectIDArray, subjectIDNumArray, subjectsList, cookieString]);
}

Future<dynamic> getSelectedUnitData(result) async {}
