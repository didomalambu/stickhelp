
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stickhelp/utils/my_navigator.dart';
import 'package:path/path.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

void lauchDashboard(context) {
  Timer(Duration(seconds: 5), () => MyNavigator.goToHome(context));
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lauchDashboard(this.context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(color: Colors.black),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        'assets/logo.png', height: 150.0, width: 150.0,),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}