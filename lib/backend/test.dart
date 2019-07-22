import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './subject_text.dart';


class testPage extends StatelessWidget {
  String result;
  testPage({Key key, @required this.result}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Material(
        child: new Center(
      // child: new Text(result, textAlign: TextAlign.center,),
      // child: new Text(result, textAlign: TextAlign.center,),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // RaisedButton(onPressed: () => print(getBranch(result))),
          // RaisedButton(onPressed: () => getBranches('50519')),
          SubjectText(result),
        ],
      ),
    ));
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
            headers: {"cookie": resultSplit[1]},
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
              headers: {"cookie": resultSplit[1]},
              body: "'[{elementid=expandable_branch_20_"+ subjectID +"&id=" +
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