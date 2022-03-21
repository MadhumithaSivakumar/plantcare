
import 'package:firebase_database/firebase_database.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';


class PostService{
  String nodeName = "posts";
  FirebaseDatabase database = FirebaseDatabase.instance;
  late DatabaseReference _databaseReference;
  late Map post;

  //PostService(Map map);

   PostService(this.post);

  addPost(){
//    this is going to give a reference to the posts node
   _databaseReference=database.reference().child(nodeName);
    _databaseReference.push().set(post);
  }
}