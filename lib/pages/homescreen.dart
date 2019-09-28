import 'dart:math';
import 'package:flutter/material.dart';

import '../pages/functionsPage.dart';
import '../pages/downloadsPage.dart';
import '../pages/subjectsPage.dart';


class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.black,
  }) : super(listenable: controller);

  final PageController controller;
  final int itemCount;
  final ValueChanged<int> onPageSelected;
  final Color color;
  static const double _kDotSize = 6.0;
  static const double _kMaxZoom = 2.0;
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center ,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}


class HomeScreen extends StatefulWidget {
  List<dynamic> newPageData;
  HomeScreen({Key key, @required this.newPageData}) : super(key: key);

  @override
  State createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    List<dynamic> unitNames = widget.newPageData;

  final _controller = new PageController(
    initialPage: 1,
    keepPage: false,
  );

   const _kDuration = const Duration(milliseconds: 300);
   const _kCurve = Curves.ease;
  final _kArrowColor = Colors.black.withOpacity(0.8);

  final List<Widget> _pages = <Widget>[
     DownloadsPage(),
     SubjectsPage(unitNames),
     FunctionsPage(),

    // new ConstrainedBox(
    //   constraints: const BoxConstraints.expand(),
    //   child: DownloadsPage(),
    // ),
    // new ConstrainedBox(
    //   constraints: const BoxConstraints.expand(), 
    //   child: SubjectsPage(newPageData: widget.newPageData),
    // ),
    // new ConstrainedBox(
    //   constraints: const BoxConstraints.expand(),
    //   child: FunctionsPage(),
    // ),

  ];

    return new Scaffold(
      body: new IconTheme(
        data: new IconThemeData(color: _kArrowColor),
        child: new Stack(
          children: <Widget>[
            new PageView.builder(
              physics: new AlwaysScrollableScrollPhysics(),
              controller: _controller,
              itemBuilder: (BuildContext context, int index) {

                return _pages[index % _pages.length];
              },
            ),
            new Positioned(
              bottom: 17.0,
              left: 0.0,
              right: 0.0,
              child: new Container(
                //color: Colors.grey[800].withOpacity(0.5),
                padding: const EdgeInsets.all(20.0),
                child: new Center(
                  child: new DotsIndicator(
                    controller: _controller,
                    itemCount: _pages.length,
                    onPageSelected: (int page) {
                      _controller.animateToPage(
                        page,
                        duration: _kDuration,
                        curve: _kCurve,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.search,
          size: 25,
        ),
        onPressed: () {},
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
      ),

            // bottomNavigationBar: BottomAppBar(
      //   child: new Row(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: <Widget>[
      //       // Padding(
      //       //   padding: EdgeInsets.only(bottom: 16.0, right: 16.0),
      //       //   child: IconButton(icon: Icon(Icons.search), onPressed: () {},),
      //       // )
      //       IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: () {},),
      //       IconButton(icon: Icon(Icons.reorder), onPressed: () {},),
      //       IconButton(icon: Icon(Icons.dashboard), onPressed: () {},),
      //       IconButton(icon: Icon(Icons.drag_handle), onPressed: () {},),
      //     ],
      //   ),
      // ),

      // bottomNavigationBar: BottomNavyBar(
      //      // selectedIndex: _selectedIndex,
      //       //showElevation: true, // use this to remove appBar's elevation
      //       onItemSelected: (index) => setState(() {
      //             //_selectedIndex = index;
      //             _controller.animateToPage(index,
      //                 duration: Duration(milliseconds: 300), curve: Curves.ease);
      //           }),
      //       items: [

      //         BottomNavyBarItem(
      //             icon: Icon(Icons.people),
      //             title: Text('Users'),
      //             activeColor: Colors.purpleAccent),
      //         BottomNavyBarItem(
      //             icon: Icon(Icons.search),
      //             title: Text('Search'),
      //             activeColor: Colors.blueGrey),

      //       ],
      //     )
    );
  }
}