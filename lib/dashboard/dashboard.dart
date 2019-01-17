import 'package:flutter/material.dart';
import 'package:stickhelp/ListPage.dart';
import 'package:stickhelp/tabTask.dart';
import 'package:stickhelp/Setting.dart';
import 'package:stickhelp/ListContact.dart';
import 'package:stickhelp/formBabysitting.dart';
import 'package:stickhelp/formTransport.dart';
import 'package:stickhelp/formShopping.dart';
import 'package:stickhelp/formLaundry.dart';
import 'package:stickhelp/formDyi.dart';
import 'package:stickhelp/pages/ListMessage.dart';
import 'package:stickhelp/form2.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final colorBack = const Color(0xFFb74093);
  BuildContext  theContext ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
   theContext=context;
    return Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        title:
        new Center(
          child: Text("STICKHELP",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),) ,
        ),
        elevation: 4.0,
        backgroundColor: Color.fromRGBO(18, 28, 45, 1),
      ),

      bottomNavigationBar: makeBottom(context),

      body:

      //Column(
        //children: <Widget>[
          //Text('Dido'),
         // SizedBox(height: 20.0,),
         Container(
            decoration: BoxDecoration(
                //color:Color.fromRGBO (58, 66, 86, 1.0)),
                color: Colors.white),
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.only(left: 3.0,right: 3.0,top: 3.0,bottom: 10.0),
              children: <Widget>[
                makeDashboardItem("Babysitting", Icons.child_care,Colors.white,context,Color.fromRGBO(18, 28, 45, 1)),
                makeDashboardItem("Transportation", Icons.directions_car,Colors.red,context,Color.fromRGBO(18, 28, 45, 1)),
                makeDashboardItem("Shopping", Icons.shopping_cart,Colors.yellow,context,Color.fromRGBO(18, 28, 45, 1)),
                makeDashboardItem("Laundry", Icons.local_laundry_service,Colors.white,context,Color.fromRGBO(18, 28, 45, 1)),
                makeDashboardItem("DYI", Icons.gavel,Colors.white,context,Color.fromRGBO(18, 28, 45, 1)),
                makeDashboardItem("Take away", Icons.fastfood,Colors.red,context,Color.fromRGBO(18, 28, 45, 1)),
              ],
            ),
          ),

        //],
      //),


    );
  }
}

Card makeDashboardItem(String title, IconData icon,Color iconColor,BuildContext context,Color rgb) {
  return Card(
      elevation: 4.0,
      margin: new EdgeInsets.all(8.0),
      child: Container(

        decoration:
        BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.black,
               // blurRadius: 10.0,
              ),
            ],
        color: rgb),
        child: new InkWell(
          onTap: ()
          {
            switch (title) {
              case "Babysitting":
                Navigator.push(context, new MaterialPageRoute(builder: (_) => new FormBabySitting()));
                break;
              case "Transportation":
                Navigator.push(context, new MaterialPageRoute(builder: (_) => new FormTransport()));
                break;
              case "Shopping":
                //Navigator.push(context, new MaterialPageRoute(builder: (_) => new FormShopping()));
                Navigator.push(context, new MaterialPageRoute(builder: (_) => new Counter()));

                break;
              case "Laundry":
                Navigator.push(context, new MaterialPageRoute(builder: (_) => new FormLaundry()));
                break;
              case "DYI":
                Navigator.push(context, new MaterialPageRoute(builder: (_) => new FormDyi()));
                break;
              case "Take away":
              //  Navigator.push(context, new MaterialPageRoute(builder: (_) => new FormTakeway()));
                break;
            }
          },
          child: Column(

            //crossAxisAlignment: CrossAxisAlignment.stretch,
           // mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                  child: Icon(
                    icon,
                    size: 40.0,
                    color: iconColor,
                  )),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(title,
                    style:
                    new TextStyle(fontSize: 17.0,
                        color: Colors.white,)),
              )
            ],
          ),
        ),
      ));
}

//final makeBottom =
Container makeBottom (BuildContext context) {
  //Widget build(BuildContext context) {

return Container(

  height: 55.0,
  child:
  BottomAppBar(
    elevation: 8.0,

    color: Color.fromRGBO(18, 28, 45, 1),
    //Color.fromRGBO(58, 66, 86, 1.0),
   // color: Colors.blue,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        /*IconButton(
          icon: Icon(Icons.home, color: Colors.white),
          onPressed: () {},
        ),*/
        IconButton(
          icon: Icon(Icons.people, color: Colors.white),
          onPressed: () {
            Navigator.push(context, new MaterialPageRoute(builder: (_) => new ListContact()));
          },
        ),
        IconButton(
          icon: Icon(Icons.featured_play_list, color: Colors.white),
          onPressed: () {

           // BuildContext theContext;
           // Navigator.push(this.context, new MaterialPageRoute(builder: (_) => new ListPage()));
           // Navigator.push(context, new MaterialPageRoute(builder: (_) => new ListPage()));
            Navigator.push(context, new MaterialPageRoute(builder: (_) => new TabTask()));
          },
        ),
        IconButton(
          icon: Icon(Icons.email, color: Colors.white),
          onPressed: () {

            // BuildContext theContext;
             Navigator.push(context, new MaterialPageRoute(builder: (_) => new ListMessage()));
            // Navigator.push(context, new MaterialPageRoute(builder: (_) => new ListPage()));
           // Navigator.push(context, new MaterialPageRoute(builder: (_) => new TabTask()));
          },
        ),
        IconButton(
          icon: Icon(Icons.settings, color: Colors.white),
          onPressed: () {
            Navigator.push(context, new MaterialPageRoute(builder: (_) => new Setting()));
          },
        ),
      ],
    ),
  ),
);
}

