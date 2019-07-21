import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:uniboard_app/components/cards.dart';
import 'package:uniboard_app/pages/singleDownload.dart';
import '../routing/fade_transition.dart';
import 'package:flutter/cupertino.dart';

class DownloadsPage extends StatefulWidget {
  @override
  _DownloadsPageState createState() => new _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  //var downloadsList = ["derivativesExam1.pdf", "sameerPhotoshoot.jpg", "DeepLoveletter.pdf"];

  @override
  Widget build(BuildContext context) {
    return new Downloads();
    
    // return new Column(
    //   children: <Widget>[
    //     new Container(
    //       child: new Text("Downloads"),
    //       height: 100,
    //     ),
    //     new Downloads(),
    //   ],
    // );

  }
}

class Item extends StatelessWidget {
  const Item({
    this.title,
    this.detail,
  });

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {

     return new InkWell(
       child:  Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      decoration: new BoxDecoration(
         gradient: LinearGradient(
                begin: Alignment(1.0, 1.0),
                end: Alignment(-1.0, -1.0),
                stops: [0.1, 0.9],
                colors: [
                  Color(0xffc39cf4).withOpacity(0.6),
                  Color(0xff9D78F3).withOpacity(0.6),
                ],
              ),
        //color: Colors.grey.shade200.withOpacity(0.3),
        borderRadius: new BorderRadius.circular(5.0),
        // boxShadow: [
        // new BoxShadow(
        //   color: Colors.grey[400],
        //   blurRadius: 15.0,
        //   offset: new Offset(0.0, 10.0),
        // )],
      ),
      child: new IntrinsicHeight(
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Expanded(
              child: new Container(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(title, style: Theme.of(context).textTheme.subhead.merge(TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    new Text(detail, style: Theme.of(context).textTheme.caption.merge(TextStyle(color: Colors.white))),
                  ],
                ),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 5.0),
              child: new InkWell(
                child: new Icon(Icons.chevron_right, size: 15.0, color: Colors.white,),
                // onTap: () {
                //   //open pdf -- assuming pdf reader has functions to send, markup...
                // },
              ),
            ),
          ],
        ),
      ),
    ),
    onTap: (){
       Navigator.push(context, FadeRouteBuilder(page: SingleDownload()));
    },
    onLongPress: (){
      //longpress
    },
     );
     
    
  }
}

class Downloads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
          return ListView(
            children: [
              new Item(
                title: 'This is the downloads section.',
                detail: 'Touch anywhere to open. Long press to get option to delete.',
              ),
              new Item(
                title: 'DeepsAnswers.pdf',
                detail: 'info here',
              ),
              new Item(
                title: 'Derivatives101.pdf',
                detail: 'info here',
              ),
              new Item(
                title: 's3nDnUdeS.pls',
                detail: 'info here',
              ),
              new Item(
                title: 'SammerXCindy.jpg',
                detail: 'info here',
              ),
              new Item(title: 'NikhilPortfolioGains.pdf', detail: 'info here'),
              new Item(title: 'blah...pdf', detail: 'info here'),
              new Item(title: '1047notes.pdf', detail: 'info here'),
            ],
    
    );
  }
}


