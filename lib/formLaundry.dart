
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:numberpicker/numberpicker.dart';
import 'package:stickhelp/pages/selectContact.dart';
import 'package:image_picker/image_picker.dart';


class FormLaundry extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _FormLaundryState();
}

class _LoginData {
  String email = '';
  String password = '';
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

class _FormLaundryState extends State<FormLaundry> {
  List _kidsNumber = ["1","2","3","4"];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _kidsNumberCurrent;
  List _location = ["My place","Drop off"];
  List<DropdownMenuItem<String>> _dropDownMenuItemsLocation;
  String _locationCurrent;

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  DateTime _dateTime = new DateTime.now();
  _LoginData _data = new _LoginData();
  final myController = TextEditingController();
  final myControllerNote = TextEditingController(text: noteText);
  int _weight = 2;
  DateTime _date = new DateTime.now();
  String  theDateSave=new DateFormat('y-MM-d').format(new DateTime.now());
  String theDateDisplay = capitalize(
      new DateFormat('EEEE, d MMMM', 'fr').format(new DateTime.now()));
  static final String noteText="";
  String noteTextSave=noteText;


  String _time = DateTime.now().hour.toString() +
      ':' +
      DateTime.now().minute.toString().padLeft(2, '0');

  String _timeEnd = DateTime.now().hour.toString() +
      ':' +
      DateTime.now().minute.toString().padLeft(2, '0');


  //final TimeOfDay time;

  /*validation the form*/
  String _validateEmail(String value) {
    // If empty value, the isEmail function throw a error.
    // So I changed this function with try and catch.
    try {
      //Validate.isEmail(value);
      print(value);
    } catch (e) {
      return 'The E-mail Address must be a valid email address.';
    }

    return null;
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    myController.dispose();
    myControllerNote.dispose();
    super.dispose();
  }



  @override
  void initState() {
    super.initState();

    myController.addListener(_printLatestValue);
    myControllerNote.addListener(_printLatestValue2);
    _dropDownMenuItems = getDropDownMenuItems();
    _kidsNumberCurrent = _dropDownMenuItems[0].value;
    _dropDownMenuItemsLocation = getDropDownMenuItemsLocation();
    _locationCurrent = _dropDownMenuItemsLocation[0].value;
  }

  void changedDropDownItem(String selectedCountry) {
    print("Selected country $selectedCountry, we are going to refresh the UI");
    setState(() {
      _kidsNumberCurrent = selectedCountry;
    });
  }

  void changedDropDownItemLocation(String selectedCountry) {
    print("Selected country $selectedCountry, we are going to refresh the UI");
    setState(() {
      _locationCurrent = selectedCountry;
    });
  }

  _printLatestValue() {
    print("Second text field: ${myController.text}");
  }

  // texte ecrit dans le champ note
  _printLatestValue2() {
    print("Second text field: ${myControllerNote.text}");

  }
  String _validatePassword(String value) {
    if (value.length < 8) {
      return 'The Password must be at least 8 characters.';
    }

    return null;
  }

  void submit() {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

      print('Printing the login data.');
      print('Email: ${_data.email}');
      print('Password: ${_data.password}');
    }
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Center(
            child:new Text("Enter a note",style: TextStyle(fontWeight: FontWeight.bold),) ,
          ),
          content: new TextFormField(
            controller: myControllerNote,
            maxLines: 5,
            style:TextStyle(color: Color.fromRGBO(58, 66, 86, 1.0),fontSize: 18.0,),
            textAlign: TextAlign.justify,
            // obscureText: true, // Use secure text for passwords.
            decoration: new InputDecoration(
              // hintText: 'Enter note',
              labelText: "Enter note",
              suffixStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Color.fromRGBO(58, 66, 86, 1.0),fontSize: 18.0,),
              labelStyle: TextStyle(color: Color.fromRGBO(58, 66, 86, 1.0),fontSize: 18.0, ),
              // prefixIcon: new Icon(Icons.place,color: Color.fromRGBO(58, 66, 86, 1.0),),
              border: OutlineInputBorder(),
            ),
          )
          ,
          actions: <Widget>[
            new RaisedButton
              (
              child: const Text('SAVE',style:  TextStyle(color: Colors.white,fontSize: 17.0,fontWeight: FontWeight.bold),),
              color: Colors.redAccent,
              elevation: 4.0,
              splashColor: Colors.blueGrey,
              textColor: Colors.white,
              onPressed: ()
              {
                Navigator.of(context).pop();
                noteTextSave=myControllerNote.text;
              },
            ),
            new RaisedButton
              (
              child: const Text('CLOSE',style:  TextStyle(color: Colors.white,fontSize: 17.0,fontWeight: FontWeight.bold),),
              color: Colors.blueAccent,
              elevation: 4.0,
              splashColor: Colors.blueGrey,
              textColor: Colors.white,
              onPressed: ()
              {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


// SelectTime
  Future<Null> _selectTime(BuildContext context,String timeVariable) async {
    final TimeOfDay picked = await showTimePicker(
        context: context, initialTime: new TimeOfDay.now());

    if (picked != null) {
      print('Time selected: ${picked.toString()}');
      setState(() {
        if (timeVariable=="timeStart")
        {
          _time = picked.hour.toString() + ":" + picked.minute.toString().padLeft(2, '0');
        }
        else
        {
          _timeEnd = picked.hour.toString() + ":" + picked.minute.toString().padLeft(2, '0');
        }

        //  Navigator.pop(context);
        // _askedToLead();
      });
    }
  }


  // SelectDate
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2019),
        lastDate: new DateTime(2020));

    print("choisir une date");

    if (picked != null) {
      print('Date selected: ${
          picked.toString()
      }');
      setState(() {

        print("choix des dates");
        DateTime date2 = new DateTime(
            picked.year, picked.month, picked.day, picked.hour, picked.minute);

        theDateDisplay = new DateFormat('EEEE, d MMMM', 'fr').format(date2);
        theDateSave= new DateFormat('y-MM-dd').format(date2);

        print("the date");
        print(_date.toString());

        print("theDateSave");
        print(theDateSave);
      });
    }
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String number in _kidsNumber) {
      items.add(new DropdownMenuItem(
          value: number,
          child: new Text(number)
      ));
    }
    return items;
  }

  List<DropdownMenuItem<String>> getDropDownMenuItemsLocation() {
    List<DropdownMenuItem<String>> items = new List();
    for (String location in _location) {
      items.add(new DropdownMenuItem(
          value: location,
          child: new Text(location)
      ));
    }
    return items;
  }

  void openCamera() async{
    var picture = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
  }

  void openGallery() async {
    var gallery = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
  }
  Future<void> _optionsDialogBox() {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: new Text('Take a picture',style: TextStyle(fontWeight: FontWeight.bold),),
                    onTap: openCamera,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: new Text('Select from gallery',style: TextStyle(fontWeight: FontWeight.bold),),
                    onTap: openGallery,
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      backgroundColor:  Colors.white,

      //Color.fromRGBO(58, 66, 86, 1.0),
      appBar: new AppBar(
        title: new Text('Laundry',style: TextStyle(fontFamily: "sans-serif-condensed",fontSize: 20.0,fontWeight: FontWeight.bold
        ),),
        backgroundColor: Color.fromRGBO(18, 28, 45, 1),
        actions: <Widget>[
          /* new IconButton(
            icon: new Icon(Icons.note_add,color: Colors.white,),
            tooltip: 'Air it',
            onPressed:_showDialog,
          ),*/
          new IconButton(
              icon: new Icon(Icons.image,color: Colors.white,),
              tooltip: 'Air it',
              onPressed: (){
                // Navigator.push(context, new MaterialPageRoute(builder: (_) => new SelectContact(typeLink: "BabySitting",)));
              }
          ),
          new IconButton(
            icon: new Icon(Icons.camera_alt,color: Colors.white,),
            tooltip: 'Air it',
            onPressed:(){
              // Navigator.push(context, new MaterialPageRoute(builder: (_) => new FormShoppingPhotos()));
              _optionsDialogBox();
            }
            ,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
      Expanded(
        child: new Container(
        padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: this._formKey,
            child: new ListView(
              padding: EdgeInsets.only(top:10.0),
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.only(left:20.0,right: 30.0),
                  child:
                  Row(children: <Widget>[
                    SizedBox(width: 100.0,
                      child: Text("DATE",style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),) ,),
                    Padding(padding: EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                      child: GestureDetector(
                        child: Text(theDateDisplay,style: TextStyle(fontSize: 18.0,),)
                        ,
                        onTap:(){
                          _selectDate(context);
                        } ,) ,
                    )
                  ],),
                ),
                new Padding(padding: new EdgeInsets.only(left: 15.0,right: 60.0,top: 10),
                  child: new Divider(color: Color.fromRGBO(58, 66, 86, 1.0),),
                ),
                new Padding(
                  padding: new EdgeInsets.only(left:20.0,right: 30.0),
                  child:
                  Row(children: <Widget>[
                    SizedBox(width: 100.0,
                      child:Text("TIME ",style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),),),
                    Padding(padding: EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                      child: GestureDetector(
                        child: Row(children: <Widget>[
                          SizedBox(child: Text("From",style:  TextStyle(color: Color.fromRGBO(58, 66, 86, 1.0),fontSize: 18.0,),),width: 70.0,),
                          Text(_time.toString(),style:  TextStyle(color: Color.fromRGBO(58, 66, 86, 1.0),fontSize: 18.0,),)
                        ],),

                        // SizedBox(width: 150.0,child: Text("From       "+_time.toString(),style:  TextStyle(color: Color.fromRGBO(58, 66, 86, 1.0),fontSize: 18.0,),)),
                        onTap:(){
                          _selectTime(context,"timeStart");
                        } ,) ,
                    )
                  ],),
                ),
                new Padding(padding: new EdgeInsets.only(left: 15.0,right: 60.0,top: 10),
                  child: new Divider(color: Color.fromRGBO(58, 66, 86, 1.0),),
                ),
                new Row(
                  children: <Widget>[
                    new Padding(padding: new EdgeInsets.only(left:20.0,right: 30.0),
                      child:
                      //new Icon(Icons.place,size: 25.0,color:Color.fromRGBO(58, 66, 86, 1.0),),
                      Text("LOCATION",style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),),
                    ),
                    new SizedBox(
                      width: 100.0,
                      height: 40,
                      child:
                      DropdownButton(
                        value: _locationCurrent,
                        items: _dropDownMenuItemsLocation,
                        onChanged: changedDropDownItemLocation,
                        style: TextStyle(fontSize: 17.0,color: Colors.black),
                      ),
                    ),],
                ), new Padding(padding: new EdgeInsets.only(left: 15.0,right: 60.0,top: 10),
                  child: new Divider(color: Color.fromRGBO(58, 66, 86, 1.0),),
                ),
                GestureDetector(
                  child: new Row(
                    children: <Widget>[
                      new Padding(padding: new EdgeInsets.only(left:20.0,right: 30.0),
                          child:
                          //new Icon(Icons.place,size: 25.0,color:Color.fromRGBO(58, 66, 86, 1.0),),

                          GestureDetector(child:   Text("NOTES",style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),) ,onTap: (){
                            _showDialog();
                          },)

                      ),
                      SizedBox(width: 150,
                        child: Text(noteTextSave,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 17.0),),)
                    ],
                  ) ,
                  onTap: (){
                    _showDialog();
                  },),
              ],
            ),
          )
    ),
      ),
      new Padding(padding: new EdgeInsets.only(top: 40.0,left:0.0,right: 0.0),
        child:  new MaterialButton
          (
          child: const Text('SELECT CONTACT',style:  TextStyle(color: Colors.white,fontSize: 17.0,fontWeight: FontWeight.bold),),
          color: Colors.redAccent,
          elevation: 4.0,
          padding: EdgeInsets.only(left: 0.0,right: 0.0,top: 0.0),
          minWidth: 500.0,
          height: 50.0,
          splashColor: Colors.blueGrey,
          onPressed: ()
          {
            Navigator.push(context, new MaterialPageRoute(builder: (_) => new SelectContact(typeLink: "Laundry",)));
          },
        ),
      )
        ],


      ),

    );
  }
}

