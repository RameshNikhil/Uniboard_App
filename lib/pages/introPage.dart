import 'package:flutter/material.dart';
import 'dart:async';
import 'package:uniboard_app/backend/RunJSInWebView.dart';
import '../routing/fade_transition.dart';
import 'package:flutter/cupertino.dart';

//! THIS PAGE IS PURELY FOR TESTING, IT WILL 'LIKELY' NOT BE USED IN PROD

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var alertTitle = "Alert Title";
    var alertBody = "Alert Body";

    AlertFunction() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              titlePadding: EdgeInsets.fromLTRB(28, 18, 0, 0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              title: Text(alertTitle),
              content: Text(alertBody),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }

    int delayAmount = 500;

    PageController _controller = PageController();

    TextEditingController nameController = new TextEditingController();
    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();

    return PageView(
      controller: _controller,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        //Page 1
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(36.0, 0.0, 36.0, 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ShowUp(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 32.0),
                        child: Text("Hello,",
                            style: TextStyle(
                              fontSize: 31.0,
                              fontFamily: "Quicksand",
                              color: Colors.black,
                            )),
                      ),
                      delay: delayAmount,
                    ),
                    ShowUp(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 32.0),
                        child:
                            Text("Welcome to Uniboard, a better way to moodle.",
                                style: TextStyle(
                                  fontSize: 32.0,
                                  fontFamily: "Quicksand",
                                  color: Colors.black,
                                )),
                      ),
                      delay: delayAmount * 3,
                    ),
                    ShowUp(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 32.0),
                        child: Text(
                            "This must be your first time on the app. Click below to get set up!",
                            style: TextStyle(
                              fontSize: 32.0,
                              fontFamily: "Quicksand",
                              color: Colors.black,
                            )),
                      ),
                      delay: delayAmount * 6,
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _controller.nextPage(
                  duration: Duration(seconds: 1), curve: Curves.ease);
            },
            child: ShowUp(
              child: Icon(Icons.keyboard_arrow_down),
              delay: delayAmount * 9,
            ),
            elevation: 0,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
          ),
        ),

        // Page 2
        Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 64.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ShowUp(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Begin with your Monash details below",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: "Quicksand",
                          color: Colors.black,
                        ),
                      ),
                    ),
                    delay: delayAmount * 3,
                  ),
                  ShowUp(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name',
                        ),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "Quicksand",
                        ),
                        controller: nameController,
                      ),
                    ),
                    delay: delayAmount * 6,
                  ),
                  ShowUp(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Monash Email Address'),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "Quicksand",
                        ),
                        controller: emailController,
                      ),
                    ),
                    delay: delayAmount * 7,
                  ),
                  ShowUp(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Monash Password'),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "Quicksand",
                        ),
                        controller: passwordController,
                      ),
                    ),
                    delay: delayAmount * 8,
                  ),
                  ShowUp(
                    child: Padding(
                      padding: EdgeInsets.only(top: 64.0),
                      child: Text(
                        "You will be sent an Okta verification in a bit",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: "Quicksand",
                          color: Colors.black,
                        ),
                      ),
                    ),
                    delay: delayAmount * 3,
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (nameController.text.isEmpty) {
                alertTitle = "Name Missing";
                alertBody = "Please add your name before continuing";
                AlertFunction();
              } else if (emailController.text.isEmpty) {
                //! need to check if email is valid with monash
                alertTitle = "Email Missing";
                alertBody = "Please add your email before continuing";
                AlertFunction();
              } else if (passwordController.text.isEmpty) {
                //! need to check if password is valid
                alertTitle = "Password Missing";
                alertBody = "Please add your Password before continuing";
                AlertFunction();
              } else {
                // TODO : this should pass in the users details and then they should be able to automatically logon
                Navigator.pushReplacement(
                    context, FadeRouteBuilder(page: RunJSInWebView()));
                //and then once Monash validates show them the subject select, otherwise go back to pswd
              }
            },
            child: ShowUp(
              child: Icon(Icons.keyboard_arrow_down),
              delay: delayAmount * 9,
            ),
            elevation: 0,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
          ),
        ),
      ],
    );
  }
}

//fade up animation
class ShowUp extends StatefulWidget {
  final Widget child;
  final int delay;

  ShowUp({@required this.child, this.delay});

  @override
  _ShowUpState createState() => _ShowUpState();
}

class _ShowUpState extends State<ShowUp> with TickerProviderStateMixin {
  AnimationController _animController;
  Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero)
            .animate(curve);

    if (widget.delay == null) {
      _animController.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay), () {
        _animController.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
      opacity: _animController,
    );
  }
}
