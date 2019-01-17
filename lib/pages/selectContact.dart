import 'package:flutter/material.dart';
import 'package:stickhelp/Contact.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
//import 'package:flutter_email_sender/flutter_email_sender.dart';


class SelectContact extends StatefulWidget {

  final  List<String> shoppingList ;
  final String market;
  final String typeLink;

  //SelectContact({Key key, @required this.shoppingList,this.market}) : super(key: key);
  SelectContact({Key key, this.shoppingList,this.market,@required this.typeLink}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}


class _SelectContactState extends State<SelectContact> {
  bool _saving = false;
  List<ContactSelect> contact;
  List<ContactSelect> contact2;
  List<ContactSelect> contactGet= <ContactSelect>[];
  bool checkBoxValue = false;



  void _submit() {
    setState(() {
      _saving = true;
    });

    //Simulate a service call
    print('submitting to backend...');
    new Future.delayed(new Duration(seconds: 4), () {

      setState(() {
        _saving = false;
        Navigator.pop(context);
      });
    });
  }


  @override
  void initState() {

  /*  print("Contenu shopphing list");
    print(widget.shoppingList);*/

  print("Dabs listing contact");

    // TODO: implement initState
    contact= <ContactSelect>[
        ContactSelect(checkbox: false,email: 'elikia.alexander@gmail.com',name:'David',firstname:'Gilles',number: '0797897867' ),
        ContactSelect(checkbox: false,email: 'dido.malambu@gmail.com',name:'Magic',firstname:'Johnson',number: '0796784522' ),
        ContactSelect(checkbox: false,email: 'dido@agencenova.ch.com',name:'Micheal',firstname:'Smith',number: '0796784522' ),
        ContactSelect(checkbox: false,email: 'phil@gmail.com',name:'Phill',firstname:'Jackson',number: '0796784522' ),
    ];

    contact2= <ContactSelect>[
      ContactSelect(checkbox: false,email: 'elikia.alexander@gmail.com',name:'Raymond',firstname:'Gay',number: '0797897867' ),
      ContactSelect(checkbox: false,email: 'elikia.alexander@gmail.com',name:'Gilles',firstname:'Pfister',number: '0796784522' ),
      ContactSelect(checkbox: false,email: 'elikia.alexander@gmail.com',name:'Patrick',firstname:'Fillon',number: '0796784522' ),
      ContactSelect(checkbox: false,email: 'elikia.alexander@gmail.com',name:'Thomas',firstname:'Guther',number: '0796784522' ),
    ];

    super.initState();
  }

  _launchEmail() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  sendEmail(String email,List<String> shoppingList,String market) async {
    String username = 'dido.malambu@gmail.com';
    String password = 'lilirose10';
    final smtpServer = gmail(username, password);
    String html="";

    print("le market"+market);
    // fetch the list to add the items to the html
    for(int i=0;i<shoppingList.length;i++){
      var element=shoppingList[i];
     //html= html+ "<h1></h1>\n<p>$element</p>" ;
      html= html+ "<li>$element</li>" ;
    }


    // Create our message.
    final message = new Message()
      ..from = new Address(username, 'Stickhelp')
      ..recipients.add(email)
      //..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
      //..bccRecipients.add(new Address('bccAddress@example.com'))
      ..subject = 'Stickhelp, I need your help for shopping'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ///..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";
    ..html = "<h1>Shopping list item for $market </h1><ul>"+html+"</ul>";

    final sendReports = await send(message, smtpServer);
    sendReports.forEach((sr) {
      _submit();
      if (sr.sent)
        print('Message sent');
      else {
        print('Message not sent.');
        for (var p in sr.validationProblems) {
          print('Problem: ${p.code}: ${p.msg}');
        }
      }
    });
  }


  /*Get the email adress to send email for the user selected*/
  void getEmailAdress(List<ContactSelect> contactGet)
  {
    contactGet.clear();
    for (var i = 0; i <contact.length; i++) {
      if (contact[i].checkbox==true)
        {
          contactGet.add(contact[i]);
        }

      if (contact2[i].checkbox==true)
      {
        contactGet.add(contact2[i]);
      }
     // contact2[i].checkbox=true;
     // print("valeur pour "+contact[i].firstname+contact[i].name+contact[i].checkbox.toString());
    }

    print("longueur des contacts selectionné"+contactGet.length.toString());
    print("le widget "+widget.typeLink);


    if (widget.typeLink=="BabySitting"){
      print("Babysitting");
      Navigator.pop(context);
    }
    else{
      // fetch the list to send Email
      if (contactGet.length>0){
        for (var i = 0; i <contactGet.length; i++) {
          sendEmail(contactGet[i].email,widget.shoppingList,widget.market);
        }
      }
    }
  }

  bool value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          //backgroundColor: Color.fromRGBO(64, 75, 96, .9),
          // title: new Text("Tasks",style: TextStyle(fontFamily: "sans-serif-condensed",fontSize: 20.0),),
          title: new Text(
            'Contacts',
            style: TextStyle(
                fontFamily: "sans-serif-condensed",
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
            actions: <Widget>[
              new IconButton(
                icon: new Icon(Icons.send,color: Colors.white,),
                tooltip: 'Send request',
                onPressed:(){
                  getEmailAdress(contactGet);
                }
                ,
              ),
            ]
          ,
          backgroundColor: Color.fromRGBO(18, 28, 45, 1),
        ),
        body:ModalProgressHUD(child: ChildWidget(notifyParent: refresh,notifySelectAll: selectAll,checkBoxValue:checkBoxValue,contact: contact,contact2: contact2,), inAsyncCall: _saving),
        backgroundColor:  Colors.white
    );
  }

  void refresh(){
    print('refresh mister');
    setState(() {
     print("value cpntact"+contact[0].checkbox.toString());
    });
  }

  void selectAll(){
    setState(() {
      for (var i = 0; i <contact.length; i++) {
        contact[i].checkbox=true;
        contact2[i].checkbox=true;
        print("valeur pour "+contact[i].firstname+contact[i].name+contact[i].checkbox.toString());
      }
    });
  }
}

class ChildWidget extends StatefulWidget {
  final Function() notifyParent;
  final Function() notifySelectAll;
  List<ContactSelect> contact;
  List<ContactSelect> contact2;
  bool checkBoxValue;

  ChildWidget({Key key, @required this.notifyParent,this.notifySelectAll,this.checkBoxValue,this.contact,this.contact2}) : super(key: key);

  @override
  _ChildWidgetState createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return



      //Center(
      //child:
          Column( mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Padding(padding: EdgeInsets.fromLTRB(0.0, 20.0, 270.0, 0.0),
                  child:Text('FAMILY',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,color:  Colors.grey),), ),

          new Expanded(
            child:theList(widget.contact, widget.notifyParent),
          ),
              Padding(padding: EdgeInsets.fromLTRB(0.0, 20.0, 240.0, 0.0),
              child:Text('COMMUNITY',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,color: Colors.grey),), ),
              new Expanded(
                child:theList(widget.contact2, widget.notifyParent),
              ),

              MaterialButton(
                child: Text('SELECT ALL', style:TextStyle(color: Colors.white,fontSize: 17.0,fontWeight: FontWeight.bold)),
                color: Colors.redAccent,
                elevation: 4.0,
                padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 0.0),
                minWidth: 500.0,
                height: 50.0,
                splashColor: Colors.blueGrey,
                textColor: Colors.white,
                onPressed: (){
                /*for (var i = 0; i < widget.contact.length; i++) {

                  widget.contact[i].checkbox=true;
                  print("valeur pour "+widget.contact[i].firstname+widget.contact[i].name+widget.contact[i].checkbox.toString());
                }*/
                widget.notifySelectAll();

                },
              ),


            ],
          );
      //theList(widget.contact, widget.notifyParent)

    //);
  }
  }




ListView theList (List<ContactSelect> contact, Function notify) {
  bool checkBoxValue = false;

  return new ListView.builder(
      padding: EdgeInsets.only(top: 5.0),
      itemCount: contact.length,
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          onTap: () {
            //  Navigator.push(context, new MaterialPageRoute(builder: (_) => new DetailsPlayers()));

          },
          child: new Container(
            //height: 93.0,
            //decoration: const BoxDecoration(color: Colors.red,),
            padding: new EdgeInsets.only(bottom: 0.0),
            child: new Column(
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Container(
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Row(
                                children: <Widget>[
                                  new Container(
                                    // width: 130.0,
                                    child:
                                    new SizedBox(
                                     // fit: BoxFit.fitWidth,
                                      width: 200.0,
                                      child: new Padding(
                                        padding: new EdgeInsets.only(
                                            bottom: 5.0, top: 0.0, left: 20.0),
                                        //child:  new Text("ADDISSON ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0,fontFamily: "sans-serif-condensed"),),

                                        child:
                                        new Text(
                                          contact[index].name+" "+
                                              contact[index].firstname,
                                          style: TextStyle(
                                            //fontWeight: FontWeight.bold,
                                              fontSize: 19.0,
                                              fontFamily: "sans-serif-condensed",color: Colors.black),
                                        ),
                                      ),
                                    ),),

                                  new Checkbox(
                                      value:  contact[index].checkbox,
                                      activeColor: Color.fromRGBO (58, 66, 86, 1.0),

                                      onChanged: (bool newValue){

                                       // checkBoxValue=newValue;

                                        contact[index].checkbox=newValue;
                                        print('click checkbox');
                                        //widget.
                                        notify();
                                        //notify( );
                                        /*print("click checkbox");
                                        print('detecctor');
                                        notify();
                                        print(newValue);*/

                                      })
                                  ,
                                ],
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                new Divider(
                  height: 0.0,
                  color: Color.fromRGBO(58, 66, 86, 1.0),
                  indent: 20.0,
                ),
              ],
            ),
          ),
        );
      });
}