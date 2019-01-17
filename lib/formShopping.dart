import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:numberpicker/numberpicker.dart';
import 'package:stickhelp/formShopping_photos.dart';
import 'package:stickhelp/pages/selectContact.dart';

class FormShopping extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _FormShoppingState();
}

class _FormShoppingState extends State<FormShopping> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  DateTime _dateTime = new DateTime.now();
  final myController = TextEditingController();
  int _weight = 2;
  DateTime _date = new DateTime.now();
  String theDateSave = new DateFormat('y-MM-d').format(new DateTime.now());
  String theDateDisplay =
      new DateFormat('EEEE, d MMMM', 'fr').format(new DateTime.now());
  String _time = DateTime.now().hour.toString() +
      ':' +
      DateTime.now().minute.toString().padLeft(2, '0');
  var myColor = Colors.white;
  var myColor2 = Colors.white;
  var myColor3 = Colors.white;
  var market = "";

  /*To do list variable*/
  final TextEditingController eCtrl = new TextEditingController();
  List<String> theToDoList = <String>[];
  // CheckBox Widgets
  List<String> timeOfToDo = <String>[];
  List<Widget> theCheckBox = <Widget>[];
  List<bool> theCheckboxState = <bool>[];
  bool showAlertDialog = false;
  bool showSelectedToDo = false;
  int selectedToDoIndex = 0;

  AlertDialog dialog = new AlertDialog(
    content: new SingleChildScrollView(
      child: new ListBody(children: <Widget>[
        new TextField(
          maxLines: 3,
          textAlign: TextAlign.left,
          // controller: eCtrl,
          onChanged: null,
          onSubmitted: null,
          decoration: new InputDecoration.collapsed(
            hintText: ("Add your item"),
          ),
          style: new TextStyle(fontSize: 20.0, color: Colors.black),
        ),
      ]),
    ),
  );

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    myController.addListener(_printLatestValue);
  }

  _printLatestValue() {
    print("Second text field: ${myController.text}");
  }

  /* to do list functions*/
  Widget _showSelectedToDo() {
    return new AlertDialog(
        title: new Text("Selected ToDO"),
        content: new SingleChildScrollView(
          child: new Text(theToDoList[selectedToDoIndex]),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text("OK"),
            onPressed: () {
              setState(() {
                showSelectedToDo = false;
              });
            },
          ),
        ]);
  }

  Widget _dialog() {
    print("DEdans dialog");
    return new AlertDialog(
      content: new Text(
        "Lets go out nonite",
        style: new TextStyle(fontSize: 30.0),
      ),
      actions: <Widget>[
        new FlatButton(
            onPressed: () {
              print('YES !!');
              print("The Text to be added is $eCtrl.text");
              theToDoList.add(eCtrl.text);
              eCtrl.clear();
            },
            child: new Text('Yes')),
      ],
    );
  }

  void _removeCheckedItems(int index) {
    theToDoList.removeAt(index);
  }

  Widget _createCheckBox(int index) {
    // Make sure that checkbox is already present if not we need to add
    if (theCheckBox.length < theToDoList.length) {
      theCheckboxState.add(false);
      theCheckBox.add(new Checkbox(
          value: theCheckboxState[index],
          onChanged: (bool value) {
            setState(() {
              print("Current INDEX Is => $index");
              theCheckboxState[index] = value;
            });
          }));
    } else {
      theCheckBox[index] = new Checkbox(
          value: theCheckboxState[index],
          activeColor: Color.fromRGBO(58, 66, 86, 1.0),
          onChanged: (bool value) {
            setState(() {
              print("Current INDEX Is => $index" + value.toString());
              theCheckboxState[index] = value;
            });
          });
    }

    return theCheckBox[index];
  }

  Widget _createAlertDialogBox() {

    fil(){
      theToDoList.add(eCtrl.text);
      eCtrl.clear();
      /*setState(() {

        // Create the text Box
        print("The Text to be added is $eCtrl.text");
        theToDoList.add(eCtrl.text);
        eCtrl.clear();
        //showAlertDialog = false;
      });*/
    }
    return new AlertDialog(
        title: new Text(
          "Your Shopping list",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: new SingleChildScrollView(
          child: new ListBody(children: <Widget>[
            new TextField(
              maxLines: 1,
              textAlign: TextAlign.left,
              controller: eCtrl,
              onChanged: null,
              onSubmitted: null,

              decoration: new InputDecoration.collapsed(
                hintText: ("Add your item"),
              ),
              style: new TextStyle(fontSize: 17.0, color: Colors.black),
            ),
          ]),
        ),
        actions: <Widget>[
          new RaisedButton(
            child: new Text(
              "OK",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            color: Color.fromRGBO(18, 28, 45, 1),
            textColor: Colors.white,
            onPressed: () {
              setState(() {
                showAlertDialog = false;
                // Create the text Box
                print("The Text to be added is $eCtrl.text");
                theToDoList.add(eCtrl.text);
                eCtrl.clear();
              });
            },
          ),
          new RaisedButton(
            child: new Text(
              "BACK",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            color: Color.fromRGBO(58, 66, 86, 1.0),
            textColor: Colors.white,
            onPressed: () {
              setState(() {
                showAlertDialog = false;
                eCtrl.clear();
              });
            },
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text(
          'Shopping',
          style: TextStyle(
              fontFamily: "sans-serif-condensed",
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(18, 28, 45, 1),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.image,
              color: Colors.white,
            ),
            tooltip: 'Air it',
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (_) => new FormShoppingPhotos()));
            },
          ),
        ],
      ),
      body:
          //SingleChildScrollView(
          //child:
          Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: new Container(
                padding: new EdgeInsets.all(20.0),
                child: new Column(children: <Widget>[
                  showSelectedToDo == true ? _showSelectedToDo() : new Text(""),
                  showAlertDialog == true
                      ? _createAlertDialogBox()
                      : new Text(""),
                  // showAlertDialog == true? _dialog() : new Text(""),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0, 5.0, 10.0),
                        child: Container(
                            height: 90.0,
                            width: 90.0,
                            child: Material(
                              shadowColor: Colors.black,
                              // color: Color.fromRGBO(58, 66, 86, 1.0),
                              color: myColor,
                              elevation: 7.0,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    myColor = (myColor ==
                                            Color.fromRGBO(58, 66, 86, 1.0))
                                        ? Colors.white
                                        : Color.fromRGBO(58, 66, 86, 1.0);
                                    if (market == "Migros") {
                                      market = "";
                                    } else {
                                      market = "Migros";
                                    }
                                  });
                                },
                                child: Center(
                                  child: new Image.asset(
                                    "assets/migros.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0, 5.0, 10.0),
                        child: Container(
                            height: 90.0,
                            width: 90.0,
                            child: Material(
                              shadowColor: Colors.black,
                              color: myColor2,
                              elevation: 7.0,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    myColor2 = (myColor2 ==
                                            Color.fromRGBO(58, 66, 86, 1.0))
                                        ? Colors.white
                                        : Color.fromRGBO(58, 66, 86, 1.0);
                                    if (market == "Coop") {
                                      market = "";
                                    } else {
                                      market = "Coop";
                                    }
                                  });
                                },
                                child: Center(
                                  child: new Image.asset(
                                    "assets/coop.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0, 5.0, 10.0),
                        child: Container(
                            height: 90.0,
                            width: 90.0,
                            child: Material(
                              shadowColor: Colors.black,
                              color: myColor3,
                              elevation: 7.0,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    myColor3 = (myColor3 ==
                                            Color.fromRGBO(58, 66, 86, 1.0))
                                        ? Colors.white
                                        : Color.fromRGBO(58, 66, 86, 1.0);
                                    if (market == "Manor") {
                                      market = "";
                                    } else {
                                      market = "Manor";
                                    }
                                  });
                                },
                                child: Center(
                                  child: new Image.asset(
                                    "assets/manor.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                  new Expanded(

                      //child: SafeArea(
                        //bottom: false,
                        child: new ListView.builder(
                    padding: new EdgeInsets.all(8.0),
                    reverse: false,
                    itemBuilder: (_, int index) {
                        return new Column(children: <Widget>[
                          new Row(children: <Widget>[
                            SizedBox(
                              width: 200.0,
                              //height: 300.0,
                              child: new Text(theToDoList[index],
                                  style: new TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0)),
                            ),
                            new IconButton(
                                icon: new Icon(Icons.delete),
                                color: Color.fromRGBO(58, 66, 86, 1.0),
                                onPressed: () {
                                  setState(() {
                                    _removeCheckedItems(index);
                                  });
                                }),
                          ]),
                          new Divider(
                            height: 5.0,
                            color: Color.fromRGBO(58, 66, 86, 1.0),
                          )
                        ]);
                    },
                    itemCount: theToDoList.length,
                  ),
                     // )
                  ),
                ])),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 10.0, left: 0.0, right: 0.0),
            child: new MaterialButton(
              child: const Text(
                'SELECT CONTACT',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
              color: Colors.redAccent,
              elevation: 4.0,
              padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0),
              minWidth: 500.0,
              height: 50.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (_) => new SelectContact(
                              shoppingList: theToDoList,
                              market: market,
                              typeLink: "shopping",
                            )));
              },
            ),
          ),
        ],
      ),
      //  ),

      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            showAlertDialog = true;
            // _dialog();

            // showDialog(context: context, child: dialog);
            //_createAlertDialogBox();
            //_createCheckBox(index)
            print('Click FAB');
            setState(() {});
          },
          tooltip: 'Add note',
          backgroundColor: Color.fromRGBO(18, 28, 45, 1),
          child: new Icon(Icons.add)),
    );
  }
}
