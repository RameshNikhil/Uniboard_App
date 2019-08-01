import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:uniboard_app/backend/subSelectPage.dart';

class RunJSInWebView extends StatefulWidget {
  @override
  RunJSInWebViewState createState() {
    return new RunJSInWebViewState();
  }
}

class RunJSInWebViewState extends State<RunJSInWebView> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.evalJavascript("document.cookie");
    flutterWebviewPlugin.onStateChanged.listen((state) async {
      if (state.type == WebViewState.finishLoad) {

        final a = flutterWebviewPlugin
            .evalJavascript('M.cfg.sesskey+"***"+document.cookie');
        a.then((String result) {
          if (result.contains("***")) {
            Navigator.pushReplacement(
              context,
              //  MaterialPageRoute(builder: (context) => testPage(result: result)),
              MaterialPageRoute(builder: (context) => SubSelectPage(result: result)),
            );
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  SafeArea(
      child:  WebviewScaffold(
      url: 'https://moodle.vle.monash.edu',
      hidden: true,
     // appBar: AppBar(title: Text("Run JS in Webview")),
    ),
    ),
    );
  }
}
