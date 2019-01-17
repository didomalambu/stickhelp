import 'package:flutter/material.dart';
import 'package:stickhelp/pages/signup.dart';



class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => new _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                    padding: EdgeInsets.fromLTRB(0, 110.0, 0.0, 0.0),
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
                    Container(
                      height: 50.0,
                      child: Material(
                        // borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Color.fromRGBO(18, 28, 45, 1),
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            //Navigator.of(context).pushReplacementNamed('/home');
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Text(
                              'RECOVER PASSWORD',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                  ],
                )),
          ],
        ));
  }
}