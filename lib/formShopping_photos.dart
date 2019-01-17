import 'package:flutter/material.dart';
import 'package:stickhelp/pages/signup.dart';
import 'package:image_picker/image_picker.dart';


class FormShoppingPhotos extends StatefulWidget {
  @override
  _FormShoppingPhotosState createState() => new _FormShoppingPhotosState();
}



class _FormShoppingPhotosState extends State<FormShoppingPhotos> {
  //File _image;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,

      appBar: new AppBar(
        title: new Text('Shopping photos',style: TextStyle(fontFamily: "sans-serif-condensed",fontSize: 20.0,fontWeight: FontWeight.bold
        ),
        ),
        backgroundColor: Color.fromRGBO(18, 28, 45, 1),
        actions: <Widget>[
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

        body:
        new GridView.extent(
          maxCrossAxisExtent: 220.0,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          padding: const EdgeInsets.all(5.0),
          children: _buildGridTiles(4),//Where is this function ?
        ),
    );
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

  List<Widget> _buildGridTiles(numberOfTiles) {
    List<Container> containers = new List<Container>.generate(numberOfTiles,
            (int index) {
          //index = 0, 1, 2,...
          final imageName = index < 9 ?
          'assets/image0${index + 1}.png' : 'assets/image${index + 1}.png';

          //new Image.asset("assets/migros.png",fit: BoxFit.contain,),
          return new Container(
            child: new Image.asset(
                imageName,
                fit: BoxFit.contain
            ),
          );
        });
    return containers;
  }
}