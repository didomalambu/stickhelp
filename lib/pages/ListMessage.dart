
import 'package:flutter/material.dart';
import 'package:stickhelp/task.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class ListMessage extends StatefulWidget {
  final Function() sumbit;
  final String title;

  ListMessage({Key key, this.title,this.sumbit}) : super(key: key);

  @override
  _ListMessageState createState() => _ListMessageState();
}


enum Answer{YES,NO,MAYBE}

Future<Null> _askuser(BuildContext context,Task task,Function notify) async {
  switch(
  await showDialog(
      context: context,
      child:  new SimpleDialog(
        contentPadding: EdgeInsets.all(0.0),
        titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        children: <Widget>[

          Container(
              padding: EdgeInsets.fromLTRB(0, 0.0, 10.0, 2.0),
              height: 50.0,
              color:Color.fromRGBO(58, 66, 86, 1.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    //crossAxisAlignment:  CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Center(child:
                      Padding(padding: EdgeInsets.fromLTRB(75, 0,0, 0),
                        child:Text('DETAIL TASK',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 17.0),) ,) ,),
                      // Padding(padding: EdgeInsets.fromLTRB(0, 0, 100.0, 0)),
                      Padding(padding: EdgeInsets.fromLTRB(10,0 , 0, 0),
                        child: IconButton(
                          icon: Icon(Icons.close, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),)
                    ],
                  )
                ],
              )
          ),
          Padding(padding: EdgeInsets.fromLTRB(10, 10.0, 0, 5.0)),
          Padding(padding: EdgeInsets.fromLTRB(25.0, 0, 0, 0),
            child: Text(task.name,style: TextStyle(fontSize: 19.0,fontWeight: FontWeight.bold),)
            ,)
          ,
          Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
          Padding(padding: EdgeInsets.fromLTRB(25.0, 0, 0, 0),
            child: Text(task.title,style: TextStyle(fontSize: 19.0),)

            ,),
          Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
          Padding(padding: EdgeInsets.fromLTRB(25.0, 0, 0, 0),
            child: Text(""),
            //Text("Done for:"+task.date,style: TextStyle(fontSize: 19.0),)
            ),
          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new MaterialButton
                (
                child: new Text("ACCEPT",style: TextStyle(fontWeight: FontWeight.bold),),
                color: Color.fromRGBO (58, 66, 86, 1.0),
                height: 50.0,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                  notify();
                },
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 10.0, 5.0)),
              new MaterialButton
                (
                child: new Text("REJECT",style: TextStyle(fontWeight: FontWeight.bold),),
                color: Colors.red,
                textColor: Colors.white,
                height: 50.0,
                onPressed: () {
                  Navigator.pop(context);
                  notify();
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



class _ListMessageState extends State<ListMessage> {
  bool _saving = false;
  List<Task> task;
  @override
  void initState() {
    // TODO: implement initState
    task= <Task>[
      Task(date:"12.08.2018",icon: Icons.child_care,title:"Keep Marc and July",colorIcon: Color.fromRGBO(58, 66, 86, 1),name: "Mike Anthony" ),
      Task(date:"08.08.2018",icon: Icons.shopping_cart,title:"Shopping to Manor",colorIcon: Colors.blue,name: "Jean Hammer" ),
      Task(date:"17.08.2018",icon: Icons.local_laundry_service,title:"Laundry express",colorIcon: Colors.red,name: "Steeve Jobs" ),
      Task(date:"22.08.2018",icon: Icons.child_care,title:"Keep Marc",colorIcon:Color.fromRGBO(58, 66, 86, 1),name: "Billy Gates" ),
      Task(date:"22.08.2018",icon: Icons.child_care,title:"Keep July",colorIcon: Color.fromRGBO(58, 66, 86, 1),name: "Pat Ewing" ),
      Task(date:"23.08.2018",icon: Icons.child_care,title:"Keep Marc after school",colorIcon: Color.fromRGBO(58, 66, 86, 1),name: "Carl Anthony" ),
      Task(date:"23.08.2018",icon: Icons.child_care,title:"Keep Marc after school",colorIcon: Color.fromRGBO(58, 66, 86, 1),name: "Scottie Pippen" ),
    ];
    super.initState();
  }

  void _submit() {
    setState(() {
      _saving = true;
    });

    //Simulate a service call
    print('submitting to backend...');
    new Future.delayed(new Duration(seconds: 4), () {

      setState(() {
        _saving = false;
       // Navigator.pop(context);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:


     // ModalProgressHUD(child:notifyParent: submit, makeBody(task),inAsyncCall: _saving),
     // ModalProgressHUD(child: ListMessage :sumbit: submit,makeBody(task), inAsyncCall: _saving),
      ModalProgressHUD(child: makeBody(task,_submit), inAsyncCall: _saving),



      appBar: new AppBar(
        //backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        // title: new Text("Tasks",style: TextStyle(fontFamily: "sans-serif-condensed",fontSize: 20.0),),
        title: new Text(
          'Messages',
          style: TextStyle(
              fontFamily: "sans-serif-condensed",
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(18, 28, 45, 1),
      ),

    );
  }
}

Container makeBody (List<Task> task,Function notify)
{
  return Container(
    padding: new EdgeInsets.only(top: 10.0),
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: task.length,
      itemBuilder: (BuildContext context, int index) {
        return
          Container(
            child: makeListTile(task,index,context,notify),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(
                  width: 1.0,
                    color: Color.fromRGBO(101, 109, 131, 0.5)
                ),)),
          );
      },
    ),
  );
}

ListTile makeListTile (List<Task> task,int index,BuildContext context,Function notify)
{
  return ListTile(
    onTap: (){
      _askuser(context,task[index],notify);
    },
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
      height: 35,
        width: 50,
        padding: EdgeInsets.only(right: 14.0),
        decoration: new BoxDecoration(
         // color: Colors.blue,
            border: new Border(
                right: new BorderSide(width: 1.0,
                    color: Color.fromRGBO(101, 109, 131, 0.5)
                ),
            )
        ),
        child:
        Icon(task[index].icon, color:task[index].colorIcon,size: 40.0,),
      ),
      title: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(5.0, 0, 0, 7.0),
              child:
              SizedBox(
                width: 150.0,
                child:Text(
                  task[index].name,
                  style: TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.bold),
                ) ,
              ),
              ),
             Padding(padding: EdgeInsets.fromLTRB(0, 0, 15.0, 8.0),
               child:
               Text(
                 task[index].date,
                 style: TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.bold),
               ),
             )
            ],
          ),Row()
        ],
      ),
      subtitle: Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(5.0, 0, 0, 0),
          child: Text(task[index].title, style: TextStyle(color: Colors.black87,fontSize: 16.0))
            ,)
        ],
      ),
  );
}

