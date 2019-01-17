
import 'package:flutter/material.dart';
import 'package:stickhelp/task.dart';

class ListPagePast extends StatefulWidget {
  ListPagePast({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _ListPagePastState createState() => _ListPagePastState();
}

class _ListPagePastState extends State<ListPagePast> {
  List<Task> task;
  @override
  void initState() {
    // TODO: implement initState
    task= <Task>[
      Task(date:"12.08.2018",icon: Icons.child_care,title:"Keep Marc and July",colorIcon: Colors.white ),
      Task(date:"12.08.2018",icon: Icons.shopping_cart,title:"Shopping to Manor",colorIcon: Colors.white ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Colors.white,
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
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return makeCard(task,index);
      },
    ),
  );
}

Card makeCard (List<Task> task,int index)
{
  return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child:
      new Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0),),
            child: makeListTile(task,index),
          ),
        ],
      )
  );
}


ListTile makeListTile (List<Task> task,int index)
{
  return ListTile(
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
    /*trailing:
      //Icon(Icons.folder_shared, color: Colors.white, size: 30.0)
     new CircleAvatar(

        backgroundColor:task[index].colorIcon,
        child: new Text('AH',style: TextStyle(fontSize: 17.0,color: Colors.black,
          //fontWeight: FontWeight.bold
        ),),
        // backgroundImage: new NetworkImage(
        //   'https://res.cloudinary.com/demo/image/upload/w_400,h_400,c_crop,g_face,r_max/w_200/lady.jpg'),
      )*/
  );
}

