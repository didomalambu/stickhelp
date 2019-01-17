import 'package:flutter/material.dart';
import 'package:stickhelp/Contact.dart';

class ListContact extends StatefulWidget {

  @override
  _ListContactState createState() => _ListContactState();
}

class _ListContactState extends State<ListContact> {
  List<Contact> contact,contact2;
  String nameEdit;
  String firstnameEdit;
  String emailEdit;
  String phoneEdit;

  @override
  void initState() {
    // TODO: implement initState
    contact= <Contact>[
      Contact(name:"Pierre",firstname: "Andree",number: "0798977790",linkPicture: "https://cdn0.iconfinder.com/data/icons/iconshock_guys/512/andrew.png",email: 'peirre@gmail.com'),
      Contact(name:"Raymond",firstname: "Hilles",number: "0798977790",linkPicture: "https://cdn0.iconfinder.com/data/icons/iconshock_guys/512/andrew.png",email: 'jules@gmail.com'),
      Contact(name:"Gilbert",firstname: "Fontaine",number: "0778567710",linkPicture: "http://www.iconninja.com/files/684/701/71/face-avatar-icon.png",email: 'gilbert@gmail.com'),
      Contact(name:"Marc",firstname: "Jacobs",number: "0778567710",linkPicture: "https://cdn0.iconfinder.com/data/icons/iconshock_guys/512/andrew.png",email: 'marc@gmail.com'),
     /* Contact(name:"Marc",firstname: "Jules",number: "0778567710",linkPicture: "https://cdn0.iconfinder.com/data/icons/iconshock_guys/512/andrew.png",email: 'delphine@gmail.com'),
      Contact(name:"Delphine",firstname: "Derozan",number: "0778567710",linkPicture: "http://www.iconninja.com/files/684/701/71/face-avatar-icon.png",email: 'delphin@gmail.com'),
      Contact(name:"Delphine",firstname: "Derozan",number: "0778567710",linkPicture: "http://www.iconninja.com/files/684/701/71/face-avatar-icon.png",email: 'delphin@gmail.com'),*/
    ];

    contact2= <Contact>[
      Contact(name:"David",firstname: "Flemming",number: "0798977790",linkPicture: "https://cdn0.iconfinder.com/data/icons/iconshock_guys/512/andrew.png",email: 'peirre@gmail.com'),
      Contact(name:"Jules",firstname: "Zimmeran",number: "0798977790",linkPicture: "https://cdn0.iconfinder.com/data/icons/iconshock_guys/512/andrew.png",email: 'jules@gmail.com'),
      Contact(name:"David",firstname: "Fielman",number: "0778567710",linkPicture: "http://www.iconninja.com/files/684/701/71/face-avatar-icon.png",email: 'gilbert@gmail.com'),
      Contact(name:"Gilles",firstname: "Hart",number: "0778567710",linkPicture: "https://cdn0.iconfinder.com/data/icons/iconshock_guys/512/andrew.png",email: 'marc@gmail.com'),
    ];
    super.initState();
  }

  /*dialog pour ajouter une personne*/
  AlertDialog dialog = new AlertDialog(
    content: new SingleChildScrollView(
      child: new ListBody(
          children: <Widget>
          [
            Container(
              height: 50.0,
              color:Color.fromRGBO(18, 28, 45, 1),
              child: Center(child: Text('ADD A CONTACT',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),) ,),
            ),
        Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
            new TextField
              (
              maxLines: 1,
              textAlign: TextAlign.left,
              onChanged: null,
              onSubmitted: null,
              decoration: new InputDecoration.collapsed
                (
                hintText: ("Name"),
              ),
              style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.black
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
            new Divider(
              height: 0.0,
              color: Color.fromRGBO(58, 66, 86, 1.0),
              indent: 20.0,
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
            new TextField
              (
              maxLines: 1,
              textAlign: TextAlign.left,
              onChanged: null,
              onSubmitted: null,
              decoration: new InputDecoration.collapsed
                (
                hintText: ("Firstname"),
              ),
              style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.black
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
            new Divider(
              height: 0.0,
              color: Color.fromRGBO(58, 66, 86, 1.0),
              indent: 20.0,
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
            new TextField
              (
              maxLines: 1,
              textAlign: TextAlign.left,
              onChanged: null,
              onSubmitted: null,
              decoration: new InputDecoration.collapsed
                (
                hintText: ("Email"),
              ),
              style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.black
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
            new Divider(
              height: 0.0,
              color: Color.fromRGBO(58, 66, 86, 1.0),
              indent: 20.0,
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
            new TextField
              (
              maxLines: 1,
              textAlign: TextAlign.left,
              onChanged: null,
              onSubmitted: null,
              decoration: new InputDecoration.collapsed
                (
                hintText: ("Phone number"),
              ),
              style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.black
              ),
            ),
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
                  },
                ),
              ],
            ),
          ]
      ),
    ),
  );



  /*dialog pour ajouter une personne*/
  AlertDialog dialogEdit = new AlertDialog(
    content: new SingleChildScrollView(
      child: new ListBody(
          children: <Widget>
          [
            Container(
              height: 50.0,
              color:Color.fromRGBO(58, 66, 86, 1.0),
              child: Center(child: Text('EDIT A CONTACT',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),) ,),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
            new TextField
              (
              maxLines: 1,
              controller:  new TextEditingController(text: 'null'),
              textAlign: TextAlign.left,
              onChanged: null,
              onSubmitted: null,

              decoration: new InputDecoration.collapsed
                (
                hintText: ("Name"),
              ),
              style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.black
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
            new Divider(
              height: 0.0,
              color: Color.fromRGBO(58, 66, 86, 1.0),
              indent: 20.0,
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
            new TextField
              (
              maxLines: 1,
              textAlign: TextAlign.left,
              onChanged: null,
              onSubmitted: null,
              decoration: new InputDecoration.collapsed
                (
                hintText: ("Firstname"),
              ),
              style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.black
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
            new Divider(
              height: 0.0,
              color: Color.fromRGBO(58, 66, 86, 1.0),
              indent: 20.0,
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
            new TextField
              (
              maxLines: 1,
              textAlign: TextAlign.left,
              onChanged: null,
              onSubmitted: null,
              decoration: new InputDecoration.collapsed
                (
                hintText: ("Email"),
              ),
              style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.black
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
            new Divider(
              height: 0.0,
              color: Color.fromRGBO(58, 66, 86, 1.0),
              indent: 20.0,
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
            new TextField
              (
              maxLines: 1,
              textAlign: TextAlign.left,
              onChanged: null,
              onSubmitted: null,
              decoration: new InputDecoration.collapsed
                (
                hintText: ("Phone number"),
              ),
              style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.black
              ),
            ),
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
                  color: Color.fromRGBO (58, 66, 86, 1.0),
                  height: 50.0,
                  textColor: Colors.white,
                  onPressed: () {
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
                   // Navigator.pop(context);
                  },
                ),
              ],
            ),
          ]
      ),
    ),
  );



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
        backgroundColor:
        Color.fromRGBO(18, 28, 45, 1),
      ),
      body:
      Column( mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(0.0, 20.0, 270.0, 0.0),
          child:Text('FAMILY',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,
              color: Colors.grey),), ),
          new Expanded(
            child:listingContacts(contact,dialogEdit),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0.0, 20.0, 240.0, 0.0),
          child:Text('COMMUNITY',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,
              color: Colors.grey),), ),
          new Expanded(
          child:listingContacts(contact2,dialogEdit),
          ),
    ]),

        //listingContacts(contact,dialogEdit),
        backgroundColor:
        //Color.fromRGBO(58, 66, 86, 1.0),
        Colors.white,
        floatingActionButton: new FloatingActionButton(
            elevation: 0.0,
            child:
            new Icon(Icons.add),
           // new Text("+",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0),),
            backgroundColor: Color.fromRGBO(18, 28, 45, 1),
            //new Color(0xFFE57373),
            onPressed: (){
             // showDialog(context: context, child: dialog);
              _adduser(context);
            }
        )
    );
  }
}

/////////
void showDialogEdit(BuildContext context,AlertDialog dialog){
  //showDialog(context: context, child: dialog);
 // amail.com(context,contact);

}

enum Answer{YES,NO,MAYBE}

Future<Null> _askuser(BuildContext context,Contact contact) async {
  switch(
  await showDialog(
      context: context,
      child:  new SimpleDialog(
        contentPadding: EdgeInsets.all(0.0),
        titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 0.0, 10.0, 5.0),
              height: 50.0,
              color:Color.fromRGBO(18, 28, 45, 1),
              child: Center(child: Text('EDIT A CONTACT',style: TextStyle(fontWeight: FontWeight.bold,
                  color:  Colors.white,fontSize: 17.0),) ,),
            ),
            Padding(padding: EdgeInsets.fromLTRB(10, 10.0, 0, 5.0)),
            Padding(padding: EdgeInsets.fromLTRB(25.0, 0, 0, 0),
            child: new TextField
              (
              maxLines: 1,
              controller:  new TextEditingController(text: contact.name),
              textAlign: TextAlign.left,
              onChanged: null,
              onSubmitted: null,
              decoration: new InputDecoration.collapsed
                (
                hintText: ("Name"),
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
            Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 5.0)),
            Padding(padding: EdgeInsets.fromLTRB(25.0, 0, 0, 0),
            child:
            new TextField
              (
              maxLines: 1,
              controller:  new TextEditingController(text: contact.email),
              textAlign: TextAlign.left,
              onChanged: null,
              onSubmitted: null,
              decoration: new InputDecoration.collapsed
                (
                hintText: ("Firstname"),
              ),
              style: new TextStyle(
                  fontSize: 19.0,
                  color: Colors.black
              ),
            ),),
            Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
            new Divider(
              height: 0.0,
              color: Color.fromRGBO(58, 66, 86, 1.0),
              indent: 20.0,
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
            Padding(padding: EdgeInsets.fromLTRB(25.0, 0, 0, 0),
            child:
            new TextField
              (
              maxLines: 1,
              textAlign: TextAlign.left,
              controller:  new TextEditingController(text: contact.firstname),
              onChanged: null,
              onSubmitted: null,
              decoration: new InputDecoration.collapsed
                (
                hintText: ("Email"),
              ),
              style: new TextStyle(
                  fontSize: 19.0,
                  color: Colors.black
              ),
            ),),
            Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
            new Divider(
              height: 0.0,
              color: Color.fromRGBO(58, 66, 86, 1.0),
              indent: 20.0,
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
            Padding(padding: EdgeInsets.fromLTRB(25.0, 0, 0, 0),
            child:
            new TextField
              (
              maxLines: 1,
              textAlign: TextAlign.left,
              controller:  new TextEditingController(text: contact.number),
              onChanged: null,
              onSubmitted: null,
              decoration: new InputDecoration.collapsed
                (
                hintText: ("Phone number"),
              ),
              style: new TextStyle(
                  fontSize: 19.0,
                  color: Colors.black
              ),
            ),),
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
                  child: new Text("SAVE",style: TextStyle(fontWeight: FontWeight.bold),),
                  color: Color.fromRGBO(18, 28, 45, 1),
                  height: 50.0,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 10.0, 5.0)),
                new MaterialButton
                  (
                  child: new Text("DELETE",style: TextStyle(fontWeight: FontWeight.bold),),
                  color: Colors.red,
                  textColor: Colors.white,
                  height: 50.0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),

          Padding(padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),)

          /*new SimpleDialogOption(
            onPressed: (){Navigator.pop(context,Answer.YES);},
            child: const Text('Yes!!!!'),

          ),
          new SimpleDialogOption(
            onPressed: (){Navigator.pop(context,Answer.NO);},
            child: const Text('NO :('),
          ),
          new SimpleDialogOption(
            onPressed: (){Navigator.pop(context,Answer.MAYBE);},
            child: const Text('...Maybe...'),
          ),
          new Icon(Icons.home)*/

        ],
      )
  )) {
    case Answer.YES:
    //setAnswer('yes');
      break;
    case Answer.NO:
    // setAnswer('no');
      break;
    case Answer.MAYBE:
    // setAnswer('maybe');
      break;
  }
}

/*add user dialog */
Future<Null> _adduser(BuildContext context) async {
  switch(
  await showDialog(
      context: context,
      child:  new SimpleDialog(
        contentPadding: EdgeInsets.all(0.0),
        titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 0.0, 10.0, 5.0),
            height: 50.0,
            color:Color.fromRGBO(18, 28, 45, 1),
            child: Center(child: Text('ADD A CONTACT',style: TextStyle(fontWeight: FontWeight.bold,
                color:  Colors.white,fontSize: 17.0),) ,),
          ),
          Padding(padding: EdgeInsets.fromLTRB(10, 10.0, 0, 5.0)),
          Padding(padding: EdgeInsets.fromLTRB(25.0, 0, 0, 0),
            child: new TextField
              (
              maxLines: 1,
              //controller:  new TextEditingController(text: contact.name),
              textAlign: TextAlign.left,
              onChanged: null,
              onSubmitted: null,
              decoration: new InputDecoration.collapsed
                (
                hintText: ("Name"),
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
          Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 5.0)),
          Padding(padding: EdgeInsets.fromLTRB(25.0, 0, 0, 0),
            child:
            new TextField
              (
              maxLines: 1,
             // controller:  new TextEditingController(text: contact.email),
              textAlign: TextAlign.left,
              onChanged: null,
              onSubmitted: null,
              decoration: new InputDecoration.collapsed
                (
                hintText: ("Firstname"),
              ),
              style: new TextStyle(
                  fontSize: 19.0,
                  color: Colors.black
              ),
            ),),
          Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
          new Divider(
            height: 0.0,
            color: Color.fromRGBO(58, 66, 86, 1.0),
            indent: 20.0,
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
          Padding(padding: EdgeInsets.fromLTRB(25.0, 0, 0, 0),
            child:
            new TextField
              (
              maxLines: 1,
              textAlign: TextAlign.left,
              //controller:  new TextEditingController(text: contact.firstname),
              onChanged: null,
              onSubmitted: null,
              decoration: new InputDecoration.collapsed
                (
                hintText: ("Email"),
              ),
              style: new TextStyle(
                  fontSize: 19.0,
                  color: Colors.black
              ),
            ),),
          Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
          new Divider(
            height: 0.0,
            color: Color.fromRGBO(58, 66, 86, 1.0),
            indent: 20.0,
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
          Padding(padding: EdgeInsets.fromLTRB(25.0, 0, 0, 0),
            child:
            new TextField
              (
              maxLines: 1,
              textAlign: TextAlign.left,
             // controller:  new TextEditingController(text: contact.number),
              onChanged: null,
              onSubmitted: null,
              decoration: new InputDecoration.collapsed
                (
                hintText: ("Phone number"),
              ),
              style: new TextStyle(
                  fontSize: 19.0,
                  color: Colors.black
              ),
            ),),
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
      )
  )) {
    case Answer.YES:
    //setAnswer('yes');
      break;
    case Answer.NO:
    // setAnswer('no');
      break;
    case Answer.MAYBE:
    // setAnswer('maybe');
      break;
  }
}


/*Deuxieme version du listing */
ListView listingContacts (List<Contact> contact, AlertDialog dialog) {
  return new ListView.builder(
      padding: EdgeInsets.only(top: 5.0),
      itemCount: contact.length,
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          onTap: () {
            _askuser(context,contact[index]);
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
                                      height: 60,
                                      child: new Padding(
                                        padding: new EdgeInsets.only(
                                            bottom: 0.0, top: 25.0, left: 20.0),
                                        child:
                                        new Text(
                                          contact[index].name+" "+
                                              contact[index].firstname,
                                          style: TextStyle(
                                            //fontWeight: FontWeight.bold,
                                              fontSize: 19.0,
                                              fontFamily: "sans-serif-condensed",
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),),
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
                  color: Colors.grey,
                  indent: 20.0,
                ),
              ],
            ),
          ),
        );
      });
}

/********************************/


/*première version du listing des contacts*/
  ListView theList (List<Contact> contact,AlertDialog dialog) {
  return new ListView.builder(

      padding: EdgeInsets.only(top: 10.0),
      itemCount: contact.length,
      itemBuilder: (BuildContext context, int index) {

        return new GestureDetector(
          onTap: () {
            //  Navigator.push(context, new MaterialPageRoute(builder: (_) => new DetailsPlayers()));

            //showDialog(context: context, child: dialog);
            //showDialogEdit(context,dialog);
            print("CLICK,CLICK");
            _askuser(context,contact[index]);
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
                        new Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 0.0, bottom: 2.0, right: 15.0),
                          child: new Container(
                            width: 80.0,
                            child: Image.network(
                              //'https://swissbasketball.ch/img/containers/main/img/13698192_1061604690596355_3122167352231491976_o.jpg/a8267e6e71464aaf7874a095a5fa6291.jpg',
                              contact[index].linkPicture,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        new Container(
                          //   decoration: BoxDecoration(color: Colors.red),
                         // width: 170.0,
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Row(
                                children: <Widget>[
                                  new Container(
                                   // width: 130.0,
                                    child:
                                  new FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: new Padding(
                                      padding: new EdgeInsets.only(
                                          bottom: 5.0, top: 0.0, left: 5.0),
                                      //child:  new Text("ADDISSON ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0,fontFamily: "sans-serif-condensed"),),
                                      child: new Text(
                                        contact[index].name+" "+
                                            contact[index].firstname,
                                        style: TextStyle(
                                            //fontWeight: FontWeight.bold,
                                            fontSize: 19.0,
                                            fontFamily: "sans-serif-condensed",color: Colors.white),
                                      ),
                                    ),
                                  ),),
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
                  color: Colors.white,
                  indent: 20.0,
                ),
              ],
            ),
          ),
        );
      });
}