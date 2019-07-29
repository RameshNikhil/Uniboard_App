import 'package:flutter/material.dart';
import '../components/cards.dart';
import '../routing/fade_transition.dart';
import '../pages/homescreen.dart';
import '../pages/singleFunction.dart';





class FunctionsPage extends StatefulWidget {
  @override
  _FunctionsPageState createState() => new _FunctionsPageState();
}

class _FunctionsPageState extends State<FunctionsPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    //Shader is for gradient text
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xffc39cf4), Color(0xff9D78F3)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return Scaffold(
      appBar: AppBar(
        elevation: 0 
      ),
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
             
              Text(
                'Functions',
                style: new TextStyle(
                    fontSize: 30.0,
                    foreground: Paint()..shader = linearGradient,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        
        Expanded(
          child: Center(
            child: FunctionContent(),
          ),
        ),
      ],
    ),
    ); 
    
  }
}

class FunctionContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var functions = ["function1", ];

    return GridView.count(
                crossAxisCount: 1,
                padding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
                childAspectRatio: 2 / 1,
                mainAxisSpacing: 32.0,
                crossAxisSpacing: 16.0,
                children: <Widget>[
                  for(String i in functions) Cards(title:i, page: SingleFunction(), curve: 15.0,),

            ],
          );
  }
}
