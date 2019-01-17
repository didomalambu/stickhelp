import 'package:flutter/material.dart';
import 'package:stickhelp/dashboard/dashboard.dart';
import 'package:stickhelp/pages/terms.dart';


class SignupPage2 extends StatefulWidget {
  @override
  _SignupPage2State createState() => _SignupPage2State();
}

class _SignupPage2State extends State<SignupPage2> {
  String radioBoxValue;
  bool checkBoxValue2 = false;
  bool checkBoxValue3 = false;
  List _countries = ["Switzerland","France","USA"];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCountry;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCountry = _dropDownMenuItems[0].value;
    super.initState();
  }


  //create the listing for the dropdown menu
  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String country in _countries) {
      items.add(new DropdownMenuItem(
          value: country,
          child: new Text(country)
      ));
    }
    return items;
  }

  void changedDropDownItem(String selectedCountry) {
    print("Selected country $selectedCountry, we are going to refresh the UI");
    setState(() {
      _currentCountry = selectedCountry;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[

                 Container(
            child: Stack(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(0, 80.0, 0.0, 0.0),
                    child:
                    Center(child: Text('Stickhelp',textAlign: TextAlign.right,
                        style:
                        TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(18, 28, 45, 1),)),)
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[


                  new Row(
                  children: <Widget>[
                    Text('COUNTRY',
                          style:TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                  new Padding(
                  padding:EdgeInsets.only(left: 30.0),
                    child: DropdownButton(
                            value: _currentCountry,
                            items: _dropDownMenuItems,
                            onChanged: changedDropDownItem,
                    ),
                  )

                  ]),

                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'CITY ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'AGE ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(height: 10.0),
                      ////
                      new Row(
                        children: <Widget>[
                          Text('Gender',style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.grey,fontSize: 17.0,
                            fontWeight: FontWeight.bold,),),
                          new Padding(
                              padding: EdgeInsets.only(top: 0.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  new Radio(
                                    value: "M",
                                    groupValue: radioBoxValue,
                                    activeColor: Color.fromRGBO(18, 28, 45, 1),
                                    onChanged: (String newValue) {
                                      setValue(newValue);
                                    },
                                  ),
                                  new Text("M"),
                                ],
                              )),
                          new Padding(
                              padding: EdgeInsets.only(top: 0.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  new Radio(
                                    value: "F",
                                    groupValue: radioBoxValue,
                                    activeColor: Color.fromRGBO(18, 28, 45, 1),
                                    onChanged: (String newValue) {
                                      setValue(newValue);
                                    },
                                  ),
                                  new Text("F"),
                                ],
                              )),
                          new Padding(
                              padding: EdgeInsets.only(top: 0.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  new Radio(
                                    value: "T",
                                    activeColor: Color.fromRGBO(18, 28, 45, 1),
                                    groupValue: radioBoxValue,
                                    onChanged: (String newValue) {
                                      setValue(newValue);
                                    },
                                  ),
                                  new Text("T"),
                                ],
                              )),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Checkbox(
                              activeColor: Color.fromRGBO(18, 28, 45, 1),
                              value: checkBoxValue3,
                              onChanged: (bool newValue) {
                                setState(() {
                                  checkBoxValue3 = newValue;
                                  print(checkBoxValue3);
                                });
                              }),

                          InkWell(
                              onTap: () {
                                Navigator.push(context, new MaterialPageRoute(builder: (_) => new Terms()));
                              },
                              child: Text(
                              'Accept Terms',
                              ),
                              )
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Container(
                          height: 50.0,
                          child: Material(
                            shadowColor: Colors.greenAccent,
                            color: Color.fromRGBO(18, 28, 45, 1),
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Center(
                                child: Text(
                                  'PREVIOUS',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: 10.0),
                      Container(
                          height: 50.0,
                          child: Material(
                            shadowColor: Colors.greenAccent,
                            color: Color.fromRGBO(18, 28, 45, 1),
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                              },
                              child: Center(
                                child: Text(
                                  'DONE',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),
                      /////

                    //],
                  //)
                 // ),


                ],
              )),
          // SizedBox(height: 15.0),
              ]));
  }

  void setValue(String newValue) {
    setState(() {
      radioBoxValue = newValue;
      print(radioBoxValue);
    });
  }
}