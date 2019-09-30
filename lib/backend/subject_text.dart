import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:uniboard_app/pages/homescreen.dart';
import 'package:uniboard_app/pages/subjectsPage.dart';
import 'package:uniboard_app/routing/fade_transition.dart';

class SubjectText extends StatefulWidget {
  String result;
  Function(String) callback;

  SubjectText(this.result);

  @override
  _SubjectTextState createState() => _SubjectTextState();
}

class _SubjectTextState extends State<SubjectText> {
  List<dynamic> selectedReportList = List();
  dynamic newPageData = [];

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
                    var reportList = <String>[];
                    for (var item in snapshot.data[2]) {
                      reportList.add(item[1]);
                    }
                    return Container(
                      height: height,
                      //child: Text("Test", style: TextStyle(fontSize: 30)),
                      child: ListView(
                        children: <Widget>[
                          //put the container breakthrough here

                          for (String i in reportList)
                            unitSelection(
                              unitTitle: i,
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

            if (newPageData == ""){
              // TODO: alert to select at least 1 unit
            } else {

              // ! NOW PUSH THE NEWPAGEDATA TO A NEW CLASS TO SEND TO FIREBASE AND CALL FROM FIREBASE IN HOMESCREEN 
              // Navigator.pushReplacement(context,FadeRouteBuilder(page: HomeScreen(newPageData: newPageData)));

              Navigator.pushReplacement(context,FadeRouteBuilder(page: HomeScreen(newPageData: newPageData)));
            }

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
  unitSelection({
    Key key,
    @required this.unitTitle,
  }) : super(key: key);

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
    } else if (solidColor == Color(0xffaf7cf4)) {
      //purple: selected
      setState(() {
        solidColor = Color(0xffdddddd); //grey: deselct
      });
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
