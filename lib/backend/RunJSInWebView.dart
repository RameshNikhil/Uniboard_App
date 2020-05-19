import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
import 'package:uniboard_app/backend/subSelectPage.dart';
import 'package:uniboard_app/routing/fade_transition.dart';

class RunJSInWebView extends StatefulWidget {
  @override
  RunJSInWebViewState createState() {
    return new RunJSInWebViewState();
  }
}

class RunJSInWebViewState extends State<RunJSInWebView> {
  InAppWebViewController webView;
  String url = "";
  double progress = 0;

// ? Is this necessary?
  @override
  void initState() {
    super.initState();
    print("hello");
  }

  Future<bool> logIn() async {
    var cookiesHttps =
        await CookieManager.getCookies("https://lms.monash.edu/");
    var cookiesHttp = await CookieManager.getCookies("http://lms.monash.edu/");
    var sessKey = await webView.injectScriptCode("M.cfg.sesskey");
    var filterMoodleSession = cookiesHttps
        .where((cookie) => cookie["name"] == "MoodleSession")
        .toList();
    filterMoodleSession.addAll(cookiesHttp
        .where((cookie) => cookie["name"] == "MoodleSession")
        .toList());
    if (filterMoodleSession.length > 0) {
      print("pushing to next screen:" +
          sessKey +
          "***" +
          filterMoodleSession.first["value"]);
      Navigator.pushReplacement(
          context,
          FadeRouteBuilder(
              page: SubSelectPage(
                  result:
                      sessKey + "***" + filterMoodleSession.first["value"])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: InAppWebView(
        initialUrl: "https://lms.monash.edu/",
        initialHeaders: {},
        initialOptions: {},
        onWebViewCreated: (InAppWebViewController controller) {
          print("created");
          webView = controller;
        },
        onLoadStop: (InAppWebViewController controller, String url) {
          if (url.contains("lms.monash.edu")) {
            logIn();
          }

          print("done with loading $url");
          setState(() {
            this.url = url;
          });
        },
        onProgressChanged: (InAppWebViewController controller, int progress) {
          setState(() {
            this.progress = progress / 100;
          });
        },
      )),
    );
  }
}
