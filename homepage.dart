import 'package:flutter/material.dart';
import 'mapping.dart';
import 'authentication.dart';

class HomePage extends StatefulWidget
{
  HomePage
  ({
    required this.auth,
    required this.onSignedOut,

  });
  final AuthImplementation auth;
  final VoidCallback onSignedOut;

  @override
  State<StatefulWidget> createState()
  {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>
{
  void logoutUser() async
  {
    try
    {
      await widget.auth.signOut();
      widget.onSignedOut();
    }
    catch(e)
    {
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      appBar: new AppBar
      (
        title: new Text("Home"),
      ),

      body: new Container
      (

      ),
      bottomNavigationBar: new BottomAppBar
      (
          color: Colors.green,
          child: new Container
          (
            margin: EdgeInsets.only(left: 70.0 , right: 70.0),
            child : new Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,

              children: <Widget>
              [
                new IconButton
                (
                 icon: new Icon(Icons.local_car_wash),
                 iconSize: 50,
                 color: Colors.white,
                 onPressed: logoutUser,
                ),

                 new IconButton
                (
                 icon: new Icon(Icons.add_a_photo),
                 iconSize: 40,
                 color: Colors.white,
                 onPressed: null,
                ),
              ],
            ),
          ),
      ),
    );
  }
}