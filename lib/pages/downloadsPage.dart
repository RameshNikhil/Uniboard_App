import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:uniboard_app/components/cards.dart';
import 'package:uniboard_app/components/deleteDialog.dart';
import 'package:uniboard_app/components/downloadCell.dart';
import 'package:uniboard_app/pages/singleDownload.dart';
import 'package:uniboard_app/pages/subjectsPage.dart';
import '../routing/fade_transition.dart';
import 'package:flutter/cupertino.dart';

class DownloadsPage extends StatefulWidget {
  // var title;
  // var detail;

  // DownloadsPage({Key key, @required this.title, @required this.detail,}) : super(key: key);

  @override
  _DownloadsPageState createState() => new _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  @override
  Widget build(BuildContext context) {
    //Shader is for gradient text
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xffc39cf4), Color(0xff9D78F3)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    //LETS PRETEND THERE IS AN ARRAY WE HAVE. MAY PRETEND WE PASS IN FROM ANOTHER CLASS
    //WITH THE FIRST BEING THE TITLE AND THE SECOND BEING THE DETAIL

    var downloadList = ["t1", "t2"];

    //NEED TO FIX PADDING

    return new Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 37.0, 16.0, 0.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 16.0),
              child: Text(
                'Downloads',
                style: new TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient),
              ),
            ),
            for (String i in downloadList)
              DownloadCell(
                title: i,
                detail: i,
              )
          ],
        ),
      ),
    );
  }
}
