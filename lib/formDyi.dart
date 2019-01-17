
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:numberpicker/numberpicker.dart';

class FormDyi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _FormDyiState();
}



class _FormDyiState extends State<FormDyi> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  DateTime _dateTime = new DateTime.now();
  final myController = TextEditingController();
  int _weight = 2;
  DateTime _date = new DateTime.now();
  String  theDateSave=new DateFormat('y-MM-d').format(new DateTime.now());
  String theDateDisplay =
  new DateFormat('EEEE, d MMMM', 'fr').format(new DateTime.now());
  String _time = DateTime.now().hour.toString() +
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
    }
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
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2019));

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

      //Navigator.pop(context);
      //_askedToLead();
    }
  }

  //methode pour popup chiffre
  _showWeightPicker(BuildContext context) {
    showDialog(
      context: context,
      child: new NumberPickerDialog.integer(
          minValue: 1,
          maxValue: 150,
          initialIntegerValue: _weight,
          title: Text('HOW MANY KIDS ?',
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontFamily: "sans-serif-condensed",
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center)),
    ).then((value) {
      if (value != null)
      {
        setState(() => _weight = value);
        //  Navigator.pop(context);
        print("la valeur de personne" + _weight.toString());
      }
    });
  }

  //fin validation

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;


    // Locale myLocale = Localizations.localeOf(context);
    // print("MyLocale");
    /// print (myLocale.toString());

    return new Scaffold(
      backgroundColor:  Colors.white,

      //Color.fromRGBO(58, 66, 86, 1.0),
      appBar: new AppBar(
        title: new Text('Laundry',style: TextStyle(fontFamily: "sans-serif-condensed",fontSize: 20.0,fontWeight: FontWeight.bold
        ),
        ),
        backgroundColor: Color.fromRGBO(18, 28, 45, 1),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.camera_alt,color: Colors.white,),
            tooltip: 'Air it',
            onPressed:null,
          ),
        ],
      ),
      body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: this._formKey,
            child: new ListView(
              padding: EdgeInsets.only(top:10.0),
              children: <Widget>[
                /* new TextFormField(
                    keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: 'you@example.com',
                        labelText: 'E-mail Address'
                    ),
                    validator: this._validateEmail,
                    onSaved: (String value) {
                      this._data.email = value;
                    }
                ),*/

                new Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: new ListTile(
                    leading: new Icon(Icons.calendar_today, color: Color.fromRGBO(58, 66, 86, 1.0),size: 25.0,),
                    title: Text(theDateDisplay,style:  TextStyle(color: Color.fromRGBO(58, 66, 86, 1.0),fontSize: 18.0,),),
                    onTap: () {
                      _selectDate(context);
                    },
                  ),
                ),
                new Padding(padding: new EdgeInsets.only(left: 60.0,right: 60.0),
                  child: new Divider(color: Color.fromRGBO(58, 66, 86, 1.0),),
                ),
                new Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: new ListTile(
                    leading: new Icon(Icons.access_time, color: Color.fromRGBO(58, 66, 86, 1.0),size: 25.0,),
                    onTap: () {
                      _selectTime(context,"timeStart");
                    },
                    title: Text("At    "+_time.toString(),style:  TextStyle(color: Color.fromRGBO(58, 66, 86, 1.0),fontSize: 18.0,),),
                  ),
                ),
                new Padding(padding: new EdgeInsets.only(left: 60.0,right: 60.0),
                  child: new Divider(color: Color.fromRGBO(58, 66, 86, 1.0),),
                ),
                /*   new Row(
                  children: <Widget>[
                    new Padding(padding: new EdgeInsets.only(left:20.0,right: 30.0),
                      child: new Icon(Icons.place,size: 25.0,color:Color.fromRGBO(58, 66, 86, 1.0),),
                    ),

                    new SizedBox(
                        width: 200.0,
                        height: null,
                        child:

                        new TextFormField(
                          controller: myController,

                          style:TextStyle(color: Color.fromRGBO(58, 66, 86, 1.0),fontSize: 18.0,),
                          textAlign: TextAlign.justify,
                          // obscureText: true, // Use secure text for passwords.
                          decoration: new InputDecoration(
                            hintText: 'Ride to',
                            labelText: "Ride to",
                            suffixStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Color.fromRGBO(58, 66, 86, 1.0),fontSize: 18.0,),
                            labelStyle: TextStyle(color: Color.fromRGBO(58, 66, 86, 1.0),fontSize: 18.0, ),
                            // prefixIcon: new Icon(Icons.place,color: Color.fromRGBO(58, 66, 86, 1.0),),
                            border:
                            //OutlineInputBorder()
                            InputBorder.none,
                          ),
                        )
                    ),],
                ),

                new Padding(padding: new EdgeInsets.only(left: 60.0),
                  child: new Divider(color: Color.fromRGBO(58, 66, 86, 1.0),),
                ),*/

                new Row(
                  children: <Widget>[
                    new Padding(padding: new EdgeInsets.only(left:20.0,right: 10.0,bottom: 20.0),
                      child: new Icon(Icons.note_add,size: 25.0,
                        color:Colors.white,),
                    ),

                    new Padding(padding: new EdgeInsets.only(top: 20.0,bottom: 20.0),
                      child: new SizedBox(
                          width: 200.0,
                          height: null,
                          child:
                          new TextFormField(
                            maxLines: 10,
                            style:TextStyle(color: Color.fromRGBO(58, 66, 86, 1.0),fontSize: 18.0,),
                            textAlign: TextAlign.justify,
                            // obscureText: true, // Use secure text for passwords.
                            decoration: new InputDecoration(
                              hintText: 'Enter note',
                              labelText: "Enter note",
                              suffixStyle: TextStyle(color: Colors.white),
                              hintStyle: TextStyle(color: Color.fromRGBO(58, 66, 86, 1.0),fontSize: 18.0,),
                              labelStyle: TextStyle(color: Color.fromRGBO(58, 66, 86, 1.0),fontSize: 18.0, ),
                              // prefixIcon: new Icon(Icons.place,color: Color.fromRGBO(58, 66, 86, 1.0),),
                              border: OutlineInputBorder(),
                            ),



                            /*validator: this._validatePassword,
                    onSaved: (String value) {
                      this._data.password = value;
                    }*/


                          )

                      ) ,
                    ),

                  ],
                ),

                //

                new Padding(padding: new EdgeInsets.only(top: 10.0,right:20.0,left:20.0),
                  child:  new MaterialButton
                    (
                    child: const Text('SELECT CONTACT',style:  TextStyle(color: Colors.white,fontSize: 17.0,fontWeight: FontWeight.bold),),
                    color: Colors.redAccent,
                    elevation: 4.0,
                    padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 0.0),
                    minWidth: 50.0,
                    height: 50.0,
                    splashColor: Colors.blueGrey,
                    onPressed: ()
                    {
                      //_onPressedButton();
                      //print("click click1");
                      // Navigator.push(context, new MaterialPageRoute(builder: (_) => new ReservationDialog()));
                      //onPressed: this.submit,
                      Navigator.maybePop(context);

                    },
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}

