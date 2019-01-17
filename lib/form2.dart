import 'package:flutter/material.dart';
import 'package:stickhelp/formShopping_photos.dart';
import 'package:stickhelp/pages/selectContact.dart';

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CounterState();
  }
}

class _CounterState extends State<Counter> {
  var myColor = Colors.white;
  var myColor2 = Colors.white;
  var myColor3 = Colors.white;
  var market = "";
  final TextEditingController eCtrl = new TextEditingController();
  List<String> theToDoList = <String>[];
  String itemFood;

  addItemToList(String item)
  {
    setState(() {
      theToDoList.add(item);
      eCtrl.clear();

      print("longeur du tableau");
      print(theToDoList.length);
    });
  }

  void _removeCheckedItems(int index) {
    theToDoList.removeAt(index);
  }

  Future<Null> _addItem(BuildContext context) async {
    switch(
    await showDialog(
        context: context,
        child:  new _SystemPadding(
          child: new SimpleDialog(
            contentPadding: EdgeInsets.only(bottom:0.0),
            titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 0.0, 10.0, 5.0),
                height: 50.0,
                color:Color.fromRGBO(18, 28, 45, 1),
                child: Center(child: Text('ADD AN ITEM',style: TextStyle(fontWeight: FontWeight.bold,
                    color:  Colors.white,fontSize: 17.0),) ,),
              ),
              Padding(padding: EdgeInsets.fromLTRB(10, 10.0, 0, 5.0)),
              Padding(padding: EdgeInsets.fromLTRB(25.0, 0, 0, 0),
                child: new TextField
                  (
                  maxLines: 1,
                controller: eCtrl,
                  //controller:  new TextEditingController(text: contact.name),
                  textAlign: TextAlign.left,
                  onChanged: null,
                  onSubmitted:null,
                  //addItemToList(eCtrl.text),
                  decoration: new InputDecoration.collapsed
                    (
                    hintText: ("Item"),
                  ),
                  style: new TextStyle(
                      fontSize: 19.0,
                      color: Colors.black
                  ),
                ) ,)
              ,
              Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
              new Divider(
                height: 0.0,
                color: Color.fromRGBO(58, 66, 86, 1.0),
                indent: 20.0,
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new MaterialButton
                    (
                    child: new Text("OK",style: TextStyle(fontWeight: FontWeight.bold),),
                    color: Color.fromRGBO(18, 28, 45, 1),
                    height: 50.0,
                    textColor: Colors.white,
                    onPressed: () {
                      //Navigator.pop(context);
                      addItemToList(eCtrl.text);
                      Navigator.pop(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 10.0, 5.0)),
                  new MaterialButton
                    (
                    child: new Text("CANCEL",style: TextStyle(fontWeight: FontWeight.bold),),
                    color: Color.fromRGBO (58, 66, 86, 1.0),
                    textColor: Colors.white,
                    height: 50.0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),

              Padding(padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),)

            ],
          ),
        )
    )) {
     /* case Answer.YES:
      //setAnswer('yes');
        break;
      case Answer.NO:
      // setAnswer('no');
        break;
      case Answer.MAYBE:
      // setAnswer('maybe');
        break;*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text(
          'Shopping',
          style: TextStyle(
              fontFamily: "sans-serif-condensed",
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
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
        backgroundColor: Color.fromRGBO(18, 28, 45, 1),
      ),
      body: Column(
        children: <Widget>[
       Expanded(
      child: new Container(
      padding: const EdgeInsets.only(top:25.0,left:25),
      child: new Column(
        children: <Widget>[
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
          ),
        ],
      ),
    ),
    ),new Padding(
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

      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            _addItem(context);

           // setState(() {});
          },
          tooltip: 'Add note',
          backgroundColor: Color.fromRGBO(18, 28, 45, 1),
          child: new Icon(Icons.add)),
    );
  }
}


class _SystemPadding extends StatelessWidget {
  final Widget child;
  _SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
        padding:EdgeInsets.fromLTRB(0, 0, 0, 70.0),
        //mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 300),
        child: child);
  }
}
