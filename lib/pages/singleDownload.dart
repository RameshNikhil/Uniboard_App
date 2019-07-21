import 'package:flutter/material.dart';
import '../components/cards.dart';

class SingleDownload extends StatefulWidget {
  @override
  _singleDownloadState createState() => new _singleDownloadState();
}

class _singleDownloadState extends State<SingleDownload> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: new Text(
          "Display the details of a single download item in this",
          textAlign: TextAlign.center,
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        //iconTheme: IconThemeData(),
      ),
    );
  }
}
