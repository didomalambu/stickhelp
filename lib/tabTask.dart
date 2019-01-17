import 'package:flutter/material.dart';
import 'package:stickhelp/ListPage.dart';
import 'package:stickhelp/ListPagePast.dart';
import 'package:stickhelp/ListPageIncoming.dart';

class TabTask extends StatefulWidget
{
  @override
  _TabTaskState createState() => new _TabTaskState();
}

class _TabTaskState extends State with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor:
        //Color.fromRGBO(64, 75, 96, .9),
        Color.fromRGBO(18, 28, 45, 1),
        title: new Text("Tasks",style: TextStyle(fontFamily: "sans-serif-condensed",fontSize: 20.0,fontWeight: FontWeight.bold),),
        bottom: new TabBar(
          indicatorColor: Colors.white,
          //Color.fromRGBO(18, 28, 45, .9),
          controller: controller,
          tabs: [
            new Tab(child: new Text("My request",style: TextStyle(fontSize: 18.0),),),
            new Tab(child: new Text("Incoming",style: TextStyle(fontSize: 18.0),),),
            new Tab(child: new Text("Completed",style: TextStyle(fontSize: 18.0),),),
          ],
        ),
      ),

      body: new TabBarView(
        controller: controller,
        children: [
         /* Padding(padding: new EdgeInsets.only(top: 0.0),
          child: new ListPage(),
          ),*/
          Padding(padding: new EdgeInsets.only(top: 0.0),
            child: new ListPage(),
          ),
          Padding(padding: new EdgeInsets.only(top: 0.0),
            child: new ListPageIncoming(),
          ),
          Padding(padding: new EdgeInsets.only(top: 0.0),
            child: new ListPagePast(),
          ),
        ],
      ),

    );
  }
}