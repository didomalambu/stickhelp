import 'package:flutter/material.dart';
import 'package:stickhelp/dashboard/dashboard.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stickhelp/pages/signup.dart';
import 'package:stickhelp/pages/signup2.dart';
import 'package:stickhelp/pages/signin.dart';
import 'package:stickhelp/pages/terms.dart';
import 'package:stickhelp/pages/forgot_password.dart';
import 'package:flutter/services.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => Dashboard(),
  "/signup": (BuildContext context) => new SignupPage(),
  "/signup2": (BuildContext context) => new SignupPage2(),
  "/terms": (BuildContext context) => new Terms(),
  "/forgot": (BuildContext context) => new ForgotPassword()
};

void main() async => SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
  runApp(new MyApp());
});



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

        /* internalisation de l'application*/
        localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'), // English
          const Locale('he', 'IL'), // Hebrew
          const Locale('fr','FR'), // Hebrew
        ],

      debugShowCheckedModeBanner: false,
      title: 'STICKHELP' ,
      theme: new ThemeData(
        primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
        fontFamily: "sans-serif-condensed",
      ),
    //  home: new Dashboard(),
        home: new SignupIn(),
        routes: routes
    );
  }
}


