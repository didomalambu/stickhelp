import 'package:flutter/material.dart';
import 'package:stickhelp/pages/signin.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        //backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        // title: new Text("Tasks",style: TextStyle(fontFamily: "sans-serif-condensed",fontSize: 20.0),),
        title: new Text(
          'Settings',
          style: TextStyle(
              fontFamily: "sans-serif-condensed",
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(18, 28, 45, 1),
      ),
      body: makeBody(context),
    );
  }
}

_launchURL() async {
  const url = 'https://www.stickhelp.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchMail() async {
  const email = 'mailto:contact@stickhelp.com?subject=App%20contact&body=Your%20comments';
  if (await canLaunch(email)) {
    await launch(email);
  } else {
    throw 'Could not launch $email';
  }
}

/*| `http:<URL>` , `https:<URL>`, e.g. `http://flutter.io` | Open URL in the default browser |
| `mailto:<email address>?subject=<subject>&body=<body>`, e.g. `mailto:smith@example.org?subject=News&body=New%20plugin` | Create email to <email address> in the default email app |
| `tel:<phone number>`, e.g. `tel:+1 555 010 999` | Make a phone call to <phone number> using the default phone app |
| `sms:<phone number>`, e.g. `sms:5550101234` | Send an SMS message to <phone number> using*/

Container makeBody(BuildContext context) {
  return new Container(
    // color: const Color(0xFF00FF00),
    decoration: BoxDecoration(
      color: Color.fromRGBO(18, 28, 45, 1),
    ),
    child: ListView(
      padding: EdgeInsets.only(top: 0.0),
      children: <Widget>[
        new Container(
          height: 50.0,
          decoration: new BoxDecoration(
            //borderRadius: new BorderRadius.circular(16.0),
            //color: Colors.blueGrey,
            color: Color.fromRGBO(58, 66, 86, 1),
          ),
          child: new Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15.0),
            child: new Text("Account",
                style: new TextStyle(
                    color: Colors.white,
                    fontFamily: "sans-serif-condensed",
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        new Container(
          height: 60.0,
          padding: const EdgeInsets.only(
            left: 5.0,
          ),
          decoration: new BoxDecoration(
            //borderRadius: new BorderRadius.circular(16.0),
            color: Color.fromRGBO(18, 28, 45, 1),
          ),
          child: new Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10.0),
            child: new Text("Email",
                style: new TextStyle(
                    color: Colors.white,
                    fontFamily: "sans-serif-condensed",
                    fontSize: 18.0)),
          ),
        ),
        new Container(
          height: 50.0,
          decoration: new BoxDecoration(
            //borderRadius: new BorderRadius.circular(16.0),
            //color: Colors.blueGrey,
            color: Color.fromRGBO(58, 66, 86, 1),
          ),
          child: new Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15.0),
            child: new Text("General",
                style: new TextStyle(
                    color: Colors.white,
                    fontFamily: "sans-serif-condensed",
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        new Container(
          height: 60.0,
          padding: const EdgeInsets.only(left: 5.0),
          decoration: new BoxDecoration(
            //borderRadius: new BorderRadius.circular(16.0),
            color: Color.fromRGBO(18, 28, 45, 1),
          ),


          child: GestureDetector(
            onTap:(){
              _launchURL();
            },
            child: new Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 10.0),
              child: new Text("Confidentiality",
                  style: new TextStyle(
                      color: Colors.white,
                      fontFamily: "sans-serif-condensed",
                      fontSize: 18.0)),
            ),
          )
        ),
        new Container(
          padding: const EdgeInsets.only(left: 5.0),
          height: 60.0,
          decoration: new BoxDecoration(
            //borderRadius: new BorderRadius.circular(16.0),
            color: Color.fromRGBO(18, 28, 45, 1),
          ),
          child:

          GestureDetector(
            onTap: (){
              _launchURL();
            },
            child:  new Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 10.0, bottom: 0.0),
              child: new Text("Terms of use",
                  style: new TextStyle(
                      color: Colors.white,
                      fontFamily: "sans-serif-condensed",
                      fontSize: 18.0)),
            ),
          )
        ), // Contactez nous
        new GestureDetector(
          onTap: () {
            _launchMail();
          },
          child: new Container(
            height: 60.0,
            padding: const EdgeInsets.only(left: 5.0),
            decoration: new BoxDecoration(
              //borderRadius: new BorderRadius.circular(16.0),
              color: Color.fromRGBO(18, 28, 45, 1),
            ),
            child: new Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, left: 10.0, bottom: 30.0),
              child: new Text("Contact us",
                  style: new TextStyle(
                      color: Colors.white,
                      fontFamily: "sans-serif-condensed",
                      fontSize: 18.0)),
            ),
          ),
        ),

        //Deconnexion
        new GestureDetector(
          onTap: () {
            print('Contacts us was tapped!');

            // appel à l'alertdialog
            // showDialog(context: context, child: dialog);
          },
          child: new Container(
            height: 60.0,
            padding: const EdgeInsets.only(left: 5.0),
            decoration: new BoxDecoration(
              //borderRadius: new BorderRadius.circular(16.0),
              color: Color.fromRGBO(18, 28, 45, 1),
            ),
            child: new Padding(
                padding:
                    const EdgeInsets.only(top: 15.0, left: 10.0, bottom: 30.0),
                child: GestureDetector(
                  child: new Text("Log out",
                      style: new TextStyle(
                          color: Colors.white,
                          fontFamily: "sans-serif-condensed",
                          fontSize: 18.0)),
                  onTap: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (_) => new SignupIn()));
                  },
                )),
          ),
        ),
        new Container(
          height: 50.0,
          decoration: new BoxDecoration(
            //borderRadius: new BorderRadius.circular(16.0),
            //color: Colors.blueGrey,
            color: Color.fromRGBO(58, 66, 86, 1),
          ),
          child: new Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15.0),
            child: new Text("About",
                style: new TextStyle(
                    color: Colors.white,
                    fontFamily: "sans-serif-condensed",
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        // fin Deconnexion
        new GestureDetector(
          onTap: () {
            // launch method to open the url
            _launchURL();
          },
          child: new Container(
            height: 60.0,
            padding: const EdgeInsets.only(left: 5.0),
            decoration: new BoxDecoration(
              //borderRadius: new BorderRadius.circular(16.0),
              color: Color.fromRGBO(18, 28, 45, 1),
            ),
            child: new Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, left: 10.0, bottom: 30.0),
              child: new Text("About Stickhelp",
                  style: new TextStyle(
                      color: Colors.white,
                      fontFamily: "sans-serif-condensed",
                      fontSize: 18.0)),
            ),
          ),
        ),
        new Container(
          height: 60.0,
          padding: const EdgeInsets.only(left: 5.0),
          decoration: new BoxDecoration(
            //borderRadius: new BorderRadius.circular(16.0),
            color: Color.fromRGBO(18, 28, 45, 1),
          ),
          child: new Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10.0),
            child: new Text("Version 0.0.1",
                style: new TextStyle(
                    color: Colors.white,
                    fontFamily: "sans-serif-condensed",
                    fontSize: 18.0)),
          ),
        ),
        // end about
      ],
    ),
  );
}
