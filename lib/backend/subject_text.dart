import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import './newPage.dart';

import 'newPage.dart';

class SubjectText extends StatefulWidget {
  String result;
  Function(String) callback;

  SubjectText(this.result);

  @override
  _SubjectTextState createState() => _SubjectTextState();
}

class _SubjectTextState extends State<SubjectText> {

  List<String> selectedReportList = List();

//NIKHIL: THIS IS THE FUTURE BUILDER WIDGET, RENDERS A LIST OF THE SUBJECTS ASYNCRONOUSLY
  Widget futureWidget() {
    return new FutureBuilder<dynamic>(
      future: getUnitData(widget.result),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return AlertDialog(
            title: Text("Report Video"),
            content: MultiSelectChip(
              snapshot.data[0],
              onSelectionChanged: (selectedList) {
                setState(() {
                  selectedReportList = selectedList;
                });
              },
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Report"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => newPage(selectedReportList : selectedReportList)),  //newPage is just the UI pages
                  );
                },
              )
            ],
          );
        } else if (snapshot.hasError) {
          return new Text("${snapshot.error}");
        } else {
          return new CircularProgressIndicator();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(children: <Widget>[
      new Text(
        "Select your units:",
        style: TextStyle(fontSize: 20, color: Colors.deepPurple),
      ),
      futureWidget(),
      RaisedButton(
        onPressed: () => {},
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF6A1B9A),
                Color(0xFF9C27B0),
                Color(0xFFF3E5F5),
              ],
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          child: const Text('   Next   ', style: TextStyle(fontSize: 20)),
        ),
      ),
    ]));
  }
}

Future<dynamic> getUnitData(result) async {
  var resultSplit = result.split("***");
  var subjectsList;
  var url = 'https://lms.monash.edu/lib/ajax/service.php?sesskey=' +
      resultSplit[0] +
      '&info=theme_monash_get_enrolled_courses_by_timeline_classification';
  http.Response response = await http.post(url,
      headers: {"cookie": resultSplit[1]},
      body:
          "[{\"index\":0,\"methodname\":\"theme_monash_get_enrolled_courses_by_timeline_classification\",\"args\":{\"classification\":\"timeline\",\"limit\":999,\"offset\":0,\"sort\":\"en.timecreated desc\",\"search\":null}}]");
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
  List<String> subjectIDNumArray = [];
  for (var item in subjectsList) {
    subjectIDNumArray.add(item[1]);
  }


  return ([subjectIDArray, subjectIDNumArray, subjectsList]);
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged;

  MultiSelectChip(this.reportList, {this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = List();

  _buildChoiceList() {
    List<Widget> choices = List();

    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    });

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}

Future<dynamic> getSelectedUnitData(result) async {}
