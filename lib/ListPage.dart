
import 'package:flutter/material.dart';
import 'package:stickhelp/task.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}



class _ListPageState extends State<ListPage> {
  List<Task> task;
  @override
  void initState() {
    // TODO: implement initState
    task= <Task>[
      Task(date:"12.08.2018",icon: Icons.child_care,title:"Keep Marc and July",colorIcon: Colors.white,statue:"Requested"),
      Task(date:"08.08.2018",icon: Icons.shopping_cart,title:"Shopping to Manor",colorIcon: Colors.white,statue:"Accepted" ),
      Task(date:"17.08.2018",icon: Icons.local_laundry_service,title:"Laundry express",colorIcon: Colors.white ,statue:"Requested"),
      Task(date:"22.08.2018",icon: Icons.child_care,title:"Keep Marc",colorIcon: Colors.white,statue:"Requested" ),
      Task(date:"22.08.2018",icon: Icons.child_care,title:"Keep July",colorIcon: Colors.white,statue:"Accepted" ),
      Task(date:"23.08.2018",icon: Icons.child_care,title:"Keep Marc after school",colorIcon: Colors.white,statue:"Accepted"),
    ];
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
    body: makeBody(task),

    );
  }
}

Container makeBody (List<Task> task)
{
  return Container(
    padding: new EdgeInsets.only(top: 10.0),
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return makeCard(context,task,index);
      },
    ),
  );
}

Card makeCard (BuildContext context,List<Task> task,int index)
{

  Color getMyColor(String statue) {
    if (statue == "Accepted")  {
      return Color.fromRGBO(58, 66, 86, 1.0);
    } else
    if (statue == "Requested")  {
      return Color.fromRGBO(18, 28, 45, 1.0);
    }
  }


  return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child:
      new Column(
        children: <Widget>[


          Container(
           color:getMyColor(task[index].statue),
            child: makeListTile(context,task,index),
          ),
        ],
      )
  );
}


/*ouverture du popup pour afficher le detail de la tache*/
enum Answer{YES,NO,MAYBE}

Future<Null> _askuser(BuildContext context,Task task) async {
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
            //Center(child: Text('DETAIL TASK',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 17.0),) ,),
          ),
          Padding(padding: EdgeInsets.fromLTRB(10, 10.0, 0, 5.0)),
          Padding(padding: EdgeInsets.fromLTRB(25.0, 0, 0, 0.0),
            child: Text(task.title,style: TextStyle(fontSize: 19.0),)
            ,)
          ,
          /*Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
          Padding(padding: EdgeInsets.fromLTRB(25.0, 0, 0, 0),
            child: Text(task.title,style: TextStyle(fontSize: 19.0),)

            ,),*/
          Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0)),
          Padding(padding: EdgeInsets.fromLTRB(25.0, 0, 0, 0),
            child: Text(""),
            //Text("Done for:"+task.date,style: TextStyle(fontSize: 19.0),)
          ),
          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new MaterialButton
                (
                child: new Text("EDIT",style: TextStyle(fontWeight: FontWeight.bold),),
                color: Color.fromRGBO (58, 66, 86, 1.0),
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

ListTile makeListTile (BuildContext context,List<Task> task,int index)
{
  return ListTile(

    onTap: (){
      _askuser(context,task[index]);
    },
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white30))),
      child: Icon(task[index].icon, color:task[index].colorIcon,size: 40.0,),
    ),
    title: Text(
      task[index].title,
      style: TextStyle(color: Colors.white,fontSize: 16.0),
    ),
    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

    subtitle: Row(
      children: <Widget>[
        // Icon(Icons.linear_scale, color: Colors.yellowAccent),
        Text(task[index].date, style: TextStyle(color: Colors.white))
      ],
    ),
    trailing:

  /*new Text(task[index].statue,style: TextStyle(fontSize: 17.0,color: Colors.white,
//fontWeight: FontWeight.bold
),),)
*/
        Container(
         // color: Colors.grey,
          height: 35,
          width: 90,
          child: Center(
            child:  new Text(task[index].statue,style: TextStyle(fontSize: 17.0,color: Colors.white,
              fontWeight: FontWeight.bold
            ),),
          )
        ),
    //Icon(Icons.folder_shared, color: Colors.white, size: 30.0)

     // backgroundImage: new NetworkImage(
       //   'https://res.cloudinary.com/demo/image/upload/w_400,h_400,c_crop,g_face,r_max/w_200/lady.jpg'),

  );
}

