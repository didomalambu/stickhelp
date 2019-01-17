import 'package:flutter/material.dart';
import 'package:stickhelp/pages/signup.dart';
import 'package:flutter_html_view/flutter_html_view.dart';


class Terms extends StatefulWidget {
  @override
  _TermsState createState() => new _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  Widget build(BuildContext context) {


    String generalText='These Terms and Conditions ("Agreement") governs the use of the services ("Service") that are made available by Website.com Solutions Inc.("Website.com" ,"we" or "us")\n\n '
        'PLEASE READ THIS AGREEMENT CAREFULLY. By submitting your application and by your use of the Service, you agree to comply with all of the terms and conditions set out in this Agreement. Website.com may terminate your account at any time, with or without notice, for conduct'
        ' that is in breach of this Agreement, for conduct that Website.com believes is harmful to its business, or for conduct where the use of the Service is harmful to any other party.\n\n'
        'Website.com may, in its sole discretion, change or modify this Agreement at any time, with or without notice. Such changes or modifications shall be made effective for all Subscribers upon posting of the modified Agreement to this web address (URL): http://www.website.com/terms-and-conditions/. '
        'You are responsible to read this document from time to time to ensure that your use of the Service remains in compliance with this Agreement. ';
    String serviceText='Website.com offers Subscribers domain name registration, website hosting, and email hosting services for the duration of the service term purchased from Website.com. \n\n '
        'Services are provided on the basis of facility and equipment availability. Website.com reserves the right to modify, change, or discontinue any aspect of the Services at any time.'
        'Access to the web and email servers is terminated upon expiry of the Service.'
        'Details regarding your account can be found in your account control panel (https://www.website.com/sign-in/) \n\n';

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(

            title:
            new Center(
              child: Text("TERMS AND CONDITIONS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0),) ,
            ),
            elevation: 4.0,
            backgroundColor: Color.fromRGBO(64, 75, 96, .9),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);

              },
            ),]
        ),
        body: new SingleChildScrollView(
          //child: new Center(
            //child: new HtmlView(data: termsHtml),
          padding: EdgeInsets.fromLTRB(25.0, 20.0, 0, 0),
            child: Text.rich(
              TextSpan(
                //text: someText, // default text style
                children: <TextSpan>[
                  TextSpan(text: '1. General\n\n', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: generalText,),
                  TextSpan(text: '\n\n 2. Services\n\n', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: serviceText ,),
                ],
              ),
            )

         // ),
        ),
      ),
    );
  }
  }