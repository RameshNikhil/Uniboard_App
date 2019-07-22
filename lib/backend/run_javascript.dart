import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import './test.dart';

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
        // flutterWebviewPlugin
        //     .evalJavascript("document.getElementById('input38').checked = false");
        // flutterWebviewPlugin
        //     .evalJavascript("jQueryCourage('#input80').prop('checked',true)");
        // flutterWebviewPlugin
        //     .evalJavascript("jQueryCourage('#input77').prop('checked',true)");
        // final b = flutterWebviewPlugin
        //     .evalJavascript("document.getElementById('input38').checked");
        // b.then((String c) => print(c));

        final a = flutterWebviewPlugin
            .evalJavascript('M.cfg.sesskey+"***"+document.cookie');
        a.then((String result) {
          if (result.contains("***")) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => testPage(result: result)),);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://moodle.vle.monash.edu',
      hidden: true,
      appBar: AppBar(title: Text("Run JS in Webview")),
    );
  }
}
