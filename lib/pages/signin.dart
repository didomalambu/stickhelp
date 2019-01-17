import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class SignupIn extends StatefulWidget {
  @override
  _SignupInState createState() => new _SignupInState();
}

class _SignupInState extends State<SignupIn> {

  _launchURL() async {
    const url = 'https://www.stickhelp.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 80.0, 0.0, 0.0),
                    child: Center(
                      child:
                      Text('Stickhelp',textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 60.0, fontWeight: FontWeight.bold,color: Color.fromRGBO(18, 28, 45, 1),)),
                    ),
        ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(58, 66, 86, 1.0)))),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(58, 66, 86, 1.0)))),
                      obscureText: true,
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/forgot');
                        },
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: Color.fromRGBO(58, 66, 86, 1.0),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(height: 60.0),
                    Container(
                      height: 50.0,
                      child: Material(
                       // borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Color.fromRGBO(18, 28, 45, 1),
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed('/home');
                          },
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                  ],
                )),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'New user ?',
                  style: TextStyle(fontFamily: 'Montserrat',fontSize: 15,color: Color.fromRGBO(18, 28, 45, 1),),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Color.fromRGBO(58, 66, 86, 1.0),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                        _launchURL() ;
                        },
                  child: Text(
                    'Help ?',
                    style: TextStyle(
                        color: Color.fromRGBO(58, 66, 86, 1.0),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}