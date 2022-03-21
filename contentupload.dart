import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'dart:io';
import 'postservice.dart';
import 'post.dart';


class AddPost extends StatefulWidget
{
  State<StatefulWidget> createState()
  {
    return _AddPostState();
  }
}

class _AddPostState extends State<AddPost>
{
  final GlobalKey<FormState> formkey =  GlobalKey();
  Post post = Post(0, " "," ");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add post"),
        elevation: 0.0,
      ),
      body: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/Plant.jpeg'),
                  //fit: BoxFit.cover,
                ),
              ),
        child:Form(
          key: formkey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Disease name",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => post.title = val!,
                  validator: (val){
                    if(val!.isEmpty ){
                      return "name field can't be empty";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Your solution",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => post.body = val!,
                  validator: (val){
                    if(val!.isEmpty){
                      return "body field can't be empty";
                    }
                  },
                ),
              ),
            ],
          )
          ),
      ),
      floatingActionButton: FloatingActionButton
      ( onPressed: ()
      {
        insertPost();
        Navigator.pop(context);
//        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      },
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.red,
        tooltip: "add a post",),
    );
  }

  void insertPost() {
    final FormState? form = formkey.currentState;
    if(form!.validate()){
      form.save();
      form.reset();
      post.date = DateTime.now().millisecondsSinceEpoch;
      PostService postService = PostService(post.toMap());
      postService.addPost();
    }
  }
  



}

   